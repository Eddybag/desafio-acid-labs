package restful.client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
@ComponentScan
public class ClienteRestful {

    public static void main(String[] args) {
        SpringApplication.run(ClienteRestful.class, args);
    }
}
