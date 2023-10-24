<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Account" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/13/2023
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin screen</title>
    <style>
        .nav{
            display: flex;
            width: 1440px;
            height: 117px;
            background-color: #176D80;
            align-items: center;
            padding-left: 30px;
        }

        a{
            color: white;
            font-size: 25px;
            text-decoration: none;
            margin: 20px;
        }

        .content{
            display: flex;
            width: 1340px;
            height: 553px;
            align-items: center;
            justify-content: center;
        }

        label{
            font-size: 50px;
        }


        .btnLogOut{
            width: 80px;
            height: 30px;
            margin-top: 18px;
            background-color: white;
            color: #176D80;
            font-size: 15px;
            border: none;
            margin-left: 40px;
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
<form action="ControllerServlet" method="post">

    <div class="nav">
        <a href="account.jsp">Account</a>
        <a href="role.jsp">Role</a>
        <a href="grantAccess.jsp">Grant Access</a>
        <a href="logs.jsp">Log</a>

        <div style="margin-left: 600px; display: flex; flex-direction: row">
            <h3 style="color: white">Hi, <%=acc.getFullName()%></h3>

            <button type="submit" name="action" value="logOut" class="btnLogOut">LOG OUT</button>
        </div>



    </div>

    <div class="content">
        <label>WWW - Week01 <br>
            Nguyễn Lê Mỹ Châu - 20046631</label>
    </div>
</form>

<%
    } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
    }
%>
</body>

</html>