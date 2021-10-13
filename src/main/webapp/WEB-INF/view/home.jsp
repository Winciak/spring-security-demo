<%--
  Created by IntelliJ IDEA.
  User: Pawel
  Date: 2021-07-09
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Home Page</title>
</head>
<body>
    <h2> Home Page </h2>
    <hr>

    <p>
    Welcome to home page.
    </p>

    <hr>

    <!-- display username and roles -->

    <p>
        User: <security:authentication property="principal.username"/>
        <br><br>
        Role(s): <security:authentication property="principal.authorities"/>
    </p>

    <hr>

    <!-- linki te sprawy -->

    <security:authorize access="hasRole('MANAGER')">
    <p>
        <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
        (Only for Managers peeps)
    </p>

    </security:authorize>

    <security:authorize access="hasRole('ADMIN')">

    <p>
        <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
        (Only for Admin peeps)
    </p>

    </security:authorize>

    <!-- logout button -->

    <form:form action="${pageContext.request.contextPath}/logout"
               method="post">

            <input type="submit" value="Logout"/>

    </form:form>


</body>
</html>
