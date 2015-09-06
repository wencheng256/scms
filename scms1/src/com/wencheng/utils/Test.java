package com.wencheng.utils;

import org.hibernate.Session;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("aaaa");
		Session session = HibernateUtil.getSession();
		session.close();
	}
}
