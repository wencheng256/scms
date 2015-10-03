package com.wencheng.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

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
public class Message {
	
	private int id;
	private String name;
	private String content;
	private Project fromProject;
	private Project toProject;
	private Date time = new Date();
	private SimpleDateFormat sm = new SimpleDateFormat("YY-MM-dd/hh:mm");
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@ManyToOne
	@JoinColumn(name="fromp")
	public Project getFromProject() {
		return fromProject;
	}
	public void setFromProject(Project fromProject) {
		this.fromProject = fromProject;
	}
	@ManyToOne
	@JoinColumn(name="top")
	public Project getToProject() {
		return toProject;
	}
	public void setToProject(Project toProject) {
		this.toProject = toProject;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Transient
	public String getDate(){
		return sm.format(getTime());
	}
}
