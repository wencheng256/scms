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
        新闻管理 &gt; <a href="#">新闻列表</a></h2>
    <div class="morebt">
    

	</div>	
    <div class="feilei">
        <a href="#"><strong>新闻列表</strong></a></div>
    <div class="fllist">
        <div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;" id="table1">
                <tr>
                <th width="10%">序号</th>
                    <th style="padding-left: 20px;">
                        标题
                    </th>
                    <th style="width: 10%; text-align: center;">
                        更新时间
                    </th>
                    <th style="width: 15%; text-align: center;">
                        操作(编辑，删除)
                    </th>
                </tr>
                <c:forEach items="${news }" var="j" varStatus="js">
	                <tr>
	                <td width="6%">
	                	${js.index+1}
					</td>
	                    <td style="padding-left: 20px;">
	                       <a href="${path }/manager/newspage?id=${j.id }">${j.title }</a> 
	                    </td>
	                    <td style="width: 15%; text-align: center;">
	                        ${j.date}
	                    </td>
	                    <td style="width: 15%; text-align: center;">
                       <a href="${path }manager/createnews?id=${j.id}">编辑</a> /<a href="${path }manager/deletenews?id=${j.id}">删除</a>
                    </td>
                </tr>
                </c:forEach>
                
            </table>
            
            <div class='MainStyle'>
		<div class=''><a href='${path }manager/mynews?page=1' target='_self'>首页</a></div>
		<div class=''><a href='${path }manager/mynews?page=${nowpage <= 1?1:nowpage-1}' target='_self'>上一页</a></div>
		<%for(int i = 0; i<(Integer)(request.getAttribute("pages")); i++){
			if(i<= 3){			
			%>
		<div ><a href='${path }manager/mynews?page=<%=i+1 %>' target='_self'><%=i+1 %></a></div>
		<%}else{
			%>
			<div >...</div>
			<%	
		}} %>
		<div class=''><a href='${path }manager/mynews?page=${nowpage >= pages?pages:nowpage+1}' target='_self'>下一页</a></div><div class=''><a href='${path }manager/mynews?page=${pages}' target='_self'>尾页</a></div><div class=''>总<b>${pages }</b>页</div><div class=''>每页<b>20</b>条数据</div><div class=''><b>1</b>/${nowpage }</div><div class='SearchStyle'><input type='text' id='john_Page_Search' onkeydown="if(event.keyCode == 13){page_searchIndex();}"/></div><div class=''><input type='button' value='Go' onclick="page_searchIndex()"/></div></div>
        </div>
    </div>

            </div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <c:if test="${message != null}">
	<script type="text/javascript">
	showMsg("${message}", "name");
	</script>
</c:if>
</body>
</html>