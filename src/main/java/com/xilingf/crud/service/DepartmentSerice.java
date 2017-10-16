package com.xilingf.crud.service;

import com.xilingf.crud.bean.Department;
import com.xilingf.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by tangz_000 on 2017/10/13 0013.
 */
@Service
public class DepartmentSerice {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
