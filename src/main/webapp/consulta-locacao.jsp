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
<title>Consula de locações</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>

<body>
	<h1>Consulta de locações</h1>
	<hr />
	<div>
		<a href="index.html"> Home </a> <a href="cadastro-locacao.html">
			Cadastro de locações</a>
	</div>
	<hr />
	<div class="pesquisa">
	<input class="pesquisa" id="pesquisa" type="text" placeholder="Pesquisar por placa, data ou cliente" onkeydown="pesquisarPorPlaca()">
	</div>
	<table>
		<thead>
			<tr>
				<th>Id</th>
				<th>Veículo</th>
				<th>Cliente</th>
				<th>Data de Início</th>
				<th>Data Final</th>
				<th>Valor total</th>
				<th>Editar</th>
				<th>Excluir</th>
			</tr>

		</thead>
		<tbody>
			<%
			
			
			LocacaoControler loControler = new LocacaoControler();
			List<Locacao> locacoes = loControler.getAll();
			for (Locacao l : locacoes) {
				Cliente c = ClienteDao.getClienteById(l.getIdCliente());
				Veiculo v = VeiculoDao.getVeiculoById(l.getIdVeiculo());
				out.print("<tr>");
				out.print("<td>" + l.getId() + "</td>");
				out.print("<td>" + v.getPlaca() + "</td>");
				out.print("<td>" + c.getNome() + "</td>");
				out.print("<td>" + l.getDataInicio() + "</td>");
				out.print("<td>" + l.getDataFim() + "</td>");
				out.print("<td>" + l.getValorTotal() + "</td>");
				out.print("<td><a href='editar-veiculo.jsp?id=" + l.getId() + "'>editar</a></td>");
				out.print("<td><button class='excluir' onclick='excluir(" + l.getId() + ")'>excluir</button></td>");
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
			window.location.href = "excluir-locacao.jsp?id=" + id;
		}
	}
	
	</script>
</body>

</html>