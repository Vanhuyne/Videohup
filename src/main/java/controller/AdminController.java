package controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import constant.SessionAttr;
import dto.VideoLikedInfo;
import entity.User;
import service.StatsService;
import service.UserService;
import serviceImpl.StatsServiceImpl;
import serviceImpl.UserServiceImpl;

/**
 * Servlet implementation class AdminController
 */
@WebServlet(urlPatterns = { "/admin", "/delete", "/edit", "/update", "/resest",
		"/add" }, name = "HomeControllerOfAdmin")
public class AdminController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private StatsService statsService = new StatsServiceImpl();
	private UserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null & currentUser.getIsAdmin() == true) {

			String path = req.getServletPath(); // localhost/Asm-Java4/login - Path re nhanh phia sau ten Project
			System.out.println(path);
			switch (path) {
			case "/admin":
				doGetHome(req, resp);
				break;
			case "/edit":
				doEdit(req, resp);
				break;
			case "/delete":
				doDelele(req, resp);
				break;
			case "/resest":
				doReset(req, resp);
				break;
			case "/update":
				doUpdate(req, resp);
				break;
			}

		} else {
			resp.sendRedirect("index");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath(); // localhost/Asm-Java4/login - Path re nhanh phia sau ten Project
		System.out.println(path);
		switch (path) {

		case "/add":
			doAdd(req, resp);
			break;
		}
	}

	private void doAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String email = req.getParameter("email");

		User user = userService.create(username, password, email);
		doReset(req, resp);
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}

	protected void doReset(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Thong ke tat ca video va luot
		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		List<User> users = userService.findAll();

		req.setAttribute("videos", videos);
		req.setAttribute("users", users);

		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);

	}

	private void doGetHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Thong ke tat ca video va luot
		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		List<User> users = userService.findAll();

		req.setAttribute("videos", videos);
		req.setAttribute("users", users);

		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
	}

	private void doEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		List<User> users = userService.findAll();

		System.out.println();
		String userId = req.getParameter("userId");
		User user = userService.findByID(Integer.valueOf(userId));

		req.setAttribute("user", user);
		req.setAttribute("videos", videos);
		req.setAttribute("users", users);
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);

	}

	private void doDelele(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		List<User> users = userService.findAll();

		String userId = req.getParameter("userId");
		User user = userService.findByID(Integer.valueOf(userId));

		String username = user.getUsername();

		userService.delete(username);

		req.setAttribute("videos", videos);
		req.setAttribute("users", users);
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);

	}

	private void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User user = new User();
		String userId = req.getParameter("userId");

		user = userService.findByID(Integer.valueOf(userId));

		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setEmail(req.getParameter("email"));
		System.out.println(user);
		user.setIsAdmin(Boolean.valueOf(req.getParameter("admin")));

		userService.update(user);
		System.out.println("update success");

		doReset(req, resp);
		req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);

	}
}
