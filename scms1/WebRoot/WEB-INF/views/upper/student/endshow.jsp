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


<h2 class="mbx">日志管理 &gt; 结题报告&nbsp;&nbsp;&nbsp;修改结题报告</h2>
<div class="morebt">

</div>
<div class="cztable">
	<input type="hidden" name="version"  value="${version}" />
    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <tr>
            <td width="91" align="right">是否公开</td>
           		<td colspan="5">
	            	<c:if test="${end.ispublic}">
	            		是
	            	</c:if>
	            	<c:if test="${!end.ispublic}">
	            		否
	            	</c:if>
            	</td>
        </tr>
        <tr>
            <td width="91" align="right">项目完成情况</td>
            <td colspan="5">${end.status}</td>
        </tr>
        <tr>
            <td width="91" align="right">研究成果</td>
            <td colspan="5">${end.result}</td>
        </tr>
        <tr>
            <td width="91" align="right">感想体会</td>
            <td colspan="5">${end.thought}</td>
        </tr>
        <tr>
            <td width="91" align="right">经费使用情况</td>
            <td colspan="5">${end.feeused}</td>
        </tr>
        <tr>
            <td colspan="5" align="center" valign="middle">
                <a href="${path }student/end"><input type="button" name="button2" id="button2" value="点击修改" class="input2" onclick="onSaveProblem()" /></a>
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
