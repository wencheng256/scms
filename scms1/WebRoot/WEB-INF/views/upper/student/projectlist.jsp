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
                
    <h2 class="mbx">
        教务中心 &gt; 我的书籍</h2>
    <div class="morebt">
    </div>
    <div class="cztable">
        <div class="tis red">
            注：请仔细核对自己的书籍发放情况，如正确请点击“确定无误”，如不正确请点击“有异议”。
        </div>
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
                        操作
                    </th>
                </tr>
                <c:forEach items="${projects}" var="pro">
	                <tr align="center">
	                    <td>
	                       ${pro.number }
	                    </td>
	                    <td>
	                        <a href="${path}student/otherproject?id=${pro.id}">${pro.name }</a>
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
	                    <td>&nbsp;
	                        
	                    </td>
	                </tr>
                </c:forEach>
                
            </tbody>
        </table>
    </div>
	<div class='MainStyle'>
		<div class=''><a href='' target='_self'>首页</a></div>
		<div class=''><a href='javascript:void(0)' target='_self'>上一页</a></div>
		<%for(int i = 0; i<(Integer)(request.getAttribute("pages")); i++){ %>
		<div class='NowItemStyle'><a href='javascript:void(0)' target='_self'><%=i+1 %></a></div>
		<%} %>
		<div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=2' target='_self'>下一页</a></div><div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=3' target='_self'>尾页</a></div><div class=''>总共<b>44</b>条数据</div><div class=''>每页<b>20</b>条数据</div><div class=''><b>1</b>/3</div><div class='SearchStyle'><input type='text' id='john_Page_Search' onkeydown="if(event.keyCode == 13){page_searchIndex();}"/></div><div class=''><input type='button' value='Go' onclick="page_searchIndex()"/></div></div>
            </div>
        </div>
        <div class="footer">
            <p>
                &copy;copyright 2012 广博教育 csgb.net 版权所有 站长统计</p>
        </div>
    </div>
</body>
</html>
