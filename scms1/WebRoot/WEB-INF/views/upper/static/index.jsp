<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>
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
    	<h2 style="text-align:center">学院数据指标（使用IE8以上版本可以看到图表）</h2>
    	<div id="main" style="height:400px;"></div>
    	<div id="main1" style="height:400px;"></div>
    	<div id="pie1" style="height:400px;"></div>
    	<div id="pie2" style="height:400px;"></div>
    	<div id="pie3" style="height:400px;"></div>
    </div>
        </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
    </div>
	<div style="text-align:center;">
</div>
  <script src="${path }js/echarts.js"></script>
  <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: '${path}/js'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
                		
                	    tooltip : {
                	    	
                	        trigger: 'axis',
                	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                	        }
                	    },
                	    legend: {
                	        data:['学生人次', '项目数量','教师数量','重点立项','日志数量']
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            restore : {show: true},
                	        }
                	    },
                	    calculable : true,
                	    xAxis : [
                	        {
                	            type : 'value'
                	        }
                	    ],
                	    yAxis : [
                	        {
                	            type : 'category',
                	            data : [
                	                    
                	                    <c:forEach items="${schools}" var="s" varStatus="ss">
                	                   ' ${s.name}'
                	                	<c:if test="${!ss.last }">,</c:if>
                	               		 </c:forEach>
                	                   ]
                	        }
                	    ],
                	    series : [
                	        {
                	            name:'学生人次',
                	            type:'bar',
                	            stack: '总量',
                	            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
                	            data:[
              	                    <c:forEach items="${schools}" var="s" varStatus="ss">
             	                   ' ${s.students.size()}'
             	                	<c:if test="${!ss.last }">,</c:if>
             	               		 </c:forEach>
								]
                	        },
                	        {
                	            name:'项目数量',
                	            type:'bar',
                	            stack: '总量',
                	            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
                	            data:[
                	                    <c:forEach items="${schools}" var="s" varStatus="ss">
                  	                   ' ${s.projects.size()}'
                  	                	<c:if test="${!ss.last }">,</c:if>
                  	               		 </c:forEach>
								]
                	        },
                	        {
                	            name:'教师数量',
                	            type:'bar',
                	            stack: '总量',
                	            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
                	            data:[
              	                    <c:forEach items="${schools}" var="s" varStatus="ss">
               	                   ' ${s.teachers.size()}'
               	                	<c:if test="${!ss.last }">,</c:if>
               	               		 </c:forEach>
								]
                	        },
                	        {
                	            name:'重点立项',
                	            type:'bar',
                	            stack: '总量',
                	            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
                	            data:[
              	                    <c:forEach items="${schools}" var="s" varStatus="ss">
               	                   ' ${s.important}'
               	                	<c:if test="${!ss.last }">,</c:if>
               	               		 </c:forEach>
								]
                	        },
                	        {
                	            name:'日志数量',
                	            type:'bar',
                	            stack: '总量',
                	            itemStyle : { normal: {label : {show: true, position: 'insideRight'}}},
                	            data:[
              	                    <c:forEach items="${schools}" var="s" varStatus="ss">
               	                   ' ${s.jouNum}'
               	                	<c:if test="${!ss.last }">,</c:if>
               	               		 </c:forEach>
								]
                	        }
                	    ]
                	};
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
        require(
                [
                    'echarts',
                    'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('main1')); 
                    
                    var option = {
                    	    title : {
                    	        text: '本期项目统计'
                    	    },
                    	    tooltip : {
                    	        trigger: 'axis'
                    	    },
                    	    legend: {
                    	        data:['本期']
                    	    },
                    	    toolbox: {
                    	        show : true,
                    	        feature : {
                    	            mark : {show: true},
                    	            dataView : {show: true, readOnly: false},
                    	            magicType: {show: true, type: ['line', 'bar']},
                    	            restore : {show: true},
                    	            saveAsImage : {show: true}
                    	        }
                    	    },
                    	    calculable : true,
                    	    xAxis : [
                    	        {
                    	            type : 'value',
                    	            boundaryGap : [0, 0.01]
                    	        }
                    	    ],
                    	    yAxis : [
                    	        {
                    	            type : 'category',
                    	            data : ['参与人次','教师人数','日志数量','项目数量','重点立项数量']
                    	        }
                    	    ],
                    	    series : [
                    	        {
                    	            name:'本期',
                    	            type:'bar',
                    	            data:[
                  	                    <c:forEach items="${schools}" var="s" varStatus="ss">
                  	                 	 ${s.students.size()}
                    	                	<c:if test="${!ss.last }">+</c:if>
                    	               </c:forEach>,
                 	                    <c:forEach items="${schools}" var="s" varStatus="ss">
                	                 	 ${s.teachers.size()}
                  	                	<c:if test="${!ss.last }">+</c:if>
                  	               		</c:forEach>,
                  	               	 	<c:forEach items="${schools}" var="s" varStatus="ss">
               	                 	 	${s.jouNum}
                 	                	<c:if test="${!ss.last }">+</c:if>
                 	               		</c:forEach>,
                 	               		<c:forEach items="${schools}" var="s" varStatus="ss">
               	                 	 	${s.projects.size()}
                 	                	<c:if test="${!ss.last }">+</c:if>
                 	               		</c:forEach>,
                 	               		<c:forEach items="${schools}" var="s" varStatus="ss">
               	                 	 	${s.important}
                 	                	<c:if test="${!ss.last }">+</c:if>
                 	               		</c:forEach>
									]
                    	        }
                    	    ]
                    	};
                    	                    
            
                    // 为echarts对象加载数据 
                    myChart.setOption(option); 
                }
            );
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('pie1')); 
                
                var option = {
                	    title : {
                	        text: '项目数量',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:[
          	                    <c:forEach items="${schools}" var="s" varStatus="ss">
         	                   ' ${s.name}'
         	                	<c:if test="${!ss.last }">,</c:if>
         	               		 </c:forEach>
							]
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie', 'funnel'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'left',
                	                        max: 1548
                	                    }
                	                }
                	            },
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            name:'访问来源',
                	            type:'pie',
                	            radius : '55%',
                	            center: ['50%', '60%'],
                	            data:[
            	                    <c:forEach items="${schools}" var="s" varStatus="ss">
             	                   {value:${s.projects.size()}, name:' ${s.name}'}
             	                	<c:if test="${!ss.last }">,</c:if>
             	               		 </c:forEach>
                	            ]
                	        }
                	    ]
                	};
                	                    
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
        require(
                [
                    'echarts',
                    'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('pie2')); 
                    
                    var option = {
                    	    title : {
                    	        text: '参与学生数量',
                    	        x:'center'
                    	    },
                    	    tooltip : {
                    	        trigger: 'item',
                    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    	    },
                    	    legend: {
                    	        orient : 'vertical',
                    	        x : 'left',
                    	        data:[
              	                    <c:forEach items="${schools}" var="s" varStatus="ss">
             	                   ' ${s.name}'
             	                	<c:if test="${!ss.last }">,</c:if>
             	               		 </c:forEach>
    							]
                    	    },
                    	    toolbox: {
                    	        show : true,
                    	        feature : {
                    	            mark : {show: true},
                    	            dataView : {show: true, readOnly: false},
                    	            magicType : {
                    	                show: true, 
                    	                type: ['pie', 'funnel'],
                    	                option: {
                    	                    funnel: {
                    	                        x: '25%',
                    	                        width: '50%',
                    	                        funnelAlign: 'left',
                    	                        max: 1548
                    	                    }
                    	                }
                    	            },
                    	            restore : {show: true},
                    	            saveAsImage : {show: true}
                    	        }
                    	    },
                    	    calculable : true,
                    	    series : [
                    	        {
                    	            name:'访问来源',
                    	            type:'pie',
                    	            radius : '55%',
                    	            center: ['50%', '60%'],
                    	            data:[
                	                    <c:forEach items="${schools}" var="s" varStatus="ss">
                 	                   {value:${s.students.size()}, name:' ${s.name}'}
                 	                	<c:if test="${!ss.last }">,</c:if>
                 	               		 </c:forEach>
                    	            ]
                    	        }
                    	    ]
                    	};
                    	                    
            
                    // 为echarts对象加载数据 
                    myChart.setOption(option); 
                }
            );
        require(
                [
                    'echarts',
                    'echarts/chart/pie' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec) {
                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('pie3')); 
                    
                    var option = {
                    	    title : {
                    	        text: '参与教师数量',
                    	        x:'center'
                    	    },
                    	    tooltip : {
                    	        trigger: 'item',
                    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    	    },
                    	    legend: {
                    	        orient : 'vertical',
                    	        x : 'left',
                    	        data:[
              	                    <c:forEach items="${schools}" var="s" varStatus="ss">
             	                   ' ${s.name}'
             	                	<c:if test="${!ss.last }">,</c:if>
             	               		 </c:forEach>
    							]
                    	    },
                    	    toolbox: {
                    	        show : true,
                    	        feature : {
                    	            mark : {show: true},
                    	            dataView : {show: true, readOnly: false},
                    	            magicType : {
                    	                show: true, 
                    	                type: ['pie', 'funnel'],
                    	                option: {
                    	                    funnel: {
                    	                        x: '25%',
                    	                        width: '50%',
                    	                        funnelAlign: 'left',
                    	                        max: 1548
                    	                    }
                    	                }
                    	            },
                    	            restore : {show: true},
                    	            saveAsImage : {show: true}
                    	        }
                    	    },
                    	    calculable : true,
                    	    series : [
                    	        {
                    	            name:'访问来源',
                    	            type:'pie',
                    	            radius : '55%',
                    	            center: ['50%', '60%'],
                    	            data:[
                	                    <c:forEach items="${schools}" var="s" varStatus="ss">
                 	                   {value:${s.teachers.size()}, name:' ${s.name}'}
                 	                	<c:if test="${!ss.last }">,</c:if>
                 	               		 </c:forEach>
                    	            ]
                    	        }
                    	    ]
                    	};
                    	                    
            
                    // 为echarts对象加载数据 
                    myChart.setOption(option); 
                }
            );
    </script>
</body>
</html>
