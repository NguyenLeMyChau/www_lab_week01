<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.GrantAccessRepository" %><%--
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

        select{
            width: 100px;
            height: 30px;
            margin-right: 20px;
            border: 1px solid #176D80;
            color: #176D80;
            font-size: 20px;
            text-align: center;
        }

        button{
            width: 100px;
            height: 30px;
            background-color: #176D80;
            color: white;
            border: none;
        }

        input[type=text]{
            border: none;
            background: transparent;
            text-align: center;
            outline-width: 0;
        }


    </style>
</head>
<body>

        <%
            AccountRepository accountRepository = new AccountRepository();
            GrantAccessRepository grantAccessRepository = new GrantAccessRepository();
            List<Account> accounts = accountRepository.getAllAccount();
            List<String> listAccId = grantAccessRepository.getListAccountID();
        %>

        <form action="ControllerServlet" method="post">
            <div class="header">
                <label>Account</label>
            </div>

            <table>
                <tr>
                    <th>Account ID</th>
                    <th>Full name</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Grant Permissions</th>
                    <th colspan="2" style="background-color: #124a4b;"><a href="insertAccount.jsp" style="color: white; background-color: #124a4b; width: 30px; height: 30px">Insert</a></th>
                </tr>
                <%for (Account account : accounts) {
                    String id = account.getId();
                %>
                <tr>
                    <td><input type="text" name="accId" value="<%=id%>" readonly></td>
                    <td><%=account.getFullName()%></td>
                    <td><%=account.getPassword()%></td>
                    <td><%=account.getEmail()%></td>
                    <td><%=account.getPhone()%></td>
                    <td><%=account.getStatus()%></td>

                    <%
                        if(listAccId.contains(account.getId())){ //kiểm tra account.getId có tồn tại trong listAccId không
                    %>
                    <td>Đã cấp quyền</td>
                    <%}
                        else{%>
                    <td>
                        <select name="roleId" id="roleId">
                            <option value="admin">admin</option>
                            <option value="user">user</option>
                        </select>
                        <button type="submit" name="action" value="grantPermissions">Confirm</button>
                    </td>
                    <%}%>

                    <td><a href="deleteAccount.jsp">Delete</a></td>
                    <td><a href="updateAccount.jsp">Update</a></td>

                </tr>

                <%}%>
            </table>


        </form>

</body>
</html>
