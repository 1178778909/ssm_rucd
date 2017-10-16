package com.xilingf.crud.test;

import com.xilingf.crud.dao.DepartmentMapper;
import com.xilingf.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试dao层的工作
 * Created by tangz_000 on 2017/10/11 0011.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sessionTemplate;

    @Test
    public void textCRUD() {
        EmployeeMapper mapper = sessionTemplate.getMapper(EmployeeMapper.class);

        System.out.println(employeeMapper.selectByPrimaryKeyWithDept(4002).getDepartment().getDeptName());
    }
}
