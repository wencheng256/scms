package com.wencheng.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Properties {

	private int propid;
	private String propkey;
	private String value;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getPropid() {
		return propid;
	}
	public void setPropid(int propid) {
		this.propid = propid;
	}
	@Column(unique=true)
	public String getPropkey() {
		return propkey;
	}
	public void setPropkey(String key) {
		this.propkey = key;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}
