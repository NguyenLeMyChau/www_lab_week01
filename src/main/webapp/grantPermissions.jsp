<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.RoleRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Role" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Account" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/24/2023
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>GrantPermissions</title>
    <style>
        body{
            background-color: #176D80;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .frameLogin{
            width: 590px;
            height: 462px;
            background-color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top:150px
        }

        .btnLogin{
            width: 248px;
            height: 69px;
            background-color: #176D80;
            color: white;
            margin: 15px;
            font-size: 30px;
            font-weight: 100;
            border: none;

        }

        h1{
            color: #176D80;
            font-size: 45px;
        }

        input[type=email] {
            width: 501px;
            height: 76px;
            margin-bottom: 10px;
            font-size: 30px;
            padding-left: 30px;
        }

        input[type=password] {
            width: 501px;
            height: 76px;
            font-size: 30px;
            padding-left: 30px;

        }


    </style>
</head>
<body>
<%
    RoleRepository roleRepository = new RoleRepository();
        List<Role> roleList = roleRepository.getAllRole();

    AccountRepository accountRepository = new AccountRepository();
        List<Account> accountList = accountRepository.getAllAccount();

%>
<form action="ControllerServlet" method="post">

    <div class="frameLogin">

        <h1>LOGIN</h1>

        <%
            for(Role role: roleList){

        %>
        <datalist>
            <option value=""><%=role.getId()%></option>
        </datalist>

        <%}%>

        <%
            for(Account account: accountList){

        %>
        <select>
            <option value="<%=account.getId()%>"><%=account.getId()%></option>
        </select>

        <%}%>


        <button type="submit" name="action" value="login" class="btnLogin">Cấp quyền</button>

    </div>
</form>

</body>
</html>
