package com.wencheng.dao;

import java.util.List;

import com.wencheng.domain.Message;

public interface MessageDao extends ObjectDao<Message>{

		public List<Message> listpro(int id);
	
}
