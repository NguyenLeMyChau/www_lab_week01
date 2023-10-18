package vn.edu.iuh.fit.labweek0120046631.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.iuh.fit.labweek0120046631.models.Account;
import vn.edu.iuh.fit.labweek0120046631.models.GrantAccess;
import vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository;
import vn.edu.iuh.fit.labweek0120046631.repositories.GrantAccessRepository;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        AccountRepository accountRepository = new AccountRepository();

        GrantAccessRepository grantAccessRepository = new GrantAccessRepository();

        if(action.equals("login")){
            PrintWriter out = response.getWriter();

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("password", password);

            Account account = new Account(email, password);

            try {
                Account login = accountRepository.loginAccount(account);

                if(login == null){
                    out.println("Login fail");
                }
                else {
                    GrantAccess grantAccess = grantAccessRepository.getGrantAccess(login.getId());
                    if(grantAccess.getId().equals("admin"))
                        response.sendRedirect("account.jsp");
                    else{
                        response.sendRedirect("informationAccount.jsp");
                    }                }


            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }

        if(action.equals("changeRoleId")){
            String roleId = request.getParameter("roleId");

            request.getSession().setAttribute("roleId",roleId);
            System.out.println("roleId: " + roleId);

            RequestDispatcher rd = request.getRequestDispatcher("/grantAccess.jsp");
            rd.include(request,response);


//            try {
//                List<GrantAccess> grantAccesses = grantAccessRepository.getAccountFromRoleId(roleId);
//
//            } catch (SQLException | ClassNotFoundException e) {
//                throw new RuntimeException(e);
//            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AccountRepository accountRepository = new AccountRepository();


        if(action.equals("addAccount")){
            PrintWriter out = response.getWriter();

            String accountId = request.getParameter("account_id");
            String fullName = request.getParameter("full_name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int status = Integer.parseInt(request.getParameter("status"));

            Account account = new Account(accountId, fullName, password, email, phone, status);
            try {

                boolean addAccount = accountRepository.addAccount(account);

                if(addAccount){
                    out.println("ID: " + account.getId());
                    out.println("Fullname: " + account.getFullName());
                    out.println("Password: " + account.getPassword());
                    out.println("Email: " + account.getEmail());
                    out.println("Phone: " + account.getPhone());
                    out.println("Status: " + account.getStatus());
                    response.sendRedirect("products.jsp");
                }else{
                    out.println("Add account fail !");
                }
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }

        if(action.equals("deleteAccount")){
            PrintWriter out = response.getWriter();

            String accountId = request.getParameter("account_id");

            try {
                boolean deleteAccount = accountRepository.deleteAccount(accountId);
                if(deleteAccount)
                    out.println("Delete success");
                else
                    out.println("Delete fail");
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }


        }

        if(action.equals("updateAccount")){
            PrintWriter out = response.getWriter();

            String accountId = request.getParameter("account_id");
            String fullName = request.getParameter("full_name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int status = Integer.parseInt(request.getParameter("status"));

            Account account = new Account(accountId, fullName, password, email, phone, status);
            try {

                boolean updateAccount = accountRepository.update(account);

                if(updateAccount){
                    out.println("ID: " + account.getId());
                    out.println("Fullname: " + account.getFullName());
                    out.println("Password: " + account.getPassword());
                    out.println("Email: " + account.getEmail());
                    out.println("Phone: " + account.getPhone());
                    out.println("Status: " + account.getStatus());
                }else{
                    out.println("Update account fail !");
                }
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }



    }

}
