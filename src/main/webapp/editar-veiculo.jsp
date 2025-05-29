<%@page import="dao.*"%>
<%@page import="modelos.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edição de veículos</title>
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <%  
        if ("POST".equals(request.getMethod())) {
            String id = request.getParameter("id");
            String placa = request.getParameter("placa");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String ano = request.getParameter("ano");
            String preco_diaria = request.getParameter("preco_diaria");
            
            Veiculo vei = new Veiculo();
            vei.setId(Integer.parseInt(id));
            vei.setPlaca(placa);
            vei.setMarca(marca);
            vei.setModelo(modelo);
            vei.setAno(Integer.parseInt(ano));
            vei.setPrecoDiaria(Double.parseDouble(preco_diaria));

            VeiculoDao.alterar(vei);
            response.sendRedirect("./consulta-veiculo.jsp");
            return;
        }
    %>
    
    <%
        String id = request.getParameter("id");
        Veiculo veiculo = VeiculoDao.getVeiculoById(Integer.parseInt(id));
    %>
    <div class="container">
        <h1>
            Editar veículo:
            <%
        out.print(id);
        %>
        </h1>
        <div>
            <a href="index.html"> Home </a> 
            <a href="cadastro-veiculo.jsp"> Cadastro Veículo </a> 
            <a href="consulta-veiculo.jsp"> Consulta Veículo </a>
        </div>
        <form id="fcad" action="editar-veiculo.jsp" method="POST">
            <input type="hidden" id="id" name="id" value="<%out.print(veiculo.getId());%>" />
            <label for="placa">Informe placa</label>
            <input type="text" id="placa" name="placa" placeholder="EX: ABC1234"
                value="<%out.print(veiculo.getPlaca());%>" />
            <label for="marca">Informe marca</label>
            <input type="text" id="marca" name="marca" placeholder="EX: Fiat"
                value="<%out.print(veiculo.getMarca());%>" />
            <label for="modelo">Informe modelo</label>
            <input type="text" id="modelo" name="modelo" placeholder="EX: Uno"
                value="<%out.print(veiculo.getModelo());%>" />
            <label for="ano">Informe ano</label>
            <input type="number" id="ano" name="ano" placeholder="EX: 2020"
                value="<%out.print(veiculo.getAno());%>" />
            <label for="preco_diaria">Informe preço diária</label>
            <input type="number" step="0.01" id="preco_diaria" name="preco_diaria" placeholder="EX: 99.90"
                value="<%out.print(veiculo.getPrecoDiaria());%>" />
            <input type="button" value="salvar" onclick="gravar()" />
        </form>
    </div>
    
    
    <script>
        function gravar(){
        	var placa = document.getElementById("placa");
        	if(placa.value === ""){
        		alert("A placa deve ser informada");
        		placa.focus();
        		return;
        	}
        	var marca = document.getElementById("marca");
        	if(marca.value === ""){
        		alert("A marca deve ser informada");
        		marca.focus();
        		return;
        	}
        	var modelo = document.getElementById("modelo");
        	if(modelo.value === ""){
        		alert("O modelo deve ser informado");
        		modelo.focus();
        		return;
        	}
        	var ano = document.getElementById("ano");
        	if(ano.value === ""){
        		alert("O ano deve ser informado");
        		ano.focus();
        		return;
        	}
        	var preco = document.getElementById("preco_diaria");
        	if(preco.value === ""){
        		alert("O preço da diária deve ser informado");
        		preco.focus();
        		return;
        	}
        	document.getElementById("fcad").submit();
        }
    </script>
</body>
</html>