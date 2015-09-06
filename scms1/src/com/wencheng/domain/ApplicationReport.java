package com.wencheng.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class ApplicationReport {
	
	private int id;
	private boolean ispublic;
	private String now;
	private String problems;
	private String could;
	private String reference;
	private String content;
	private String method;
	private String process;
	private String equipment;
	private String comefrom;
	private String thought;
	private String about;
	private String base;
	private Project project;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isIspublic() {
		return ispublic;
	}
	public void setIspublic(boolean ispublic) {
		this.ispublic = ispublic;
	}
	public String getNow() {
		return now;
	}
	public void setNow(String now) {
		this.now = now;
	}
	public String getProblems() {
		return problems;
	}
	public void setProblems(String problems) {
		this.problems = problems;
	}
	public String getCould() {
		return could;
	}
	public void setCould(String could) {
		this.could = could;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getComefrom() {
		return comefrom;
	}
	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}
	public String getThought() {
		return thought;
	}
	public void setThought(String thought) {
		this.thought = thought;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
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
