package com.wencheng.dao.impl;

import java.util.List;

import net.sf.json.JSONArray;

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
	@Override
	public Object[] listProject(int project) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		try{
			return (Object[]) session.createCriteria(Project.class).createAlias("teacher.school", "sch",JoinType.LEFT_OUTER_JOIN).createAlias("teacher","teach",JoinType.LEFT_OUTER_JOIN).add(Restrictions.eq("id", 1)).setProjection(Projections.projectionList().add(Projections.property("teach.name")).add(Projections.property("teach.identity")).add(Projections.property("teach.phone")).add(Projections.property("teach.phone")).add(Projections.property("teach.email")).add(Projections.property("sch.name"))).uniqueResult();
		}finally{
			HibernateUtil.closeSession();
		}
	}

}
