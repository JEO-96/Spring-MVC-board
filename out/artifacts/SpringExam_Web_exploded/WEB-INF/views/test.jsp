<%--
  User: josh
  Date: 2023/02/09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
createPage.jsp
<br/>

<form action="student/create">
    이름 : <input type="text" name="name" value="${student.name}"><br>
    아이디 : <input type="text" name="id" value="${student.id}"><br>
    <input type="submit" value="전송">
</form>
</body>
</html>
