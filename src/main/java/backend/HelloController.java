package backend;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
public class HelloController {
    @GetMapping("/hello")
    public String hello(){
        return "Gopher market is running";
    }

    @GetMapping("/user")
    public Map<String, String> user(){
        return Map.of("name","Lakshya","university", "UMN", "project", "Gopher Market");
    }

    @PostMapping("/echo")
    public Map<String, String> echo(@RequestBody Map<String, String> body){
        return Map.of("you_sent", body.get("message"));
    }
}
