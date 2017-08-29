package main.java.ru.addressbook.controller;

import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.service.AddressBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Tim on 16.08.2017.
 */
@Controller
public class AddressBookRegistrationController {


    @Autowired
    AddressBookService service;

    @Autowired
    @Qualifier("myValidator")
    private Validator validator;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(validator);
    }

    @RequestMapping(value = {"/registration"}, method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView model = new ModelAndView("registration");
        User user = new User();
        user.setEnabled(Short.parseShort("1"));
        user.setMessage("Регистрация");
        model.addObject("user", user);
        //model.addObject("message", "Registration");
        return model;
    }

    @RequestMapping(value = {"/addUser"}, method = RequestMethod.GET)
    public ModelAndView addUser() {

        ModelAndView model = new ModelAndView("registration");
        User user = new User();
        user.setMessage("Добавить новую запись");
        model.addObject("user", user);
        //model.addObject("message", "Add new user");
        return model;
    }

    @RequestMapping(value = {"/checkForm"}, method = RequestMethod.POST)
    public ModelAndView checkForm(@ModelAttribute("user") @Validated User user,
                                  BindingResult result
    ) {
        ModelAndView model = new ModelAndView();
        if(result.hasErrors()){
            model.setViewName("registration");
            user.setEnabled(Short.parseShort("1"));
        }else{
            if(user.getId() > 0){
                service.update(user);
                model.addObject("messageInfo", "Данные были успешно отредактированы");
            }else{
                service.insert(user);
                model.addObject("messageInfo", "Новая запись была добавлена в книгу");
            }

            if(user.getMessage().equals("Регистрация")){
                model.addObject("messageInfo", "Новый пользователь был успешно зарегистрирован");
                model.setViewName("welcome");
            }else {
                model.setViewName("index");
            }
            List<User> users = service.findAll();
            model.addObject("users", users);
        }
        return model;
    }

    @RequestMapping(value = {"/checkForm"}, method = RequestMethod.GET)
    public String checkForm(){
        return "welcome";
    }

    @RequestMapping(value = {"/updateUser**"}, method = RequestMethod.POST)
    public ModelAndView updateUser(@RequestParam(value = "id", required = false) int id) {
        List<User> users = service.findUserById(id);
        User user = users.get(0);
        ModelAndView model = new ModelAndView("registration");
        user.setMessage("�?зменить данные");
        model.addObject("user", user);
        //model.addObject("message", "Update user");
        return model;
    }

}
