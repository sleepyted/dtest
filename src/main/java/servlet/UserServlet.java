package servlet;

import bean.Result;
import bean.User;
import com.google.gson.Gson;
import commom.Log;
import dao.UserDao;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 用户管理
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private final String TAG = "UserServlet";
	UserService userService = new UserService();

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
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		String action = req.getParameter("action");
		User user = new User() ;
		switch (action) {
			case "login":
				String userName = req.getParameter("username");
				String password = req.getParameter("password");
				user = userService.userLogin(userName, password);
				if (null != user) {
					HttpSession session = req.getSession();
					session.setAttribute("user", user);
					resp.sendRedirect("home");
				}else {
					Result result = new Result(0, "登录失败，请检查用户名和密码");
					Gson gson = new Gson();
					resp.getWriter().write(gson.toJson(result));
				}
				break;
			case "register":
				String username = req.getParameter("username");
				String email = req.getParameter("email");
				String password1 = req.getParameter("password");
				String gender = req.getParameter("gender");
				String tel = req.getParameter("tel");
				user.setUsername(username);
				user.setPassword(password1);
				user.setEmail(email);
				user.setTel(tel);
				user.setGender(gender);
				user.setUserType("0");

				Gson gson = new Gson();

				try{
					if(userService.userRegister(user) != -1){
						resp.getWriter().write(gson.toJson(new Result(1,"注册成功，将跳转到登录页面")));
					}else {
						resp.getWriter().write(gson.toJson(new Result(0,"注册失败，用户已存在")));
					}
				}catch (Exception e){
					Log.i(TAG, e.toString());
					resp.getWriter().write(gson.toJson(new Result(0,"注册失败，请重试")));
				}
		}
	}


}
