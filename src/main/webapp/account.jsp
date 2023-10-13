<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Account" %>
<%@ page import="java.util.List" %><%--
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
        <%
            AccountRepository accountRepository = new AccountRepository();
            List<Account> accounts = accountRepository.getAllAccount();
        %>

        <form action="ControllerServlet" method="get">
            <h2 style="text-align: center">Thao tác với Account</h2>

            <table width="60%" align="center" border="1">
                <tr>
                    <th>Account ID</th>
                    <th>Full name</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                </tr>
                <%for (Account account : accounts) {

                %>
                <tr>
                    <td><%=account.getId()%></td>
                    <td><%=account.getFullName()%></td>
                    <td><%=account.getPassword()%></td>
                    <td><%=account.getEmail()%></td>
                    <td><%=account.getPhone()%></td>
                    <td><%=account.getStatus()%></td>

                </tr>
                <%}%>
            </table>

            <div style="text-align: center">
                <a href="insertAccount.jsp">Insert</a>
                <a href="deleteAccount.jsp">Delete</a>
                <a href="updateAccount.jsp">Update</a>
            </div>

        </form>

</body>
</html>
