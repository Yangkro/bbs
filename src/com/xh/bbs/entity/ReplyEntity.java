package com.xh.bbs.entity;

import java.sql.Timestamp;
/** ����ʵ���� */
public class ReplyEntity {

	private int rid;
	private String content;
	private Timestamp replyTime;
	// �ظ���,���һ�Ĺ���
	private UserEntity user = new UserEntity();
	// ���һ����
	private ForumEntity forum = new ForumEntity();

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Timestamp replyTime) {
		this.replyTime = replyTime;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public ForumEntity getForum() {
		return forum;
	}

	public void setForum(ForumEntity forum) {
		this.forum = forum;
	}

}
