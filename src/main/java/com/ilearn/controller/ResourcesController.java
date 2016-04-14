package com.ilearn.controller;

import com.ilearn.bean.ResourcesEntity;
import com.ilearn.dao.ResourcesDao;
import com.ilearn.page.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by tsj on 16-4-8.
 * 获取资源用的controller
 */
@Controller
@RequestMapping("/Ilearn/resource")
public class ResourcesController {
    private static final String ORDERBYCOLLECTION = "collection";
    private static final String ORDERBYREMARK = "remark";
    private static final int PAGESIZE = 20;

    @Autowired
    private ResourcesDao resourcesDao;

    @RequestMapping(value = "/course" , method = RequestMethod.GET)
    public String list(Model model){

        model.addAttribute("coursePage1",resourcesDao.queryByPage(1,20));

        return "course";
    }


    /**
     * 根据三级目录的id查找资源
     * @param id
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/course/{id}/{pageNum}" , method = RequestMethod.GET)
    public Page<ResourcesEntity> getPageResoucesOfLeaf(@PathVariable("id") int id ,
                                        @PathVariable("pageNum") int pageNum){

        return resourcesDao.getPageResourcesOfLeaf(id,pageNum);

    }


    /**
     * 根据一级或二级目录的名字查找资源
     * @param cateName
     * @param pageNum
     * @return
     */
    @RequestMapping(value = "/course/{cateName}/{pageNum}" , method = RequestMethod.GET)
    public Page<ResourcesEntity> getPageResoucesOfCateName(@PathVariable("cateName") String cateName ,
                                                           @PathVariable("pageNum") int pageNum){

        return resourcesDao.getPageResourcesOfCateName(cateName,pageNum);

    }







    //    根据前端给出的参数对资源进行排序
    @RequestMapping(value = "/sort", method = RequestMethod.POST)
    public String sort(HttpServletRequest request, HttpServletResponse response,
                                      @RequestParam String sort) {
        List<ResourcesEntity> resourcesEntities = (List<ResourcesEntity>) request.getSession().getAttribute("list");
        for (int i = 0; i < resourcesEntities.size(); i++) {
            for (int j = i + 1; j < resourcesEntities.size(); j++) {
                if (sort.equals(ORDERBYCOLLECTION)) {
                    if (resourcesEntities.get(i).getCollection() < resourcesEntities.get(j).getCollection()) {
                        int temp = resourcesEntities.get(i).getCollection();
                        resourcesEntities.get(i).setCollection(resourcesEntities.get(j).getCollection());
                        resourcesEntities.get(j).setCollection(temp);

                    }
                } else if (sort.equals(ORDERBYREMARK)) {
                    if (resourcesEntities.get(i).getRemark() < resourcesEntities.get(j).getRemark()) {
                        int temp = resourcesEntities.get(i).getRemark();
                        resourcesEntities.get(i).setRemark(resourcesEntities.get(j).getRemark());
                        resourcesEntities.get(j).setRemark(temp);
                    }

                }
            }

        }
        request.getSession().setAttribute("list",resourcesEntities);
        return "";

    }

//    分页显示，根据所需的页数提供数据
    @RequestMapping(value = "/listbypage" , method = RequestMethod.POST)
    public String ListByPage(HttpServletRequest request,
                           HttpServletResponse response,@RequestParam int page){
        List<ResourcesEntity> list =  resourcesDao.queryByPage(page,PAGESIZE).getList();
        request.getSession().setAttribute("list", list);
        for(ResourcesEntity re:list){
            System.out.println(re.getTitle());
        }

        return "";

    }

//    根据给出的目录查询数据，可能是一二或者三级目录
    @RequestMapping(value = "/getresources" , method = RequestMethod.POST)
    public String getResourcesByCate(HttpServletRequest request, HttpServletResponse response,
                                     @RequestParam String category,@RequestParam int grade){
        List<ResourcesEntity> list = resourcesDao.getResourcesByCate(category,grade);
        request.getSession().setAttribute("list",list);
        return "";
    }



}
