package com.xh.bbs.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.xh.bbs.entity.ForumEntity;
import com.xh.bbs.entity.ReplyEntity;
import com.xh.bbs.entity.UserEntity;
import com.xh.bbs.utils.DBUtil;

public class BbsDaoImpl implements BbsDaoInf{

	//��ѯ�����б�
	public List<ForumEntity> findForumList() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ForumEntity> list = new ArrayList<ForumEntity>();
        String sql = "select * from forum_info";
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ForumEntity forum = new ForumEntity();
				forum.setFid(rs.getInt(1));
				forum.setTitle(rs.getString(2));
				forum.setContent(rs.getString(3));
				forum.setCreateTime(rs.getTimestamp(4));
				//��ȡ��Ӧ�û����е����
				UserEntity author = new UserEntity();
				author.setUser_id(rs.getInt(5));
				forum.setAuthor(author);
				list.add(forum);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, conn);
		}
		return list;
	}

	//�������
	public int addForum(ForumEntity forum) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "insert into forum_info(title,content,create_time,user_id) values(?,?,?,?)";

		int i = 0;
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, forum.getTitle());
			ps.setString(2, forum.getContent());
			ps.setTimestamp(3, forum.getCreateTime());
			ps.setInt(4, forum.getAuthor().getUser_id());
			i = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(null, ps, conn);
		}
		return i;
	}
	
	//����ID��ѯĳ������
	public ForumEntity findForumById(int fid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ForumEntity forum = null;
		String sql = "select * from forum_info where fid = ?";
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fid);
			rs = ps.executeQuery();
			if(rs.next()){
				forum = new ForumEntity();
				forum.setFid(rs.getInt(1));
				forum.setTitle(rs.getString(2));
				forum.setContent(rs.getString(3));
				forum.setCreateTime(rs.getTimestamp(4));
				//��ȡ��Ӧ�û����е����
				UserEntity author = new UserEntity();
				author.setUser_id(rs.getInt(5));
				forum.setAuthor(author);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, conn);
		}
		return forum;
	}

	//��ѯ���Ӷ�Ӧ�����лظ�
	public List<ReplyEntity> findReplyList(int fid) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ReplyEntity> list = new ArrayList<ReplyEntity>();
		//���������Ϊ������ѯ��ǰ���ӵ����лظ�
		String sql = "select * from reply_info where fid = ?";
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fid);
			rs = ps.executeQuery();
			while(rs.next()){
				ReplyEntity reply = new ReplyEntity();
				reply.setRid(rs.getInt(1));
				reply.setContent(rs.getString(2));
				reply.setReplyTime(rs.getTimestamp(3));
				//��ȡ��Ӧ�û����е����
				UserEntity replyUser = new UserEntity();
				replyUser.setUser_id(rs.getInt(4));
				reply.setUser(replyUser);
				list.add(reply);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, conn);
		}
		return list;
	}

	//��ӻظ�
	public int addReply(ReplyEntity reply) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		
//		System.out.println("��ӻظ��ɹ�");
		String sql = "insert into reply_info(reply_content,reply_time,user_id,fid) values(?,?,?,?)";
		try{
			conn = DBUtil.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, reply.getContent());
			ps.setTimestamp(2, reply.getReplyTime());
			//����Ӧ�����������ֵ
			ps.setInt(3, reply.getUser().getUser_id());
			ps.setInt(4, reply.getForum().getFid());
			i = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(null, ps, conn);
		}
		return i;
	}
	
	//�����û�ID��ѯ�û������з���
		public List<ForumEntity> personForum(int pid){
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			
			String sql="select * from forum_info where user_id=?";
			List<ForumEntity> list=new ArrayList<ForumEntity>();
			
			try {
				conn=DBUtil.getConnection();
				ps=conn.prepareStatement(sql);
				ps.setInt(1, pid);
				rs=ps.executeQuery();
				
				while(rs.next()){
					ForumEntity forum=new ForumEntity();
					forum.setFid(rs.getInt(1));
					forum.setTitle(rs.getString(2));
					forum.setContent(rs.getString(3));
					forum.setCreateTime(rs.getTimestamp(4));
					UserEntity user=new UserEntity();
					user.setUser_id(rs.getInt(5));
					forum.setAuthor(user);
					list.add(forum);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		//�û�ɾ������ĳ������
		public void deleteForum(int fid){
			Connection conn=null;
			PreparedStatement ps=null;
			
			String sql="delete from forum_info where fid=?";
			
			try {
				conn=DBUtil.getConnection();
				ps=conn.prepareStatement(sql);
				ps.setInt(1, fid);
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.close(null, ps, conn);
			}
		}
		
		//��������idɾ�����лظ�
		public void deleteReply(int fid){
			Connection conn=null;
			PreparedStatement ps=null;
			
			String sql="delete from reply_info where fid=?";
			
			try {
				conn=DBUtil.getConnection();
				ps=conn.prepareStatement(sql);
				ps.setInt(1, fid);
				
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.close(null,ps,conn);
			}
		}
		
		//�û�ɾ��ĳ������
		public void deleteReplyByRid(int rid){			
			Connection conn=null;
			PreparedStatement ps=null;
			
			String sql="delete from reply_info where reply_id=?";
			
			try {
				conn=DBUtil.getConnection();
				ps=conn.prepareStatement(sql);
				ps.setInt(1, rid);
				
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.close(null,ps,conn);
			}
		}
		
												//�û�����ģ��
		//ɾ���û����з���
		public void dUserAllforumByUid(int uid){
				Connection conn=null;
				PreparedStatement ps=null;
				
				String sql="delete from forum_info where user_id=?";
				
				try {
					conn=DBUtil.getConnection();
					ps=conn.prepareStatement(sql);
					ps.setInt(1, uid);
					
					ps.executeUpdate();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					DBUtil.close(null,ps,conn);
				}
		}
		
		//ɾ���û������л���
		public void dUserAllreplyByUid(int uid){
			Connection conn=null;
			PreparedStatement ps=null;
			
			String sql="delete from reply_info where user_id=?";
			
			try {
				conn=DBUtil.getConnection();
				ps=conn.prepareStatement(sql);
				ps.setInt(1, uid);
				
				ps.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.close(null,ps,conn);
			}
		}
		
		//ɾ���û������µ����л���
		public void dUserOtherRelyByFid(int uid){
			Connection conn=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			
			String sql="select fid from forum_info where user_id=?";
				
			List<ForumEntity> fidlist=new ArrayList<ForumEntity>();
			try {
				conn=DBUtil.getConnection();
				ps=conn.prepareStatement(sql);
				ps.setInt(1, uid);				
				rs=ps.executeQuery();
				while(rs.next()){
					ForumEntity forum=new ForumEntity();
					forum.setFid(rs.getInt(1));
					fidlist.add(forum);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.close(null,ps,conn);
			}
			
			String fsql="delete from reply_info where fid=?";
			
			try {
				
				
				for(ForumEntity forum : fidlist){
					conn=DBUtil.getConnection();
					ps=conn.prepareStatement(fsql);
					ps.setInt(1, forum.getFid());
					
					ps.executeUpdate();
					DBUtil.close(null,ps,conn);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
}
