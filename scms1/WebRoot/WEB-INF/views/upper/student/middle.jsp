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
            <td colspan="5">是<input type="radio" name="public1" value ="1" checked /> 否<input type="radio" name="public1" value="0"/></td>
        </tr>
        <tr>
            <td width="91" align="right">研究成果</td>
            <td colspan="5"><textarea name="result" id="result" cols="100" rows="5">${mid.result}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">感想体会</td>
            <td colspan="5"><textarea name="thought" id="thought" cols="100" rows="5">${mid.thought}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">经费使用情况</td>
            <td colspan="5"><textarea name="feeused" id="feeused" cols="100" rows="5">${mid.feeused}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">未按原计划完成部分及原因</td>
            <td colspan="5"><textarea name="reasonWhyDelay" id="reasonWhyDelay" cols="100" rows="5">${mid.reasonWhyDelay}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">工作计划</td>
            <td colspan="5"><textarea name="plan" id="plan" cols="100" rows="5">${mid.plan}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">存在的问题</td>
            <td colspan="5"><textarea name="problems" id="problems" cols="100" rows="5">${mid.problems}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">预期成果</td>
            <td colspan="5"><textarea name="target" id="target" cols="100" rows="5">${mid.target}</textarea></td>
        </tr>
        <tr>
            <td colspan="5" align="center" valign="middle">
                <input type="button" name="button2" id="button2" value="点击提交" class="input2" onclick="onSaveProblem()" />
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
    var ue = UE.getEditor('edit');
    var form = document.forms[0];
    function onSaveProblem(){
		var texts = form.getElementsByTagName("textarea");
		for(var i = 0; i<texts.length; i++){
			if(texts[i].value == ""){
				console.log(texts[i]);
				showMsg(texts[i].parentNode.previousSibling.previousSibling.innerHTML+"不能为空!",texts[i]);
				return;
			}
		}
		form.submit();
    }
    </script>
</body>
</html>
