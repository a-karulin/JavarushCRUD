<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 02.07.2017
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>

</head>
<body>
<a href="/users">Show all users</a>
<form method="get" action="/search" target="_self" id="searchForm"/>
<br>
<h3>Search form:</h3>
<table>
    <tr>
        <td>
            <input name="name" form="searchForm" placeholder="User name">
            <input name="page" form="searchForm" hidden value="0"/>
        </td>
    </tr>
    <tr>
        <td>
            <input type=submit form="searchForm" value="Search">
        </td>
    </tr>
</table>
<h2>Searching results:</h2>
<c:if test="${!empty resultPages.pageList}">
<table class="tg">
    <tr>
        <th class="tg-13pz">Id</th>
        <th class="tg-qsvf">Name</th>
        <th class="tg-qsvf">Age</th>
        <th class="tg-qsvf">Is Admin</th>
        <th class="tg-qsvf">Created date</th>
        <th class="tg-qsvf">Edit</th>
        <th class="tg-qsvf">Remove</th>
    </tr>
    <c:forEach items="${resultPages.pageList}" var = "user">
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
        <td>${user.admin}</td>
        <td>${user.createdDate}</td>
        <td><a href="<c:url value='/edit/${user.id}'/>">Edit</a> </td>
        <td><a href="<c:url value='/remove/${user.id}'/>">Remove</a></td>
        </tr>
    </c:forEach>
    <tr>
        <td style="border-style:hidden"><a <c:if test="${resultPages.firstPage}">hidden</c:if>  href="/search${prevPageRequest}">Prev</a></td>
        <td style="border-style:hidden"></td>
        <td style="border-style:hidden"></td>
        <td style="border-style:hidden"></td>
        <td style="border-style:hidden"></td>
        <td style="border-style:hidden"></td>
        <td style="border-style:hidden"><a <c:if test="${resultPages.lastPage}">hidden</c:if>  href="/search${nextPageRequest}">Next</a></td>
    </tr>
    </c:if>
    <c:if test="${empty resultPages.pageList}">
        No matches.
    </c:if>


</body>
</html>
