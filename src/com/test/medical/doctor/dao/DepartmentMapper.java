package com.test.medical.doctor.dao;

import com.test.medical.doctor.entity.Department;

import java.util.List;

public interface DepartmentMapper {
    public List<Department> queryAllDepartment();
}