<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="scms.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<m:include src="clicki.web.css?V=20120501" type="1"></m:include>
<m:include src="clicki.loginandreg.css?V=20120501" type="1"></m:include>
<m:include src="clicki.webkitanimation.css?V=20120501" type="1"></m:include>

<title>${web_name}登陆</title>
<!--[if lte IE 9 ]><link rel="stylesheet" href="resources/styles/clicki.iehotfix.css?V=20120501" /><![endif]-->
<!--[if lte IE 9]>
<style>
body {background:#2f7fb2 url(resources/styles/images/topbg_01.png?V=20120501) top center no-repeat;}
html{height:100%;overflow:hidden;background:#2f7fb2 url(resources/styles/images/topbg_01.png?V=20120501) top center no-repeat;}
</style>
<![endif]-->
</head>
<body>

<div class="theCenterBox" style="">
  <div class="theLoginBox">
    <div class="loginTxt">登录</div>
    <div class="theLoginArea" id="loginBox">
      <form id="leftForm" action="${path }loginaction" method="post">
        <p style="position: relative;">
          <label for="LoginForm_email">邮箱：</label>
          <input placeholder="请输入您的登陆账号" name="username" id="LoginForm_email" type="text" maxlength="255" />
          <span>请输入您的账号</span> </p>
        <p style="position: relative;">
          <label for="LoginForm_password">密码：</label>
          <input placeholder="请输入您的密码" name="password" id="LoginForm_password" type="password" maxlength="16" />
          <span>请输入您的密码</span> </p>
        <div class="loginSubmitBnt fixPadding">
          <div>
            <input id="ytautoLogin" type="hidden" value="0" name="LoginForm[rememberMe]" />
            <input id="autoLogin" class="theRememberMe" name="LoginForm[rememberMe]" value="1" checked="checked" type="checkbox" />
            <label class="theRememberMeLabel" for="autoLogin">记住用户名和密码</label>
            <em class="forgotPasswordEm"><a href="#" title="忘记密码">忘记密码?</a>&nbsp;&nbsp;&nbsp;<a href="${path}/register" title="注册项目">注册项目</a></em>
            <div class="login_submit" id="login" style="cursor:pointer">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
	var form = document.forms[0];
	window.onload = function(){
		var sub = document.getElementById("login");
		sub.onclick = function(){
			if(form.username.value.length < 5){
				form.username.nextSibling.nextSibling.style.display="block";
				return;
			}else{
				form.username.nextSibling.nextSibling.style.display="none";
			}
			if(form.password.value.length < 5){
				form.password.nextSibling.nextSibling.style.display="block";
				return;
			}else{
				form.password.nextSibling.nextSibling.style.display="none";
			}
			form.submit();
		}
	}
</script>
</body>
</html>
