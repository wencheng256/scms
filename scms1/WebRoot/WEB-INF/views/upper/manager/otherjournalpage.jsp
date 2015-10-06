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
    <div class="feilei">
        <a href="#"><strong>日志列表</strong></a></div>
    <div class="fllist">
    	<h1 style="text-align:center;font-size:42px;line-height:45px;height:50px;">${journal.title}</h1>
    	<div style="text-align:center;padding:5px;"><i>${journal.editor.name} 时间:${journal.time}</i></div>
    	<div style="text-align:center;padding:5px;"><i>类型:${journal.type.name}</i></div>
		${journal.content}	
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