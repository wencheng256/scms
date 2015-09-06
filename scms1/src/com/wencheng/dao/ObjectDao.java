package com.wencheng.dao;

import java.util.List;

public interface ObjectDao<T> {
	public boolean create(T domain);
	public boolean update(T domain);
	public boolean delete(Class<T> cla,int id);
	public T find(Class<T> cla,int id);
	public List<T> list(String name);
}
