package com.xh.bbs.service;

import java.util.ArrayList;
import java.util.List;

import com.xh.bbs.dao.BbsDaoImpl;
import com.xh.bbs.dao.BbsDaoInf;
import com.xh.bbs.dao.UserDaoImpl;
import com.xh.bbs.dao.UserDaoInf;
import com.xh.bbs.entity.ForumEntity;
import com.xh.bbs.entity.ReplyEntity;
import com.xh.bbs.entity.UserEntity;

public class BbsServiceImpl implements BbsServiceInf{

	
	public List<ForumEntity> findForumList() {
//		System.out.println("��ѯ�����б�");
		BbsDaoInf bbsDao = new BbsDaoImpl();
		UserDaoInf userDao = new UserDaoImpl(); 
	
		List<ForumEntity> forumList = bbsDao.findForumList();
	
		for (ForumEntity forumEntity : forumList) {
			int uid = forumEntity.getAuthor().getUser_id();
			UserEntity author = userDao.findUserById(uid);
			forumEntity.setAuthor(author);
			
			
		}
//		System.out.println(forumList);
		return forumList;
	}

	//��������
	public int createForum(ForumEntity forum) {
		BbsDaoInf bbsDao = new BbsDaoImpl();
		return bbsDao.addForum(forum);
	}


	public ForumEntity findReplyList(int fid) {
		BbsDaoInf bbsDao = new BbsDaoImpl();
		UserDaoInf userDao = new UserDaoImpl();
	
		ForumEntity forum = bbsDao.findForumById(fid);		
		UserEntity author = userDao.findUserById(forum.getAuthor().getUser_id());
			
		List<ReplyEntity> replyList = bbsDao.findReplyList(fid);
			
		for (ReplyEntity replyEntity : replyList) {
			UserEntity replyUser = userDao.findUserById(replyEntity.getUser().getUser_id());
			replyEntity.setUser(replyUser);
		}
		
		forum.setAuthor(author);
		forum.setReplyList(replyList);
		return forum;
	}

	//����ظ�
	public int createReply(ReplyEntity reply) {
		BbsDaoInf dao = new BbsDaoImpl();
		return dao.addReply(reply);
	}
	
	//��ѯ���˷���
	public List<ForumEntity> personForum(int pid){
		BbsDaoInf dao=new BbsDaoImpl();
		List<ForumEntity> personList=new ArrayList<ForumEntity>();
		
		personList=dao.personForum(pid);
		
		return (personList==null)?null:personList;
	}
	
	//ɾ����������
	public void deleteForumByFid(int fid){
		BbsDaoInf dao=new BbsDaoImpl();
		dao.deleteForum(fid);
	}
								
	//ɾ�����ӵ����лظ�
	public void deleteReplyByFid(int fid){
		BbsDaoInf dao=new BbsDaoImpl();
		dao.deleteReply(fid);
	}
	
	//ɾ�������µ�ĳ���û��Ļ���
	public void deleteReplyByRid(int rid){
		BbsDaoInf dao=new BbsDaoImpl();
		dao.deleteReplyByRid(rid);
	}
			                      //����Աģ��
	//ɾ���û���ɾ���û���Ϣ��������Ϣ��������Ϣ��
	public void dUserAllForumByUid(int uid){
		BbsDaoInf dao=new BbsDaoImpl();
		dao.dUserAllforumByUid(uid);
	}
	
	//ɾ�����û����л���
	public void dUserAllreplyByUid(int uid){
		BbsDaoInf dao=new BbsDaoImpl();
		dao.dUserAllreplyByUid(uid);
	}
	
	//ɾ���û������µ����л���
	public void dUserOtherRelyByFid(int uid){
		BbsDaoInf dao=new BbsDaoImpl();
		dao.dUserOtherRelyByFid(uid);
	}
	
	//�鿴�����û��������
	public List<ForumEntity> seeUserForumList(int uid){
		BbsDaoInf dao=new BbsDaoImpl();
		List<ForumEntity> forum=dao.personForum(uid);	
		return forum;
	}
}
