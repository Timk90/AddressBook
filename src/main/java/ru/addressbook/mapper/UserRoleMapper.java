package main.java.ru.addressbook.mapper;


import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.bean.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Tim on 17.08.2017.
 */
public interface UserRoleMapper {

    void setUserRole(@Param("name") String name, @Param("role") String role);
    List<UserRole> getUserRoles(String name);

    void deleteUserAndRolesByName(@Param("name") String name);

    void updateUser(@Param("newName") String newName, @Param("oldName") String oldName);
}
