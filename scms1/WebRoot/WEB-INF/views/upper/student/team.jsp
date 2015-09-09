<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>
<%
	request.setAttribute("ta",2);
	request.setAttribute("tb",1);
	request.setAttribute("tc",2);
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
        <jsp:include page="/WEB-INF/views/include/left.jsp" />
         <div class="rightbox">

<h2 class="mbx">项目管理 &gt; 成员管理</h2>
<div class="morebt">

<jsp:include page="projectManager.jsp" />

</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:center;" width="5%">序号</th>
            <th style="text-align:center;" width="5%">姓名</th>
            <th style="text-align:center;" width="12%">学号</th>
            <th style="text-align:center;" width="11%">手机</th>
            <th width="10%">学历</th>
            <th width="15%">学院</th>
            <th width="15%">邮箱</th>
            <th style="text-align:center;" width="5%">队长</th>
            <th style="text-align:center;" width="5%">选择</th>
            <th style="text-align:center;" width="3%">删除</th>
        </tr>
	<c:forEach items="${students}" var="stu" varStatus="statu">
        <tr style="height: 28px" class="tdbg" align="center">
            <td align="center">${statu.index}</td>
			<td align="center">${stu.name}</td>
			<td align="center">${stu.number}</td>
			<td align="center">${stu.phone}</td>
            <td align="center">
				<c:choose>
					<c:when test="${stu.degree==1}">
						本科
					</c:when>
					<c:otherwise>
						硕士
					</c:otherwise>
				</c:choose>
			</td>
			<td align="center">${stu.school.name}</td>
			<td align="center">${stu.email}</td>
			<td align="center">
				<c:if test="${stu.cap}">
					√
				</c:if>
			</td>
            <td align="center"><a href="${path}student/mkcaptain?id=${stu.id}">晋升</a></td>
            <td align="center"><a onclick="delete1('${stu.id}','${stu.name}')">X</a></td>
        </tr>
	</c:forEach>
    </table>
</div>

<div class="cztable">
<h2 class="mbx">项目管理 &gt; 成员管理</h2>
<form method="post" action="${path}student/teamaction">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">姓名： </div></td>
            <td><input id="name" size="20" name="name" class="input_2"/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">学号： </div></td>
            <td><input id="number" size="20" name="number" class="input_2"/></td>
        </tr>
         <tr>
            <td width="15%" align="right"><div align="right">学历： </div></td>
            <td>本科： <input type="radio" name="degree" value="1" checked/> 硕士： <input type="radio" value="2" name="degree" /></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">学院： </div></td>
            <td>
                <select id="school" name="schoolid">
                    <option value="Unselected">请选择</option>
                    	<c:forEach items="${school}" var="s">
                   	 		<option value="${s.id}">${s.name}</option>
                   		</c:forEach>
                </select>
            </td>
        </tr>
         <tr>
        <td width="15%" align="right"><div align="right">手机： </div></td>
            <td><input id="phone" size="20" name="phone" class="input_2"/></td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">邮箱： </div></td>
            <td><input id="email" size="20" name="email" class="input_2"/></td>
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
        var name = $("#name").val();   //消息标题
        if (name == "") {
            showMsg("请您输入成员姓名！", "name");
            return false;
        }
        var email = $("#email").val();   //消息标题
        if (email == "") {
            showMsg("请您输入成员邮箱！", "email");
            return false;
        }
        var school = $("#schoolid").val();   //消息标题
        if (school == "Unselected") {
            showMsg("请您选择成员的学院", "school");
            return false;
        }
        var number = $("#number").val();   //消息标题
        if (number == "") {
            showMsg("请您输入成员学号", "number");
            return false;
        }
        var phone = $("#phone").val();   //消息标题
        if (phone == "") {
            showMsg("请您输入成员的电话号码", "phone");
            return false;
        }

        document.forms[0].submit();
    }
    function delete1(id,name){
    	var conf = confirm("确认要从团队中删除"+name+"吗?");
    	if(conf){
    		window.location = "${path}student/deleteteam?id="+id;
    	}
    }
</script>
<c:if test="${errormessage != null}">
	<script type="text/javascript">
	showMsg("${errormessage}", "name");
	</script>
</c:if>
</body>
</html>
