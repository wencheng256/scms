<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("path", basePath);
request.setAttribute("web_name", "山东大学（威海）科研立项管理系统");
%>
<%@taglib uri="/scms.sdu.edu.cn" prefix="m"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>