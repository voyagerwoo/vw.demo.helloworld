package vw.demo.helloworld

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloworldController {

    @GetMapping("/hello")
    String hello(String name) {
        return "Hello, ${name? name: 'world'}!"
    }

    @GetMapping("/how-are-you")
    String howAreYou(String name) {
        return "How Are You, ${name? name: 'world'}?"
    }

    @GetMapping("/haha")
    String haha(String name) {
        return "hahaha, ${name? name: 'world'}!"
    }
}
