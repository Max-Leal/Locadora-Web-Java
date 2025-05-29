package controles;

import java.util.List;

import dao.LocacaoDao;
import modelos.Locacao;

public class LocacaoControler {


	public List<Locacao> getAll(){
		return LocacaoDao.getAll();
	}
	
	public Locacao salvar(Locacao locacao) {
		LocacaoDao.insert(locacao);
		return locacao;
	}
}
