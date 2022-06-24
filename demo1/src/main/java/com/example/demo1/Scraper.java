package com.example.demo1;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlImage;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import java.io.*;
import java.net.MalformedURLException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.time.LocalDate;

import static java.lang.System.out;


@WebServlet(name = "Scraper", value = "/hello-servlet")
public class Scraper extends HttpServlet {
    Connection conn;
    Date date = Date.valueOf(LocalDate.now());
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
            System.out.println("Úspěšné odhlášeno z databáze.");
        } catch (SQLException ex) {
            System.out.println("Nastala nějaká chyba." + ex.getMessage());
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ArrayList items = new ArrayList<Items>();

        String[] urls = request.getParameterValues("url");
        HttpSession session = request.getSession();

        try {
            for (String url : urls) {
                Statement st1 = conn.createStatement();
                ResultSet rs1 = st1.executeQuery("SELECT * FROM items WHERE url='" + url + "'");

                if (rs1.next() && rs1.getString("url").equals(url)) {
                    saveItems(items, request, response, rs1, url);
                } else {
                    try {
                        ScrapeAndSaveItems(url, items, response, request, rs1, "INSERT");
                    }catch (Exception e){
                        request.setAttribute("info", "Nespravny odkaz, nebo Alza vyžaduje recaptcha. Bohužel nebylo možne provest web scrape.");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }
                if (session.getAttribute("ID")!=null) {
                    addTo_user_items(request, st1, url, session);
                }
            }
            request.setAttribute("items", items);
            request.getRequestDispatcher("result.jsp").forward(request, response);

        } catch (SQLException e) {
            System.out.println("main post error one");
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("info", "Alza vyžaduje recaptcha. Bohužel nebylo možne provest web scrape.");
            try {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException ex) {
                throw new RuntimeException(ex);
            }
        }
    }


    public void saveItems(ArrayList items, HttpServletRequest request, HttpServletResponse response, ResultSet rs, String url) {
        try {
            if (rs.getDate("time").equals(date)) {
                Items item = new Items(rs.getString("image"), rs.getString("price"), rs.getString("name"), rs.getString("url"), date);
                items.add(item);
            } else {
                ScrapeAndSaveItems(url, items, response, request, rs, "UPDATE");
            }
        } catch (SQLException e) {
            System.out.println("saveItems error");
            e.printStackTrace();
        }
        return;
    }


    public void ScrapeAndSaveItems(String url, ArrayList items, HttpServletResponse response, HttpServletRequest request, ResultSet rs, String insertUpdate) {
        HtmlImage image = ((HtmlImage)scrape(url).getFirstByXPath("//img[contains(@id,'imgMain')]"));
        HtmlElement price = ((HtmlElement) scrape(url).getFirstByXPath("//span[contains(@class, 'price_withVat')]"));
        HtmlElement name = ((HtmlElement) scrape(url).getFirstByXPath("//h1[contains(@itemprop, 'name')]"));
        System.out.println(image);
        System.out.println(price);
        System.out.println(name);
        System.out.println(url);

        if (scrape(url) != null) {

            try {
                Statement st = conn.createStatement();

                insertOrUpdate(url, (HtmlImage) image, price, name, st, items, rs, insertUpdate);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (scrape(url) == null) {
            out.println("<p>Informace nebyly nalezeny</p>");
        } else {
            out.println("<p>Nastal neznámý error</p>");
        }
        return;
    }

    public void insertOrUpdate(String url, HtmlImage image, HtmlElement price, HtmlElement name, Statement st, ArrayList items, ResultSet rs, String insertUpdate) {
        try {
            String image1 = image.getSrc();
            String price1 = price.asNormalizedText();
            String name1 = name.asNormalizedText();
            String url1 = url;

            if (insertUpdate.equals("INSERT")) {
                String SQL = "INSERT INTO items(url,price,name,image, time)" +
                        "VALUES(?,?,?,?,?)";
                updateOrInsertItem(SQL,image1,price1,name1,url1);

            } else if (insertUpdate.equals("UPDATE")) {
                int id = rs.getInt("ID");
                String SQL = "UPDATE items SET url = ?, price = ?,name = ?,image = ?,time = ? WHERE id=" + id + ";";
                updateOrInsertItem(SQL,image1,price1,name1,url1);

            } else {
                throw new SQLException("Error while Inserting/Updating");
            }
            Items item = new Items(image1, price1, name1, url1, date);
            items.add(item);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return;
    }

    public void addTo_user_items(HttpServletRequest request, Statement st, String url, HttpSession session) {
        try {
            String id = (String) session.getAttribute("ID");

            ResultSet rs1 = st.executeQuery("SELECT * FROM items WHERE url='" + url + "'");
            rs1.next();
            int id_item = rs1.getInt("ID");
            int id_user = Integer.parseInt(id);
            ResultSet rs2 = st.executeQuery("SELECT * FROM user_items WHERE ID_users='" + id_user + "' AND ID_items = '"+id_item+"'");
            while (!rs2.next()) {
                String SQL = "INSERT INTO user_items(ID_items,ID_users)" +
                        "VALUES(?,?)";
                PreparedStatement ps = conn.prepareStatement(SQL);
                ps.setInt(1,id_item);
                ps.setInt(2,id_user);
                System.out.println("affected rows: "+ ps.executeUpdate());

            }
        } catch (SQLException e) {
            System.out.println("Chyba: "+e);
        }
    }

    public static HtmlPage scrape(String url){
        WebClient client = new WebClient();
        client.getOptions().setJavaScriptEnabled(false);
        client.getOptions().setCssEnabled(false);
        client.getOptions().setUseInsecureSSL(true);

        try {
            HtmlPage page = client.getPage(url);
            System.out.println(page);
            return page;
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

    }

    public void updateOrInsertItem(String SQL,String image1,String price1,String name1,String url1) throws SQLException {
        PreparedStatement ps = conn.prepareStatement(SQL);
        ps.setString(1,url1);
        ps.setString(2,price1);
        ps.setString(3,name1);
        ps.setString(4,image1);
        ps.setDate(5,date);
        System.out.println("affected rows: "+ ps.executeUpdate());
    }














}


