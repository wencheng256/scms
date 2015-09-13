package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wencheng.dao.JournalDao;
import com.wencheng.domain.Journal;
import com.wencheng.domain.Project;
import com.wencheng.domain.Student;
import com.wencheng.domain.Type;
import com.wencheng.utils.HibernateUtil;

public class JournalDaoImpl extends ObjectDaoImpl<Journal> implements
		JournalDao {

	@Override
	public boolean create(Journal domain, int project,int editor,int type) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project proj = session.load(Project.class, project);
			Type typ = session.load(Type.class, type);
			Student edit = session.load(Student.class, editor);
			domain.setProject(proj);
			domain.setType(typ);
			domain.setEditor(edit);
			session.save(domain);
			ts.commit();
			return true;
		}catch(HibernateException e){
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public List<Journal> list(int project) {
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct j from Journal j left join j.type where j.project.id = :id";
			Query query = session.createQuery(queryString).setInteger("id", project);
			return query.list();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public Journal find(int id,int proj) {
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct j from Journal j join fetch j.editor  join fetch j.type  where j.id = :id and j.project.id = :id1";
			Query query = session.createQuery(queryString).setInteger("id", id).setInteger("id1", proj);
			return (Journal) query.uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public boolean update(Journal domain, int project, int edit, int type) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project pro = session.load(Project.class, project);
			Student edi = session.load(Student.class, edit);
			Type ty = session.load(Type.class,type);
			domain.setProject(pro);
			domain.setType(ty);
			domain.setEditor(edi);
					
			session.merge(domain);
			ts.commit();
			
			return true;
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public int delete(int id) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Journal jou = session.load(Journal.class, id);
			if(jou.getStatus() != 3){
				jou.setStatus(3);
				ts.commit();
				return 0;
			}else{
				session.delete(jou);
				ts.commit();
				return 1;
			}
		}finally{
			HibernateUtil.closeSession();
		}
	}
	
	

}
