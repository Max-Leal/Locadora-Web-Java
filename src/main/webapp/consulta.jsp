<%@page import="modelos.Cliente"%>
<%@page import="controles.ClienteControler"%>
<%@page import="dao.ClienteDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>

<body>
	<h1>Consulta de clientes</h1>
	<hr />
	<div>
		<a href="index.html"> Home </a> <a href="cadastro.html"> Cadastro de clientes
		</a>
	</div>
	<hr />
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Fone</th>
			</tr>

		</thead>
		<tbody>
			<%
			// ClienteDao clidao=new ClienteDao(); // ClienteControler cliControler=new
			ClienteControler cliControler = new ClienteControler();
			List<Cliente> clientes = cliControler.getAll();
			for (Cliente c : clientes) {
				out.print("<tr>");
				out.print("<td>" + c.getId() + "</td>");
				out.print("<td>" + c.getNome() + "</td>");
				out.print("<td>" + c.getEmail() + "</td>");
				out.print("<td>" + c.getFone() + "</td>");
				out.print("</tr>");
			}
			%>
		</tbody>

	</table>
</body>

</html>