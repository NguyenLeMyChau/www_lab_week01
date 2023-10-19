<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Account" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.GrantAccessRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.GrantAccess" %><%--
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
        .informationAccount{
            width: 279px;
            height: 694px;
            background-color: #176D80;
            padding-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .avatar{
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            width: 100%;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            color: white;
        }

        .information{
            width: 279px;
            height: 400px;
            text-align: left;
            font-size: 20px;
            display: flex;
            flex-direction: column;
            color: white;
        }

        .btnLogOut{
            width: 171px;
            height: 53px;
            background-color: white;
            color: #176D80;
            font-size: 30px;
            border: none;
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

                    GrantAccessRepository grantAccessRepository = new GrantAccessRepository();
                    GrantAccess grantAccess = grantAccessRepository.getGrantAccess(acc.getId());

            %>

            <form action="ControllerServlet" method="post">

            <div class="informationAccount">
                <div class="avatar">
                    <img src="iconPerson.png">
                    <label style="margin-top: 10px"><%=acc.getFullName()%></label>
                </div>

                <div class="information">
                    <label style="margin-left: 20px; margin-top: 30px">Account ID: <%=acc.getId()%></label>
                    <label style="margin-left: 20px; margin-top: 20px">Role: <%=grantAccess.getId()%></label>
                    <label style="margin-left: 20px; margin-top: 20px">Email: <%=acc.getEmail()%></label>
                    <label style="margin-left: 20px; margin-top: 20px">Phone: <%=acc.getPhone()%></label>
                    <label style="margin-left: 20px; margin-top: 20px">Status: <%=acc.getStatus()%></label>
                </div>

                <button type="submit" name="action" value="logOut" class="btnLogOut">LOG OUT</button>

            </div>
            </form>


            <%
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
            %>


</body>
</html>
