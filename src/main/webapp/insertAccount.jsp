<%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/13/2023
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="ControllerServlet" method="get">

    <h2 style="text-align: center">Add Account</h2>
    <table style="margin-left: auto; margin-right: auto">
        <tr>
            <td><label for="account_id">Account ID:</label> </td>
            <td><input type="text" id="account_id" name="account_id" required><br></td>
        </tr>

        <tr>

            <td><label for="full_name">Full Name:</label></td>
            <td><input type="text" id="full_name" name="full_name" required><br></td>
        </tr>
        <tr>
            <td><label for="password">Password:</label></td>
            <td><input type="password" id="password" name="password" required><br></td>
        </tr>
        <tr>
            <td><label for="email">Email:</label></td>
            <td><input type="email" id="email" name="email" required><br></td>
        </tr>
        <tr>

            <td><label for="phone">Phone:</label></td>
            <td><input type="tel" id="phone" name="phone" required><br></td>
        </tr>

        <tr>
            <td><label for="status">Status:</label></td>
            <td> <select id="status" name="status">
                <option value="0">deactive</option>
                <option value="1">active</option>
                <option value="-1">delete</option>
            </select><br></td>
        </tr>

    </table>

    <div style="margin: 10px;text-align: center; background-color: aqua">
        <input type="submit" name="action" value="addAccount">
    </div>

</form>

</body>
</html>
