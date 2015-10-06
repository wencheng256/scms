package com.wencheng.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;

@Entity
public class News {
	
	private int id;
	private String title;
	private String jcontent;
	private int type; //0为学校新闻，1为学院新闻
	private School school;
	private Manager edit;
	private Date time = new Date();
	private SimpleDateFormat sm = new SimpleDateFormat("YYYY-MM-dd/hh:mm");
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Type(type="text")
	@Column(name="content")
	public String getJcontent() {
		return jcontent;
	}
	public void setJcontent(String content) {
		this.jcontent = content;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@ManyToOne
	@JoinColumn(name="schoolid")
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	@ManyToOne
	@JoinColumn(name="editorid")
	public Manager getEdit() {
		return edit;
	}
	public void setEdit(Manager edit) {
		this.edit = edit;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Transient
	public String getDate(){
		return sm.format(getTime());
	}
	
}
