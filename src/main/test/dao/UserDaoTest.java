package dao;

import bean.User;
import org.junit.Test;

/**
 */
public class UserDaoTest {

	@Test
	public void TestInsert() {
		User user = new User("teddy", "ted@ted.com", "12345678", "123","0","0");
		UserDao userDao = new UserDao();
		System.out.println(userDao.insert(user));
	}

	@Test
	public void TestFindUser(){
		UserDao userDao = new UserDao();
		User user = userDao.getUserByEmailPassword("ted@ted.com", "123");
		System.out.println(user);

		User user2 = userDao.getUserByEmailPassword("ted2", "123");
		System.out.println(user2);

		User user3 = userDao.getUserById(3);
		System.out.println(user3);
	}
}
