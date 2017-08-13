package main.java.ru.addressbook.validator;

import main.java.ru.addressbook.mapper.User;
import main.java.ru.addressbook.service.AddressBookServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import java.util.List;

/**
 * Created by Tim on 09.08.2017.
 */
public class UserValidator implements org.springframework.validation.Validator{

    @Autowired
    private AddressBookServiceImp service;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
        if (user.getName().length() < 6 || user.getName().length() > 32) {
            errors.rejectValue("name", "Size.userForm.username");
        }

        List<User> tmpUser = service.findUserByUsername(user.getName());
        if (tmpUser.size()>0 && (tmpUser.get(0).getId() != user.getId())) {
            errors.rejectValue("name", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getConfirmationPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmationPassword", "Diff.userForm.passwordConfirm");
        }
    }
}
