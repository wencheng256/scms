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
    <div class="fllist">
        <ul>
            <li><strong>类型：</strong><a href="#" id="cAll" onclick="show(list)">全部</a>
                <c:forEach items="${type}" var="typ" >
                <a href="#"  onclick="showName(list,'${typ.name}')">
                    ${typ.name}</a>
                </c:forEach>
                
                
            </li>
            <li><strong>状态：</strong><a href="#" id="tAll" onclick="show(list)">全部</a>
                
                <a href="#" id="1" onclick="showStatus(list,0)">
                    草稿</a>
                
                <a href="#" id="2" onclick="showStatus(list,1)">
                    私有</a>
                
                <a href="#" id="3" onclick="showStatus(list,2)">
                    公开</a>
                
                <a href="#" id="4" onclick="showStatus(list,3)">
                    回收站</a>
                
            </li>
        </ul>
        <div class="cztable">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:center;" id="table1">
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
                
                
            </table>
        </div>
    </div>

            </div>
        </div>
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <script>
    	var list;
    	var numbers;
    	var perpage = 20;
    	var table;
    	$(function(){
    		$.post("${path}student/getjournallist",{},function(data, textStatus, jqXHR){
    			list = data;
    			table = $("#table1").html();
    			numbers = list.length;
    			show(data);
    		},"json");
    	})
    	function show(list){
    		$("#table1").html(table);
    		for(var i = 0; i<list.length; i++){
    			var obj1 = list[i];
    			var img = "status"+obj1.status+".png";
    			if(obj1.status < 3 ){
    				$("#table1").append("<tr><td><img src='${path}images/FileIco/"+img+"' /></td><td class=\"xxleft\">"+obj1.title+"</td><td>"+obj1.type+"</td><td>"+obj1.time+"</td><td><a href=\"${path}student/journaledit?id="+obj1.id+"\">√</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"${path}student/deletejournal?id="+obj1.id+"\">X</a></td></tr>");
    			}
    		}
    	}
    	function showName(list,name){
    		$("#table1").html(table);
    		$("#table1").innerHtml = table;
    		for(var i = 0; i<list.length; i++){
    			var obj1 = list[i];
    			var img = "status"+obj1.status+".png";
    			if(obj1.type == name && obj1.status < 3){
    				$("#table1").append("<tr><td><img src='${path}images/FileIco/"+img+"' /></td><td class=\"xxleft\">"+obj1.title+"</td><td>"+obj1.type+"</td><td>"+obj1.time+"</td><td><a href=\"${path}student/journaledit?id="+obj1.id+"\">√</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"${path}student/deletejournal?id="+obj1.id+"\">X</a></td></tr>");
    			}
    		}
    	}
    	function showStatus(list,status){
    		$("#table1").html(table);
    		$("#table1").innerHtml = table;
    		for(var i = 0; i<list.length; i++){
    			var obj1 = list[i];
    			var img = "status"+obj1.status+".png";
    			if(obj1.status == status){
    				$("#table1").append("<tr><td><img src='${path}images/FileIco/"+img+"' /></td><td class=\"xxleft\">"+obj1.title+"</td><td>"+obj1.type+"</td><td>"+obj1.time+"</td><td><a href=\"${path}student/journaledit?id="+obj1.id+"\">√</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=\"${path}student/deletejournal?id="+obj1.id+"\">X</a></td></tr>");
    			}
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