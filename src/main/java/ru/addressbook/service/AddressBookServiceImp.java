package main.java.ru.addressbook.service;

import main.java.ru.addressbook.mapper.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by Tim on 09.08.2017.
 */
@Component("dbUtil")
public class AddressBookServiceImp implements AddressBookService {


    DataSource dataSource;

    DataSource getDataSource() {
        return dataSource;
    }

    static String resource = "main/resources/mybatis-config.xml";
    static InputStream inputStream = null;

    public  SqlSessionFactory init() {
        DataSource dataSource = getDataSource(); //http://www.studytrails.com/frameworks/spring/spring-security-using-db/

        try {
            inputStream = Resources.getResourceAsStream(resource);
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            return sqlSessionFactory;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<User> selectAllUsers() {
        SqlSession session = this.init().openSession();
        try{
            List result = session.selectList("main.java.ru.addressbook.mapper.User.getAll");
            session.commit();
            return result;
        }catch(Exception e){
            //exception
            e.printStackTrace();
            return null;
        }finally {
            session.close();
        }
    }

    @Override
    public void addUser(User user) {
        SqlSession session = this.init().openSession();
        try{
            session.selectList("main.java.ru.addressbook.mapper.User.insert", user);
            session.commit();
        }catch(Exception e){
            //exception
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    @Override
    public User findUserByID(long id) {
        SqlSession session = this.init().openSession();
        try{
            List<User> result = session.selectList("main.java.ru.addressbook.mapper.User.getById", id);
            session.commit();
            if(result.size()>0) {
                User user = result.get(0);
                return user;
            }else{
                return null;
            }
        }catch(Exception e){
            //exception
            e.printStackTrace();
            return null;
        }finally {
            session.close();
        }
    }

    @Override
    public void updateUserInfo(User user) {
        SqlSession session = this.init().openSession();
        try{
            session.selectList("main.java.ru.addressbook.mapper.User.update", user);
            session.commit();
        }catch(Exception e){
            //exception
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    @Override
    public int deleteUserByID(long id) {
        SqlSession session = this.init().openSession();
        try{
            int result = session.delete("main.java.ru.addressbook.mapper.User.deleteByID", id);
            session.commit();
            return result;
        }catch(Exception e){
            //exception
            e.printStackTrace();
            return 0;
        }finally {
            session.close();
        }
    }

    public List<User> findUserByUsername(String name){

        SqlSession session = this.init().openSession();
        try{
            List<User> result = session.selectList("main.java.ru.addressbook.mapper.User.getByName", name);
            session.commit();
            return result;
        }catch(Exception e){
            //exception
            e.printStackTrace();
            return null;
        }finally {
                session.close();
        }
    }
}
