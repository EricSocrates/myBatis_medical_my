package com.test.medical.patient.service;

import com.test.medical.common.factory.SF;
import com.test.medical.common.page.Page;
import com.test.medical.doctor.dao.DoctorMapper;
import com.test.medical.doctor.entity.Doctor;
import com.test.medical.patient.dao.PatientMapper;
import com.test.medical.patient.entity.Patient;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PatientService {
    public boolean addPatient(Patient patient) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            PatientMapper dao_p = session.getMapper(PatientMapper.class);
            DoctorMapper dao_d = session.getMapper(DoctorMapper.class);
            Doctor d = dao_d.queryDoctorByName(patient.getDname());
            Map<String, Object> map = new HashMap<>();
            map.put("dname", patient.getDname());
            map.put("treatedate", patient.getTreatedate());
            if (dao_p.countDoctorByDay(map) != null && dao_p.countDoctorByDay(map) >= 2) return false;
            dao_p.addPatient(patient);
            d.setCount(d.getCount() + 1);
            dao_d.updateDoctorByDno(d);
            session.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    public Page<Patient> queryPatientSeparated(int pageNumber, int pageSize, String keyWord, String type) {
        Page<Patient> p = new Page();
        p.setPageNumber(pageNumber);
        p.setPageSize(pageSize);
        SqlSession session = null;
        List<Patient> dList = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        try {
            session = SF.getSession();
            PatientMapper dao = session.getMapper(PatientMapper.class);
            map.put("start", p.getStart());
            map.put("pageSize", p.getPageSize());
            if ("1".equals(type)) map.put("dKeyWord", keyWord);
            else if ("2".equals(type)) map.put("pKeyWord", keyWord);
            dList = dao.queryPatientSeparated(map);
            Integer count = dao.countPatient();
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

    public void delPatientByPno(String pno) {
        SqlSession session = null;
        try {
            session = SF.getSession();
            PatientMapper dao = session.getMapper(PatientMapper.class);
            dao.delPatientByPno(pno);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (session != null) session.rollback();
        } finally {
            if (session != null) session.close();
        }
    }
}
