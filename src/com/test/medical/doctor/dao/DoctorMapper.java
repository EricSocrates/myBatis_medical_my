package com.test.medical.doctor.dao;

import com.test.medical.doctor.entity.Doctor;

import java.util.List;
import java.util.Map;

public interface DoctorMapper {
    public Integer addDoctor(Doctor doctor);

    public Doctor queryDoctorByName(String name);

    public Doctor queryDoctorByDno(String dno);

    public Integer countDoctor();

    public List<Doctor> queryDoctorSeparated(Map<String, Object> map);

    public void delDoctorByDno(String dno);

    public void updateDoctorByDno(Doctor d);

    public String getLastDno();

    public List<Doctor> queryAllDoctor();
}
