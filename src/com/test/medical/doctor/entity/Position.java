package com.test.medical.doctor.entity;

public class Position {
    private Integer pono;
    private String position;
    private String department;

    public Position() {
    }

    public Position(Integer pono, String position, String department) {
        this.pono = pono;
        this.position = position;
        this.department = department;
    }

    public Integer getPono() {
        return pono;
    }

    public void setPono(Integer pono) {
        this.pono = pono;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Position{" +
                "pono=" + pono +
                ", position='" + position + '\'' +
                ", department='" + department + '\'' +
                '}';
    }
}
