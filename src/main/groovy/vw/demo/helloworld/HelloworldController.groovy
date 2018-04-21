package vw.demo.helloworld

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("hello")
class HelloworldController {

    @GetMapping
    String hello(String name) {
        if(!name)
            name = "world"
        return "hello $name!"
    }
}
