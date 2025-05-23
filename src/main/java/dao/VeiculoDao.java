package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import modelos.Veiculo;
import util.ConexaoDB;

public class VeiculoDao {

	public static List<Veiculo> getAll() {
		List<Veiculo> lista = new ArrayList<>();
		try {
		
			String sql = "SELECT * FROM tb_veiculo";
			Connection con = ConexaoDB.getConexao();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Veiculo v = new Veiculo();
				v.setId(rs.getInt("id"));
				v.setPlaca(rs.getString("placa"));
				v.setMarca(rs.getString("marca"));
				v.setModelo(rs.getString("modelo"));
				v.setAno(rs.getInt("ano"));
				v.setPrecoDiaria(rs.getDouble("preco_diaria"));
				lista.add(v);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
	}

	public static void insert(Veiculo v) {
		
		try {
			
			String sql = "INSERT INTO tb_veiculo (placa, marca, modelo, ano, preco_diaria) VALUES (?, ?, ?, ?, ?)";
			Connection con = ConexaoDB.getConexao();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, v.getPlaca());
			ps.setString(2, v.getMarca());
			ps.setString(3, v.getModelo());
			ps.setInt(4, v.getAno());
			ps.setDouble(5, v.getPrecoDiaria());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
