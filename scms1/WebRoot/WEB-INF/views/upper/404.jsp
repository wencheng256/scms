<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	出错啦！
</title>
<style type="text/css">
	h1{
		font-size: 150px;
		margin: 20px;
	}
	h2{
		font-size: 20px;
		color:#888;
		margin-left: 50px;
	}
	h3{
		font-size: 15px;
		color:#888;
		margin-left: 50px;
	}
</style>
</head>
<body>
	<h1>?: 404</h1>
	<h2>我会告诉你上面那个符号是猫王吗？看多像他的头发！</h2>
	<c:if test="${message!=null }">
	<h2>${message }</h2>
	</c:if>
	<h2>如果一直重复出现这个问题，请发邮件告诉我<a href="mailto:wencheng256@gmail.com">wencheng256@gmail.com</a>注明科创中心bug</h2>
	<h3><span id="tick">5</span>秒钟后跳转至首页</h3>
	<h3>山东大学（威海）科创中心</h3>
</body>
</html>
