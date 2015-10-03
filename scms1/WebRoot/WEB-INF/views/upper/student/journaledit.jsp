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
	<c:choose>
		<c:when test="${jou == null}">
			<form action="${path }student/journalaction" method="post">
		</c:when>
		<c:otherwise>
			<form action="${path }student/editjournalaction" method="post">
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="version"  value="${version}" />
	<c:if test="${jou != null}">
    	<input type="hidden" name="id" id="tValue" value="${jou.id}" />
   	</c:if>
    <table border="0" cellspacing="0" cellpadding="0" width="100%" >
        <tr>
            <td width="91" align="right">日志名称：</td>
            <td colspan="5"><input type="text" name="title"  id="title" style="width:80%;"placeholder="请输入标题" value="${jou.title}"/></td>
        </tr>
        <tr>
            <td align="right">撰写人：</td>
            <td colspan="5" ><select style="width:50%" name="editorid">
                <c:forEach items="${students}" var="stu">
            		<option value="${stu.id}" 
            			<c:if test="${jou.editor.id  == stu.id}">
            				selected
            			</c:if>
            		>-----------------------${stu.name}-----------------------</option>
            	</c:forEach>
            </select></td>
        </tr>
        <tr>
            <td align="right">日志状态：</td>
            <td colspan="5">          草稿：
             <input type="radio" value="0" name="status" 
			 	<c:if test="${jou.status  == 0}">
            		checked
            	</c:if>
			/> 私有： 
			<input type="radio" value="1" name="status"
			 	<c:if test="${jou.status  == 1}">
            		checked
            	</c:if>			
			/> 公开： <input type="radio" value="2" name="status"
				<c:if test="${jou.status  == 2}">
            		checked
            	</c:if>		
			/> 回收站：<input type="radio" value="3" disabled="disabled" name="status"
				<c:if test="${jou.status  == 3}">
            		checked
            	</c:if>		
			/></td>
        </tr>
        <tr>
            <td align="right">日志类型：</td>
            <td colspan="5"><select style="width:50%" name="typeid">
            	<c:forEach items="${type}" var="ty">
            		<option value="${ty.id }"
            			<c:if test="${jou.type.id  == ty.id}">
            				selected
            			</c:if>
            		>-----------------------${ty.name }-----------------------</option>
            	</c:forEach>
            </select></td>
        </tr>
        <tr>
            <td rowspan="3" align="right">问题反馈：</td>
            <td colspan="5" style="text-align:right;">
            	<font color="red">点击下方编辑器右上角的全屏，方便编辑日志！<font/>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="position:relative;">
                <textarea name="jcontent" id="edit" cols="80" style="width:100%;" rows="6" class="input_2">
                	${jou.jcontent }
                </textarea>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center" valign="middle">
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
