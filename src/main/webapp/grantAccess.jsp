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

    <style>
        .header{
            width: 100%;
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
            margin-top: 20px;
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

        div{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        select{
            width: 120px;
            height: 40px;
            margin-right: 20px;
            border: 1px solid #176D80;
            color: #176D80;
            font-weight: bold;
            font-size: 20px;
            text-align: center;
        }

        button{
            width: 120px;
            height: 40px;
            background-color: #176D80;
            color: white;
            border: none;
        }


    </style>
</head>
<body>
<%
    AccountRepository accountRepository = new AccountRepository();
%>

<form action="ControllerServlet" method="post">

    <div class="header">
        <label>Grant Access</label>
    </div>

    <div style="margin-top: -20px">
        <select name="roleId" id="roleId">
            <option value="admin">admin</option>
            <option value="user">user</option>
        </select>
        <button type="submit" name="action" value="changeRoleId">Change</button>
    </div>


    <table>
        <tr>
            <th>Account ID</th>
            <th>Full name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Status</th>

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
