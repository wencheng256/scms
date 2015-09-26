<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<m:include type="1" src="clicki.web.css?V=20120501"/>
<m:include type="1" src="clicki.loginandreg.css?V=20120501"/>
<m:include type="1" src="clicki.webkitanimation.css?V=20120501"/>
<m:include type="0" src="jquery-1.4.1.js"/>
<title>${web_name}教师注册</title>
<style type="text/css">
.theCenterBox{width:670px; margin-top:50px;margin-bottom:50px;}
.show{display:block;}
</style>
</head>
<body >

<div class="theCenterBox" style="height:950px; display:block;">
  <div class="theLoginBox" style="width:657px;height:930px;">
    <div class="loginTxt">${web_name}教师注册</div>
    <form id="leftForm" action="${path}teacher/teacherregisteraction" method="post" onsubmit="check()">
      <div class="theLoginArea" id="loginBox">
        <p style="position: relative;">
          <label for="LoginForm_email">教师姓名：</label>
          <input placeholder="请输入您的姓名" name="name" id="name" type="text" maxlength="255" />
          <span>请输入您的姓名</span> 
          </p>
		<p style="position: relative;">
          <label for="LoginForm_email">教师登陆名：<a href="javascript:checkname()" style="font-size:12px;color:blue;cursor:pointer;">检测是否已经被注册</a></label>
          <input placeholder="请输入您的姓名" name="username" id="username" type="text" maxlength="255" />
          <span>请输入您的登陆账号</span> 
          </p>
        <p style="position: relative;">
          <label for="LoginForm_password">登陆密码：</label>
          <input placeholder="请输入您的密码" name="password" id="password" type="password" maxlength="16" />
          <span>请输入您的密码</span> </p>
		<p style="position: relative;">
          <label for="LoginForm_password">确认密码：</label>
          <input placeholder="请重复输入您的密码" name="confpass" id="confpass" type="password" maxlength="16" />
          <span>两次输入的不正确</span> </p>
        <p style="position: relative;">
          <label for="LoginForm_checksum">教师职务：</label>
		 <input placeholder="请输入您的工作内容"  name="identity" id="identity" type="text" maxlength="255" />
		  <span>请输入您的工作内容</span> 
     	 </p>
		<p style="position: relative;">
          <label for="LoginForm_email">教师邮箱：</label>
          <input placeholder="请输入您的邮箱" name="email" id="email" type="text" maxlength="255" />
          <span>请输入您的邮箱</span> 
          </p>
       <p style="position: relative;">
          <label for="LoginForm_email">教师号码：</label>
          <input placeholder="请输入您的手机号码" name="phone" id="phone" type="text" maxlength="255" />
          <span>请输入您的手机号码</span> 
          </p>
        <p style="position: relative;">
          <label for="LoginForm_checksum">教师学院：</label>
			<select name="schoolid" style="width:290px;float:left;height:30px;margin-top:10px;">
				<c:forEach items="${schools}" var="s">
					<option value="${s.id}">${s.name}</option>
				</c:forEach>
			</select> 
          </p>
          
        <div class="loginSubmitBnt">
          <div class="reg_submit" id="sub" style="cursor:pointer">
          </div>
        </div>
      </div>
      <div class="theRegArea fixRegHeight" id="reg_reg">
        <h2>没有邀请码？</h2>
        <br/>
        <a class="apply_reg" href="#"></a> <br/>
        <h2>已经有账号？</h2>
        <br/>
        <a class="reg_login" href="index.html"></a> </div>
        <input name="version" type="hidden" value="${version}" />
    </form>
  </div>
  <div style="clear:both; height:10px;"></div>
</div>
 <script>
 var form = document.forms[0];
  window.onload=function(){
    sub.onclick=function(){
      	if(form.name.value.length<=2){
      		console.log(form.name);
            form["name"].nextSibling.nextSibling.style.display="block";
            return;
    	}else{
    		form["name"].nextSibling.nextSibling.style.display="none";
    	}
      	if(form.username.value.length<=5){
            form["username"].nextSibling.nextSibling.style.display="block";
            return;
    	}else{
    		form["username"].nextSibling.nextSibling.style.display="none";
    	}
      	if(form.password.value.length<=5){
            form["password"].nextSibling.nextSibling.style.display="block";
            return;
    	}else{
    		form["password"].nextSibling.nextSibling.style.display="none";
    	}
      	form.submit();
    }
  }
  function checkUserName(){
		 $.post("${path}/teacher/checkusername",{username:form.username.value},function(data){
			 if(data.used){
				 alert("登录名已经被使用了，请更换下一个名称");
			 }else{
				 alert("该登录名尚未注册，可以使用！");
			 }
		 },"json");
	  }
  </script>
</body>
</html>

