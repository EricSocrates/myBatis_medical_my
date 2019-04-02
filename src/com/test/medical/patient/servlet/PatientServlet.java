package com.test.medical.patient.servlet;

import com.test.medical.common.page.Page;
import com.test.medical.patient.entity.Patient;
import com.test.medical.patient.service.PatientService;
import net.sf.json.JSONArray;
import sun.java2d.pipe.SpanShapeRenderer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "PatientServlet", urlPatterns = "/patient")
public class PatientServlet extends HttpServlet {

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

    protected void addPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        PatientService ps = new PatientService();
        String pname = request.getParameter("pname");
        String identify = request.getParameter("identify");
        Integer psex = Integer.parseInt(request.getParameter("psex"));
        Integer age = Integer.parseInt(request.getParameter("age"));
        String dname = request.getParameter("dname");
        String department = request.getParameter("department");
        Double totalcost = Double.parseDouble(request.getParameter("totalcost"));

        Integer inpatient = Integer.parseInt(request.getParameter("inpatient"));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String aDate = sdf.format(new Date());
        Date dDate = sdf.parse(aDate);

        Date arrivedate = (inpatient == 1 ? sdf.parse(request.getParameter("arrivedate")) : null);
        Date treatdate = dDate;
        String notes = request.getParameter("notes");

        boolean flag = ps.addPatient(new Patient(null, pname, identify, psex, age, dname, department, totalcost, treatdate, arrivedate, notes));

        PrintWriter out = response.getWriter();
        if (flag) out.print("success");
        else out.print("fail");
        out.close();
    }

    protected void queryPatientSeparated(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PatientService service = new PatientService();
        int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String keyWord = request.getParameter("keyWord");
        String type = request.getParameter("type");
        Page<Patient> p = service.queryPatientSeparated(pageNumber, pageSize, keyWord, type);
        JSONArray ja = JSONArray.fromObject(p);
        PrintWriter out = response.getWriter();
        out.print(ja);
        out.close();
    }

    protected void delPatientByPno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PatientService service = new PatientService();
        String pno = request.getParameter("pno");
        service.delPatientByPno(pno);
        PrintWriter out = response.getWriter();
        out.print("success");
        out.close();
    }
}
