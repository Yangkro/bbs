package com.xh.bbs.service;

import java.util.List;

import com.xh.bbs.entity.UserEntity;

public interface UserServiceInf {

	// ��¼ʱ���û�����֤��ѯ
	public UserEntity login(String userId, String passwd);

	// ����û�
	public int saveUser(UserEntity user);
	
	//ɾ���û�
	public void deleteUser(int uid);
	
	//�޸��û�
	public void updateUser(UserEntity user);
	
	//��ѯ�û���ϢById
	public UserEntity findUser(int uid);
	
	//��ѯ�����û�
	public List<UserEntity> findUserList();

}
