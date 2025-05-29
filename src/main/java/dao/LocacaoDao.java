package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelos.Locacao;
import modelos.Veiculo;
import util.ConexaoDB;

public class LocacaoDao {
	
	 public static void excluir(int id) {
	        try {
	            Connection con = ConexaoDB.getConexao();
	            String sql = "DELETE FROM tb_locacoes WHERE id=?";
	            PreparedStatement stm = con.prepareStatement(sql);
	            stm.setInt(1, id);
	            stm.execute();

	            stm.close();
	            con.close();
	        } catch (Exception e) {
	            throw new RuntimeException(e.getMessage());
	        }
	    }

	    public static void alterar(Locacao l) {
	        try {
	            Connection con = ConexaoDB.getConexao();
	            String sql = "UPDATE tb_locacoes SET id_cliente = ?, id_veiculo = ?, data_inicio = ?, data_fim = ?, valor_total = ? WHERE id = ?";
	            PreparedStatement stm = con.prepareStatement(sql);
	            stm.setInt(1, l.getIdCliente());
	            stm.setInt(2, l.getIdVeiculo());
	            stm.setDate(3, (Date) l.getDataInicio());
	            stm.setDate(4, (Date) l.getDataFim());
	            stm.setDouble(5, l.getValorTotal());
	            stm.setInt(6, l.getId());
	            stm.execute();

	            stm.close();
	            con.close();
	        } catch (Exception e) {
	            throw new RuntimeException(e.getMessage());
	        }
	    }

	    public static Locacao getLocacaoById(int id) {
	        Locacao l = null;
	        try {
	            Connection con = ConexaoDB.getConexao();
	            String sql = "SELECT * FROM tb_locacoes WHERE id=?";
	            PreparedStatement stm = con.prepareStatement(sql);
	            stm.setInt(1, id);
	            ResultSet rs = stm.executeQuery();

				if (rs.next()) {
					l = new Locacao();
					l.setId(rs.getInt("id"));
					l.setIdCliente(rs.getInt("id_cliente"));
					l.setIdVeiculo(rs.getInt("id_veiculo"));
					l.setDataInicio(rs.getDate("data_inicio"));
					l.setDataFim(rs.getDate("data_fim"));
					l.setValorTotal(rs.getDouble("valor_total"));
				}

	            rs.close();
	            stm.close();
	            con.close();
	        } catch (SQLException e) {
	            throw new RuntimeException(e.getMessage());
	        }
	        return l;
	    }

		public static void insert(Locacao l) {
			try {
				Connection con = ConexaoDB.getConexao();
				String sql = "INSERT INTO tb_locacoes (id_cliente, id_veiculo, data_inicio, data_fim, valor_total) VALUES (?, ?, ?, ?, ?)";
				PreparedStatement stm = con.prepareStatement(sql);
				stm.setInt(1, l.getIdCliente());
				stm.setInt(2, l.getIdVeiculo());
				stm.setDate(3, (Date) l.getDataInicio());
				stm.setDate(4, (Date) l.getDataFim());
				stm.setDouble(5, l.getValorTotal());
				stm.execute();

				stm.close();
				con.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}

		public static List<Locacao> getAll() {
			List<Locacao> lista = new ArrayList<Locacao>();
			try {
				Connection con = ConexaoDB.getConexao();
				String sql = "SELECT * FROM tb_locacoes";
				PreparedStatement stm = con.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while (rs.next()) {
					Locacao l = new Locacao();
					l.setId(rs.getInt("id"));
					l.setIdCliente(rs.getInt("id_cliente"));
					l.setIdVeiculo(rs.getInt("id_veiculo"));
					l.setDataInicio(rs.getDate("data_inicio"));
					l.setDataFim(rs.getDate("data_fim"));
					l.setValorTotal(rs.getDouble("valor_total"));
					lista.add(l);
				}
				rs.close();
				stm.close();
				con.close();
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
			return lista;
		}

}
