package com.xilingf.crud.controller;

import com.xilingf.crud.bean.Department;
import com.xilingf.crud.bean.Msg;
import com.xilingf.crud.service.DepartmentSerice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理部门有关的请求
 * Created by tangz_000 on 2017/10/13 0013.
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentSerice departmentSerice;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDepts(){
        //
        List<Department> deptList = departmentSerice.getDepts();
        return Msg.success().add("depts", deptList);
    }
}
