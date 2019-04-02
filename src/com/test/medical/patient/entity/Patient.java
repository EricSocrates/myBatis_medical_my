package com.test.medical.patient.entity;

import java.util.Date;

public class Patient {
    private String pno;
    private String pname;
    private String identify;
    private Integer psex;
    private Integer age;
    private String dname;
    private String department;
    private Double totalcost;
    private Date treatedate;
    private Date arrivedate;
    private String notes;

    public Patient() {
    }

    public Patient(String pno, String pname, String identify, Integer psex, Integer age, String dname, String department, Double totalcost, Date treatedate, Date arrivedate, String notes) {
        this.pno = pno;
        this.pname = pname;
        this.identify = identify;
        this.psex = psex;
        this.age = age;
        this.dname = dname;
        this.department = department;
        this.totalcost = totalcost;
        this.treatedate = treatedate;
        this.arrivedate = arrivedate;
        this.notes = notes;
    }

    public String getPno() {
        return pno;
    }

    public void setPno(String pno) {
        this.pno = pno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getIdentify() {
        return identify;
    }

    public void setIdentify(String identify) {
        this.identify = identify;
    }

    public Integer getPsex() {
        return psex;
    }

    public void setPsex(Integer psex) {
        this.psex = psex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Double getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(Double totalcost) {
        this.totalcost = totalcost;
    }

    public Date getTreatedate() {
        return treatedate;
    }

    public void setTreatedate(Date treatedate) {
        this.treatedate = treatedate;
    }

    public Date getArrivedate() {
        return arrivedate;
    }

    public void setArrivedate(Date arrivedate) {
        this.arrivedate = arrivedate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    @Override
    public String toString() {
        return "Patient{" +
                "pno='" + pno + '\'' +
                ", pname='" + pname + '\'' +
                ", identify='" + identify + '\'' +
                ", psex=" + psex +
                ", age=" + age +
                ", dname='" + dname + '\'' +
                ", department='" + department + '\'' +
                ", totalcost=" + totalcost +
                ", treatedate=" + treatedate +
                ", arrivedate=" + arrivedate +
                ", notes='" + notes + '\'' +
                '}';
    }
}
