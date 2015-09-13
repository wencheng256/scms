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
	<form action="${path }student/applicationaction" method="post">
	
	<input type="hidden" name="version"  value="${version}" />
	<c:if test="${appid != null}">
    	<input type="hidden" name="id" id="tValue" value="${appid}" />
   	</c:if>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <tr>
            <td width="91" align="right">是否公开</td>
            <td colspan="5">是<input type="radio" name="ispublic" value ="1"
             <c:if test="${app.ispublic}">
             checked 
             </c:if>
             /> 否<input type="radio" name="ispublic" value="0"
            <c:if test="${!app.ispublic}">
             checked 
             </c:if>
             /></td>
        </tr>
        <tr>
            <td width="91" align="right">研究现状</td>
            <td colspan="5"><textarea name="now" id="now" cols="100" rows="5">${app.now}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">需要解决的问题和创新点</td>
            <td colspan="5"><textarea name="problems" id="problems" cols="100" rows="5">${app.problems}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">项目研究可行性分析</td>
            <td colspan="5"><textarea name="could" id="could" cols="100" rows="5">${app.could}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">参考文献</td>
            <td colspan="5"><textarea name="reference" id="reference" cols="100" rows="5">${app.reference}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">研究内容</td>
            <td colspan="5"><textarea name="content" id="content" cols="100" rows="5">${app.content}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">研究方法</td>
            <td colspan="5"><textarea name="method" id="method" cols="100" rows="5">${app.method}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">研究进度及安排</td>
            <td colspan="5"><textarea name="process" id="process" cols="100" rows="5">${app.process}</textarea></td>
        </tr>
         <tr>
            <td width="91" align="right">预期研究成果及其展现形式</td>
            <td colspan="5"><textarea name="comefrom" id="comefrom" cols="100" rows="5">${app.comefrom}</textarea></td>
        </tr>
         <tr>
            <td width="91" align="right">所需仪器设备</td>
            <td colspan="5"><textarea name="equipment" id="equipment" cols="100" rows="5">${app.equipment}</textarea></td>
        </tr>
         <tr>
            <td width="91" align="right">项目来源</td>
            <td colspan="5"><textarea name="comefrom" id="comefrom" cols="100" rows="5">${app.comefrom}</textarea></td>
        </tr>
         <tr>
            <td width="91" align="right">项目感想</td>
            <td colspan="5"><textarea name="thought" id="thought" cols="100" rows="5">${app.thought}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">项目概要</td>
            <td colspan="5"><textarea name="about" id="about" cols="100" rows="5">${app.about}</textarea></td>
        </tr>
        <tr>
            <td width="91" align="right">研究基础</td>
            <td colspan="5"><textarea name="base" id="base" cols="100" rows="5">${app.base}</textarea></td>
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
