package com.test.medical.patient.dao;

import com.test.medical.patient.entity.Patient;

import java.util.List;
import java.util.Map;

public interface PatientMapper {
    public void addPatient(Patient patient);

    public Integer countDoctorByDay(Map<String, Object> map);

    public List<Patient> queryPatientSeparated(Map<String, Object> map);

    public Integer countPatient();

    public void delPatientByPno(String pno);
}
