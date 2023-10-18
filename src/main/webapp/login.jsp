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
            <form action="ControllerServlet" method="post">

                <div class="frameLogin">

                    <h1>LOGIN</h1>

                    <input type="email" id="email" name="email" placeholder="Email" required> <br>

                    <input type="password" id="password" name="password" placeholder="Password" required> <br>

                    <button type="submit" name="action" value="login" class="btnLogin">LOGIN</button>

                </div>
            </form>

</body>
</html>
