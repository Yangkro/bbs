package com.xh.bbs.service;

import java.util.List;

import com.xh.bbs.entity.ForumEntity;
import com.xh.bbs.entity.ReplyEntity;

public interface BbsServiceInf {

	//��ѯ�����б�
	public List<ForumEntity> findForumList();
	
	//��������
	public int createForum(ForumEntity forum);
	
	//��ѯ���Ӷ�Ӧ�Ļظ�
	public ForumEntity findReplyList(int fid);
	
	//����ظ�
	public int createReply(ReplyEntity reply);
	
	//��ѯ���˷���
	public List<ForumEntity> personForum(int pid);
	
	//ɾ����������
	public void deleteForumByFid(int fid);
	
	//ɾ�����ӵ����лظ�
	public void deleteReplyByFid(int fid);
	
	//ɾ�������µ�ĳ���û��Ļ���
	public void deleteReplyByRid(int rid);
	
	
	
												//�û�����ģ��
	//ɾ���û������з���
	public void dUserAllForumByUid(int uid);
	
	//ɾ�����û����л���
	public void dUserAllreplyByUid(int uid);
	
	//ɾ���û������µ����л���
	public void dUserOtherRelyByFid(int uid);
	
	//�鿴�����û��������
	public List<ForumEntity> seeUserForumList(int uid);
	
}
