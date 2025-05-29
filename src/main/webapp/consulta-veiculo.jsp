<%@page import="modelos.*"%>
<%@page import="controles.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Consula veículos</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>

<body>
	<h1>Consulta de veiculos</h1>
	<hr />
	<div>
		<a href="index.html"> Home </a> <a href="cadastro-veiculo.html">
			Cadastro de veículos</a>
	</div>
	<hr />
	<div>
	<input class="pesquisa" id="pesquisa" type="text" placeholder="Pesquisar por placa" onkeydown="pesquisarPorPlaca()">
	</div>
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Placa</th>
				<th>Marca</th>
				<th>Modelo</th>
				<th>Ano</th>
				<th>Preço diária</th>
				<th>Editar</th>
				<th>Excluir</th>
			</tr>

		</thead>
		<tbody>
			<%
			
			VeiculoControler veiControler = new VeiculoControler();
			List<Veiculo> veiculos = veiControler.getAll();
			for (Veiculo v : veiculos) {
				out.print("<tr>");
				out.print("<td>" + v.getId() + "</td>");
				out.print("<td>" + v.getPlaca() + "</td>");
				out.print("<td>" + v.getMarca() + "</td>");
				out.print("<td>" + v.getModelo() + "</td>");
				out.print("<td>" + v.getAno() + "</td>");
				out.print("<td>" + v.getPrecoDiaria() + "</td>");
				out.print("<td><a href='editar-veiculo.jsp?id=" + v.getId() + "'>editar</a></td>");
				out.print("<td><button class='excluir' onclick='excluir(" + v.getId() + ")'>excluir</button></td>");
				out.print("</tr>");
			}
			%>
		</tbody>

	</table>
	
	<script>
	function pesquisarPorPlaca() {

    let textoPesquisa = document.getElementById("pesquisa").value.toLowerCase();
    let linhas = document.querySelectorAll("table tbody tr");

    linhas.forEach(linha => {
        let textoPlaca = linha.cells[1].textContent.toLowerCase();
        if (textoPlaca.includes(textoPesquisa) || textoPesquisa === "") {
            linha.style.display = "";
        } else {
            linha.style.display = "none";
        }
    });
}
	
	function excluir(id) {
		if (confirm("Tem certeza que deseja excluir este veículo?")) {
			window.location.href = "excluir-veiculo.jsp?id=" + id;
		}
	}
	
	</script>
</body>

</html>