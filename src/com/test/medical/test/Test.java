package com.test.medical.test;

import com.test.medical.common.factory.SF;
import com.test.medical.doctor.dao.DoctorMapper;
import com.test.medical.doctor.entity.Department;
import com.test.medical.doctor.entity.Position;
import com.test.medical.doctor.service.DepartmentService;
import com.test.medical.doctor.service.PositionService;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        /*DepartmentService service = new DepartmentService();
        List<Department> dList = service.queryAllDepartment();
        for(Department dept : dList){
            System.out.println(dept);
        }*/
        /*PositionService service = new PositionService();
        List<Position> dList = service.queryPositionBtDeno(1);
        for(Position pos : dList){
            System.out.println(pos);
        }*/

/*        SqlSession session = null;
        Integer count = 0;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            count = Integer.parseInt(dao.getLastDno().substring(10)) + 1;
            System.out.println(count);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if(session != null) session.rollback();
        } finally {
            if(session != null) session.close();
        }*/

    }
}
