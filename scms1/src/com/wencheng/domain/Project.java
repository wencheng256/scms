package com.wencheng.domain;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Project {

	private int id;
	private String name;								//项目名称
	private String number;								//项目编号
	private Date startingTime;							//开始时间
	private ProjectLevel level;							//项目分类
	private int status;									//项目状态 0.超前 1.顺利 2.延迟 3.中断 4.终止
	private School school;								//学院
	private List<Student> member = new LinkedList<Student>();//成员
	private Teacher teacher;							//指导教师
	private List<Journal> journals = new LinkedList<Journal>();	//日志
	private ApplicationReport appliocationReport;		//申请报告
	private MiddleReport middleReport;					//中期报告
	private EndReport endReport;						//结题报告
	private List<Message> messages = new LinkedList<Message>();	//站内信
	private Account account;							//登陆账户
	private int process;								//项目进度
	private List<Error> errors = new LinkedList<Error>(); //警告处分
	private List<Fee> fees = new LinkedList<Fee>();
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(unique=true)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(unique=true)
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Date getStartingTime() {
		return startingTime;
	}
	public void setStartingTime(Date startingTime) {
		this.startingTime = startingTime;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="level")
	public ProjectLevel getLevel() {
		return level;
	}
	public void setLevel(ProjectLevel level) {
		this.level = level;
	}
	@Column(name="status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="school")
	public School getSchool() {
		return school;
	}
	public void setSchool(School school) {
		this.school = school;
	}
	@OneToMany(mappedBy="school")
	public List<Student> getMember() {
		return member;
	}
	public void setMember(List<Student> member) {
		this.member = member;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="teacher")
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	@OneToMany(mappedBy="project",fetch=FetchType.LAZY)
	public List<Journal> getJournals() {
		return journals;
	}
	public void setJournals(List<Journal> journals) {
		this.journals = journals;
	}
	@OneToOne(mappedBy="project",fetch=FetchType.LAZY)
	public ApplicationReport getAppliocationReport() {
		return appliocationReport;
	}
	public void setAppliocationReport(ApplicationReport appliocationReport) {
		this.appliocationReport = appliocationReport;
	}
	@OneToOne(mappedBy="project",fetch=FetchType.LAZY)
	public MiddleReport getMiddleReport() {
		return middleReport;
	}
	public void setMiddleReport(MiddleReport middleReport) {
		this.middleReport = middleReport;
	}
	@OneToOne(mappedBy="project",fetch=FetchType.LAZY)
	public EndReport getEndReport() {
		return endReport;
	}
	public void setEndReport(EndReport endReport) {
		this.endReport = endReport;
	}
	@OneToMany(mappedBy="toProject",fetch=FetchType.LAZY)
	public List<Message> getMessages() {
		return messages;
	}
	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}
	@OneToOne(mappedBy="project",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public int getProcess() {
		return process;
	}
	public void setProcess(int process) {
		this.process = process;
	}
	@OneToMany(mappedBy="project",fetch=FetchType.LAZY)	
	public List<Error> getErrors() {
		return errors;
	}
	public void setErrors(List<Error> errors) {
		this.errors = errors;
	}
	@OneToMany(mappedBy="project",fetch=FetchType.LAZY)
	public List<Fee> getFees() {
		return fees;
	}
	public void setFees(List<Fee> fees) {
		this.fees = fees;
	}
}
