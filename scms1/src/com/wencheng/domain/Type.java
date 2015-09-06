package com.wencheng.domain;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Type {
	
	private int id;
	private String name;
	private List<Journal> journals = new LinkedList<Journal>();
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@OneToMany(mappedBy="type")
	public List<Journal> getJournals() {
		return journals;
	}
	public void setJournals(List<Journal> journals) {
		this.journals = journals;
	}
	
}
