package com.test.medical.doctor.entity;

public class Doctor {
    private String dno;
    private String dname;
    private Integer dsex;
    private String department;
    private String position;
    private String phone;
    private Integer count;

    public Doctor() {
    }

    public Doctor(String dno, String dname, Integer dsex, String department, String position, String phone, Integer count) {
        this.dno = dno;
        this.dname = dname;
        this.dsex = dsex;
        this.department = department;
        this.position = position;
        this.phone = phone;
        this.count = count;
    }

    public String getDno() {
        return dno;
    }

    public void setDno(String dno) {
        this.dno = dno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Integer getDsex() {
        return dsex;
    }

    public void setDsex(Integer dsex) {
        this.dsex = dsex;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Doctor{" +
                "dno='" + dno + '\'' +
                ", dname='" + dname + '\'' +
                ", dsex=" + dsex +
                ", department='" + department + '\'' +
                ", position='" + position + '\'' +
                ", phone='" + phone + '\'' +
                ", count=" + count +
                '}';
    }
}
