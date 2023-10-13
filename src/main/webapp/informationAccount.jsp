<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Account" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/14/2023
  Time: 12:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Information Account</title>

    <style>
        body{
            background-color: midnightblue;
            display: flex;
            justify-content: center;
            align-items: center;
        }


    </style>
</head>
<body>
            <%
                AccountRepository accountRepository = new AccountRepository();
                String email = request.getSession().getAttribute("email").toString();
                String password = request.getSession().getAttribute("password").toString();
                try {
                   Account acc = accountRepository.loginAccount(new Account(email, password));

            %>

                    <div style="width: 330px; height: 250px; background-color: white; text-align: center; padding-top: 100px">
                        <table style="margin-left: auto; margin-right: auto">
                            <tr>
                                <th>Account Id</th>
                                <td><%=acc.getId()%></td>
                            </tr>

                            <tr>
                                <th>Full name</th>
                                <td><%=acc.getFullName()%></td>
                            </tr>

                            <tr>
                                <th>Password</th>
                                <td><%=acc.getPassword()%></td>
                            </tr>


                            <tr>
                                <th>Email</th>
                                <td><%=acc.getEmail()%></td>
                            </tr>

                            <tr>
                                <th>Phone</th>
                                <td><%=acc.getPhone()%></td>
                            </tr>

                            <tr>
                                <th>Status</th>
                                <td><%=acc.getStatus()%></td>
                            </tr>

                            <%
                                } catch (SQLException | ClassNotFoundException e) {
                                    throw new RuntimeException(e);
                                }
                            %>
                        </table>


                    </div>
</body>
</html>
