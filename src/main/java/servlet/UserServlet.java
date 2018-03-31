package servlet;

import commom.Log;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户管理
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private final String TAG = "UserServlet";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page = req.getParameter("page");
		switch (page) {
			case "login":
			case "register":
			case "info":
				req.getRequestDispatcher("/page/user/" + page + ".jsp").forward(req, resp);
				break;
			default:
				Log.i(TAG, "No page match -- " + page);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
