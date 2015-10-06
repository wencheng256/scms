<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>
<%
	request.setAttribute("ta",1);
	request.setAttribute("tb",2);
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
                 	<c:choose>
				<c:when test="${manager.type == 0 }">
					<jsp:include page="/WEB-INF/views/include/leftmanager.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="/WEB-INF/views/include/leftteacher.jsp" />
				</c:otherwise>
			</c:choose>
        <div class="rightbox">
                
    <h2 class="mbx">
        教师管理 &gt; <a href="#">教师列表</a></h2>
    <div class="morebt">
    

	</div>	
    <div class="feilei">
        <a href="#"><strong>教师列表</strong></a></div>
    <div class="fllist">
    <c:if test="${manager.type == 0 }">
    	筛选本页的教师
    	<br/>
    	<c:forEach items="${schools}" var="s">
    		${s.name }:&nbsp<input type="checkbox" value="${s.id}" id="check${s.id}" checked onchange="change()"/>&nbsp&nbsp&nbsp
    	</c:forEach>
    </c:if>	
        <div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;" id="table1">
                <tr>
                <th width="10%">序号</th>
                    <th style="padding-left: 20px;">
                        姓名
                    </th>
                    <th style="padding-left: 20px;">
                        职位
                    </th>
                    <th style="padding-left: 20px;">
                        学院
                    </th>
                    <th style="padding-left: 20px;">
                        指导项目
                    </th>
                    <th style="padding-left: 20px;">
                        联系方式
                    </th>
                    <th style="padding-left: 20px;">
                        删除
                    </th>
                </tr>
                <c:forEach items="${teachers}" var="teach" varStatus="js">
	                <tr school="${teach.school.id}" class="trrow" style="background:#fff">
		                <td width="6%">
		                	${js.index+1}
						</td>
	                    <td style="padding-left: 20px;">
	                    ${teach.name}
	                    </td>
	                    <td style="padding-left: 20px;">
	                    ${teach.identity}
	                    </td>
	                    <td style="padding-left: 20px;">
	                    ${teach.school.name}
	                    </td>
	                    <td style="padding-left: 20px;">
	                    ${teach.projects.size()}
	                    </td>
	                    <td style="padding-left: 20px;">
	                    ${teach.phone}
	                    </td>
	                    <td style="padding-left: 20px;">
	                    <a href="javascript:delete1( ${teach.id},'${teach.name}')">删除</a>
	                    </td>
                </tr>
                </c:forEach>
                
            </table>
            
            <div class='MainStyle'>
		<div class=''><a href='${path }manager/teacherlist?page=1' target='_self'>首页</a></div>
		<div class=''><a href='${path }manager/teacherlist?page=${nowpage <= 1?1:nowpage-1}' target='_self'>上一页</a></div>
		<%for(int i = 0; i<(Integer)(request.getAttribute("pages")); i++){
			if(i<= 3){			
			%>
		<div ><a href='${path }manager/teacherlist?page=<%=i+1 %>' target='_self'><%=i+1 %></a></div>
		<%}else{
			%>
			<div >...</div>
			<%	
		}} %>
		<div class=''><a href='${path }manager/teacherlist?page=${nowpage >= pages?pages:nowpage+1}' target='_self'>下一页</a></div><div class=''><a href='${path }manager/teacherlist?page=${pages}' target='_self'>尾页</a></div><div class=''>总<b>${pages }</b>页</div><div class=''>每页<b>20</b>条数据</div><div class=''><b>1</b>/${nowpage }</div><div class='SearchStyle'><input type='text' id='john_Page_Search' onkeydown="if(event.keyCode == 13){page_searchIndex();}"/></div><div class=''><input type='button' value='Go' onclick="page_searchIndex()"/></div></div>
        </div>
    </div>

            </div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
        <script type="text/javascript">
	
	function change(){
		var tr = document.getElementsByClassName("trrow");
		for(var i = 0; i<tr.length; i++){
			var id = "check"+tr[i].getAttribute("school");
			var check = document.getElementById(id);
			if(check.checked){
				tr[i].style.background = "#fff";
			}else{
				tr[i].style.background = "#eee";
			}
		}
	}
	function delete1(teacherid,name){
		var is = confirm("确认要删除"+name+"老师吗?");
		if(is){
			window.location = "${path}/manager/deleteteacher?id="+teacherid;
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