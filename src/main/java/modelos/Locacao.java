package modelos;

import java.util.Date;

public class Locacao {

	private int id;
	private int idCliente;
	private int idVeiculo;
	private Date dataInicio;
	private Date dataFim;
	private double valorTotal;
	
	public Locacao() {}

	public Locacao(int idCliente, int idVeiculo, Date dataInicio, Date dataFim, double valorTotal) {
		super();
		this.idCliente = idCliente;
		this.idVeiculo = idVeiculo;
		this.dataInicio = dataInicio;
		this.dataFim = dataFim;
		this.valorTotal = valorTotal;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public int getIdVeiculo() {
		return idVeiculo;
	}

	public void setIdVeiculo(int idVeiculo) {
		this.idVeiculo = idVeiculo;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public double getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(double valorTotal) {
		this.valorTotal = valorTotal;
	}

	
	
	
	
}
