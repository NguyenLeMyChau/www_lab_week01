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
            width: 300px;
            height: 50px;
            background-color: #176D80;
            color: white;
            border: none;
            border-radius: 20px;
            margin: 10px;
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



        <div class="header">
                <label>Account</label>
            </div>

            <div style="width: 100%; height: 100px;display: flex; justify-content: center; align-items: center">
                <button><a href="insertAccount.jsp" style="color: white; width: 30px; height: 30px">Insert</a></button>
            </div>

            <table>
                <tr>
                    <th>Account ID</th>
                    <th>Full name</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
                <%for (Account account : accounts) {
                    String id = account.getId();
                    String delete_string = "ControllerServlet?action=deleteAccount&account_id=" + id;
                %>
                <tr>
                    <td><input type="text" name="accId" value="<%=id%>" readonly></td>
                    <td><%=account.getFullName()%></td>
                    <td><%=account.getPassword()%></td>
                    <td><%=account.getEmail()%></td>
                    <td><%=account.getPhone()%></td>
                    <td><%=account.getStatus()%></td>

                    <td>
                       <a href=<%=delete_string%>>Delete</a>
                    </td>
                    <td><a href="updateAccount.jsp?account_id=<%=id%>
                        <%request.getSession().setAttribute("acc_id", id);%>">Update</a></td>

                </tr>


                <%}%>
            </table>

</body>
</html>
