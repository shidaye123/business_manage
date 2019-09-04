package com.neuedu.dao;


import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface ProductMapper {

    //显示所有商品
    public List<Product> findByPage(@Param("searchKey") String searchKey);
    public int findPagecounts();

    //删除商品
    public int deleteById(int id);

    //父类类别
    public List<Category> findCategory();

    //添加商品
    public int insertAll(@Param("name")String name,
                         @Param("subtitle")String subtitle,
                         @Param("price")BigDecimal price,
                         @Param("stock") int stock,
                         @Param("detail") String detail,
                         @Param("categoryId") int categoryId,
                         @Param("mainImage") String mainImage,
                         @Param("subImages") String subImages);

    //修改商品
    public Product findById(int id);

    public int update(@Param("id") int id,
                      @Param("name")String name,
                      @Param("subtitle")String subtitle,
                      @Param("price")BigDecimal price,
                      @Param("stock") int stock,
                      @Param("detail") String detail,
                      @Param("categoryId") int categoryId,
                      @Param("mainImage") String mainImage,
                      @Param("subImages") String subImages);


    public String findNameById(int id);

    //上下架
    public int grounding(int id);
    public int undercarriage(int id);

    //商品分页搜索
    List<Product> keySearch(String searchKey);



    //测试
    public List<Product> findA();

}