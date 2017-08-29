package main.java.ru.addressbook.controller;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.core.util.StatusPrinter;
import main.java.ru.addressbook.bean.User;
import main.java.ru.addressbook.config.LoggingConfig;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Tim on 16.08.2017.
 */
@Controller
public class AddressBookWelcomeController {

    @ModelAttribute("user")
    public User createUser(){
        return new User();
    }

    //private final static org.slf4j.Logger logger = LoggerFactory.getLogger(BaseController.class);
    //static{System.setProperty("logback.configurationFile","main/resources/logging/logback.xml");}
    private final Logger logger = (Logger) LoggerFactory.getLogger(AddressBookController.class);
    LoggerContext lc = (LoggerContext) LoggerFactory.getILoggerFactory();

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public ModelAndView welcome() {

        logger.info("Starting application");
        StatusPrinter.print(lc);
        //LoggingConfig.config();

        ModelAndView model = new ModelAndView("welcome");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(SecurityContextHolder.getContext().getAuthentication()!=null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !SecurityContextHolder.getContext().getAuthentication().getName().equals("") &&
                //when Anonymous Authentication is enabled
                !(SecurityContextHolder.getContext().getAuthentication()
                        instanceof AnonymousAuthenticationToken)){
            model.setViewName("redirect:/AddressBookUser");
            logger.info("redirection to AddresBookUser");
            return model;
        }

        //model.addObject("user", new User());
        return model;
    }
}
