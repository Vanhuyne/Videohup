package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

@WebServlet(urlPatterns = "/video")
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String href = req.getParameter("id");
		HttpSession session = req.getSession();
		switch (action) {
		case "watch":
			doGetWatch(session, href, req, resp);
			break;
		case "like":
			doGetLike(session, href, req, resp);
			break;
		}

	}

	private void doGetWatch(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Video video = videoService.findByHref(href);
		req.setAttribute("video", video);
		User currrentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);

		// Neu da dang nhap thi click vao xem thi them vao History - xem xem no da like

		if (currrentUser != null) {
			History history = historyService.create(currrentUser, video);
			req.setAttribute("flagLikedBtn", history.getIsLiked());
			System.out.println(history.getIsLiked());
		}

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/video-detail.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	private void doGetLike(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("application/json");
		User currrentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		boolean result = historyService.updateLikeOrUnlike(currrentUser, href);
		if (result == true) {
			resp.setStatus(204);// Success nhma k tra ve data
		} else {
			resp.setStatus(400);// Loi
		}

	}
}
