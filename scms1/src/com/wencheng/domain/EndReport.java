package com.wencheng.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class EndReport {
	
	private int id;
	private boolean submit;
	private boolean ispublic;
	private String status;
	private String result;
	private String thought;
	private String feeused;
	private Project project;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isSubmit() {
		return submit;
	}
	public void setSubmit(boolean submit) {
		this.submit = submit;
	}
	public boolean isIspublic() {
		return ispublic;
	}
	public void setIspublic(boolean ispublic) {
		this.ispublic = ispublic;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getThought() {
		return thought;
	}
	public void setThought(String thought) {
		this.thought = thought;
	}
	public String getFeeused() {
		return feeused;
	}
	public void setFeeused(String feeused) {
		this.feeused = feeused;
	}
	@OneToOne
	@JoinColumn(name="project")
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	
}
