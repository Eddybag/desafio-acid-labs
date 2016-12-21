package restful.client.controller;

import org.json.JSONObject;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.nio.charset.Charset;
import java.util.Base64;

@Controller
@ConfigurationProperties(prefix = "restful-server")
public class ControladorImagenUpload {

    private String url;


    @RequestMapping(value = "simpleSubida", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> singleSave(@RequestParam("imagen") MultipartFile file, @RequestParam("username") String username) {
        String imagen64;
        StringBuilder sb = new StringBuilder();
        try {

            if (file != null) {
                Base64.Encoder enc = Base64.getEncoder();
                byte[] strenc = enc.encode(file.getBytes());
                imagen64 = new String(strenc, Charset.forName("UTF-8"));
                sb.append("data:image/png;base64,");
                sb.append(imagen64);
            }
        } catch (Exception ex) {

        }

        // se inicializa el objeto JSON
        JSONObject request = new JSONObject();
        request.put("username", username);
        request.put("image", sb.toString());

        //se preparan los header para hacer el post
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<String> entity = new HttpEntity<String>(request.toString(), headers);

        //inicializando el restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<?> loginResponse = null;


        try {
            // Hace post a la url descrita en application.properties
            loginResponse = restTemplate
                    .exchange(url, HttpMethod.POST, entity, String.class);
            // Se captura la exception y se muestra el mensaje indicado según el tipo
        } catch (org.springframework.web.client.HttpClientErrorException ex) {
            if (ex.getStatusCode() == HttpStatus.BAD_REQUEST) {
                return new ResponseEntity<>("400: Bad Request", HttpStatus.BAD_REQUEST);
            }
            if (ex.getStatusCode() == HttpStatus.UNAUTHORIZED) {
                return new ResponseEntity<>("401: Unauthorized", HttpStatus.UNAUTHORIZED);
            }
        }
        return new ResponseEntity<>("201: OK", loginResponse.getHeaders(), loginResponse.getStatusCode());
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
