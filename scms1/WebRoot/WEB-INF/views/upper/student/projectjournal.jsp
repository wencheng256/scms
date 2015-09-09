<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>

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
                
    <h2 class="mbx">
        学习中心 &gt; <a href="#">资料中心</a></h2>
    <div class="feilei">
        <a href="#"><strong>资料中心</strong></a></div>
    <input type="hidden" id="cValue" value="" />
    <input type="hidden" id="tValue" value="" />
    <div class="fllist">
        <ul>
            <li><strong>类型：</strong><a href="#" id="cAll" onclick='searchData("","c")'>全部</a>
                <c:forEach items="${type}" var="typ" >
                <a href="#" id="8c7743e8-0818-41fa-bc86-44407ca2f773" onclick="searchData('8c7743e8-0818-41fa-bc86-44407ca2f773','c')">
                    ${typ.name}</a>
                </c:forEach>
                
                
            </li>
            <li><strong>状态：</strong><a href="#" id="tAll" onclick="searchData('','t')">全部</a>
                
                <a href="#" id="1" onclick="searchData('1','t')">
                    草稿</a>
                
                <a href="#" id="2" onclick="searchData('2','t')">
                    公开</a>
                
                <a href="#" id="3" onclick="searchData('3','t')">
                    私有</a>
                
                <a href="#" id="4" onclick="searchData('4','t')">
                    回收站</a>
                
            </li>
        </ul>
        <div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;">
                <tr>
                <th width="6%">状态</th>
                    <th style="padding-left: 20px;">
                        日志名称
                    </th>
                    <th style="width: 15%; text-align: center;">
                        日志类型
                    </th>
                    <th style="width: 15%; text-align: center;">
                        更新时间
                    </th>
                    <th style="width: 15%; text-align: center;">
                        操作(编辑，删除)
                    </th>
                </tr>
                
                <tr>
                <td><img src='${path}images/FileIco/doc.gif' /></td>
                    <td class="xxleft">
                        
                        英语2
                    </td>
                    <td>
                        复习资料
                    </td>
                    <td>
                        2013-09-29
                    </td>
                    <td>
						√&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; X
                    </td>
                </tr>
                
            </table>
            <div class='MainStyle'><div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=1' target='_self'>首页</a></div><div class=''><a href='javascript:void(0)' target='_self'>上一页</a></div><div class='NowItemStyle'><a href='javascript:void(0)' target='_self'>1</a></div><div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=2' target='_self'>2</a></div><div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=3' target='_self'>3</a></div><div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=2' target='_self'>下一页</a></div><div class=''><a href='http://sm.zk0731.com/OnlineTeaching/StudentMaterial.aspx?page=3' target='_self'>尾页</a></div><div class=''>总共<b>44</b>条数据</div><div class=''>每页<b>20</b>条数据</div><div class=''><b>1</b>/3</div><div class='SearchStyle'><input type='text' id='john_Page_Search' onkeydown="if(event.keyCode == 13){page_searchIndex();}"/></div><div class=''><input type='button' value='Go' onclick="page_searchIndex()"/></div></div><script>    function page_searchIndex(){        var searchText = document.getElementById('john_Page_Search');        var searchIndex = searchText != null && searchText.value != '' ? parseInt(searchText.value) : 0;        if(searchIndex > 0 && searchIndex <= 3) {             window.location='StudentMaterial.aspx?page=' + searchIndex;        }        else        {            alert('需要跳转的页码不能超出范围！');        }    }</script>
        </div>
    </div>

            </div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
</body>
</html>