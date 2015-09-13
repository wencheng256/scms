<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>


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
        <jsp:include page="/WEB-INF/views/include/left.jsp" />
        <div class="rightbox">


<h2 class="mbx">日志管理 &gt; 项目日志&nbsp;&nbsp;&nbsp;创建日志</h2>
<div class="morebt">



</div>
<div class="cztable">
	<form action="${path }student/middleaction" method="post">
	
	<input type="hidden" name="version"  value="${version}" />
	<c:if test="${midid != null}">
    	<input type="hidden" name="id" id="tValue" value="${midid}" />
   	</c:if>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <tr>
            <td width="91" align="right">是否公开</td>
            <td colspan="5">
            	<c:if test="${mid.public1}">
            		是
            	</c:if>
            	<c:if test="${!mid.public1}">
            		否
            	</c:if>
            </td>
        </tr>
        <tr>
            <td width="91" align="right">研究成果</td>
            <td colspan="5">${mid.result}</td>
        </tr>
        <tr>
            <td width="91" align="right">感想体会</td>
            <td colspan="5">${mid.thought}</td>
        </tr>
        <tr>
            <td width="91" align="right">经费使用情况</td>
            <td colspan="5">${mid.feeused}</td>
        </tr>
        <tr>
            <td width="91" align="right">未按原计划完成部分及原因</td>
            <td colspan="5">${mid.reasonWhyDelay}</td>
        </tr>
        <tr>
            <td width="91" align="right">工作计划</td>
            <td colspan="5">${mid.plan}</td>
        </tr>
        <tr>
            <td width="91" align="right">存在的问题</td>
            <td colspan="5">${mid.problems}</td>
        </tr>
        <tr>
            <td width="91" align="right">预期成果</td>
            <td colspan="5">${mid.target}</td>
        </tr>
        <tr>
            <td colspan="5" align="center" valign="middle">
                <a href="${path}student/middle"><input type="button" name="button2" id="button2" value="点击修改" class="input2" onclick="onSaveProblem()" /></a>
        	</td>
       	</tr>
    </table>
    </form>
</div>

            </div>
        </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>
