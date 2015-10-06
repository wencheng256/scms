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
        教务中心 &gt; 我的书籍</h2>
    <div class="morebt">
    
    </div>
    <c:if test="${manager.type == 0 }">
    	筛选本页的项目
    	<br/>
    	<c:forEach items="${schools}" var="s">
    		${s.name }:&nbsp<input type="checkbox" value="${s.id}" id="check${s.id}" checked onchange="change()"/>&nbsp&nbsp&nbsp
    	</c:forEach>
    </c:if>	
    <div class="cztable">
    
    
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr style="height: 25px" align="center">
                    <th scope="col">
                        编号
                    </th>
                    <th scope="col">
                        项目名称
                    </th>
                    <th scope="col">
                       创建时间
                    </th>
                    <th scope="col">
                        是否为重点立项
                    </th>
                    <th scope="col">
                        学院
                    </th>
                     <th scope="col">
                       删除
                    </th>
                </tr>
                <c:forEach items="${projects}" var="pro">
	                <tr align="center" school="${pro.school.id}" class="trrow">
	                    <td>
	                       ${pro.number }
	                    </td>
	                    <td>
	                        <a href="${path}manager/otherproject?id=${pro.id}">${pro.name }</a>
	                    </td>
	                    <td>
	                        ${pro.startingTime }
	                    </td>
	                    
	                    <td>
							<c:if test="${pro.important }">
								是
	                        </c:if>
	                        <c:if test="${!pro.important }">
								否
	                        </c:if>
	                    </td>
	                    
	                    <td>
							${pro.school.name}	                        
	                    </td>
	                    <td>
							<a href="javascript:delete1(${pro.id},'${pro.name }')">删除</a>                        
	                    </td>
	                </tr>
                </c:forEach>
                
            </tbody>
        </table>
    </div>
	<div class='MainStyle'>
		<div class=''><a href='${path }manager/projectlist?page=1' target='_self'>首页</a></div>
		<div class=''><a href='${path }manager/projectlist?page=${nowpage <= 1?1:nowpage-1}' target='_self'>上一页</a></div>
		<%for(int i = 0; i<(Integer)(request.getAttribute("pages")); i++){
			if(i<= 3){			
			%>
		<div ><a href='${path }manager/projectlist?page=<%=i+1 %>' target='_self'><%=i+1 %></a></div>
		<%}else{
			%>
			<div >...</div>
			<%	
		}} %>
		<div class=''><a href='${path }manager/projectlist?page=${nowpage >= pages?pages:nowpage+1}' target='_self'>下一页</a></div><div class=''><a href='${path }manager/projectlist?page=${pages}' target='_self'>尾页</a></div><div class=''>总<b>${pages }</b>页</div><div class=''>每页<b>20</b>条数据</div><div class=''><b>1</b>/${nowpage }</div><div class='SearchStyle'><input type='text' id='john_Page_Search' onkeydown="if(event.keyCode == 13){page_searchIndex();}"/></div><div class=''><input type='button' value='Go' onclick="page_searchIndex()"/></div></div>
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
		var is = confirm("确认要删除"+name+"吗?");
		if(is){
			window.location = "${path}/manager/deleteproject?id="+teacherid;
		}
	}
	</script>
</body>
</html>
