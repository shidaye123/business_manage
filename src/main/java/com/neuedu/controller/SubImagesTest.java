package com.neuedu.controller;


import com.neuedu.pojo.Product;
import com.neuedu.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SubImagesTest {

    @Autowired
    ProductServiceImpl productService;

    @RequestMapping("/subimages")
    public String subImages(HttpSession session){

        List<Product> productList = productService.findA();
        for (Product product:productList){
            if (product.getSubImages()!=null){
                String[] sub = product.getSubImages().split("#");
                for (String s:sub){
                    product.getSubimage().add(s);
                }
            }
        }
        session.setAttribute("productList",productList);
        return "test";
    }


}
