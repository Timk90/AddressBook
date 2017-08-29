package main.java.ru.addressbook.controller;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.util.StatusPrinter;
import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.service.AddressBookService;
import org.slf4j.*;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.Collections;
import java.util.List;


/**
 * Created by Tim on 09.08.2017.
 */
@Controller
public class AddressBookController {

    @Autowired
    AddressBookService service;

    private final Logger logger = (Logger)LoggerFactory.getLogger(AddressBookController.class);

    LoggerContext lc = (LoggerContext) LoggerFactory.getILoggerFactory();


    @RequestMapping(value = {"/AddressBook**"}, method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView model = new ModelAndView("index");
        List<User> users = service.findAll();
        model.addObject("users", users);

        System.setProperty("logback.configurationFile","WEB-INF\\classes\\main\\resources\\logging\\logback.xml");

        logger.info("Usual step...");
        logger.debug("Dangerous");
        StatusPrinter.print(lc);


        return model;
    }

    @RequestMapping(value={"/AddressBookUser**"}, method = RequestMethod.GET)
    public ModelAndView show(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String name = authentication.getName();
        ModelAndView model = new ModelAndView("indexUsers");
        model.addObject("AuthorizedUser", name);
        List<User> authorizedUser = service.findUserByUsername(name);

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        if(authorities.contains(new SimpleGrantedAuthority("ROLE_ADMIN"))){
            model.addObject("authority", "admin");
            //model.setViewName("/AddressBook");
        }

        model.addObject("AuthorizedUserID", authorizedUser.get(0).getId());
        model.addObject("roles", authentication.getAuthorities());

        List<User> users = service.findAll();
        model.addObject("users", users);
        return model;
    }


    @RequestMapping(value = {"/deleteUser**"}, method = RequestMethod.POST)
    public ModelAndView deleteUser(@RequestParam(value = "id", required = false) int id) {
        service.deleteUserById(id);
        ModelAndView model = new ModelAndView();
        model.addObject("messageInfo", "Запись успешно удалена из книги");
        List<User> users = service.findAll();
        model.addObject("users", users);
        model.setViewName("index");
        return model;
    }

//    @RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
//    public ModelAndView logout(SessionStatus status) {
//        status.isComplete();
//
//        ModelAndView model = new ModelAndView("login");
//        return model;
//    }


}
