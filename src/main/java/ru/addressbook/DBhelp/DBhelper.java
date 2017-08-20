package main.java.ru.addressbook.DBhelp;

import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.bean.UserRole;
import main.java.ru.addressbook.mapper.UserMapper;
import main.java.ru.addressbook.service.AddressBookService;
import main.java.ru.addressbook.service.AddressBookServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import java.sql.*;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * Created by Tim on 10.08.2017.
 */
public class DBhelper {

    static Connection con;

    static String url = "jdbc:postgresql://localhost:5432/AddressBook";
    static String driverClassManager = "org.postgresql.Driver";
    static String username = "jdbc.username";
    static String password = "jdbc.password";

    public static void createTableClients(){
        Statement stmt0 = null;
        try {

            Properties props = new Properties();
            props.setProperty("user",username);
            props.setProperty("password",password);
            con = DriverManager.getConnection(url, props);
            System.out.println("DB succesfully opened ");

            stmt0 = con.createStatement();
            String sql0 = "DROP TABLE IF EXISTS users CASCADE ";
            stmt0.executeUpdate(sql0);
            stmt0.close();

            Statement stmt00 = con.createStatement();
            String sql00 = "DROP TABLE IF EXISTS user_roles CASCADE ";
            stmt00.executeUpdate(sql00);
            stmt00.close();

            Statement stmt1 = con.createStatement();
            String sql1 = "CREATE TABLE IF NOT EXISTS users  " +
                    "(ID SERIAL PRIMARY KEY, " +
                    " name           TEXT    NOT NULL UNIQUE , " +
                    " password       TEXT    NOT NULL,  " +
                    " email          TEXT,  " +
                    " address         TEXT    ,  " +
                    " phone          TEXT    ," +
                    " enabled  SMALLINT NOT NULL DEFAULT '1')";

            stmt1.executeUpdate(sql1);
            stmt1.close();


            Statement stmt2 = con.createStatement();
            String sql2 = "CREATE TABLE IF NOT EXISTS user_roles  " +
                    "(ID SERIAL PRIMARY KEY , " +
                    " name       TEXT    NOT NULL, " +
                    " role       TEXT    NOT NULL , " +
                    "  FOREIGN KEY (name) REFERENCES users (name))";

            stmt2.executeUpdate(sql2);
            stmt2.close();

            String sql3 = "INSERT INTO users (NAME, password, email, address, phone, enabled) " +
                    "        VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement stm3 = con.prepareStatement(sql3);

            stm3.setString(1,"Timur");
            stm3.setString(2,"1234timk");
            stm3.setString(3,"timk90@mail.ru");
            stm3.setString(4, "Kazan, Russia");
            stm3.setString(5, "9503181629");
            stm3.setInt(6, 1);
            stm3.executeUpdate();
            stm3.close();

            String sql22 = "INSERT INTO user_roles (NAME, ROLE) " +
                    "        VALUES (?, ?);";
            PreparedStatement stm22 = con.prepareStatement(sql22);

            stm22.setString(1,"Timur");
            stm22.setString(2,"ROLE_ADMIN");

            stm22.executeUpdate();
            stm22.close();

            String sql23 = "INSERT INTO user_roles (NAME, ROLE) " +
                    "        VALUES (?, ?);";
            PreparedStatement stm23 = con.prepareStatement(sql23);
            stm23.setString(1,"Timur");
            stm23.setString(2,"ROLE_USER");

            stm23.executeUpdate();
            stm23.close();


            String sql4 = "INSERT INTO users (NAME, password, email, address, phone, enabled) " +
                    "        VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement stm4 = con.prepareStatement(sql4);

            stm4.setString(1,"Andrew");
            stm4.setString(2,"1234andrew");
            stm4.setString(3,"Andrew85@mail.ru");
            stm4.setString(4, "Moscow, Russia");
            stm4.setString(5, "9532321162");
            stm4.setInt(6, 1);
            stm4.executeUpdate();
            stm4.close();


            String sql44 = "INSERT INTO user_roles (NAME, ROLE)\n" +
                    "        VALUES (?, ?);";
            PreparedStatement stm44 = con.prepareStatement(sql44);

            stm44.setString(1,"Andrew");
            stm44.setString(2,"ROLE_USER");
            stm44.executeUpdate();
            stm44.close();

            String sql5 = "INSERT INTO users (NAME, password, email, address, phone)\n" +
                    "        VALUES (?, ?, ?, ?, ?);";
            PreparedStatement stm5 = con.prepareStatement(sql5);

            stm5.setString(1,"Papuas");
            stm5.setString(2,"3211234papuas");
            stm5.setString(3,"Papuas5@mail.ru");
            stm5.setString(4, "Rostov, Russia");
            stm5.setString(5, "3532321162");
            stm5.executeUpdate();
            stm5.close();

        }catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void security(String name){

        Properties props = new Properties();
        props.setProperty("user",username);
        props.setProperty("password",password);
        try {
            con = DriverManager.getConnection(url, props);
            String sql6 = "select name, password, enabled from users where name = '"+name+"'";
            Statement stm6 = con.createStatement();
            ResultSet resultSet = stm6.executeQuery(sql6);

            if(resultSet.next()){
                System.out.print("name: "+resultSet.getString(1)+", ");
                System.out.print("password: "+resultSet.getString(2)+", ");
                System.out.print("enabled: "+resultSet.getInt(3)+"; ");
                System.out.println();
            }
            resultSet.close();
            stm6.close();

            String sql7 = "select name, role from user_roles where name = '"+name+"'";
            Statement stm7 = con.createStatement();
            ResultSet resultSet1 = stm7.executeQuery(sql7);

            if(resultSet1.next()){
                System.out.print("name: "+resultSet1.getString(1)+", ");
                System.out.print("role: "+resultSet1.getString(2)+"; ");
                System.out.println();
            }
            resultSet1.close();
            stm6.close();

            String sql22 = "INSERT INTO user_roles (NAME, ROLE) " +
                    "        VALUES (?, ?);";
            PreparedStatement stm22 = con.prepareStatement(sql22);

            stm22.setString(1,"Tim");
            stm22.setString(2,"ROLE_ADMIN");

            stm22.executeUpdate();
            stm22.close();

            String sql23 = "INSERT INTO user_roles (NAME, ROLE) " +
                    "        VALUES (?, ?);";
            PreparedStatement stm23 = con.prepareStatement(sql23);
            stm23.setString(1,"Tim");
            stm23.setString(2,"ROLE_USER");

            stm23.executeUpdate();
            stm23.close();

            String sql24 = "INSERT INTO user_roles (NAME, ROLE) " +
                    "        VALUES (?, ?);";
            PreparedStatement stm24 = con.prepareStatement(sql24);
            stm24.setString(1,"Popa");
            stm24.setString(2,"ROLE_USER");

            stm24.executeUpdate();
            stm24.close();


            String sql8 = "select name, role from user_roles ";
            Statement stm8 = con.createStatement();
            ResultSet resultSet2 = stm8.executeQuery(sql8);




            if(resultSet2.next()){
                System.out.print("name: "+resultSet2.getString(1)+", ");
                System.out.print("role: "+resultSet2.getString(2)+"; ");
                System.out.println();
            }
            resultSet2.close();
            stm8.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }


    }

    static void showTableRoles() {

        Properties props = new Properties();
        props.setProperty("user",username);
        props.setProperty("password",password);
        try {
            con = DriverManager.getConnection(url, props);
            String sql8 = "select * from user_roles ";
            Statement stm8 = con.createStatement();
            ResultSet resultSet2 = stm8.executeQuery(sql8);

            if (resultSet2.next()) {
                System.out.print("id: " + resultSet2.getInt(1) + ", ");
                System.out.print("name: " + resultSet2.getString(2) + "; ");
                System.out.print("role: " + resultSet2.getString(3) + "; ");
                System.out.println();
            }
            resultSet2.close();
            stm8.close();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

//    @Autowired
//    AddressBookServiceImp service;

    public static void main(String[] args) {

        ApplicationContext cxt = new ClassPathXmlApplicationContext("main/webapp/WEB-INF/dispatcher-servlet.xml");
        AddressBookServiceImp service = (AddressBookServiceImp) cxt.getBean("service");

       //DBhelper.createTableClients();

       //UserMapperImp adr = new UserMapperImp();
       //System.out.println(adr.findAll());
        //System.out.println(adr.findById(2));
        //adr.deleteById(2);
//        System.out.println(adr.findByName("Tim"));
        System.out.println("-------Select ALL users-----------");
        DBhelper dBhelper = new DBhelper();
        User user = new User();
        user.setName("Bobon");
        user.setPassword("bobon1234");
        user.setAddress("Saratov");
        user.setEmail("lskw@kdslwdk.com");
        user.setEnabled(Short.parseShort(""+1));
        user.setPhone("78738947392");
        user.setMessage("new user");
        user.setRoles(Arrays.asList("ROLE_ADMIN","ROLE_USER"));

        //service.insert(user);
        System.out.println("added");

        List<User> users = service.findAll();
        System.out.println("end  of the search");
        for(User tmpUser : users){
            System.out.print(tmpUser.toString());
            System.out.println();
        }
        System.out.println();

        List<UserRole> userRoles = service.getUserRoles("Glinka");
        for(UserRole tmpUser : userRoles){
            System.out.print("Username: " + tmpUser.getName() + ", Role: "+tmpUser.getRole());
            System.out.println();
        }
        System.out.println();


        //DBhelper.security("Tim");
        //DBhelper.security("Tim");
        //DBhelper.security("Popa");
        //DBhelper.showTableRoles();
    }
}
