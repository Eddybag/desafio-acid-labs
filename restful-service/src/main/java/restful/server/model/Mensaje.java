package restful.server.model;

import java.io.Serializable;

/**
 * Created by evelaguti on 12/20/16.
 */
public class Mensaje implements Serializable{

    private String message;

    public Mensaje(){

    }

    public Mensaje(String message){
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
