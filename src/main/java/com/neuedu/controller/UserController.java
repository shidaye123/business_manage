package com.neuedu.controller;


import com.neuedu.constant.Constant;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.impl.UserServiceImpl;
import com.neuedu.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserServiceImpl userService;

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login/login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        HttpServletResponse response){

        password = MD5Utils.getMD5Code(password);
        UserInfo user = userService.login(username,password);
        session.setAttribute(Constant.CURRENT_USER,user);
        Cookie usernameCookie = new Cookie("username",username);
        Cookie passwordCookie = new Cookie("password",password);
        usernameCookie.setMaxAge(60*60*24*7);
        passwordCookie.setMaxAge(60*60*24*7);
        response.addCookie(usernameCookie);
        response.addCookie(passwordCookie);
        return "/home/home";

    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,
                         HttpServletResponse response){

        Cookie[] cookies = request.getCookies();
        if (cookies!=null&&cookies.length>0){
            for (Cookie cookie:cookies){
                if (cookie.getName().equals("username")){
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
                if (cookie.getName().equals("password")){
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }

        return "/login/login";
    }
}
