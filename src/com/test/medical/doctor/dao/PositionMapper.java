package com.test.medical.doctor.dao;

import com.test.medical.doctor.entity.Department;
import com.test.medical.doctor.entity.Position;

import java.util.List;

public interface PositionMapper {
    public List<Position> queryPositionByDepartment(String department);
}
