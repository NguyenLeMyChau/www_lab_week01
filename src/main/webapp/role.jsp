<%@ page import="vn.edu.iuh.fit.labweek0120046631.repositories.RoleRepository" %>
<%@ page import="vn.edu.iuh.fit.labweek0120046631.models.Role" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/19/2023
  Time: 10:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Role</title>

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
            RoleRepository roleRepository = new RoleRepository();
            List<Role> roleList = roleRepository.getAllRole();
        %>

        <form action="ControllerServlet" method="get">
            <div class="header">
                <label>Role</label>
            </div>

            <table>
                <tr>
                    <th>Role ID</th>
                    <th>Role Name</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>

                <%for (Role role : roleList) {

                %>
                <tr>
                    <td><%=role.getId()%></td>
                    <td><%=role.getName()%></td>
                    <td><%=role.getDescription()%></td>
                    <td><%=role.getStatus()%></td>
                </tr>

                <%}%>

            </table>
        </form>
</body>
</html>
