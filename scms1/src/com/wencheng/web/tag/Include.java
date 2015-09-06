package com.wencheng.web.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class Include extends SimpleTagSupport{

	private static final int JS = 0;
	private static final int CSS = 1;
	private String src;
	private int type;
	
	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		PageContext context = (PageContext) this.getJspContext();
		String src1 = context.getServletContext().getContextPath();
		JspWriter out = context.getOut();
		if(type == JS){
			String o = "<script src=\""+src1+"/js/"+src+"\" ></script>\n";
			out.print(o);
			out.flush();
		}else if(type == CSS){
			String o = "<link rel=\"stylesheet\" href=\""+src1+"/style/"+src+"\" type=\"text/css\" />\n";
			out.print(o);
			out.flush();
		}
		
	}
	
}
