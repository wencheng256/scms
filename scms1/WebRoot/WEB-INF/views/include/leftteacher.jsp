<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

            <div class="leftbox">
                <div class="l_nav2">
                    <div class="ta1">
                        <strong>管理菜单</strong>
                        <div class="leftbgbt">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${path }teacher/projectlist">指导的项目</a></div>
                        <div>
                            <a href="${path }teacher/personinfo">个人信息管理</a>
                        </div>
                    </div>
                </div>
            </div>
            