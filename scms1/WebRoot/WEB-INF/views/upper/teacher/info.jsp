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
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" width="80">教师姓名：</td>
            <td>${teacher.name }</td>
            <td align="right" width="90">教师职位：</td>
            <td>${teacher.identity }</td>
            
        </tr>
        <tr>
            <td align="right">学院：</td>
            <td>${teacher.school.name }</td>
            <td align="right">E-Mail：</td>
            <td>${teacher.email }</td>
        </tr>
        <tr>
            <td align="right">手机号码：</td>
            <td>
				${teacher.phone}
			</td>
            <td align="right"></td>
            <td></td>
        </tr>
        
        <tr>
            <td colspan="4" align="left">指导项目</td>
            
        </tr>
        <c:forEach items="${teacher.projects}" var="pro" varStatus="stus">
        <tr>
            <td align="right">${stus.index+1}</td>
            <td colspan="3">
				${pro.name }(${pro.level.name})
            </td>
        </tr>
        </c:forEach>
        <tr align="center">
            <td colspan="5" height="40">
                <div align="center">
                    <a href="${path }teacher/editpersoninfo">
                    <input type="button" id="button2" value="修改" class="input2" /></a>
                </div>
            </td>
        </tr>
    </table>
</div>

            </div>
        </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>
