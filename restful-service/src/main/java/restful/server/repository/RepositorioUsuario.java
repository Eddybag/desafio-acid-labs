package restful.server.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import restful.server.model.Usuario;

public interface RepositorioUsuario extends JpaRepository<Usuario, Long>{

}
