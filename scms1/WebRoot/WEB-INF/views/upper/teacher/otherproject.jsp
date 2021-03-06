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
        <jsp:include page="/WEB-INF/views/include/leftteacher.jsp" />
            <div class="rightbox">
                
<h2 class="mbx">我的信息 &gt; 个人资料 &nbsp;&nbsp;&nbsp;</h2>       
<div class="morebt">
    
<jsp:include page="otherprojectManager.jsp" />

</div>
<div class="cztable">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right" width="80">项目名称：</td>
            <td>${project.name }</td>
            <td align="right" width="90">项目编码：</td>
            <td>${project.number }</td>
            
            <td rowspan="7"><div align="center"><div id="main" style="height:300px;width:350px;"></div></div></td>
        </tr>
        <tr>
            <td align="right">学院：</td>
            <td>${project.process }</td>
            <td align="right">指导教师：</td>
            <td>${project.teacher.name }</td>
        </tr>
        <tr>
            <td align="right">项目类型：</td>
            <td>
				${project.level.name}
			</td>
            <td align="right">项目进度：</td>
            <td>${project.process }%</td>
        </tr>
        <tr>
            <td align="right">项目学院：</td>
            <td>${project.school.name}</td>
            <td align="right">原专业：</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td align="right">报考层次：</td>
            <td>专本同读&nbsp;</td>
            
            <td align="right">注册批次：</td>
            <td>${project.grade}</td>
        </tr>
        <tr>
            <td align="right">注册时间：</td>
            <td>${project.startingTime}</td>
            <td align="right">状态：</td>
            <td>
				<c:choose>
					<c:when test="${project.status == 0}">
						超前
					</c:when>
					<c:when test="${project.status == 1}">
						顺利
					</c:when>
					<c:when test="${project.status == 2}">
						延迟
					</c:when>
					<c:when test="${project.status == 3}">
						中断
					</c:when>
					<c:when test="${project.status == 4}">
						终止
					</c:when>				
				</c:choose>
			</td>
        </tr>
        
        <tr>
            <td colspan="4" align="left">联系方式（如联系方式有变动请及时修改，以便能及时联系到你。谢谢！）</td>
            
        </tr>
        <c:forEach items="${project.member}" var="stu" varStatus="stus">
        <tr>
            <td align="right">${stus.index+1}</td>
            <td colspan="4" >
            <c:if test="${stu.cap}">
            	<font color="blue">
            </c:if>
            ${stu.name}
            <c:if test="${stu.cap}">
            	</font>
            </c:if>
            </td>
        </tr>
        </c:forEach>
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
    <script type="text/javascript">
 function createRandomItemStyle() {
	    return {
	        normal: {
	            color: 'rgb(' + [
	                Math.round(Math.random() * 160),
	                Math.round(Math.random() * 160),
	                Math.round(Math.random() * 160)
	            ].join(',') + ')'
	        }
	    };
	}

        // 路径配置
        require.config({
            paths: {
            	echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/wordCloud' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
                	    title: {
                	        text: '项目云',
                	    },
                	    tooltip: {
                	        show: true
                	    },
                	    series: [{
                	        name: '${project.name}',
                	        type: 'wordCloud',
                	        size: ['80%', '80%'],
                	        textRotation : [0, 45, 90, -45],
                	        textPadding: 0,
                	        autoSize: {
                	            enable: true,
                	            minSize: 14
                	        },
                	        data: [
                	            {
                	                name: '${project.name}',
                	                value: 10000,
                	                itemStyle: {
                	                    normal: {
                	                        color: 'black'
                	                    }
                	                }
                	            },
                	            {
                	                name: "教师：${project.teacher.name}",
                	                value: 6181,
                	                itemStyle: createRandomItemStyle()
                	            },
                	            {
                	                name: "学院：${project.school.name}",
                	                value: 4386,
                	                itemStyle: createRandomItemStyle()
                	            },
                	            {
                	                name: "进度：${project.process}%",
                	                value: 4055,
                	                itemStyle: createRandomItemStyle()
                	            },
                	            <c:forEach items="${project.member}" var="stu" varStatus="stus">
	                	            {
	                	                name: "成员：${stu.name}",
	                	                value: 2244,
	                	                itemStyle: createRandomItemStyle()
	                	            },
                	            </c:forEach>

                  	            {
                	                name: "编号：${project.number}",
                	                value: 2467,
                	                itemStyle: createRandomItemStyle()
                	            }
                	        ]
                	    }]
                	};
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
</body>
</html>
