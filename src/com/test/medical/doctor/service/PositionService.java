package com.test.medical.doctor.service;

import com.test.medical.common.factory.SF;
import com.test.medical.doctor.dao.DepartmentMapper;
import com.test.medical.doctor.dao.PositionMapper;
import com.test.medical.doctor.entity.Department;
import com.test.medical.doctor.entity.Position;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class PositionService {
    public List<Position> queryPositionByDepartment(String department) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            PositionMapper dao = session.getMapper(PositionMapper.class);
            List<Position> dept = dao.queryPositionByDepartment(department);
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
