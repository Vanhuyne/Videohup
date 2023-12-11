package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constant.SessionAttr;
import entity.History;
import entity.User;
import entity.Video;
import service.HistoryService;
import service.VideoService;
import serviceImpl.HistoryServiceImpl;
import serviceImpl.VideoServiceImpl;

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = { "/index", "/favorites", "/history", "/change-lang" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final int VIDEO_MAX_PAGE_SIZE = 8;
	private VideoService videoService = new VideoServiceImpl(); // Inject IoC
	private HistoryService historyService = new HistoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// DoGet tong de? lay path cua tung DoGet theo case
		String path = req.getServletPath(); // localhost/Asm-Java4/login - Path re nhanh phia sau ten Project
		switch (path) {
		case "/index":
			doGetIndex(req, res);
			break;
		case "/favorites":
			doGetFavorites(session, req, res);
			break;
		case "/history":
			doGetHistory(session, req, res);
			break;
		case "/change-lang":
			doChangeLang(session, req, res);
			break;
		}

	}

	private void doGetIndex(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Chia page
		List<Video> countVideo = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);

		// 10 video , muon chia 1 trang co 4 video >>> 10/4 thi 2.5 trang => 3 TRANG
		List<Video> videos;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null || Integer.valueOf(pageNumber) > maxPage) {
			// Return to Page 1 neu ma Page rong or tham so truyen cua page > maxPage trong
			// List
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/user/index.jsp").forward(req, res);
	}

	private void doGetFavorites(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAttr.CURRENT_USER); // Check da login

		List<History> histories = historyService.findByUserAndIsLiked(user.getUsername()); // Kiem

		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo())); // Java8 forEach

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/user/favorites.jsp").forward(req, res);

	}

	private void doGetHistory(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAttr.CURRENT_USER); // Check da login

		List<History> histories = historyService.findByUser(user.getUsername()); // Kiem
		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo())); // Java8 forEach

		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/user/history.jsp").forward(req, res);
	}

	private void doChangeLang(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String lang = req.getParameter("lang");
		req.getSession().setAttribute("lang", lang);
		res.sendRedirect("index");
	};

}
