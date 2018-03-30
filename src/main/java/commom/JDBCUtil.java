package commom;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 操作jdbc的工具类
 */
public class JDBCUtil {

	public static String DRIVERNAME = null;
	public static String URL = null;
	public static String USER = null;
	public static String PASSWORD = null;

	public static Connection conn = null;

	static {
		try {
//			获取配置文件
			Properties props = new Properties();
//			//Reader in = new FileReader("db.properties");
			InputStream in = JDBCUtil.class.getClassLoader().getResourceAsStream(".\\db.properties");
			props.load(in);

			DRIVERNAME = props.getProperty("drivername");
			URL = props.getProperty("url");
			USER = props.getProperty("user");
			PASSWORD = props.getProperty("password");
//			DRIVERNAME = "com.mysql.jdbc.Driver";
//			URL = "jdbc:mysql://localhost:3306/online_voting?useUnicode=true&amp;characterEncoding=utf-8";
//			USER = "root";
//			PASSWORD = "";
			System.out.println("------USE DB.PROPERTIES-----");
			System.out.println(DRIVERNAME + "\n"
					+ USER + "\n"
					+ URL + "\n"
					+ PASSWORD);
			System.out.println("-----------------------------");
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 注册驱动、连接数据库
	 *
	 * @return Connection 对象
	 * @throws Exception
	 */
	public static Connection getConnection() throws Exception {
		if (conn != null) {
			return conn;
		}

		Class.forName(DRIVERNAME);
		conn = DriverManager.getConnection(URL, USER, PASSWORD);

		return conn;
	}

	/**
	 * 关闭连接
	 *
	 * @param conn
	 * @param st
	 * @throws SQLException
	 */
	public static void closeResource(Connection conn, PreparedStatement st) throws SQLException {
		st.close();
		conn.close();
	}

	/**
	 * 关闭连接
	 *
	 * @param conn
	 * @param rs
	 * @param st
	 * @throws SQLException
	 */
	public static void closeResource(Connection conn, ResultSet rs, PreparedStatement st) throws SQLException {
		st.close();
		rs.close();
		conn.close();
	}

}