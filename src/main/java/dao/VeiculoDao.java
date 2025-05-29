package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelos.Veiculo;
import util.ConexaoDB;

public class VeiculoDao {

    public static void excluir(int id) {
        try {
            Connection con = ConexaoDB.getConexao();
            String sql = "DELETE FROM tb_veiculos WHERE id=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            stm.execute();

            stm.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public static void alterar(Veiculo v) {
        try {
            Connection con = ConexaoDB.getConexao();
            String sql = "UPDATE tb_veiculos SET placa = ?, marca = ?, modelo = ?, ano = ?, preco_diaria = ? WHERE id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, v.getPlaca());
            stm.setString(2, v.getMarca());
            stm.setString(3, v.getModelo());
            stm.setInt(4, v.getAno());
            stm.setDouble(5, v.getPrecoDiaria());
            stm.setInt(6, v.getId());
            stm.execute();

            stm.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public static Veiculo getVeiculoById(int id) {
        Veiculo v = null;
        try {
            Connection con = ConexaoDB.getConexao();
            String sql = "SELECT * FROM tb_veiculos WHERE id=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                v = new Veiculo();
                v.setId(rs.getInt("id"));
                v.setPlaca(rs.getString("placa"));
                v.setMarca(rs.getString("marca"));
                v.setModelo(rs.getString("modelo"));
                v.setAno(rs.getInt("ano"));
                v.setPrecoDiaria(rs.getDouble("preco_diaria"));
            }

            rs.close();
            stm.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }
        return v;
    }

    public static void insert(Veiculo v) {
        try {
            Connection con = ConexaoDB.getConexao();
            String sql = "INSERT INTO tb_veiculos (placa, marca, modelo, ano, preco_diaria) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, v.getPlaca());
            stm.setString(2, v.getMarca());
            stm.setString(3, v.getModelo());
            stm.setInt(4, v.getAno());
            stm.setDouble(5, v.getPrecoDiaria());
            stm.execute();

            stm.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public static List<Veiculo> getAll() {
        List<Veiculo> lista = new ArrayList<Veiculo>();
        try {
            Connection con = ConexaoDB.getConexao();
            String sql = "SELECT * FROM tb_veiculos";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
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
            rs.close();
            stm.close();
            con.close();
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        return lista;
    }
}