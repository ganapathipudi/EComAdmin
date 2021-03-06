<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<title>Add new employee</title>
</head>
<body>
    <script>
        $(function() {
            $('input[name=employeeDob]').datepicker();
        });
    </script>

    <form method="POST" action='EmployeeController' name="frmAddemployee">
        employee ID : <input type="text" readonly="readonly" name="employeeId"
            value="<c:out value="${employee.employeeId}" />" /> <br /> 
        Employee Name : <input
            type="text" name="employeeName"
            value="<c:out value="${employee.employeeName}" />" /> <br /> 
       	employee Dob : <input
            type="text" name="employeeDob"
            value="<fmt:formatDate pattern="dd/MM/yyyy" value="${employee.employeeDob}" />" /> <br /> 
        employee Address : <input type="text" name="employeeAddress"
            value="<c:out value="${employee.employeeAddress}" />" /> <br /> 
        Employee Email : <input
            type="text" name="employeeEmail"
            value="<c:out value="${employee.employeeEmail}" />" /> <br />
        Employee Password : <input
            type="password" name="employeePassword"
            value="<c:out value="${employee.employeePassword}" />" /> <br />
            
            <input
            type="submit" value="Register" />
    </form>
</body>
</html>