package com.xh.bbs.dao;

import java.util.List;

import com.xh.bbs.entity.UserEntity;

public interface UserDaoInf {

	//��¼ʱ���û�����֤��ѯ
	public UserEntity findUser(String userId, String passwd);
	
	//����id��ѯ�û�
	public UserEntity findUserById(int id);
	
	//����û�
	public int addUser(UserEntity user);
	
	//ɾ���û�
	public void deleteUser(int uid);
	
	//�޸��û�
	public void updateUser(UserEntity user);
	
	//��ѯ�����û���Ϣ
	public List<UserEntity> findUserlist();
}
