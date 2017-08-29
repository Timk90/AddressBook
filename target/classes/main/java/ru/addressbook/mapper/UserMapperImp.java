//TODO Another Way how to get information from DB using MyBatis but without Spring framework
//package main.java.ru.addressbook.mapper;
//
//import main.java.ru.addressbook.bean.User;
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//
//import javax.sql.DataSource;
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.List;
//
///**
// * Created by Tim on 09.08.2017.
// */
//
//public class UserMapperImp implements UserMapper {
//
//
//    DataSource dataSource;
//
//    DataSource getDataSource() {
//        return dataSource;
//    }
//
//    static String resource = "main/resources/mybatis-config.xml";
//    static InputStream inputStream = null;
//
//    public  SqlSessionFactory init() {
//        DataSource dataSource = getDataSource(); //http://www.studytrails.com/frameworks/spring/spring-security-using-db/
//
//        try {
//            inputStream = Resources.getResourceAsStream(resource);
//            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//            return sqlSessionFactory;
//        } catch (IOException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    @Override
//    public List<User> findAll() {
//        SqlSession session = this.init().openSession();
//        try{
//            List result = session.selectList("main.java.ru.addressbook.bean.User.getAll");
//            session.commit();
//            return result;
//        }catch(Exception e){
//            //exception
//            e.printStackTrace();
//            return null;
//        }finally {
//            session.close();
//        }
//    }
//
//    @Override
//    public void insert(User user) {
//        SqlSession session = this.init().openSession();
//        try{
//            session.selectList("main.java.ru.addressbook.bean.User.insert", user);
//            session.commit();
//        }catch(Exception e){
//            //exception
//            e.printStackTrace();
//        }finally {
//            session.close();
//        }
//    }
//
//    @Override
//    public User findById(long id) {
//        SqlSession session = this.init().openSession();
//        try{
//            List<User> result = session.selectList("main.java.ru.addressbook.bean.User.getById", id);
//            session.commit();
//            if(result.size()>0) {
//                User user = result.get(0);
//                return user;
//            }else{
//                return null;
//            }
//        }catch(Exception e){
//            //exception
//            e.printStackTrace();
//            return null;
//        }finally {
//            session.close();
//        }
//    }
//
//    @Override
//    public void update(User user) {
//        SqlSession session = this.init().openSession();
//        try{
//            session.selectList("main.java.ru.addressbook.bean.User.update", user);
//            session.commit();
//        }catch(Exception e){
//            //exception
//            e.printStackTrace();
//        }finally {
//            session.close();
//        }
//    }
//
//    @Override
//    public int deleteById(long id) {
//        SqlSession session = this.init().openSession();
//        try{
//            int result = session.delete("main.java.ru.addressbook.bean.User.deleteByID", id);
//            session.commit();
//            return result;
//        }catch(Exception e){
//            //exception
//            e.printStackTrace();
//            return 0;
//        }finally {
//            session.close();
//        }
//    }
//
//    @Override
//    public List<User> findByName(String name){
//
//        SqlSession session = this.init().openSession();
//        try{
//            List<User> result = session.selectList("main.java.ru.addressbook.bean.User.getByName", name);
//            session.commit();
//            return result;
//        }catch(Exception e){
//            //exception
//            e.printStackTrace();
//            return null;
//        }finally {
//                session.close();
//        }
//    }
//}
