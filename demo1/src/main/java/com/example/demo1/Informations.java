package com.example.demo1;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "Informations", value = "/Informations")
public class Informations extends HttpServlet {
    Connection conn;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wishlist", "root", "admin");
            out.println("Úspěšné příhlášení do databáze.");
        } catch (Exception ex) {
            out.println("Nastala nějaká chyba." + ex.getMessage());
        }
    }

    @Override
    public void destroy() {
        try {
            conn.close();
            out.println("Úspěšné odhlášeno z databáze.");
        } catch (SQLException ex) {
            out.println("Nastala nějaká chyba." + ex.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String info = request.getParameter("info");
        ;
        switch (info) {
            case "getHistory":
                getHistory(request, response);
                break;
            case "getInfo":
                getInfo(request, response);
                break;
            default:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    private void getHistory(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("ID");
        List<Items> itemsList = new ArrayList<>();
        List<Integer> numberRS = new ArrayList<>();
        if (id != null) {
            try {
                int idUser = Integer.parseInt(id);
                Statement st = null;
                st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM user_items WHERE ID_users='" + idUser + "'");
                while (rs.next()) {
                    numberRS.add(rs.getInt("ID_items"));
                }
                for (int i = 0; i <= numberRS.size() - 1; i++) {
                    int id_item = numberRS.get(i);
                    ResultSet rs1 = st.executeQuery("SELECT * FROM items WHERE ID='" + id_item + "'");
                    rs1.next();
                    String name = rs1.getString("name");
                    String price = rs1.getString("price");
                    String image = rs1.getString("image");
                    Items item = new Items(image, price, name);
                    itemsList.add(item);
                }


                request.setAttribute("items", itemsList);
                request.getRequestDispatcher("searchHistory.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void getInfo(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("ID");
            int idUser = Integer.parseInt(id);
            Statement st = null;
            st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users WHERE ID='" + idUser + "'");
            rs.next();
            String name = rs.getString("firstName");
            String lastName = rs.getString("lastName");
            String phoneNumber = rs.getString("phoneNumber");
            String email = rs.getString("email");
            Users user = new Users(email, name, lastName, phoneNumber);

            request.setAttribute("user", user);
            request.getRequestDispatcher("info.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
