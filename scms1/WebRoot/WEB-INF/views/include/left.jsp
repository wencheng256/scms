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
                            <a href="MyInfo/ClassInfo.aspx.html">成员管理</a>
                        </div>
                        <div>
                            <a href="User/StudentInfor/Letter.aspx.html">指导教师</a></div>
                        <div>
                            <a href="User/StudentInfor/systemMsge.aspx.html">经费申报</a></div>
                        <div>
                            <a href="MyInfo/Objection.aspx.html">我的异议</a></div>
                    </div>
                    <div class="ta1">
                        <strong>日志管理</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="EducationCenter/Application.aspx.html">项目日志</a></div>
                        <div>
                            <a href="EducationCenter/Score.aspx.html">申请报告</a></div>
                        <div>
                            <a href="EducationCenter/Book.aspx.html">中期报告</a></div>
                        <div>
                            <a href="EducationCenter/Book.aspx.html">结题报告</a></div>
                    </div>
                    <div class="ta1">
                        <strong>院校新闻</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="OnlineTeaching/StudentMaterial.aspx.html">学院新闻</a></div>
                        <div>
                            <a href="OnlineTeaching/StudentStudyRecordList.aspx.html">学校新闻</a></div>
                    </div>

                    <div class="ta1">
                        <strong>其他项目</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="MyAccount/wdcw.aspx.html">其他项目</a></div>
                    </div>
<div class="ta1">
                        <a href="http://www.csgb.net/login.aspx?userLoginName=2014&userName=邹智&professionId=F40C998A-D9AC-421F-99C9-C024C1DC53AD&flag=sm" target="_blank"><strong>留言</strong></a>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                </div>
            </div>
            