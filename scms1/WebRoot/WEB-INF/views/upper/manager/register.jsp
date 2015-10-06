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
<title>${web_name}项目注册</title>
<style>
.theCenterBox{width:670px; margin-top:50px;margin-bottom:50px;}
.show{display:block;}
</style>
</head>
<body >

<div class="theCenterBox" style="height:900px; display:block;">
  <div class="theLoginBox" style="width:657px;height:730px;">
    <div class="loginTxt">${web_name}管理员注册</div>
    <form id="leftForm" action="managerregisteraction" method="post" onsubmit="check()">
      <div class="theLoginArea" id="loginBox">
        <p style="position: relative;">
          <label for="LoginForm_email">管理员名称：</label>
          <input placeholder="请输入项目名称" name="name" id="LoginForm_email" type="text" maxlength="255" />
          <span>请输入项目名称</span> 
          </p>
        <p style="position: relative;">
          <label for="LoginForm_checksum">登陆账户(英文)：<a href="javascript:checkUserName()" style="font-size:12px;color:blue;cursor:pointer;">检测是否已经被注册</a></label>
          <input placeholder="请输入您的邀请码" name="username" id="username" type="text" value="" />
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
          <label for="LoginForm_checksum">管理员类型：</label>
			<select name="type" id="type" style="width:290px;float:left;height:30px;margin-top:10px;" onchange="showschool()">
					<option value="unselected">请选择管理员类型</option>
					<option value="1">学院管理员</option>
					<option value="0">学校管理员</option>
			</select>           </p>
        <p style="position: relative;display:none;" id="hid">
          <label for="LoginForm_checksum">管理员学院：</label>
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
      	form.submit();
    }
  }
  function showschool(){
	  console.log(1);
	  var se = document.getElementById("type");
	  var hid = document.getElementById("hid");
	  if(se.value == "1"){
		  hid.style.display = "block";
	  }else{
		  hid.style.display = "none";
	  }
  }
  function checkUserName(){
	  jQuery.post("${path}checkmanagername",{username:$("#username").val()},function(json){
		  if(json.result){
			  alert("该用户名已被注册!");
		  }else{
			  alert("该用户名尚未注册!");
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

