package com.test.medical.doctor.service;

import com.test.medical.common.factory.SF;
import com.test.medical.common.page.Page;
import com.test.medical.doctor.dao.DepartmentMapper;
import com.test.medical.doctor.dao.DoctorMapper;
import com.test.medical.doctor.dao.PositionMapper;
import com.test.medical.doctor.entity.Department;
import com.test.medical.doctor.entity.Doctor;
import com.test.medical.doctor.entity.Position;
import org.apache.ibatis.session.SqlSession;

import java.text.SimpleDateFormat;
import java.util.*;

public class DoctorService {
    public Integer addDoctor(Doctor doctor) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            String dname = (dao.queryDoctorByName(doctor.getDname()) == null ? doctor.getDname() : (doctor.getDname() + "（" + doctor.getDepartment() + ")"));
            Integer affectRows = dao.addDoctor(new Doctor(generateDno(), dname, doctor.getDsex(), doctor.getDepartment(), doctor.getPosition(), doctor.getPhone(), null));
            session.commit();
            return affectRows;
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    private String generateDno() {
        StringBuffer dno = new StringBuffer("DC");
        dno.append(new SimpleDateFormat("yyyyMMdd").format(new Date().getTime()));
        SqlSession session = null;
        Integer count = 0;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            count = Integer.parseInt(dao.getLastDno().substring(10)) + 1;
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
        Integer cLength = count.toString().length();
        for (int i = 0; i < 4 - cLength; i++) {
            dno.append("0");
        }
        dno.append(count);
        return dno.toString();
    }

    public Page<Doctor> queryDoctorSeparated(int pageNumber, int pageSize, String keyWord) {
        Page<Doctor> p = new Page();
        p.setPageNumber(pageNumber);
        p.setPageSize(pageSize);
        SqlSession session = null;
        List<Doctor> dList = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            map.put("start", p.getStart());
            map.put("pageSize", p.getPageSize());
            map.put("keyWord", keyWord);
            dList = dao.queryDoctorSeparated(map);
            Integer count = dao.countDoctor();
            p.setTotal(count);
            p.setRows(dList);
            session.commit();
            return p;
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    public void delDoctorByDno(String dno) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            dao.delDoctorByDno(dno);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
        } finally {
            if (session != null) session.close();
        }
    }

    public Doctor queryDoctorByDno(String dno) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            session.commit();
            return dao.queryDoctorByDno(dno);
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    public List<Doctor> queryAllDoctor() {
        SqlSession session = null;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            List<Doctor> dList = dao.queryAllDoctor();
            session.commit();
            return dList;
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    public void updateDoctorByDno(Doctor d) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            dao.updateDoctorByDno(d);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
        } finally {
            if (session != null) session.close();
        }
    }

    public String queryDepartmentByDname(String dname) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            DoctorMapper dao = session.getMapper(DoctorMapper.class);
            Doctor d = dao.queryDoctorByName(dname);
            session.commit();
            return d.getDepartment();
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }
}
