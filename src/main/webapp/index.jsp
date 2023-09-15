<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
    <form action="ControllerServlet" method="get">
    <h1>Thao tác với Account</h1>
        <%-- Get All Account--%>
<%--        <h2>Get All Account</h2>--%>
    <%--        <input type="hidden" name="action" value="getAllAccount">--%>
        <%--        <button type="submit">Hiển thị danh sách account</button>--%>

        <%-- Add Account--%>
<%--        <h2>Add Account</h2>--%>
    <%--        <table>--%>
<%--            <tr>--%>
<%--                <td><label for="account_id">Account ID:</label> </td>--%>
<%--                <td><input type="text" id="account_id" name="account_id" required><br></td>--%>
<%--            </tr>--%>

<%--            <tr>--%>

<%--            <td><label for="full_name">Full Name:</label></td>--%>
<%--                <td><input type="text" id="full_name" name="full_name" required><br></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="password">Password:</label></td>--%>
<%--                <td><input type="password" id="password" name="password" required><br></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="email">Email:</label></td>--%>
<%--                <td><input type="email" id="email" name="email" required><br></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>

<%--                <td><label for="phone">Phone:</label></td>--%>
<%--                <td><input type="tel" id="phone" name="phone" required><br></td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--            <td><label for="status">Status:</label></td>--%>
<%--                <td> <select id="status" name="status">--%>
<%--                        <option value="0">deactive</option>--%>
<%--                        <option value="1">active</option>--%>
<%--                        <option value="-1">delete</option>--%>
<%--                         </select><br></td>--%>
<%--            </tr>--%>

<%--        </table>--%>
<%--            <input type="hidden" name="action" value="addAccount">--%>
<%--            <button type="submit">Thêm</button>--%>

        <%-- Delete Account--%>
<%--        <h2>Delete Account</h2>--%>
<%--        <label for="account_id">Account ID:</label>--%>
<%--        <td><input type="text" id="account_id" name="account_id" required><br></td>--%>
<%--        <input type="hidden" name="action" value="deleteAccount">--%>
<%--        <button type="submit">Xoá Account</button>--%>

        <h2>Update Account</h2>
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
                    <input type="hidden" name="action" value="updateAccount">
                    <button type="submit">Cập nhật</button>


    </form>
</body>
</html>