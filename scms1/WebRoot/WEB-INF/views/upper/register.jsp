<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="scms.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<m:include type="1" src="clicki.web.css?V=20120501"/>
<m:include type="1" src="clicki.loginandreg.css?V=20120501"/>
<m:include type="1" src="clicki.webkitanimation.css?V=20120501"/>
<m:include type="0" src="jquery-1.4.1.js"/>
<title>${web_name}项目注册</title>
</head>
<body >

<div class="theCenterBox" style="height:900px; display:block;">
<style>
.theCenterBox{width:670px; margin-top:50px;margin-bottom:50px;}
.show{display:block;}
</style>
  <div class="theLoginBox" style="width:657px;height:830px;">
    <div class="loginTxt">${web_name}项目注册</div>
    <form id="leftForm" action="registeraction" method="post" onsubmit="check()">
      <div class="theLoginArea" id="loginBox">
        <p style="position: relative;">
          <label for="LoginForm_email">项目名称：<a href="javascript:checkname()" style="font-size:12px;color:blue;cursor:pointer;">检测是否已经被注册</a></label>
          <input placeholder="请输入项目名称" name="name" id="LoginForm_email" type="text" maxlength="255" />
          <span>请输入项目名称</span> 
          </p>
        <p style="position: relative;">
          <label for="LoginForm_checksum">登陆账户(英文)：<a href="javascript:checkUserName()" style="font-size:12px;color:blue;cursor:pointer;">检测是否已经被注册</a></label>
          <input placeholder="请输入您的邀请码" name="username" id="LoginForm_checksum" type="text" value="" />
          <span>请输入您的英文账号5-15位</span> </p>
        <p style="position: relative;">
          <label for="LoginForm_password">登陆密码：</label>
          <input placeholder="请输入您的密码" name="password" id="LoginForm_password" type="password" maxlength="16" />
          <span>请输入您的密码</span> </p>
		<p style="position: relative;">
          <label for="LoginForm_password">确认密码：</label>
          <input placeholder="请重复输入您的密码" name="confpass" id="LoginForm_password" type="password" maxlength="16" />
          <span>两次输入的不正确</span> </p>
        <p style="position: relative;">
          <label for="LoginForm_checksum">项目类型：</label>
			<select name="type" style="width:290px;float:left;height:30px;margin-top:10px;">
				<c:forEach items="${level}" var="leve">
					<option value="${leve.id}">${leve.name}</option>
				</c:forEach>
			</select>           </p>
        <p style="position: relative;">
          <label for="LoginForm_checksum">项目学院：</label>
			<select name="type" style="width:290px;float:left;height:30px;margin-top:10px;">
				<c:forEach items="${school}" var="s">
					<option value="${s.id}">${s.name}</option>
				</c:forEach>
			</select> 
          </p>
        <p style="position: relative;">
          <label for="LoginForm_checksum">学校编号：<a href="javascript:checkProjectNumber()" style="font-size:12px;color:blue;cursor:pointer;">检测是否已经被注册</a></label>
          <input placeholder="请输入您的学校编号" name="number" id="LoginForm_checksum" type="text" value="" />
          <span>请输入您的学校编号</span> </p>
          
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
      	if(form.name.value.length<=5){
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
      	if(form.number.value.length<=5){
            form["number"].nextSibling.nextSibling.style.display="block";
            return;
    	}else{
    		form["number"].nextSibling.nextSibling.style.display="none";
    	}
      	form.submit();
    }
  }
  function checkname(){
	 $.post("${path}/register/checkname",{name:form.name.value},function(data){
		 if(data.used){
			 alert("项目名称已经被使用了，请更换下一个名称");
		 }else{
			 alert("该名称尚未注册，可以使用！");
		 }
	 },"json");
  }
  function checkUserName(){
		 $.post("${path}/register/checkusername",{username:form.username.value},function(data){
			 if(data.used){
				 alert("登录名已经被使用了，请更换下一个名称");
			 }else{
				 alert("该登录名尚未注册，可以使用！");
			 }
		 },"json");
	  }
  function checkProjectNumber(){
		 $.post("${path}/register/checknumber",{number:form.number.value},function(data){
			 if(data.used){
				 alert("本项目已经注册过了");
			 }else{
				 alert("本项目尚未注册，请继续注册！");
			 }
		 },"json");
	  }
  </script>
  <c:if test="${message != null}">
  	<script>
  	alert("${message}");
  	</script>
  </c:if>
</body>
</html>

