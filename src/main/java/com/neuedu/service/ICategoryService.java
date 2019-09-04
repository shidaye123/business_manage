package com.neuedu.service;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import org.apache.xml.resolver.Catalog;

import java.util.Date;
import java.util.List;

public interface ICategoryService {

    //===========
    public List<Category> findAll() throws MyException;
    public List<Category> findAllParents() throws MyException;
    //===========

    public int deleteById(int id) throws MyException;

    public Category findAllById(int id) throws MyException;

    public int update(int id,int parentId, String name, int status) throws MyException;

    public int insert(Category category) throws MyException;

    public List<String> findParents() throws MyException;

}
