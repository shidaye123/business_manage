package com.neuedu.interceptors;

import com.neuedu.constant.Constant;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.impl.UserServiceImpl;
import com.neuedu.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthorityInterceptor implements HandlerInterceptor {

    @Autowired
    UserServiceImpl userService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("=====到达拦截器=========");
        HttpSession session = request.getSession();
        String username = null;
        String password = null;
        Cookie[] cookies = request.getCookies();
        if (cookies!=null&&cookies.length>0){
            for (Cookie cookie:cookies){
                if (cookie.getName().equals("username")){
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("password")){
                    password = cookie.getValue();
                }
            }
        }
        if (username!=null&&password!=null){
            System.out.println("=====用户已经登陆过=======");
            UserInfo user = userService.login(username,password);
            session.setAttribute(Constant.CURRENT_USER,user);
            return true;
        }else {
            System.out.println("用户没有登陆过");
            request.getRequestDispatcher("/user/login").forward(request,response);
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
