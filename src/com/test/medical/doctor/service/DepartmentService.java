package com.test.medical.doctor.service;

import com.test.medical.common.factory.SF;
import com.test.medical.doctor.dao.DepartmentMapper;
import com.test.medical.doctor.entity.Department;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class DepartmentService {
    public List<Department> queryAllDepartment() {
        SqlSession session = null;
        try {
            session = SF.getSession();
            DepartmentMapper dao = session.getMapper(DepartmentMapper.class);
            List<Department> dept = dao.queryAllDepartment();
            session.commit();
            return dept;
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }
}
