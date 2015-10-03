<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>

<ul id="ulStudMsgHeadTab">
    <li><a class="tab${ta}" onclick="" href="${path}teacher/otherproject?id=${id}">团队信息</a> </li>
    <li><a class="tab${tb}" onclick="" href="${path}teacher/otherapplication?id=${id}">项目申请书</a></li>
    <li><a class="tab${tc}" onclick="" href="${path}teacher/othermiddle?id=${id}">中期审核</a></li>
    <li><a class="tab${td}" onclick="" href="${path}teacher/otherend?id=${id}">结题报告</a></li>
    <li><a class="tab${tc}" onclick="" href="${path}teacher/otherjournallist?id=${id}">日志列表</a></li>
    <li><a class="tab${tc}" onclick="" href="${path}teacher/othermessage?id=${id}">留言</a></li>
</ul>