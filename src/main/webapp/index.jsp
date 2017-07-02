<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 03.06.2017
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <br/>
  <a href="/users" target="_blank">Users list</a>

  <br/>
  <br>
  <form method="get" action="/search" target="_self" id="searchForm"/>
  <br>
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
  </body>
</html>
