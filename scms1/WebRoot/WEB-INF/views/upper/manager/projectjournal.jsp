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
        日志管理 &gt; <a href="#">日志列表</a></h2>
    <div class="morebt">
    
		<jsp:include page="otherprojectManager.jsp" />

	</div>	
    <div class="feilei">
        <a href="#"><strong>日志列表</strong></a></div>
    <div class="fllist">
        <ul>
            <li><strong>类型：</strong><a href="#" id="cAll" onclick="show(list)">全部</a>
                <c:forEach items="${type}" var="typ" >
                <a href="#"  onclick="showName(list,'${typ.name}')">
                    ${typ.name}</a>
                </c:forEach>
                
                
            </li>
        </ul>
        <div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;" id="table1">
                <tr>
                <th width="6%">状态</th>
                    <th style="padding-left: 20px;">
                        日志名称
                    </th>
                    <th style="width: 10%; text-align: center;">
                        日志类型
                    </th>
                    <th style="width: 10%; text-align: center;">
                        更新时间
                    </th>
                    <th style="width: 10%; text-align: center;">
                        审核状态
                    </th>
                    <th style="width: 15%; text-align: center;">
                        操作(编辑，删除)
                    </th>
                </tr>
                <c:forEach items="${journals }" var="j" >
	                <tr>
	                <td width="6%">
						<c:choose>
							<c:when test="${j.status == 0}">
							草稿
							</c:when>
							<c:when test="${j.status == 1}">
							私有
							</c:when>
							<c:when test="${j.status == 2}">
							公开
							</c:when>
							<c:when test="${j.status == 3}">
							回收站
							</c:when>
						</c:choose>
					</td>
	                    <td style="padding-left: 20px;">
	                       <a href="${path }/manager/otherjournalpage?id=${j.id }">${j.title }</a> 
	                    </td>
	                    <td style="width: 15%; text-align: center;">
	                         ${j.type.name }
	                    </td>
	                    <td style="width: 15%; text-align: center;">
	                        ${j.date}
	                    </td>
	                    <td style="width: 15%; text-align: center;">
	                        <c:if test="${j.readed }">
	                        	已审核
	                        </c:if>
	                        <c:if test="${!j.readed }">
	                        	未审核
	                        </c:if>
	                    </td>
	                    <td style="width: 15%; text-align: center;">
                        <a>删除</a>
                    </td>
                </tr>
                </c:forEach>
                
            </table>
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