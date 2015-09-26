<%@ page language="java" import="java.util.*,java.text.*,com.wencheng.domain.*" pageEncoding="UTF-8"%>
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
                
<h2 class="mbx">我的信息 &gt; 个人资料 &nbsp;&nbsp;&nbsp;</h2>       
<div class="morebt">
    
<jsp:include page="otherprojectManager.jsp" />

</div>

<div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;" id="table1">
                <tr>
                    <th style="padding-left: 20px;">
                       日志名称
                    </th>
                    <th style="width: 15%; text-align: center;">
                        日志类型
                    </th>
                    <th style="width: 30%; text-align: center;">
                        更新时间
                    </th>
                </tr>
                
                <c:forEach items="${list}" var="jou">
                <tr>
                    <td style="padding-left: 20px;">
                         <a href="${path }student/otherjournalpage?id=${jou.id}">${jou.title }</a>
                    </td>
                    <td style="width: 15%; text-align: center;">
                    	 ${jou.type.name }
                    </td>
                    <td style="width: 15%; text-align: center;">
                     ${jou.date}
                    </td>
                </tr>
                </c:forEach>
                
            </table>
</div>


            </div>
        </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>
