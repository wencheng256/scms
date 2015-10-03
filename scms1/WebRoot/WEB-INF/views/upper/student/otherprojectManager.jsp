<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../scms.jsp" %>

<ul id="ulStudMsgHeadTab">
    <li><a class="tab${ta}" onclick="" href="${path}student/otherproject?id=${id}">团队信息</a> </li>
    <li><a class="tab${tb}" onclick="" href="${path}student/otherapplication?id=${id}">项目申请书</a></li>
    <li><a class="tab${tc}" onclick="" href="${path}student/othermiddle?id=${id}">中期审核</a></li>
    <li><a class="tab${td}" onclick="" href="${path}student/otherend?id=${id}">结题报告</a></li>
    <li><a class="tab${tc}" onclick="" href="${path}student/otherjournallist?id=${id}">日志列表</a></li>
    <li><a class="tab${tc}" onclick="" href="${path}student/othermessage?id=${id}">留言</a></li>
</ul>