package main.java.ru.addressbook.service;

import main.java.ru.addressbook.mapper.User;

import java.util.List;


/**
 * Created by Tim on 09.08.2017.
 */
public interface AddressBookService {
    void addUser(User user);
    User findUserByID(long id);
    void updateUserInfo(User user);
    int deleteUserByID(long id);
    List<User> selectAllUsers();



}
