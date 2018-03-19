<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel= "stylesheet" type="text/css" href="/css/newnav.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav>
       <div class="container" id="main" role="main">
       <c:if test="${adminsession != null}">
            <ul class="menu">
                <li class="active"><a href="/admin/adminHome" style="color: #C4302B">Admin Home</a></li>
                <c:if test="${adminsession.a_level == 'A'}">
                <li class="active"><a href="#">Admin</a>
                    <ul class="submenu">
                        <li><a href="/admin/adminList">Admin List</a></li>
                    </ul>
                </li>
                
                <li class="active"><a href="#">User</a>
                    <ul class="submenu">
                        <li><a href="/admin/auserList">User List</a></li>
                    </ul>
                </li>
                </c:if>
                
                <c:if test="${adminsession.a_level == 'B'}">  
                <li class="active"><a href="#">User</a>
                    <ul class="submenu">
                        <li><a href="admin/auserList">User List</a></li>
                    </ul>
                </li>
                </c:if>
                
                <li class="active"><a href="#">Product</a>
                    <ul class="submenu">
                        <li><a href="/admin/productList">Product List</a></li>
                        <li><a href="/admin/productAdd">Product Add</a></li>
                    </ul>
                </li>
            </ul>
           </c:if>
           
           
           <c:if test="${adminsession == null}">
            <ul class="menu">
                <li class="active"><a href="/admin/adminHome" style="color: #C4302B">Admin Home</a></li>
                
                <li class="active"><a href="#">PLEASE</a>
                    <ul class="submenu">
                        <li><a href="#">please</a></li>
                    </ul>
                </li>
                <li class="active"><a href="#">LOGIN</a>
                    <ul class="submenu">
                        <li><a href="#">login</a></li>
                    </ul>
                </li>
            </ul>
           </c:if>
        </div>
</nav>