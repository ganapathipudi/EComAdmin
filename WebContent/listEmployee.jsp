<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All Employees</title>
</head>
<body>
	<h2>Employee Management</h2>
	<table border=1>
		<thead>
			<tr>
				<th>Employee Id</th>
				<th>Employee Name</th>
			
				<th>Employee DOB</th>
				<th>Employee Address</th>
				<th>Employee Email</th>
				<th colspan=2>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${employees}" var="employee">
				<tr>
					<td><c:out value="${employee.employeeId}" /></td>
					<td><c:out value="${employee.employeeName}" /></td>
					
					<td><fmt:formatDate pattern="yyyy-MMM-dd" value="${employee.employeeDob}" /></td>
					<td><c:out value="${employee.employeeAddress}" /></td>
					<td><c:out value="${employee.employeeEmail}" /></td>
					
					<td><a
						href="EmployeeController?action=edit&employeeId=<c:out value="${employee.employeeId}"/>">Update</a></td>
					<td><a
						href="EmployeeController?action=delete&employeeId=<c:out value="${employee.employeeId}"/>">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p><a href="EmployeeController?action=insert">Add Employee</a></p>
</body>
</html>