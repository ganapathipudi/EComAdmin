package com.daniel.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daniel.dao.EmployeeDao;
import com.daniel.model.Employee;

public class EmployeeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/Employee.jsp";
    private static String LIST_employee = "/listEmployee.jsp";
    private EmployeeDao dao;

    public EmployeeController() {
        super();
        dao = new EmployeeDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")){
            int employeeId = Integer.parseInt(request.getParameter("employeeId"));
            dao.deleteEmployee(employeeId);
            forward = LIST_employee;
            request.setAttribute("employees", dao.getAllEmployees());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int employeeId = Integer.parseInt(request.getParameter("employeeId"));
            Employee employee = dao.getEmployeeById(employeeId);
            request.setAttribute("employee", employee);
        } else if (action.equalsIgnoreCase("listEmployee")){
            forward = LIST_employee;
            request.setAttribute("employees", dao.getAllEmployees());
        }else if(action.equalsIgnoreCase("listEmployee")) {
        	
        }
        else 
        {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Employee employee = new Employee();
        employee.setEmployeeName(request.getParameter("employeeName"));
       
        try {
            Date employeeDob = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("employeeDob"));
            employee.setEmployeeDob(employeeDob);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        employee.setEmployeeAddress(request.getParameter("employeeAddress"));
        employee.setEmployeeEmail(request.getParameter("employeeEmail"));
        String employeeid = request.getParameter("employeeId");
        if(employeeid == null || employeeid.isEmpty())
        {
            dao.addEmployee(employee);
        }
        else
        {
            employee.setEmployeeId(Integer.parseInt(employeeid));
            dao.updateEmployee(employee);
        }
        RequestDispatcher view = request.getRequestDispatcher(LIST_employee);
        request.setAttribute("employees", dao.getAllEmployees());
        view.forward(request, response);
    }
}