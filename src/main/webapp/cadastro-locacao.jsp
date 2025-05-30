<%@page import="controles.*"%>
<%@page import="dao.*"%>
<%@page import="modelos.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>

<%
    String placa = request.getParameter("placa");
    String nomeCliente = request.getParameter("nomeCliente");
    String dataInicialStr = request.getParameter("dataInicial");
    String dataFimStr = request.getParameter("dataFim");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date dataInicialUtil = null;
    java.util.Date dataFimUtil = null;
    try {
        dataInicialUtil = sdf.parse(dataInicialStr);
        dataFimUtil = sdf.parse(dataFimStr);
    } catch (Exception e) {
        out.print("Erro ao converter datas: " + e.getMessage());
        return;
    }

    Date dataInicial = new Date(dataInicialUtil.getTime());
    Date dataFim = new Date(dataFimUtil.getTime());

    int idVeiculo = VeiculoDao.getIdByPlaca(placa);
    int idCliente = ClienteDao.getIdByNome(nomeCliente);

    if (idVeiculo == 0) {
        out.println("<script>alert('Veículo não encontrado! Cadastre o veículo primeiro.'); window.location.href='cadastro-veiculo.html';</script>");
        return;
    }
    if (idCliente == 0) {
        out.println("<script>alert('Cliente não encontrado! Cadastre o cliente primeiro.'); window.location.href='cadastro-cliente.html';</script>");
        return;
    }

    if (dataFim.before(dataInicial)) {
        out.println("<script>alert('A data de fim não pode ser anterior à data de início!'); window.location.href='cadastro-locacao.html';</script>");
        return;
    }

    Locacao locacao = new Locacao(idCliente, idVeiculo, dataInicial, dataFim, 0.0);

    LocacaoControler locacaoControler = new LocacaoControler();
    locacaoControler.salvar(locacao);

    response.sendRedirect("consulta-locacao.jsp");
%>