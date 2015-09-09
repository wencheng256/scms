package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.wencheng.dao.StudentDao;
import com.wencheng.domain.Project;
import com.wencheng.domain.School;
import com.wencheng.domain.Student;
import com.wencheng.utils.HibernateUtil;

public class StudentDaoImpl extends ObjectDaoImpl<Student> implements
		StudentDao {

	@Override
	public boolean create(Student domain,int project,int school) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project pro = session.load(Project.class, project);
			School sc = session.load(School.class, school);
			domain.setProject(pro);
			domain.setSchool(sc);
			session.persist(domain);
			ts.commit();
			return true;
		}catch(HibernateException e){
			return false;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public List<Student> list(int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct s from Student s join s.school where s.project.id = :id";
			Query query = session.createQuery(queryString).setInteger("id", project);
			return query.list();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public boolean mkcaptain(int id, int project) {
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			String queryString = "update Student s set s.cap = :cap  where s.project.id = :id";
			Query query = session.createQuery(queryString).setBoolean("cap",false).setInteger("id",project);
			query.executeUpdate();
			session.load(Student.class, id).setCap(true);
			session.flush();
			ts.commit();
			return true;
		}catch(HibernateException e){
			e.printStackTrace();
			return false;
		}finally{
			HibernateUtil.closeSession();
		}
	}

}
