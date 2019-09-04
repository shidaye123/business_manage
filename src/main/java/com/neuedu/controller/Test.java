package com.neuedu.controller;

import com.neuedu.utils.MD5Utils;

public class Test {

    public static void main(String[] args) {
        System.out.println(MD5Utils.getMD5Code("石永"));
        System.out.println(MD5Utils.getMD5Code("123456"));
        System.out.println(MD5Utils.getMD5Code("张三"));
    }

}
