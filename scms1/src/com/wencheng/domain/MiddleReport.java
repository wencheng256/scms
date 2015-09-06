package com.wencheng.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class MiddleReport {
	
	private int id;
	private boolean isSubmit;
	private boolean isPublic;
	private String result;
	private String thought;
	private String feeused;
	private String reasonWhyDelay;
	private String plan;
	private String target;
	private String problems;
	private Project project;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * 是否提交
	 * @return
	 */
	public boolean isSubmit() {
		return isSubmit;
	}
	public void setSubmit(boolean isSubmit) {
		this.isSubmit = isSubmit;
	}
	/**
	 * 是否公开
	 * @return
	 */
	public boolean isPublic() {
		return isPublic;
	}
	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}
	/**
	 * 研究成果
	 * @return
	 */
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	/**
	 * 感想体会
	 * @return
	 */
	public String getThought() {
		return thought;
	}
	public void setThought(String thought) {
		this.thought = thought;
	}
	/**
	 * 经费使用情况
	 * @return
	 */
	public String getFeeused() {
		return feeused;
	}
	public void setFeeused(String feeused) {
		this.feeused = feeused;
	}
	/**
	 * 未按照原计划完成的部分原因
	 * @return
	 */
	public String getReasonWhyDelay() {
		return reasonWhyDelay;
	}
	public void setReasonWhyDelay(String reasonWhyDelay) {
		this.reasonWhyDelay = reasonWhyDelay;
	}
	/**
	 * 工作计划
	 * @return
	 */
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	/**
	 * 存在的问题
	 * @return
	 */
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	/**
	 * 预期结果
	 * @return
	 */
	public String getProblems() {
		return problems;
	}
	public void setProblems(String problems) {
		this.problems = problems;
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
