package controles;

import java.util.List;

import dao.ClienteDao;
import modelos.Cliente;

public class ClienteControler {
   /* private ClienteDao clienteDao;
    
    public ClienteControler(ClienteDao clienteDao) {
    	this.clienteDao = clienteDao;
    }  
    
   
	public ClienteControler() {
		
	}*/

	public List<Cliente> getAll(){
		return ClienteDao.getAll();
	}
	
	public Cliente salvar(Cliente cliente) {
		/*cliente.setId(clienteDao.clientes.size()+1);
		clienteDao.clientes.add(cliente);*/
		ClienteDao.insert(cliente);
		return cliente;
	}
}
