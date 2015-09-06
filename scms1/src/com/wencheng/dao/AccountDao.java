package com.wencheng.dao;

import com.wencheng.domain.Account;


public interface AccountDao extends ObjectDao<Account> {

	public boolean checkUsername(String username);
	
}
