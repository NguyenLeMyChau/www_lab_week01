<%--
  Created by IntelliJ IDEA.
  User: CHAU
  Date: 10/13/2023
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Insert Account</title>
    <style>
        body{
            background-color: #176D80;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .frameInsert{
            width: 590px;
            height: 462px;
            background-color: white;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .btnAdd{
            width: 400px;
            height: 50px;
            background-color: #176D80;
            color: white;
            margin: 15px;
            font-size: 30px;
            font-weight: 100;
            border: none;

        }

        h2{
            color: #176D80;
            font-size: 45px;
        }

        input[type=text] {
            width: 300px;
            height: 30px;
            margin-bottom: 10px;
            font-size: 20px;
            padding-left: 20px;
        }

        input[type=password] {
            width: 300px;
            height: 30px;
            font-size: 20px;
            padding-left: 20px;

        }

        input[type=email] {
            width: 300px;
            height: 30px;
            margin-bottom: 10px;
            font-size: 20px;
            padding-left: 20px;
        }

        input[type=tel] {
            width: 300px;
            height: 30px;
            margin-bottom: 10px;
            font-size: 20px;
            padding-left: 20px;
        }

        select{
            width: 300px;
            height: 30px;
        }


    </style>
</head>
<body>
<form action="ControllerServlet" method="get">

    <div class="frameInsert">
        <h2>Add Account</h2>
        <table>
            <tr>
                <td><label for="account_id">Account ID:</label> </td>
                <td><input type="text" id="account_id" name="account_id" required><br></td>
            </tr>

            <tr>

                <td><label for="full_name">Full Name:</label></td>
                <td><input type="text" id="full_name" name="full_name" required><br></td>
            </tr>
            <tr>
                <td><label for="password">Password:</label></td>
                <td><input type="password" id="password" name="password" required><br></td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td><input type="email" id="email" name="email" required><br></td>
            </tr>
            <tr>

                <td><label for="phone">Phone:</label></td>
                <td><input type="tel" id="phone" name="phone" required><br></td>
            </tr>

            <tr>
                <td><label for="status">Status:</label></td>
                <td> <select id="status" name="status">
                    <option value="0">deactive</option>
                    <option value="1">active</option>
                    <option value="-1">delete</option>
                </select><br></td>
            </tr>

        </table>
        <button type="submit" name="action" value="addAccount" class="btnAdd">ADD</button>
    </div>


</form>

</body>
</html>
