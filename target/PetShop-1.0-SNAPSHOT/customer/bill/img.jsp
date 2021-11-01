<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/14/2021
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib  prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAO.ImageDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<sql:setDataSource var="conn" scope="session"
                   url="jdbc:mysql://localhost/petshop"
                   user="root" password=""
                   driver="com.mysql.jdbc.Driver"/>
<sql:query var="image" dataSource="${conn}" sql=" select * from image where pID = 1"/>
<%-- Thuc hien show image theo id san pham--%>
<c:forEach var="img" items="${image.rows}" >
    <img src="../../data/${img.imageName}" height='100px' width='100px'/>
    <c:out value="${img.imageName}"></c:out>
</c:forEach>
</body>
</html>

