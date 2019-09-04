package com.neuedu.controller;

import com.neuedu.constant.Constant;
import com.neuedu.pojo.Category;
import com.neuedu.service.ICategoryService;
import com.neuedu.service.impl.CategoryServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/user/category")
public class CategoryController {

    @Autowired
    CategoryServiceImpl categoryService;

    //所有类别显示
    @RequestMapping("/info")
    public String category(HttpSession session){
        List<Category> categoryList = categoryService.findAll();
        session.setAttribute("categoryList",categoryList);
        List<Category> parentCategory = categoryService.findAllParents();
        session.setAttribute("parentCategory",parentCategory);
        return "/category/list";
    }


    @RequestMapping("/delete")
    public String delete(@RequestParam("id") int id,HttpSession session){

        int count = categoryService.deleteById(id);
        if (count==1){
            List<Category> categoryList = categoryService.findAll();
            session.setAttribute("categoryList",categoryList);
            return "/category/list";
        }
        return "/category/list";
    }

    @RequestMapping("/update")
    public String update(@RequestParam("id") int id, HttpServletRequest request){

        Category category = categoryService.findAllById(id);
        request.setAttribute("category",category);
        List<Category> parentCategory = categoryService.findAllParents();
        request.setAttribute("parentCategory",parentCategory);
        return "/category/index";

    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update1(@RequestParam(value = "id") int id,
                          @RequestParam(value = "parentId") int parentId,
                          @RequestParam(value = "name") String name,
                          @RequestParam(value = "status") int status,
                          HttpSession session){

        int count = categoryService.update(id,parentId, name, status);
        if (count==1){
            List<Category> categoryList = categoryService.findAll();
            session.setAttribute("categoryList",categoryList);
            return "/category/list";
        }
        return "/category/list";

    }

    @RequestMapping("/insert")
    public String insert(HttpServletRequest request){
        List<Category> parentCategory = categoryService.findAllParents();
        request.setAttribute("parentCategory",parentCategory);
        request.setAttribute("new",1);
        return "/category/index";
    }

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insert1(Category category,HttpSession session){

        int count = categoryService.insert(category);
        if (count==1){
            List<Category> categoryList = categoryService.findAll();
            session.setAttribute("categoryList",categoryList);
            return "/category/list";
        }
        return "/category/index";
    }


    @RequestMapping("/parents")
    public String showParents(HttpSession session){

        List<String> list = categoryService.findParents();
        session.setAttribute("list",list);
        return "selectmenu";

    }

}
