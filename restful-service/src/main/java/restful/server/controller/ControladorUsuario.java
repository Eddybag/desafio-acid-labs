package restful.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;
import restful.server.model.Usuario;
import restful.server.service.ServicioUsuario;

@RestController
@RequestMapping("/")
public class ControladorUsuario {


    private ServicioUsuario servicioUsuario;

    /**
     * @param userId
     * @return
     */
    @RequestMapping(value = "/users/{userId}", method = RequestMethod.GET)
    public ResponseEntity<?> findUser(@PathVariable String userId) {
        Long idUsuario = Long.valueOf(userId);
        // llamada al servicio para encontrar un usuario en específico
        Usuario usuario = servicioUsuario.encontrarUnUsuario(idUsuario);

        if (usuario != null) {
            //usuario encontrado
            return new ResponseEntity<>(vistaHtmlUsuario(usuario), HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }



    @RequestMapping(value = "/users", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<?> agregarUsuario(@RequestBody Usuario usuario, UriComponentsBuilder ucBuilder) {
        ResponseEntity<?> respuesta = servicioUsuario.agregarUsuario(usuario);

        if (HttpStatus.CREATED.equals(
                respuesta.getStatusCode())) {
            HttpHeaders headers = new HttpHeaders();
            headers.setLocation(ucBuilder.path("/users/{id}").buildAndExpand(usuario.getId()).toUri());
            return new ResponseEntity<Void>(headers, HttpStatus.MOVED_PERMANENTLY);
        }
        return respuesta;
    }


    @Autowired
    public ControladorUsuario(ServicioUsuario servicioUsuario) {
        this.servicioUsuario = servicioUsuario;
    }

    public String vistaHtmlUsuario(Usuario usuario){
        String vista =
                "<html> " +
                        "<head> " +
                            "<meta charset ='utf-8'>" +
                            "<title>Dibujando con canvas</title>" +
                        "</head> " +
                        "<body>" +
                            "<img src='"+usuario.getImage()+"'/>"+
                            "<label>"+usuario.getUsername()+"<label/>"+
                        "</body>"+
                "</html>";
        return vista;
    }


}

