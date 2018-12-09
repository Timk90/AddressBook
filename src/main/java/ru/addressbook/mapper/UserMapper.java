package ru.addressbook.mapper;

import ru.addressbook.bean.User;

import java.util.List;


/**
 * Created by Tim on 09.08.2017.
 */
public interface UserMapper {

    void insert(User user);
    void update(User user);
    List<User> findById(long id);
    List<User> findByName(String name);
    int deleteById(long id);
    List<User> findAll();
    List<User> findUserRoles(String name);

}
