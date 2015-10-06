package com.wencheng.dao.impl;

import java.util.List;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.wencheng.dao.TeacherDao;
import com.wencheng.domain.Project;
import com.wencheng.domain.Teacher;
import com.wencheng.utils.HibernateUtil;

public class TeacherDaoImpl extends ObjectDaoImpl<Teacher> implements TeacherDao {

	@Override
	public boolean checkUsername(String username) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			Long num = (Long) session.createCriteria(Teacher.class).add(Restrictions.eq("username",username)).setProjection(Projections.rowCount()).uniqueResult();
			return num > 0;
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public List<Teacher> listSchool(int school) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			return session.createCriteria(Teacher.class).createAlias("school","scho",JoinType.LEFT_OUTER_JOIN).add(Restrictions.eq("scho.id", school)).setProjection(Projections.projectionList().add(Projections.property("id")).add(Projections.property("name")).add(Projections.property("identity"))).list();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	public List<Teacher> listSchool(int school,int start,int rows) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			return session.createCriteria(Teacher.class).createAlias("school","scho",JoinType.LEFT_OUTER_JOIN).add(Restrictions.eq("scho.id", school)).setFirstResult(start).setMaxResults(rows).list();
		}finally{
		}
	}
	public List<Teacher> list(int start,int rows) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			return session.createCriteria(Teacher.class).setFirstResult(start).setMaxResults(rows).list();
		}finally{
		}
	}
	@Override
	public Teacher listProject(int teacher) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct t from Project p left join p.teacher t where p.id = :id";
			Query query = session.createQuery(queryString).setInteger("id", teacher);
			
			return (Teacher) query.uniqueResult();
		}finally{
		}
	}
	@Override
	public Teacher verified(String username, String password) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select distinct t from Teacher t left join fetch t.school where t.username = :name and t.password = :password";
			Query query = session.createQuery(queryString).setString("name",username).setString("password", password);
			return (Teacher) query.uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public Teacher find(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		String queryString = "select distinct t from Teacher t left join  t.projects where t.id = :id";
		Query query = session.createQuery(queryString).setInteger("id", id);
		return (Teacher) query.uniqueResult();
	}
	
	public Long getRows(){
		Session session = HibernateUtil.getSession();
		String queryString = "select count(distinct t) from Teacher t";
		Query query = session.createQuery(queryString);
		return (Long) query.uniqueResult();
	}
	public Long getSchoolRows(int school){
		Session session = HibernateUtil.getSession();
		String queryString = "select count(distinct t) from Teacher t where t.school.id = :school";
		Query query = session.createQuery(queryString).setInteger("school", school);
		return (Long) query.uniqueResult();
	}

}
