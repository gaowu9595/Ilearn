package com.ilearn.controller;

import com.ilearn.dao.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/Ilearn")
public class IndexController {


    @Autowired
    @Qualifier("categoryDao")
    private CategoryDao categoryDao;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {

        List<String> firstCates;

        firstCates = categoryDao.getFirstCategory();

        model.addAttribute("firstcates",firstCates);
        for(String s : firstCates){
            System.out.println("test : " + s);
        }

        return "index";
    }

}