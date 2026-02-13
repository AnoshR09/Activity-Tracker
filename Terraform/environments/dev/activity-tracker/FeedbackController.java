package com.tracker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/feedback")
@CrossOrigin(origins = "*")
public class FeedbackController {
    
    @Autowired
    private FeedbackRepository feedbackRepository;
    
    @GetMapping
    public List<Feedback> getAllFeedback() {
        return feedbackRepository.findAllByOrderByCreatedAtDesc();
    }
    
    @PostMapping
    public Feedback createFeedback(@RequestBody Feedback feedback) {
        return feedbackRepository.save(feedback);
    }
    
    @DeleteMapping("/{id}")
    public void deleteFeedback(@PathVariable Long id) {
        feedbackRepository.deleteById(id);
    }
}