package main.java.ru.addressbook.service;

import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.bean.UserRole;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Tim on 16.08.2017.
 */
@Service
public interface AddressBookService {

    public List<User> findUserByUsername(String name);
    public List<User> findAll();
    void insert(User user);
    public List<User> findUserById(long id);
    void update(User user);
    void deleteUserById(long id);
    List<UserRole> getUserRoles(String name);

}
