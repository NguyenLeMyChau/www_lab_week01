<%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/13/2023
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <form action="ControllerServlet" method="get">
            <div style="text-align: center">
                <h2>Delete Account</h2>
                    <label for="account_id" >Account ID:</label>
                    <input type="text" id="account_id" name="account_id" required><br>
                    <input type="submit" name="action" value="deleteAccount" style="margin: 10px">
            </div>


        </form>
</body>
</html>
