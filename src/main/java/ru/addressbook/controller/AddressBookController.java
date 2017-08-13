package main.java.ru.addressbook.controller;

import main.java.ru.addressbook.mapper.User;
import main.java.ru.addressbook.service.AddressBookServiceImp;
import main.java.ru.addressbook.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by Tim on 09.08.2017.
 */
@Controller
public class AddressBookController {

    @Autowired
    private User user;

    @ModelAttribute("user")
    public User createUser(){
        return new User();
    }

    @Autowired
    AddressBookServiceImp dbService;
    //private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);

    @Autowired
    @Qualifier("myValidator")
    private Validator validator;

    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(validator);
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public ModelAndView welcome() {
        ModelAndView model = new ModelAndView("welcome");
        //model.addObject("user", new User());
        return model;
    }

    @RequestMapping(value = {"/login**"}, method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            SessionStatus status) {

        ModelAndView model = new ModelAndView("login");
        model.addObject("user", new User());

        if(error != null){
            model.addObject("error", "Invalid username and password!");
        }

        if(logout != null){
            model.addObject("logout", "You have logged out!");
            status.isComplete();
        }

        return model;
    }

    @RequestMapping(value = {"/AddressBook**"}, method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView model = new ModelAndView("index");
        List<User> users = dbService.selectAllUsers();
        model.addObject("users", users);
        return model;
    }

    @RequestMapping(value={"/AddressBookUser**"}, method = RequestMethod.GET)
    public ModelAndView show(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName();
        ModelAndView model = new ModelAndView("indexUsers");
        model.addObject("AuthorizedUser", name);
        List<User> authorizedUser = dbService.findUserByUsername(name);
        model.addObject("AuthorizedUserID", authorizedUser.get(0).getId());
        model.addObject("roles", authentication.getAuthorities());
        List<User> users = dbService.selectAllUsers();
        model.addObject("users", users);
        return model;
    }

    @RequestMapping(value = {"/registration"}, method = RequestMethod.GET)
    public ModelAndView registration() {
        ModelAndView model = new ModelAndView("registration");
        User user = new User();
        user.setEnabled(Short.parseShort("1"));
        user.setMessage("Registration");
        model.addObject("user", user);
        //model.addObject("message", "Registration");
        return model;
    }

    @RequestMapping(value = {"/addUser"}, method = RequestMethod.GET)
    public ModelAndView addUser() {

        ModelAndView model = new ModelAndView("registration");
        User user = new User();
        user.setMessage("Add new user");
        model.addObject("user", user);
        //model.addObject("message", "Add new user");
        return model;
    }

    @RequestMapping(value = {"/deleteUser**"}, method = RequestMethod.POST)
    public ModelAndView deleteUser(@RequestParam(value = "id", required = false) int id) {
        dbService.deleteUserByID(id);
        ModelAndView model = new ModelAndView();
        model.addObject("messageInfo", "User was successfully deleted");
        List<User> users = dbService.selectAllUsers();
        model.addObject("users", users);
        model.setViewName("index");
        return model;
    }

    @RequestMapping(value = {"/updateUser**"}, method = RequestMethod.POST)
    public ModelAndView updateUser(@RequestParam(value = "id", required = false) int id) {
        User user = dbService.findUserByID(id);
        ModelAndView model = new ModelAndView("registration");
        user.setMessage("Update user");
        model.addObject("user", user);
        //model.addObject("message", "Update user");
        return model;
    }

//    @RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
//    public ModelAndView logout(SessionStatus status) {
//        status.isComplete();
//
//        ModelAndView model = new ModelAndView("login");
//        return model;
//    }

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
                dbService.updateUserInfo(user);
                model.addObject("messageInfo", "User was successfully updated");
            }else{
                dbService.addUser(user);
                model.addObject("messageInfo", "New User was successfully Added");
            }

            if(user.getMessage().equals("Registration")){
                model.addObject("messageInfo", "New User was successfully registered");
                model.setViewName("welcome");
            }else {
                model.setViewName("index");
            }
            List<User> users = dbService.selectAllUsers();
            model.addObject("users", users);
        }
        return model;
    }

    @RequestMapping(value = {"/checkForm"}, method = RequestMethod.GET)
    public String checkForm(){
        return "welcome";
    }


}
