<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.LogRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Logs" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/19/2023
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logs</title>

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
            LogRepository logRepository = new LogRepository();
            List<Logs> logsList = logRepository.getAllLogs();
        %>

        <form action="ControllerServlet" method="get">
            <div class="header">
                <label>Logs</label>
            </div>

            <table>
                <tr>
                    <th>Log ID</th>
                    <th>Account ID</th>
                    <th>Login Time</th>
                    <th>Logout Time</th>
                    <th>Note</th>
                </tr>

                <%for (Logs logs : logsList) {

                %>
                <tr>
                    <td><%=logs.getId()%></td>
                    <td><%=logs.getAccount().getId()%></td>
                    <td><%=logs.getLoginTime()%></td>
                    <td><%=logs.getLogoutTime()%></td>
                    <td><%=logs.getNotes()%></td>
                </tr>


                <%}%>

            </table>
        </form>


</body>
</html>
