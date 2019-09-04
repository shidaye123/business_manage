package com.neuedu.dao;

import com.neuedu.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserInfoMapper {

    public int findByUsername(String username);

    public UserInfo findByUsernameAndPassword(@Param("username") String username,
                                              @Param("password") String password);

}