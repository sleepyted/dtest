package servlet;

import commom.JDBCUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * servlet for homePage
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Connection conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM online_voting.t_user";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			List<Integer> rss = new ArrayList<Integer>();
			while (rs.next()) {
				rss.add(rs.getInt("id"));
			}
			req.setAttribute("rss", rss);
		}catch (Exception e){
			System.out.println("jdbc Fail");
		}
		req.getRequestDispatcher("/page/home.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
