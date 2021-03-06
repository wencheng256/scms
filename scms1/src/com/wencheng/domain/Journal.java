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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


@Entity
public class Journal {
	
	private int id;
	private boolean readed = false;
	private int status;					//0草稿 1私有 2公开 3回收站
	private Student editor;
	private String jcontent;
	private Type type;
	private Project project;
	private Date time=new Date();
	private String title;
	private SimpleDateFormat sm = new SimpleDateFormat("YYYY-MM-dd");
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@ManyToOne
	@JoinColumn(name="editor")
	public Student getEditor() {
		return editor;
	}
	public void setEditor(Student editor) {
		this.editor = editor;
	}
	@ManyToOne
	@JoinColumn(name="type")
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	
	@Column(length=3000,name="content")
	@org.hibernate.annotations.Type(type="text")
	public String getJcontent() {
		return jcontent;
	}
	public void setJcontent(String content) {
		this.jcontent = content;
	}
	@ManyToOne
	@JoinColumn(name="project")
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Transient
	public String getDate(){
		return sm.format(time);
	}
	@Column(nullable=true)
	public boolean isReaded() {
		return readed;
	}
	public void setReaded(boolean read) {
		this.readed = read;
	}
}
