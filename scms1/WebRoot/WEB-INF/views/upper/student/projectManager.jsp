<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>

<ul id="ulStudMsgHeadTab">
    <li><a class="tab${ta}" onclick="" href="${path}student/projectinfo">团队信息</a> </li>
    <li><a class="tab${tb}" onclick="" href="${path}student/team">成员管理</a></li>
    <li><a class="tab${tc}" onclick="" href="${path}student/teacher">指导老师</a></li>
    <li><a class="tab${td}" onclick="" href="${path}student/fee">经费申报<span style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span></a></li>
    <!--<li><a class="tab${te}" onclick="" href="../../MyInfo/Objection.aspx.html">我的异议</a></li>-->
</ul>