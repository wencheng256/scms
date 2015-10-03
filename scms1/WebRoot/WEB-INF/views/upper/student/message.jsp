<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>
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
<h2 class="mbx">留言</h2>
<div class="morebt">
</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:center;" width="20%">签名</th>
            <th style="text-align:center;" width="65%">内容</th>
            <th style="text-align:center;" width="10%">时间</th>
            <th style="text-align:center;" width="5%">删除</th>
        </tr>
	<c:forEach items="${messages}" var="me" varStatus="mes">
        <tr style="height: 28px" class="tdbg" align="center">
			<td align="center">${me.name}(${me.fromProject.name})</td>
			<td align="center">${me.content}</td>
            <td align="center">${me.date }</td>
            <td align="center"><a onclick="delete1('${me.id}')" style="cursor:pointer;">X</a></td>
          </tr>
	</c:forEach>
    </table>
</div>
<div class="cztable">
<h2 class="mbx">项目留言</h2>
<form method="post" action="${path}student/messageaction">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">签名： </div></td>
            <td><input id="name" size="20" name="name" class="input_2"/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">内容：</div></td>
            <td><textarea id="content" name="content" class="input_2" style="width:90%;height:100px;"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <div align="center" >
                	<input type="hidden" name="version" value="${version}"  />
                	<input type="hidden" name="toProjectid" value="${project.id}"  />
                	<input type="hidden" name="fromProjectid" value="${project.id}"  />
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
    function delete1(id){
    	if(confirm("确认要删除这条留言吗?")){
    		window.location = "${path}student/deletemessage?id="+id;
    	}
    }
    function returnIndex() {
        window.location = "/Index.aspx";
    }
    function showMsg(msg, obj) {
        jBox.tip(msg);
        $("#" + obj).focus();
    }
    function saveClick(studentId) {
        var name = $("#name").val();   //消息标题
        if (name == "") {
            showMsg("请您输入留言签名！", "name");
            return false;
        }
        var email = $("#content").val();   //消息标题
        if (email == "") {
            showMsg("请您输入留言内容！", "content");
            return false;
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
