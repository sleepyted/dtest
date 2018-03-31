package service;

import bean.User;
import commom.Util;
import dao.UserDao;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

/**
 */
public class UserService {
	UserDao userDao = new UserDao();
	public int userRegister(User user) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		if(userDao.getUserByEmail(user.getEmail())){
			return -1;
		}
		user.setPassword(Util.EncoderByMd5(user.getPassword()));
		return userDao.insert(user);
	}

	public User userLogin(String email, String password) {
		User user = userDao.getUserByEmailPassword(email, password);
		return user;
	}
}
