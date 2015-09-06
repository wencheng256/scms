package com.wencheng.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Message {
	
	private int id;
	private String content;
	private Project fromProject;
	private Project toProject;
	private Date time;
	
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
	
}
