package com.wencheng.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Journal {
	
	private int id;
	private boolean isPublic;
	private boolean isCao;
	private Student editor;
	private String content;
	private Type type;
	private Project project;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isPublic() {
		return isPublic;
	}
	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}
	public boolean isCao() {
		return isCao;
	}
	public void setCao(boolean isCao) {
		this.isCao = isCao;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@ManyToOne
	@JoinColumn(name="project")
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
}
