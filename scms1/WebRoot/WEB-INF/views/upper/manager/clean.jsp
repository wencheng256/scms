<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>
<%
	request.setAttribute("ta",2);
	request.setAttribute("tb",2);
	request.setAttribute("tc",1);
	request.setAttribute("td",2);
	request.setAttribute("te",2);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>
	学生信息管理平台
</title>
<jsp:include page="/WEB-INF/views/include/include.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/banner.jsp" />
  <div class="page">
        <div class="box mtop">
        <jsp:include page="/WEB-INF/views/include/leftmanager.jsp" />
         <div class="rightbox">

<div class="morebt">



</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:center;" width="40%">年级</th>
            <th style="text-align:center;" width="40%">项目数量</th>
        </tr>
        <c:forEach items="${map}"  var="ex">
        <tr>
            <td style="text-align:center;" width="40%">${ex.grade }</td>
            <td style="text-align:center;" width="40%">${ex.count}</td>
        </tr>
        </c:forEach>
    </table>
</div>

<div class="cztable">
<h2 class="mbx"> 请选择想要导出的项目</h2>
<form method="post" action="${path}/managedelete">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">年度： </div></td>
            <td >
                <select id="school" name="grade" onchange="getteacher($('#school').val())">
                    <option value="Unselected">请选择</option>
                    	<c:forEach items="${grades}" var="s">
                   	 		<option value="${s}" >${s}</option>
                   		</c:forEach>
                </select>
            </td>
        </tr>
                <tr>
            <td width="15%" align="right"><div align="right">说明： </div></td>
            <td >
				<input name="introduce" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <div align="center" >
                	<input type="hidden" name="version" value="${version}"  />
                	<input type="hidden" name="pro" value="${project.id}"  />
                    <input type="button" value="提交" onclick="saveClick('11111')" class="input2" />
                    <input type="reset" value="重置" class="input2" />
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

    <script type="text/javascript">
    function showMsg(msg, obj) {
        jBox.tip(msg);
        $("#" + obj).focus();
    }
    function saveClick(studentId) {
    	if($("#school").val() == "Unselected"){
    		showMsg( "请选择老师");
    		return;
    	}
        document.forms[0].submit();
    }
</script>
<c:if test="${errormessage != null}">
	<script type="text/javascript">
	showMsg("${errormessage}", "name");
	</script>
</c:if>
</body>
</html>
