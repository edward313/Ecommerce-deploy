package com.example.deploy;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorldController
{
    @RequestMapping("/")
    public String hello()
    {
        return "Hello deploy lan 1";
    }

    @RequestMapping("/phat")
    public String hello1()
    {
        return "Hello deploy lan 2";
    }
}
