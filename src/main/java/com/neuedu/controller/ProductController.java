package com.neuedu.controller;

import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.service.impl.CategoryServiceImpl;
import com.neuedu.service.impl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/user/product")
public class ProductController {

    @Autowired
    ProductServiceImpl productService;
    @Autowired
    CategoryServiceImpl categoryService;

    @RequestMapping("/info")
    public String showAll(HttpSession session,
                          HttpServletRequest request,
                          @RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
                          @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize,
                          @RequestParam(name = "searchKey",required = false)String searchKey){

        //解决搜索分页问题
        if (searchKey!=null){
            session.setAttribute("searchKey",searchKey);
        }else {
            session.removeAttribute("searchKey");
        }

        //当前页
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("size",pageSize);

        List<Product> productList = productService.findByPage(pageNum, pageSize,session,searchKey);

        //子图
        for (Product product:productList){
            if (product.getSubImages()!=null){
                String[] sub = product.getSubImages().split(",");
                for (String s:sub){
                    product.getSubimage().add(s);
                }
            }
        }
        session.setAttribute("productList",productList);

        List<Category> parentCategory = categoryService.findAllParents();
        request.setAttribute("parentCategory",parentCategory);

        return "/product/list";
    }


    @RequestMapping("/delete")
    public String deleteById(@RequestParam("id") int id,
                             @RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
                             @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize,
                             HttpSession session,
                             HttpServletRequest request){

        String searchKey = (String) session.getAttribute("searchKey");

        request.setAttribute("currentPage",pageNum);
        request.setAttribute("size",pageSize);

        int counts = productService.deleteById(id);
        if (counts == 1){
            List<Product> productList = productService.findByPage(pageNum, pageSize,session,searchKey);

            //子图
            for (Product product:productList){
                if (product.getSubImages()!=null){
                    String[] sub = product.getSubImages().split(",");
                    for (String s:sub){
                        product.getSubimage().add(s);
                    }
                }
            }
            session.setAttribute("productList",productList);

            List<Category> parentCategory = categoryService.findAllParents();
            request.setAttribute("parentCategory",parentCategory);
            return "/product/list";
        }
        return "/product/list";
    }

    @RequestMapping("/insert")
    public String insertProduct(HttpServletRequest request){

        List<Category> categoryList = productService.findCategory();
        request.setAttribute("categoryList",categoryList);
        return "/product/index";

    }

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insertProduct(@RequestParam("name") String name,
                                 @RequestParam("subtitle") String subtitle,
                                 @RequestParam("price") BigDecimal price,
                                 @RequestParam("stock") int stock,
                                 @RequestParam("detail") String detail,
                                 @RequestParam("categoryId") int categoryId,
                                 @RequestParam("pic") MultipartFile picfile,
                                 @RequestParam("subpic") MultipartFile[] subpicfile,
                                 HttpSession session,
                                 HttpServletRequest request,
                                 @RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
                                 @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize){

        File file = null;
        String newFileName = null;
        if (picfile!=null){
            String oldFileName = picfile.getOriginalFilename();
            String extendName = oldFileName.substring(oldFileName.lastIndexOf("."));
            String uuid = UUID.randomUUID().toString();
            newFileName = uuid + extendName;
            file = new File("D:\\picture");
            if (!file.exists()){
                file.mkdir();
            }
            File newfile = new File(file,newFileName);
            try {
                picfile.transferTo(newfile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        String[] newSubFileName = new String[subpicfile.length];
        if (subpicfile!=null){
            for(int i=0;i<subpicfile.length;i++){

                String oldFileName = subpicfile[i].getOriginalFilename();
                String extendName = oldFileName.substring(oldFileName.lastIndexOf("."));
                String uuid = UUID.randomUUID().toString();
                newSubFileName[i] = uuid + extendName;
                if (!file.exists()){
                    file.mkdir();
                }
                File newFile = new File(file,newSubFileName[i]);
                try {
                    subpicfile[i].transferTo(newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        String subImages = "";
        if (newSubFileName!=null&&newSubFileName.length>0){
            for (String i:newSubFileName){
                subImages += i + "," ;
            }
        }

        String searchKey = (String) session.getAttribute("searchKey");

        request.setAttribute("currentPage",pageNum);
        request.setAttribute("size",pageSize);

        int counts = productService.insertAll(name,subtitle,price,stock,detail,categoryId,newFileName,subImages);
        if (counts==1){

            List<Product> productList = productService.findByPage(pageNum, pageSize,session,searchKey);

            //子图
            for (Product product:productList){
                if (product.getSubImages()!=null){
                    String[] sub = product.getSubImages().split(",");
                    for (String s:sub){
                        product.getSubimage().add(s);
                    }
                }
            }
            session.setAttribute("productList",productList);

            List<Category> parentCategory = categoryService.findAllParents();
            request.setAttribute("parentCategory",parentCategory);
            return "/product/list";
        }

        return "/product/index";
    }


    @RequestMapping("/update")
    public String updateProduct(@RequestParam("id") int id,
                                @RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
                                @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize,
                                HttpServletRequest request){
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("size",pageSize);
        List<Category> categoryList = productService.findCategory();
        request.setAttribute("categoryList",categoryList);
        Product product = productService.findById(id);
        request.setAttribute("productInfo",product);
        return "/product/index";
    }
    //下拉框选中
//更新图片，要删除原有图片（主图，子图）
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateProduct(@RequestParam("id") int id,
                                @RequestParam("name") String name,
                                @RequestParam("subtitle") String subtitle,
                                @RequestParam("price") BigDecimal price,
                                @RequestParam("stock") int stock,
                                @RequestParam("detail") String detail,
                                @RequestParam("categoryId") int categoryId,
                                @RequestParam("pic") MultipartFile picfile,
                                @RequestParam("subpic") MultipartFile[] subpicfile,
                                @RequestParam("currentPage") int pageNum,
                                @RequestParam("size") int pageSize,
                                HttpSession session,
                                HttpServletRequest request){
        //删除原始图片
        String oldName = productService.findNameById(id);
        File oldFile = new File("D:/picture/"+oldName);
        if (oldFile.exists()&&oldFile.isFile()){
            oldFile.delete();
        }

        File file = null;
        String newFileName = null;
        if (picfile!=null){
            String oldFileName = picfile.getOriginalFilename();
            String extendName = oldFileName.substring(oldFileName.lastIndexOf("."));
            String uuid = UUID.randomUUID().toString();
            newFileName = uuid + extendName;
            file = new File("D:\\picture");
            if (!file.exists()){
                file.mkdir();
            }
            File newfile = new File(file,newFileName);
            try {
                picfile.transferTo(newfile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        String[] newSubFileName = new String[subpicfile.length];
        if (subpicfile!=null){
            for(int i=0;i<subpicfile.length;i++){

                String oldFileName = subpicfile[i].getOriginalFilename();
                String extendName = oldFileName.substring(oldFileName.lastIndexOf("."));
                String uuid = UUID.randomUUID().toString();
                newSubFileName[i] = uuid + extendName;
                if (!file.exists()){
                    file.mkdir();
                }
                File newFile = new File(file,newSubFileName[i]);
                try {
                    subpicfile[i].transferTo(newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        String subImages = "";
        if (newSubFileName!=null&&newSubFileName.length>0){
            for (String i:newSubFileName){
                subImages += i + ",";
            }
        }

        String searchKey = (String) session.getAttribute("searchKey");
        //当前页
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("size",pageSize);

        int counts = productService.update(id,name,subtitle,price,stock,detail,categoryId,newFileName,subImages);
        if (counts==1){

            List<Product> productList = productService.findByPage(pageNum, pageSize,session,searchKey);

            //子图
            for (Product product:productList){
                if (product.getSubImages()!=null){
                    String[] sub = product.getSubImages().split(",");
                    for (String s:sub){
                        product.getSubimage().add(s);
                    }
                }
            }
            session.setAttribute("productList",productList);

            List<Category> parentCategory = categoryService.findAllParents();
            request.setAttribute("parentCategory",parentCategory);
            return "/product/list";
        }
        return "/product/index";
    }


    //上下架
    @RequestMapping("/grounding")
    public String grounding(@RequestParam("id") int id,
                            @RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
                            @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize,
                            HttpSession session,
                            HttpServletRequest request){

        String searchKey = (String) session.getAttribute("searchKey");
        //当前页
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("size",pageSize);

        int counts = productService.grounding(id);
        if (counts==1){
            List<Product> productList = productService.findByPage(pageNum, pageSize,session,searchKey);

            //子图
            for (Product product:productList){
                if (product.getSubImages()!=null){
                    String[] sub = product.getSubImages().split(",");
                    for (String s:sub){
                        product.getSubimage().add(s);
                    }
                }
            }
            session.setAttribute("productList",productList);

            List<Category> parentCategory = categoryService.findAllParents();
            request.setAttribute("parentCategory",parentCategory);
            return "/product/list";
        }
        return "/product/list";
    }

    @RequestMapping("/undercarriage")
    public String undercarriage(@RequestParam("id") int id,
                                @RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
                                @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize,
                                HttpSession session,
                                HttpServletRequest request){

        String searchKey = (String) session.getAttribute("searchKey");
        //当前页
        request.setAttribute("currentPage",pageNum);
        request.setAttribute("size",pageSize);

        int counts = productService.undercarriage(id);
        if (counts==1){

            List<Product> productList = productService.findByPage(pageNum, pageSize,session,searchKey);

            //子图
            for (Product product:productList){
                if (product.getSubImages()!=null){
                    String[] sub = product.getSubImages().split(",");
                    for (String s:sub){
                        product.getSubimage().add(s);
                    }
                }
            }
            session.setAttribute("productList",productList);

            List<Category> parentCategory = categoryService.findAllParents();
            request.setAttribute("parentCategory",parentCategory);
            return "/product/list";
        }
        return "/product/list";

    }

//    //分页商品模糊查询
//    @RequestMapping(value = "/key_search",method = RequestMethod.GET)
//    public String searchProduct(@RequestParam(name = "page",required = false,defaultValue = "1")Integer pageNum,
//                                @RequestParam(name = "size",required = false,defaultValue = "5")Integer pageSize,
//                                @RequestParam(name = "searchKey")String searchKey,
//                                HttpSession session,
//                                HttpServletRequest request,
//                                @RequestParam(name = "url")String url){
//
//        request.setAttribute("searchKey",searchKey);
//        session.setAttribute("currentPage",pageNum);
//        session.setAttribute("size",pageSize);
//        List<Product> productList = productService.keySearch(pageNum,pageSize,searchKey,session);
//        //子图
//        for (Product product:productList){
//            if (product.getSubImages()!=null){
//                String[] sub = product.getSubImages().split("#");
//                for (String s:sub){
//                    product.getSubimage().add(s);
//                }
//            }
//        }
//        session.setAttribute("productList",productList);
//        List<Category> parentCategory = categoryService.findAllParents();
//        request.setAttribute("parentCategory",parentCategory);
//        return "/product/list";
//    }

}
