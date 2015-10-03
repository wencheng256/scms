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
        <jsp:include page="/WEB-INF/views/include/left.jsp" />
         <div class="rightbox">

<h2 class="mbx">项目管理 &gt; 指导教师</h2>
<div class="morebt">


<jsp:include page="projectManager.jsp" />

</div>
<div class="cztable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <th style="text-align:center;" width="20%">姓名</th>
            <th style="text-align:center;" width="20%">职务</th>
            <th style="text-align:center;" width="20%">手机</th>
            <th width="20%">邮箱</th>
            <th width="20%">学院</th>
        </tr>
        <tr>
            <td style="text-align:center;" width="20%">${teacher[0]}</td>
            <td style="text-align:center;" width="20%">${teacher[1]}</td>
            <td style="text-align:center;" width="20%">${teacher[2]}</td>
            <td style="text-align:center;" width="20%">${teacher[3]}</td>
            <td style="text-align:center;" width="20%">${teacher[4]}</td>
        </tr>
    </table>
</div>

<div class="cztable">
<h2 class="mbx">项目管理 &gt; 指导教师(只能有一个指导教师，再次选择将更换指导教师)</h2>
<form method="post" action="${path}student/addteacher">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="15%" align="right"><div align="right">学院： </div></td>
            <td >
                <select id="school" name="schoolid" onchange="getteacher($('#school').val())">
                    <option value="Unselected">请选择</option>
                    	<c:forEach items="${schools}" var="s">
                   	 		<option value="${s.id}" >${s.name}</option>
                   		</c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td width="15%" align="right"><div align="right">老师： </div></td>
            <td id="teacherschool">
                <select id="school" name="teacherid">
                    <option value="Unselected">请选择学院</option>
                </select>
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
    function getteacher(school){
		if(school == "Unselected"){
			return;
		}
    	console.log(document.forms[0].schoolid.value);
    	var list = "<select id=\"school\" name=\"teacherid\">";
		$.post("${path}student/getteacherlist",{'school':school},function(data){
			if(data.result){
				var resultlist = data.value;
				for(var i = 0; i<resultlist.length; i++){
					if(resultlist[i][2].length>5){
						resultlist[i][2] = resultlist[i][2].slice(0,5)+"...";
					}
					list+="<option value=\""+resultlist[i][0]+"\">"+resultlist[i][1]+"("+resultlist[i][2]+")</option>";
				}
				list += "</select>";
				console.log(resultlist);
				$("#teacherschool").html(list);
			}
		},"json");
    	//document.form[schoolid].innerHTML=list;
    }
</script>
<c:if test="${errormessage != null}">
	<script type="text/javascript">
	showMsg("${errormessage}", "name");
	</script>
</c:if>
</body>
</html>
