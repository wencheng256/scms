<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/scms.sdu.edu.cn"  prefix="m"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

        <div class="footer">
            <p>
                &copy;copyright <%=new SimpleDateFormat("YYYY").format(new Date())%> 广博教育 csgb.net 版权所有 站长统计</p>
        </div>