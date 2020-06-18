package com.xh.bbs.service;

import java.util.List;

import com.xh.bbs.dao.UserDaoImpl;
import com.xh.bbs.dao.UserDaoInf;
import com.xh.bbs.entity.UserEntity;

public class UserServiceImpl implements UserServiceInf{

	public UserEntity login(String userId, String passwd) {
		//����dao���û��Ĳ�ѯ
		UserDaoInf userDao = new UserDaoImpl();
		UserEntity user = userDao.findUser(userId, passwd);
		return (user==null) ? null : user;
	}

	public int saveUser(UserEntity user) {
		//����dao�����û�
		UserDaoInf userDao = new UserDaoImpl();
		return userDao.addUser(user);
	}
	
		//����Daoɾ���û�
	public void deleteUser(int uid){
		UserDaoInf user=new UserDaoImpl();
		user.deleteUser(uid);
	}
	
	public void updateUser(UserEntity user){
		UserDaoInf userdao=new UserDaoImpl();
		userdao.updateUser(user);
	}
	
	public UserEntity findUser(int uid){
		UserDaoInf userDao=new UserDaoImpl();
		UserEntity user=userDao.findUserById(uid);
		return (user==null)?null:user;
	}
	
	public List<UserEntity> findUserList(){
		UserDaoInf userDao=new UserDaoImpl();
		List<UserEntity> userList=userDao.findUserlist();
		return userList;
	}

}
