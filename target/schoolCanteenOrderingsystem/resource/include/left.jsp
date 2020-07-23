<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- 左分栏导航 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${root}/resource/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>admin</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li class="treeview"><a href="/backstage/index"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->
            <li class="treeview">
                <a href="/backstage/user">
                    <i class="fa fa-folder"></i> <span>用户信息管理</span>
                </a>
            </li>

            <li class="treeview">
                <a href="/backstage/menu">
                    <i class="fa fa-edit"></i> <span>菜单管理页面</span>
                </a>
            </li>

            <li class="treeview">
                <a href="/backstage/order">
                    <i class="fa fa-reorder"></i> <span>订单管理页面</span>
                </a>
            </li>

            <li class="treeview">
                <a href="/backstage/amount">
                    <i class="fa fa-reorder"></i> <span>金额页面</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 左分栏导航 /-->
