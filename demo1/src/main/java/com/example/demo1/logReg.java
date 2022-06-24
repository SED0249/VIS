package com.example.demo1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "logReg", urlPatterns = {"/logReg"})
public class logReg extends HttpServlet {
    Connection conn;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wishlist", "root", "admin");
            System.out.println("Úspěšné příhlášení do databáze.");
        } catch (Exception ex) {
            System.out.println("Nastala nějaká chyba." + ex.getMessage());
        }
    }

    @Override
    public void destroy() {
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Nastala nějaká chyba." + ex.getMessage());
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String direction = request.getParameter("direction");
        switch(direction) {
            case "logout":
                HttpSession session = request.getSession();
                if (!session.isNew()) {
                    session.invalidate();
                }
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String logReg = request.getParameter("logReg");
        switch(logReg) {
            case "login":
                login(request,response);
                break;
            case "register":
                register(request,response);
                break;
            default:
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response){
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");

        try {
            Statement st = conn.createStatement();

            ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='" + mail + "'");
            String encryptPassword=encerypt(password);
            if (rs.next() && rs.getString("password").equals(encryptPassword)) {
                try (PrintWriter out = response.getWriter()) {
                    HttpSession session= request.getSession(true);
                    session.setAttribute("ID",rs.getString("ID"));
                    session.setAttribute("name",rs.getString("firstName"));
                    response.sendRedirect("index.jsp");
                }catch (Exception e){
                    System.out.println("Nastala chyba:" + e.getLocalizedMessage());
                }
            } else {
                request.setAttribute("hlaseni", "Neplatné přihlašovací údaje.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch(Exception ex) {
            System.out.println("Nastala nějaká chyba." + ex.getLocalizedMessage());
        }

    }
    private void register(HttpServletRequest request, HttpServletResponse response){
    try{
        String mail = request.getParameter("mail");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password");
        String phoneNumber = request.getParameter("phoneNumber");

        regularExpressionsCheck(password,mail,phoneNumber, request,response);

        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery("SELECT * FROM users");

        while(rs1.next()) {
            String email=rs1.getString("email");
            if(email.equals(mail)){
                request.setAttribute("reg", "Toto uživatelské jméno již existuje.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
        if (mail.equals(password)) {
            request.setAttribute("reg", "Email nemůže být stejný jako heslo!");
        } else {
            String PW= encerypt(password);
            String SQL = "INSERT INTO users(email,firstName,lastName,password, phoneNumber) " +
                    "VALUES(?,?,?,?,?)";
            updateOrInsertUser(SQL, mail,firstName,lastName,PW,phoneNumber);
            request.setAttribute("reg", "Registrace byla úspěšná!");
        }

        request.getRequestDispatcher("register.jsp").forward(request, response);

    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ServletException e) {
        e.printStackTrace();
    } catch (IOException e) {
        e.printStackTrace();
    }
    }


    public void updateOrInsertUser(String SQL,String mail,String firstName,String lastName,String PW,String phoneNumber) throws SQLException {
        PreparedStatement ps = conn.prepareStatement(SQL);
        ps.setString(1,mail);
        ps.setString(2,firstName);
        ps.setString(3,lastName);
        ps.setString(4,PW);
        ps.setString(5,phoneNumber);
        System.out.println("affected rows: "+ ps.executeUpdate());
    }

    private String encerypt(String pw){
        String password = pw;
        String encryptedpassword = null;
        try
        {
            /* MessageDigest instance for MD5. */
            MessageDigest m = MessageDigest.getInstance("MD5");

            /* Add plain-text password bytes to digest using MD5 update() method. */
            m.update(password.getBytes());

            /* Convert the hash value into bytes */
            byte[] bytes = m.digest();

            /* The bytes array has bytes in decimal form. Converting it into hexadecimal format. */
            StringBuilder s = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                s.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }

            /* Complete hashed password in hexadecimal format */
            encryptedpassword = s.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        return encryptedpassword;
    }

    private void regularExpressionsCheck(String PW, String email, String phoneNumber, HttpServletRequest request, HttpServletResponse response){
        boolean password = Pattern.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$", PW);
        boolean mail = Pattern.matches("^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$",email);
        boolean number = Pattern.matches("^\\d{9}$", phoneNumber);

        try {
        if(password == false) {
            request.setAttribute("reg", "Uživatelské heslo musi obsahovat velke, male pismeno, cislo a specialni znak.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (mail == false){
            request.setAttribute("reg", "Zadejte email ve spravnem formatu.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
        else{}
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    }
















