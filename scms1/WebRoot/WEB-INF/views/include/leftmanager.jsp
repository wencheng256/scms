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
                            <a href="${path }manager/index">项目统计</a></div>
                        <div>
                            <a href="${path }manager/projectlist">项目列表</a>
                        </div>
                        <div>
                            <a href="${path }manager/teacherlist">查看参与教师</a>
                        </div>
                        <div>
                            <a href="${path }manager/journal">日志审核</a>
                        </div>
                        <div>
                            <a href="${path }manager/applications">项目申请书</a>
                        </div>
                        <div>
                            <a href="${path }manager/middles">项目中期报告</a>
                        </div>
                        <div>
                            <a href="${path }manager/ends">项目结题报告</a>
                        </div>
                        <div>
                            <a href="${path }manager/export">导出往届项目</a></div>
                        <div>
                            <a href="${path }manager/clean">清空往届项目</a></div>
                        <div>
                            <a href="${path }manager/begin">开启新一期项目</a></div>
                    </div>
                    <div class="ta1">
                        <strong>院校新闻</strong>
                        <div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${path }manager/newslist">查看新闻列表</a></div>
                        <div>
                            <a href="${path }manager/mynews">我的新闻</a></div>
                        <div>
                            <a href="${path }manager/createnews">创建新闻</a></div>
                    </div>

                    <div class="ta1">
                        <strong>系统管理</strong><div class="leftbgbt2">
                        </div>
                    </div>
                    <div class="cdlist">
                        <div>
                            <a href="${path }manager/checkmanager">审核管理员</a></div>
                            <div>
                            <a href="${path }manager/cpproject">修改项目密码</a></div>
                            <div>
                            <a href="${path }manager/cpmanager">修改管理员密码</a></div>
                            <div>
                            <a href="${path }manager/cpteacher">修改教师密码</a></div>
                    	</div>
                </div>
            </div>
            