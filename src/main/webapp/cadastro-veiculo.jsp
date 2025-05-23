<%@page import="controles.*"%>
<%@page import="dao.*"%>
<%@page import="modelos.*"%>

<%
   String placa = request.getParameter("placa");
   String marca = request.getParameter("marca");
   String modelo = request.getParameter("modelo");
   Integer ano = Integer.parseInt(request.getParameter("ano"));
   Double precoDiaria = Double.parseDouble(request.getParameter("precoDiaria")) ;
   
   Veiculo veiculo = new Veiculo(placa,marca,modelo,ano,precoDiaria);
   
  // ClienteDao clidao = new ClienteDao();
   //ClienteControler cliControler = new ClienteControler(clidao);
   VeiculoControler veiControler = new VeiculoControler();
   veiControler.salvar(veiculo);
   response.sendRedirect("consulta-veiculo.jsp");
%>
