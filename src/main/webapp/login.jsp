<%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/13/2023
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LOGIN</title>
    <style>
        body{
            background-color: midnightblue;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .btnLogin{
            width: 80px;
            height: 30px;
            background-color: midnightblue;
            color: white;
            margin: 15px;
        }


    </style>
</head>
<body>
            <form action="ControllerServlet" method="post">
                <div style="width: 330px; height: 250px; background-color: white; text-align: center">
                    <h1 style="text-align: center">LOGIN</h1>

                    <input type="email" id="email" name="email" placeholder="Email" required style="padding: 10px; margin-bottom: 10px"> <br>

                    <input type="password" id="password" name="password" placeholder="Password" required style="padding: 10px"> <br>

                    <input type="submit" name="action" value="login" class="btnLogin">

                </div>
            </form>

</body>
</html>
