package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import modelos.Cliente;
import util.ConexaoDB;

public class ClienteDao {

	public static Cliente insert(Cliente cliente) {
		try {
			Connection con = ConexaoDB.getConexao();
			String sql = "insert into tb_clientes(nome, email, fone)" + "values(?,?, ?)";
			PreparedStatement stm = con.prepareStatement(sql);
			stm.setString(1, cliente.getNome());
			stm.setString(2, cliente.getEmail());
			stm.setString(3, cliente.getFone());
			stm.execute();

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return cliente;
	}

	public static List<Cliente> getAll() {
		List<Cliente> clientes = new ArrayList<Cliente>();
		try {
			Connection con = ConexaoDB.getConexao();

			String sql = "select * from tb_clientes";
			PreparedStatement stm = con.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				clientes.add(new Cliente(rs.getInt("id"), rs.getString("nome"), rs.getString("email"),
						rs.getString("fone")));
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return clientes;
	}

}
