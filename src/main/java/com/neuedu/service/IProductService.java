package com.neuedu.service;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

public interface IProductService {

    public List<Product> findByPage(int page,int size,HttpSession session,String searchKey) throws MyException;
    public int findPagecounts() throws MyException;

    public int deleteById(int id) throws MyException;

    public List<Category> findCategory() throws MyException;

    public int insertAll(String name, String subtitle, BigDecimal price, int stock ,
                         String detail, int categoryId, String mainImage,String subImages);

    public Product findById(int id) throws MyException;

    public int update(int id , String name, String subtitle, BigDecimal price, int stock ,
                      String detail, int categoryId, String mainImage , String subImages) throws MyException;


    public String findNameById(int id) throws MyException;

    //上下架
    public int grounding(int id) throws MyException;
    public int undercarriage(int id) throws MyException;

    //商品分页搜索
    List<Product> keySearch(Integer pageNum, Integer pageSize, String searchKey, HttpSession session);



    //测试
    public List<Product> findA() throws MyException;
}
