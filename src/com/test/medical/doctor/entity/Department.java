package com.test.medical.doctor.entity;

public class Department {
    private Integer deno;
    private String department;

    public Department() {
    }

    public Department(Integer deno, String department) {
        this.deno = deno;
        this.department = department;
    }

    public Integer getDeno() {
        return deno;
    }

    public void setDeno(Integer deno) {
        this.deno = deno;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Department{" +
                "deno=" + deno +
                ", department='" + department + '\'' +
                '}';
    }
}
