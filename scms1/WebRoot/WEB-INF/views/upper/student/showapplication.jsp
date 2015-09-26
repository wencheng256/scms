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


<h2 class="mbx">日志管理 &gt; 申请报告&nbsp;&nbsp;&nbsp;查看申请报告</h2>
<div class="morebt">



</div>
<div class="cztable">
	<c:choose>
		<c:when test="${jou == null}">
			<form action="${path }student/journalaction" method="post">
		</c:when>
		<c:otherwise>
			<form action="${path }student/editjournalaction" method="post">
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="version"  value="${version}" />
	<c:if test="${jou != null}">
    	<input type="hidden" name="id" id="tValue" value="${jou.id}" />
   	</c:if>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <tr>
            <td width="160" align="right">是否公开：</td>
            <td colspan="5">
            <c:if test="${app.ispublic}">
            	是
            </c:if>
            <c:if test="${!app.ispublic}">
            	是
            </c:if>
            </td>
        </tr>
        <tr>
            <td width="160" align="right">研究现状：</td>
            <td colspan="5">${app.now}</td>
        </tr>
        <tr>
            <td width="160" align="right">需要解决的问题和创新点：</td>
            <td colspan="5">${app.problems}</td>
        </tr>
        <tr>
            <td width="160" align="right">项目研究可行性分析：</td>
            <td colspan="5">${app.could}</td>
        </tr>
        <tr>
            <td width="160" align="right">参考文献：</td>
            <td colspan="5">${app.reference}</td>
        </tr>
        <tr>
            <td width="160" align="right">研究内容：</td>
            <td colspan="5">${app.content}</td>
        </tr>
        <tr>
            <td width="160" align="right">研究方法：</td>
            <td colspan="5">${app.method}</td>
        </tr>
        <tr>
            <td width="160" align="right">研究进度及安排：</td>
            <td colspan="5">${app.process}</td>
        </tr>
         <tr>
            <td width="160" align="right">预期研究成果及其展现形式：</td>
            <td colspan="5">${app.comefrom}</td>
        </tr>
         <tr>
            <td width="160" align="right">所需仪器设备：</td>
            <td colspan="5">${app.equipment}</td>
        </tr>
         <tr>
            <td width="160" align="right">项目来源：</td>
            <td colspan="5">${app.comefrom}</td>
        </tr>
         <tr>
            <td width="160" align="right">项目感想：</td>
            <td colspan="5">${app.thought}</td>
        </tr>
        <tr>
            <td width="160" align="right">项目概要：</td>
            <td colspan="5">${app.about}</td>
        </tr>
        <tr>
            <td width="160" align="right">研究基础：</td>
            <td colspan="5">${app.base}</td>
        </tr>
        <tr>
            <td colspan="5" align="center" valign="middle">
                <a href="${path }student/application"><input type="button" name="button2" id="button2" value="点击修改" class="input2" onclick="onSaveProblem()" /></a>
        	</td>
       	</tr>
    </table>
</div>

            </div>
        </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <script>
    var ue = UE.getEditor('edit');
    var form = document.forms[0];
    function onSaveProblem(){
		if(form.title.value == ""){
			showMsg("标题不能为空","title");
			return;
		}
		if(form.content.value == ""){
			showMsg("内容不能为空","edit");
			return;
		}
		form.submit();
    }
    </script>
</body>
</html>
