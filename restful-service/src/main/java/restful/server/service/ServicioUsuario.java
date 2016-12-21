package restful.server.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import restful.server.model.Mensaje;
import restful.server.model.Usuario;
import restful.server.repository.RepositorioUsuario;

import java.nio.charset.Charset;


@Service
public class ServicioUsuario {

    @Autowired
    private RepositorioUsuario repositorioUsuario;

    public Usuario encontrarUnUsuario(Long id) {
        Usuario usuario = repositorioUsuario.findOne(id);
        if (usuario != null) {
            usuario.setImage(byteArrayABase64(usuario.getImagenBlob()));
        }
        return usuario;
    }

    public ResponseEntity<?> agregarUsuario(Usuario usuario) {
        if (usuario != null) {
            if (StringUtils.isEmpty(usuario.getUsername())
                    || StringUtils.isEmpty(usuario.getImage())) {
                return new ResponseEntity<>(new Mensaje("Bad Request"), HttpStatus.BAD_REQUEST);

            } else if (!"usuario1".equals(usuario.getUsername())) {
                return new ResponseEntity<>(new Mensaje("Unauthorized"), HttpStatus.UNAUTHORIZED);

            } else {
                usuario.setImagenBlob(base64AByteArray(usuario.getImage()));
                repositorioUsuario.save(usuario);
                return new ResponseEntity<Void>(HttpStatus.CREATED);
            }
        } else {
            return new ResponseEntity<>(new Mensaje("Bad Request"), HttpStatus.BAD_REQUEST);
        }
    }

    public byte[] base64AByteArray(String base64) {
        if (!StringUtils.isEmpty(base64)) {
            byte[] bytes = base64.getBytes(Charset.forName("UTF-8"));
            return bytes;
        }
        return null;
    }

    public String byteArrayABase64(byte[] bytes) {
        if (bytes != null && bytes.length > 0) {
            StringBuilder sb = new StringBuilder();
            String imagen64 = new String(bytes, Charset.forName("UTF-8"));
            sb.append(imagen64);
            return sb.toString();
        }
        return null;
    }

}
