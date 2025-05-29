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
<title>Consulta de clientes</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>

<body>
	<h1>Consulta de clientes</h1>
	<hr />
	<div>
		<a href="index.html"> Home </a> <a href="cadastro.html"> Cadastro
			de clientes </a>
	</div>
	<hr />
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Email</th>
				<th>Fone</th>
				<th>Editar</th>
				<th>Excluir</th>
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
				out.print("<td><a href='./editar.jsp?id=" + c.getId() + "'>editar</a></td>");
				out.print("<td><button class='excluir' onclick='excluir(" + c.getId() + ")'>excluir</button></td>");
				out.print("</tr>");
			}
			%>
		</tbody>

	</table>

	<script type="text/javascript">
		function excluir(id) {
			if (confirm("Tem certeza que deseja excluir este cliente?")) {
				window.location.href = "excluir.jsp?id=" + id;
			}
		}
	</script>
</body>

</html>