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
    <title>Account</title>
    <style>
        .header{
            display: flex;
            align-items: center;
            justify-content: center;
            width: 1456px;
            height: 117px;
            background-color: #176D80;
            color: white;
            font-size: 40px;
            margin-bottom: 50px;
        }

        table{
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }

        th {
            background-color: #176D80;
            color: white;
            padding: 15px;
        }

        td{
            padding: 10px;
        }


        tr:nth-child(even){
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: coral;
        }

        a{
            font-size: 25px;
            text-decoration: none;
        }


    </style>
</head>
<body>
        <%
            AccountRepository accountRepository = new AccountRepository();
            List<Account> accounts = accountRepository.getAllAccount();
        %>

        <form action="ControllerServlet" method="get">
            <div class="header">
                <label>Thao tác với Account</label>
            </div>

            <table>
                <tr>
                    <th>Account ID</th>
                    <th>Full name</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th colspan="2" style="background-color: #124a4b;"><a href="insertAccount.jsp" style="color: white; background-color: #124a4b; width: 30px; height: 30px">Insert</a></th>
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
                    <td><a href="deleteAccount.jsp">Delete</a></td>
                    <td><a href="updateAccount.jsp">Update</a></td>

                </tr>
                <%}%>
            </table>


        </form>

</body>
</html>
