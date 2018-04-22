package vw.demo.helloworld

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/goodbye")
class GoodByeController {

    @GetMapping("")
    String goodbye(String name) {
        return "Good Bye, ${name? name: 'world'}!"
    }
}
