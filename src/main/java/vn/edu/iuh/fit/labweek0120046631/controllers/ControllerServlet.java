package vn.edu.iuh.fit.labweek0120046631.controllers;

import jakarta.ejb.Local;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.iuh.fit.labweek0120046631.models.Account;
import vn.edu.iuh.fit.labweek0120046631.models.GrantAccess;
import vn.edu.iuh.fit.labweek0120046631.models.Logs;
import vn.edu.iuh.fit.labweek0120046631.repositories.AccountRepository;
import vn.edu.iuh.fit.labweek0120046631.repositories.GrantAccessRepository;
import vn.edu.iuh.fit.labweek0120046631.repositories.LogRepository;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;

@WebServlet(urlPatterns = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        AccountRepository accountRepository = new AccountRepository();

        GrantAccessRepository grantAccessRepository = new GrantAccessRepository();

        LogRepository logRepository = new LogRepository();


        if(action.equals("login")){
            PrintWriter out = response.getWriter();

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            request.getSession().setAttribute("email", email);
            request.getSession().setAttribute("password", password);


            try {
                Account login = accountRepository.loginAccount(new Account(email, password));

                if(login == null){
                    out.println("Login fail");
                }
                else {
                    long sizeLog = logRepository.getAllLogs().size() + 1;
                    request.getSession().setAttribute("sizeLog", sizeLog);

                    LocalDateTime loginTime = LocalDateTime.now();
                    request.getSession().setAttribute("loginTime", loginTime);


                    GrantAccess grantAccess = grantAccessRepository.getGrantAccess(login.getId());
                    if(grantAccess.getId().equals("admin"))
                        response.sendRedirect("account.jsp");
                    else{
                        response.sendRedirect("informationAccount.jsp");
                    }
                }


            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }

        if(action.equals("changeRoleId")){
            String roleId = request.getParameter("roleId");

            request.getSession().setAttribute("roleId",roleId);

            RequestDispatcher rd = request.getRequestDispatcher("/grantAccess.jsp");
            rd.include(request,response);

        }

        if(action.equals("logOut")){
            try {
                Long id = Long.parseLong(request.getSession().getAttribute("sizeLog").toString());
                LocalDateTime loginTime = (LocalDateTime) request.getSession().getAttribute("loginTime");

                String email = request.getSession().getAttribute("email").toString();
                String password = request.getSession().getAttribute("password").toString();

                Account account = accountRepository.loginAccount(new Account(email, password));
                Logs logs = new Logs(id, account,loginTime, LocalDateTime.now(), "");

                logRepository.noteLog(logs);

                response.sendRedirect("login.jsp");

            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

        }

        if(action.equals("grantPermissions")) {

            try {
                String roleId = request.getParameter("roleId");

                Account account = new Account(request.getParameter("accId"));

                GrantAccess grantAccess = new GrantAccess(roleId, account, true, "");

                grantAccessRepository.insertGrantAccess(grantAccess);

                response.sendRedirect("account.jsp");

            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
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
                    response.sendRedirect("account.jsp");
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
