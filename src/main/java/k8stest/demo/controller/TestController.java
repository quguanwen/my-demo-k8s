package k8stest.demo.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/api/v1/test")
@RestController
@Slf4j
public class TestController {

    @GetMapping("/status")
    public String isOk(){
        log.info("ok,quguanwen");
        log.error("ok,quguanwen");
        return "OK";
    }

    @GetMapping("/fail")
    public void fail(HttpServletResponse response) throws IOException {
        log.info("fail,quguanwen");
        log.error("fail,quguanwen");
        response.setStatus(500);
        response.getWriter().append("down down down ...");
    }

}
