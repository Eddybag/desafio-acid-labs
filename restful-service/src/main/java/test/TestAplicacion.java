package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import restful.server.ServicioRestful;

/**
 * Created by evelaguti on 12/17/16.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = ServicioRestful.class)
@WebAppConfiguration
public class TestAplicacion {


    @Test
    public void cargarContextos(){
    }
}
