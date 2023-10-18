<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.GrantAccess" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.GrantAccessRepository" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Account" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/18/2023
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hiển thị các Account của một Role</title>
</head>
<body>
<%
    AccountRepository accountRepository = new AccountRepository();
%>

<form action="ControllerServlet" method="post">
    <table style="width: 50%; text-align: center;">
        <tr>
            <th>Account ID</th>
            <th>Full name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Status</th>


            <th><select name="roleId" id="roleId">
                                <option value="admin">admin</option>
                                <option value="user">user</option>
                            </select>
                                <input type="submit" name="action" value="changeRoleId" >
        </tr>
        <%
            try {
                String id = null;

                if(request.getSession().getAttribute("roleId") == null){
                    id = "user";
                }
                else{
                    id = request.getSession().getAttribute("roleId").toString();
                }
                System.out.println("Id: " + id);
                for (Account account: accountRepository.getAccountFromRoleId(id)) {

        %>
        <tr>
            <td><%=account.getId()%></td>
            <td><%=account.getFullName()%></td>
            <td><%=account.getEmail()%></td>
            <td><%=account.getPhone()%></td>
            <td><%=account.getStatus()%></td>
        </tr>
        <%}

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        %>
    </table>


</form>

</body>
</html>
