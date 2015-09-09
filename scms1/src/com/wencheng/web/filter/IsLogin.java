package com.wencheng.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wencheng.domain.Project;
import com.wencheng.service.ProjectService;
import com.wencheng.service.impl.ProjectServiceImpl;
import com.wencheng.utils.WebUtils;

public class IsLogin implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		if(!WebUtils.isLogin(request, "login")){
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		if(!WebUtils.isLogin(request, "project")){
			ProjectService ps = new ProjectServiceImpl();
			Project pro = ps.find(request);
			if(pro == null){
				response.sendRedirect(request.getContextPath()+"/login");
				return;
			}
			request.getSession().setAttribute("project", pro);
		}
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
