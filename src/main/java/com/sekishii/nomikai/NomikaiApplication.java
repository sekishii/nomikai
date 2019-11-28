package com.sekishii.nomikai;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class NomikaiApplication {


    public static void main(String[] args) {
        SpringApplication.run(NomikaiApplication.class, args);
    }

}
