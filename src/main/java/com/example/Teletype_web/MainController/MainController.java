package com.example.Teletype_web.MainController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class MainController {
    List<String> items = new ArrayList<>(Arrays.asList("1", "2", "3", "4", "5", "6", "7", "8", "9"));
    List<Message> messages = new ArrayList<>();

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("items", items);
        model.addAttribute("selectedUser", "User 1");
        model.addAttribute("messages", messages);
        return "home";
    }

    @PostMapping("/sendMessage")
    @ResponseBody
    public Message sendMessage(@RequestBody Message message) {
        messages.add(message);
        return message;
    }

    @GetMapping("/getMessages")
    @ResponseBody
    public List<Message> getMessages() {
        return messages;
    }

    public static class Message {
        private String sender;
        private String content;

        public Message() {}

        public Message(String sender, String content) {
            this.sender = sender;
            this.content = content;
        }

        public String getSender() {
            return sender;
        }

        public void setSender(String sender) {
            this.sender = sender;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
    }
}
