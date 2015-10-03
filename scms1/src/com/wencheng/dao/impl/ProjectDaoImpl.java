package com.wencheng.dao.impl;

import java.util.List;

import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.wencheng.dao.ProjectDao;
import com.wencheng.domain.Project;
import com.wencheng.domain.Teacher;
import com.wencheng.utils.HibernateUtil;

public class ProjectDaoImpl extends ObjectDaoImpl<Project> implements ProjectDao {

	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		Session se = HibernateUtil.getSession();
		try{
			String queryString = "select distinct p from Project p where p.name=:name";
			Query query = se.createQuery(queryString);
			query.setString("name", name);
			return query.uniqueResult() != null;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public boolean checkNumber(String number) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String queryString = "select count(p) from Project p where p.number = :number";
			Query query = session.createQuery(queryString);
			query.setString("number",number);
			return (Long)query.uniqueResult()>0;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public List<Project> list(int grade,int start,int rows) {
		Session session = HibernateUtil.getSession();
		try{
			return session.createCriteria(Project.class).add(Restrictions.eq("grade", grade)).createCriteria("school",JoinType.LEFT_OUTER_JOIN).setFetchMode("school",FetchMode.JOIN).setFirstResult(start).setMaxResults(rows).list();
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public long getRows(int grade) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			return (Long) session.createCriteria(Project.class).add(Restrictions.eq("grade",grade)).setProjection(Projections.rowCount()).uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public Project findProject(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			String HQLString = "select distinct p from Project p left join fetch p.teacher left join fetch p.school left join fetch p.level left join fetch p.member  where p.id=:id";
			Query query = session.createQuery(HQLString);
			query.setInteger("id", id);
			return (Project) query.uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	@Override
	public boolean addTeacher(int teacher,int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Transaction ts = session.beginTransaction();
		try{
			Project pro = session.load(Project.class, project);
			Teacher tea = session.load(Teacher.class, teacher);
			pro.setTeacher(tea);
			ts.commit();
			return true;
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public List<Project> listTeacher(int grade, int start, int rows,int teacher) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			return session.createCriteria(Project.class).add(Restrictions.eq("grade", grade)).createAlias("teacher","t",JoinType.LEFT_OUTER_JOIN).add(Restrictions.eq("t.id", teacher)).createCriteria("school",JoinType.LEFT_OUTER_JOIN).setFetchMode("school",FetchMode.JOIN).setFirstResult(start).setMaxResults(rows).list();
		}finally{
			HibernateUtil.closeSession();
		}
	}

	@Override
	public long getTeacherRows(int grade, int teacher) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			return (Long) session.createCriteria(Project.class).createAlias("teacher", "t",JoinType.LEFT_OUTER_JOIN).add(Restrictions.eq("t.id", teacher)).add(Restrictions.eq("grade",grade)).setProjection(Projections.rowCount()).uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}

}
