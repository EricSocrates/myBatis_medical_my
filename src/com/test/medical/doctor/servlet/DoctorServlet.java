package com.test.medical.doctor.servlet;

import com.test.medical.common.page.Page;
import com.test.medical.doctor.entity.Department;
import com.test.medical.doctor.entity.Doctor;
import com.test.medical.doctor.entity.Position;
import com.test.medical.doctor.service.DepartmentService;
import com.test.medical.doctor.service.DoctorService;
import com.test.medical.doctor.service.PositionService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.List;

@WebServlet(name = "DoctorServlet", urlPatterns = "/doctor")
public class DoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/plain;charset=utf-8");
        String method = request.getParameter("method");
        try {
            Class c = this.getClass();
            Method m = c.getDeclaredMethod(method, HttpServletRequest.class, HttpServletResponse.class);
            //当前这个类中的这个方法  被  执行了
            //反射相当于将陈述句变为被动句
            m.invoke(this, request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void queryAllDepartment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DepartmentService service = new DepartmentService();
        List<Department> dList = service.queryAllDepartment();
        JSONArray ja = JSONArray.fromObject(dList);
        PrintWriter out = response.getWriter();
        out.print(ja);
        out.close();
    }

    protected void queryPositionByDeno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PositionService service = new PositionService();
        String department = request.getParameter("department");
        List<Position> pList = service.queryPositionByDepartment(department);
        JSONArray ja = JSONArray.fromObject(pList);
        PrintWriter out = response.getWriter();
        out.print(ja);
        out.close();
    }

    protected void addDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService service = new DoctorService();
        String dname = request.getParameter("dname");
        System.out.println(dname);
        int dsex = Integer.parseInt(request.getParameter("dsex"));
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        String phone = request.getParameter("phone");
        Doctor doctor = new Doctor(null, dname, dsex, department, position, phone, 0);
        Integer affectRows = service.addDoctor(doctor);
        PrintWriter out = response.getWriter();
        if (affectRows != null) {
            out.print("success");
        } else out.print("fail");
        out.close();
    }

    protected void queryDoctorSeparated(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService service = new DoctorService();
        int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String keyWord = request.getParameter("keyWord");
        Page<Doctor> p = service.queryDoctorSeparated(pageNumber, pageSize, keyWord);
        JSONArray ja = JSONArray.fromObject(p);
        PrintWriter out = response.getWriter();
        out.print(ja);
        out.close();
    }

    protected void delDoctorByDno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService service = new DoctorService();
        String dno = request.getParameter("dno");
        service.delDoctorByDno(dno);
        PrintWriter out = response.getWriter();
        out.print("success");
        out.close();
    }

    protected void queryDoctorByDno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService service = new DoctorService();
        String dno = request.getParameter("dno");
        Doctor d = service.queryDoctorByDno(dno);
        JSONObject jo = JSONObject.fromObject(d);
        PrintWriter out = response.getWriter();
        out.print(jo);
        out.close();
    }

    protected void updateDoctorByDno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService service = new DoctorService();
        String dno = request.getParameter("dno");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        Doctor d = new Doctor();
        d.setDno(dno);
        d.setPhone(phone);
        d.setDepartment(department);
        d.setPosition(position);
        service.updateDoctorByDno(d);
        PrintWriter out = response.getWriter();
        out.print("success");
        out.close();
    }

    protected void queryAllDoctor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService service = new DoctorService();
        List<Doctor> dList = service.queryAllDoctor();
        JSONArray ja = JSONArray.fromObject(dList);
        PrintWriter out = response.getWriter();
        out.print(ja);
        out.close();
    }

    protected void queryDepartmentByDname(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DoctorService service = new DoctorService();
        String dname = request.getParameter("dname");
        String s = service.queryDepartmentByDname(dname);
        PrintWriter out = response.getWriter();
        out.print(s);
        out.close();
    }
}
