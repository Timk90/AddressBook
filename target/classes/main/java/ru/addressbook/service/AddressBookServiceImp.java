package main.java.ru.addressbook.service;

import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.bean.UserRole;
import main.java.ru.addressbook.mapper.UserMapper;
import main.java.ru.addressbook.mapper.UserRoleMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Tim on 16.08.2017.
 */
@Service("service")
public class AddressBookServiceImp implements AddressBookService {

    @Autowired
    UserMapper mapper;

    @Autowired
    UserRoleMapper mapperRoles;

    @Override
    public void insert(User user) {
        mapper.insert(user);
        mapperRoles.setUserRole( user.getName(), "ROLE_USER");
        //mapperRoles.setUserRole(user.getName(), "ROLE_ADMIN");
    }

    @Transactional
    @Override
    public List<User> findAll() {
        System.out.println("Searching");
        return mapper.findAll();

    }

    @Override
    public List<User> findUserByUsername(String name) {
        return mapper.findByName(name);
    }

    @Override
    public List<User> findUserById(long id) {
        return mapper.findById(id);
    }

    @Override
    public void update(User user) {
        User tmpUser = mapper.findById(user.getId()).get(0);

        if(tmpUser.getName().equals(user.getName())) {
            mapper.update(user);
        }else {
            String newName = user.getName();
            String oldName = tmpUser.getName();
            mapperRoles.updateUser(newName, oldName);
        }
    }

    @Override
    public List<UserRole> getUserRoles(String name) {
        return mapperRoles.getUserRoles(name);
    }

    @Override
    public void deleteUserById(long id) {
        List<User> user = mapper.findById(id);
        mapperRoles.deleteUserAndRolesByName(user.get(0).getName());
        mapper.deleteById(id);
    }
}
