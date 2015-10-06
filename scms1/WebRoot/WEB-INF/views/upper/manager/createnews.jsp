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
        <c:choose>
		<c:when test="${manager.type == 0 }">
					<jsp:include page="/WEB-INF/views/include/leftmanager.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="/WEB-INF/views/include/leftteacher.jsp" />
				</c:otherwise>
		</c:choose>
        <div class="rightbox">
                

<h2 class="mbx">新闻管理 &gt; 项目新闻&nbsp;&nbsp;&nbsp;创建新闻</h2>  
<div class="morebt">
    


</div>
<div class="cztable">
	<c:choose>
		<c:when test="${news == null}">
			<form action="${path }manager/newsaction" method="post">
		</c:when>
		<c:otherwise>
			<form action="${path }manager/editnewsaction" method="post">
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="version"  value="${version}" />
	<c:if test="${news != null}">
    	<input type="hidden" name="id" id="tValue" value="${news.id}" />
   	</c:if>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <tr>
            <td width="91" align="right">新闻名称：</td>
            <td colspan="5"><input type="text" name="title"  id="title" style="width:80%;"placeholder="请输入标题" value="${news.title}"/></td>
        </tr>
        <tr>
            <td align="right">撰写人：</td>
            <td colspan="5" >${manager.name}</td>
        </tr>
        <tr>
            <td rowspan="3" align="right">新闻内容：</td>
            <td colspan="5" style="text-align:right;">
            	<font color="red">点击下方编辑器右上角的全屏，方便编辑新闻！<font/>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="position:relative;">
                <textarea name="jcontent" id="edit" cols="80" style="width:100%;" rows="6" class="input_2">
                	${news.jcontent }
                </textarea>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center" valign="middle">
            <input type="hidden" name="version" value="${version}"/>
            <input type="hidden" name="managerid" value="${manager.id}"/>
            <input type="hidden" name="type" value="${manager.type}"/>
            <input type="hidden" name="schoolid" value="${manager.school.id}"/>
                <input type="button" name="button2" id="button2" value="点击提交" class="input2" onclick="onSaveProblem()" />
            </td>
        </tr>
    </table>
    </form>
</div>

            </div>
        </div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
    <script>
    var ue = UE.getEditor('edit');
    var form = document.forms[0];
    function onSaveProblem(){
		if(form.title.value == ""){
			showMsg("标题不能为空","title");
			return;
		}
		if(form.jcontent.value == ""){
			showMsg("内容不能为空","edit");
			return;
		}
		form.submit();
    }
    </script>
</body>
</html>
