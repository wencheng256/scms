<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>
<%
	request.setAttribute("ta",2);
	request.setAttribute("tb",2);
	request.setAttribute("tc",2);
	request.setAttribute("td",1);
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
        <jsp:include page="/WEB-INF/views/include/left.jsp" />
         <div class="rightbox">

<h2 class="mbx">项目管理 &gt; 成员管理</h2>
<div class="morebt">
<jsp:include page="projectManager.jsp" />

</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:center;" width="10%">序号</th>
            <th style="text-align:center;" width="65%">原因</th>
            <th style="text-align:center;" width="15%">金额(￥)</th>
            <th style="text-align:center;" width="10%">删除</th>
        </tr>
	<c:forEach items="${fees}" var="fe" varStatus="fes">
        <tr style="height: 28px" class="tdbg" align="center">
            <td align="center">${fes.index+1}</td>
			<td align="center">${fe.reason}</td>
			<td align="center">${fe.amount}</td>
            <td align="center"><a onclick="delete1(${fe.id})" style="cursor:pointer;">X</a></td>
            <c:set var="amount" value="${amount+fe.amount}"></c:set>
  
          </tr>
	</c:forEach>
    </table>
</div>

<div class="cztable">
<h2 class="mbx">项目管理 &gt; 经费管理 总计：￥${amount}</h2>
<form method="post" action="${path}student/feeaction">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">原因： </div></td>
            <td><input id="reason" size="20" name="reason" class="input_2"/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">金额： </div></td>
            <td><input id="amount" size="20" name="amount" class="input_2"/></td>
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
    function returnIndex() {
        window.location = "/Index.aspx";
    }
    function showMsg(msg, obj) {
        jBox.tip(msg);
        $("#" + obj).focus();
    }
    function saveClick(studentId) {
        var name = $("#reason").val();   //消息标题
        if (name == "") {
            showMsg("请您输入经费原因！", "name");
            return false;
        }
        var email = $("#amount").val();   //消息标题
        if (email == "") {
            showMsg("请您输入经费金额！", "email");
            return false;
        }

        document.forms[0].submit();
    }
    function delete1(id){
    	var conf = confirm("确认删除此条经费吗?");
    	if(conf){
    		window.location = "${path}student/deletefee?id="+id;
    	}
    }
</script>
<c:if test="${message != null}">
	<script type="text/javascript">
		showMsg("${message}", "name");
	</script>
</c:if>
</body>
</html>
