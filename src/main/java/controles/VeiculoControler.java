package controles;

import java.util.List;

import dao.VeiculoDao;
import modelos.Veiculo;

public class VeiculoControler {


	public List<Veiculo> getAll(){
		return VeiculoDao.getAll();
	}
	
	public Veiculo salvar(Veiculo veiculo) {
		VeiculoDao.insert(veiculo);
		return veiculo;
	}
}
