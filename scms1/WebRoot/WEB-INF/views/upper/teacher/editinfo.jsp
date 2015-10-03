<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>
<%
	request.setAttribute("ta",1);
	request.setAttribute("tb",2);
	request.setAttribute("tc",2);
	request.setAttribute("td",2);
	request.setAttribute("te",2);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	${web_name}
</title>
<jsp:include page="/WEB-INF/views/include/include.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/banner.jsp" />
    <div class="page">
        <div class="box mtop">
        <jsp:include page="/WEB-INF/views/include/leftteacher.jsp" />
            <div class="rightbox">
                
<h2 class="mbx">我的信息 &gt; 个人资料 &nbsp;&nbsp;&nbsp;</h2>       
<div class="morebt">

</div>
<div class="cztable">
<form action="${path}teacher/editpersoninfoaction" method="post">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" width="80">教师姓名：</td>
            <td><input id="name" name="name" value="${teacher.name }"/></td>
            <td align="right" width="90">教师职位：</td>
            <td><input name="identity" id="identity" value="${teacher.identity }"/></td>
            
        </tr>
        <tr>
            <td align="right">学院：</td>
            <td><select name="schoolid">
            	<c:forEach items="${school}" var="sc">
            		<option value="${sc.id }"
            		<c:if test="${teacher.school.id == sc.id }">selected</c:if>
            		>${sc.name }</option>
            	</c:forEach>
            </select></td>
            <td align="right">E-Mail：</td>
            <td><input name="email" id="email" value="${teacher.email }"/></td>
        </tr>
        <tr>
            <td align="right">手机号码：</td>
            <td>
				<input name="phone" id="phone" value="${teacher.phone}"/>
			</td>
            <td align="right">登陆密码(如不修改则不输入)</td>
            <td><input name="newpassword"  id="newpassword" type="password" value="#unmodified"/></td>
        </tr>
        
        <tr align="center">
            <td colspan="5" height="40">
                <div align="center">
                    
                    <input type="hidden" name="teacherid" value="${teacher.id}" />
                    <input type="hidden" name="version" value="${version}" />
                    <input type="button" id="button2" value="提交" onclick="submitMail()" class="input2" />
                </div>
            </td>
        </tr>
    </table>
    </form>
</div>

            </div>
        </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <script>
	    function showMsg(msg, obj) {
	        jBox.tip(msg);
	        $("#" + obj).focus();
	    }
    	var but = document.getElementById("button2");
    	but.onclick = function(){
    		if($("#name").val().length <= 1){
    			showMsg("姓名不能为空",name);
    			return;
    		}
    		if($("#identity").val().length <= 1){
    			showMsg("职位不能为空",identity);
    			return;
    		}
    		if($("#email").val().length <= 1){
    			showMsg("邮箱不能为空",email);
    			return;
    		}
    		if($("#phone").val().length <= 1){
    			showMsg("手机号码不能为空",phone);
    			return;
    		}
    		if($("#newpassword").val().length <= 1){
    			showMsg("密码不能为空",newpassword);
    			return;
    		}
			document.forms[0].submit();
    	}
    </script>
    <c:if test="${message != null }">
    <script>
    	showMsg("${message}");
    </script>
    </c:if>
</body>
</html>
