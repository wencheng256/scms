<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

            <div class="leftbox">
                <div class="l_nav2">
                    <div class="ta1">
                        <strong>项目管理</strong>
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${path }student/projectinfo">项目信息</a></div>
                        <div>
                            <a href="${path }student/team">成员管理</a>
                        </div>
                        <div>
                            <a href="${path }student/teacher">指导教师</a></div>
                        <div>
                            <a href="${path }student/fee">经费申报</a></div>
                    </div>
                    <div class="ta1">
                        <strong>日志管理</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${path }student/journallist">项目日志</a></div>
                        <div>
                            <a href="${path }student/applicationshow">申请报告</a></div>
                        <div>
                            <a href="${path }student/middleshow">中期报告</a></div>
                        <div>
                            <a href="${path }student/endshow">结题报告</a></div>
                    </div>
                    <div class="ta1">
                        <strong>院校新闻</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${path }student/schoolnews">学院新闻</a></div>
                        <div>
                            <a href="${path }student/universitynews">学校新闻</a></div>
                    </div>

                    <div class="ta1">
                        <strong>其他项目</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${path }student/projectlist">其他项目</a></div>
                    </div>
					<div class="ta1">
                        <a href="${path }student/message" target="_blank"><strong>留言</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            