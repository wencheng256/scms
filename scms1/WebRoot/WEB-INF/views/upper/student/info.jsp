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
    
<jsp:include page="projectManager.jsp" />

</div>
<div class="cztable">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" width="80">姓名：</td>
            <td>邹智&nbsp;</td>
            <td align="right" width="90">身份证号码：</td>
            <td>430181198612113330&nbsp;</td>
            
            <td rowspan="9"><div align="center"><img id="pic_face"  height="160" width="120" src="${path }images/Student/photo.jpg"/ style="padding:2px 2px 5px; border:1px #ddd solid;"></div>&nbsp;</td>
        </tr>
        <tr>
            <td align="right">性别：</td>
            <td>男&nbsp;</td>
            <td align="right">考籍号：</td>
            <td>910513201419&nbsp;</td>
        </tr>
        <tr>
            <td align="right">报考类别：</td>
            <td>自考&nbsp;</td>
            <td align="right">报考学校：</td>
            <td>湖南大学&nbsp;</td>
        </tr>
        <tr>
            <td align="right">报考专业：</td>
            <td>经济法学&nbsp;</td>
            <td align="right">原专业：</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td align="right">报考层次：</td>
            <td>专本同读&nbsp;</td>
            
            <td align="right">注册批次：</td>
            <td>2013秋&nbsp;</td>
        </tr>
        <tr>
            <td align="right">报名时间：</td>
            <td>2013-08-16&nbsp;</td>
            <td align="right">状态：</td>
            <td>在读&nbsp;</td>
        </tr>
        
        <tr>
            <td colspan="4" align="left">联系方式（如联系方式有变动请及时修改，以便能及时联系到你。谢谢！）</td>
            
        </tr>
        <tr>
            <td align="right">手机号码：</td>
            <td>15111141999</td>
            <td align="right">第二联系号码：</td>
            <td></td>
           
        </tr>
        <tr>
            <td align="right">QQ:</td>
            <td></td>
            <td align="right">电子邮箱：</td>
            <td></td>
            
        </tr>
        <tr>
            <td align="right">联系地址：</td>
            <td colspan="4"></td>
        </tr>
        <tr align="center">
            <td colspan="5" height="40">
                <div align="center">
                    
                    <input type="button" id="button2" value="联系方式有修改" onclick="submitMail()" class="input2" />
                </div>
            </td>
        </tr>
    </table>
</div>

            </div>
        </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>
