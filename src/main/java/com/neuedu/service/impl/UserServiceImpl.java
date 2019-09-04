package com.neuedu.service.impl;


import com.neuedu.dao.UserInfoMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public UserInfo login(String username,String password) {

        //非空判断
        if (username==null||username.equals("")){
            throw new MyException("用户名不能为空！");
        }
        if (password==null||password.equals("")){
            throw new MyException("密码不能为空！");
        }

        //根据用户名查找是否存在
        int count = userInfoMapper.findByUsername(username);
        System.out.println(count);
        if (count==0){
            throw new MyException("用户名错误！");
        }

        //根据用户名和密码进行查找
        //找到即登录
        UserInfo user = userInfoMapper.findByUsernameAndPassword(username,password);
        if (user == null){
            throw new MyException("密码错误！");
        }

        //权限判断
        if (user.getRole()==1){
            throw new MyException("没有权限访问！");
        }

        return user;
    }
}
