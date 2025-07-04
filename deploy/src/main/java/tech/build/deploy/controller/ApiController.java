package tech.build.deploy.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@RestController
public class ApiController {

    @GetMapping
    public ResponseEntity<TimesTampResponse> helloAws(){
        return ResponseEntity.ok(new TimesTampResponse(Instant.now()));
    }
}
