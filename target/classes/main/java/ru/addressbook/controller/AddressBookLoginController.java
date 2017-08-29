package main.java.ru.addressbook.controller;

import ch.qos.logback.classic.Logger;
import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.service.AddressBookService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Tim on 16.08.2017.
 */
@Controller
public class AddressBookLoginController {

    private final Logger logger = (Logger) LoggerFactory.getLogger(AddressBookController.class);

    @Autowired
    AddressBookService service;

    @RequestMapping(value = {"/login**"}, method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            SessionStatus status) {

        ModelAndView model = new ModelAndView("login");
        model.addObject("user", new User());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addObject("logged",auth);

        if(SecurityContextHolder.getContext().getAuthentication()!=null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !SecurityContextHolder.getContext().getAuthentication().getName().equals("") &&
                //when Anonymous Authentication is enabled
                !(SecurityContextHolder.getContext().getAuthentication()
                instanceof AnonymousAuthenticationToken)){
            model.setViewName("redirect:/AddressBookUser");
            return model;
        }

        if(error != null){
            model.addObject("error", "Неправильное имя пользователя или пароль!");
            logger.error("attempt to log-in");
        }

        if(logout != null){
            model.addObject("logout", "Вы вышли из системы!");
            status.isComplete();
        }

        return model;
    }

}
