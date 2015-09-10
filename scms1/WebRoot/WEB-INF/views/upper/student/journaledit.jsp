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
                

<h2 class="mbx">日志管理 &gt; 项目日志&nbsp;&nbsp;&nbsp;创建日志</h2>  
<div class="morebt">
    


</div>
<div class="cztable">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <tr>
            <td width="91" align="right">日志名称：</td>
            <td colspan="5"><input type="text" name="title" style="width:80%;"placeholder="请输入标题"/></td>
        </tr>
        <tr>
            <td align="right">撰写人：</td>
            <td colspan="5" ><select style="width:50%"></select></td>
        </tr>
        <tr>
            <td align="right">日志状态：</td>
            <td colspan="5">草稿： <input type="radio"/> 私有： <input type="radio"/> 公开： <input type="radio"/> 回收站：<input type="radio" disabled="disabled"/></td>
        </tr>
        <tr>
            <td align="right">学校名称：</td>
            <td colspan="5">湖南大学&nbsp;</td>
        </tr>
            
            <tr>
                    <td align="right"><div align="right">班主任老师：</div>&nbsp;</td>
                    <td><div align="left">王娟</div></td>
                    <td><div align="right">电话：</div>&nbsp;</td>
                    <td><div align="left">15388088011</div>&nbsp;</td>
                    <td align="right"><div align="right">在线交流：</div>&nbsp;</td>
                    <td align="right"><div align="left"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2::41" alt="点击这里给我发消息" /></a></div>&nbsp;</td>
                  </tr>
            
        <tr>
            <td align="right">工作评价：</td>
            <td colspan="5">
                <input value="满意" checked="checked" type="radio" name="workAssess" />满意
                <input value="一般" type="radio" name="workAssess" />一般
                <input value="差" type="radio" name="workAssess" />差
            </td>
        </tr>
        <tr>
            <td rowspan="3" align="right">问题反馈：</td>
            <td colspan="5">
                <input value="4" checked="checked" type="radio" name="problemType" />提问
                
                <input value="1" type="radio" name="problemType" />投诉
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <textarea name="problemContent" id="problemContent" cols="80" rows="6" class="input_2"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="left" valign="middle">
                <input type="button" name="button2" id="button2" value="点击提交" class="input2" onclick="onSaveProblem()" />
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
