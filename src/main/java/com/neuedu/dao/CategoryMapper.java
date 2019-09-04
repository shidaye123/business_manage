package com.neuedu.dao;

import com.neuedu.pojo.Category;
import com.neuedu.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface CategoryMapper {

    //======
    public List<Category> findAll();
    public List<Category> findAllParents();
    //======

    public int deleteById(int id);

    public Category findAllById(int id);

    public int update(@Param("id") int id,@Param("parentId") int parentId,@Param("name") String name,@Param("status") int status);

    public int insert(Category category);

    public List<String> findParents();
}