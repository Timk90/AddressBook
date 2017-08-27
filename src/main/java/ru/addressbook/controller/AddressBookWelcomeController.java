package main.java.ru.addressbook.controller;

import main.java.ru.addressbook.bean.User;
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


    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public ModelAndView welcome() {


        ModelAndView model = new ModelAndView("welcome");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if(SecurityContextHolder.getContext().getAuthentication()!=null &&
                SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
                !SecurityContextHolder.getContext().getAuthentication().getName().equals("") &&
                //when Anonymous Authentication is enabled
                !(SecurityContextHolder.getContext().getAuthentication()
                        instanceof AnonymousAuthenticationToken)){
            model.setViewName("redirect:/AddressBookUser");
            return model;
        }



        //model.addObject("user", new User());
        return model;
    }
}
