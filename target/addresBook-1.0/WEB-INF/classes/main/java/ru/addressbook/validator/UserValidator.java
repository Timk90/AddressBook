package main.java.ru.addressbook.validator;

import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.service.AddressBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Tim on 09.08.2017.
 */
public class UserValidator implements org.springframework.validation.Validator{

    @Autowired
    private AddressBookService service;

    private static final String EMAIL_PATTERN =
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

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

        if (!emailValidation(user.getEmail())){
            errors.rejectValue("email", "User.emeail.not.valid");
        }

    }

    boolean emailValidation(String email){
        boolean valid = false;
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher match = pattern.matcher(email);
        valid =  match.matches();
        return valid;
    }

}
