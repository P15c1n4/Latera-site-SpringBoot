package com.example.latera.controllers;

import com.example.latera.models.web.EventModel;
import com.example.latera.models.web.OffertModel;
import com.example.latera.repositories.web.EventRepository;
import com.example.latera.repositories.web.OfertRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class PageController {

    @Autowired
    EventRepository eventRepository;
    @Autowired
    OfertRepository ofertRepository;

    @GetMapping(value = "/hall")
    public String PageHall(HttpSession session, Model model){

        if(session.getAttribute("userid") == null){

            model.addAttribute("erro", "Você deve estar logado!");
            return "index";
        }

        return "hall";
    }

    @GetMapping(value = "/eventlist")
    public String EventList(@RequestParam("type") short type, Model model){

        List<EventModel> events;
        if(type != 0) {
            events = eventRepository.findTop5ByEventTypeOrderByIdDesc(type);
        }else{
            events = eventRepository.findTop5OrderByIdDesc();
        }

        model.addAttribute("type",type)
                .addAttribute("list",events);

        return "events";
    }


    @GetMapping(value = "/event")
    public String Event(@RequestParam("id") short id, Model model){

        Optional<EventModel> event = eventRepository.findById(id);

        if(!event.isPresent()){
            return "";

        }

        List<EventModel> events = eventRepository.findAllByEventTypeOrderByIdDesc(event.get().getEventType());

        model.addAttribute("event",event.get())
                .addAttribute("list",events)
                .addAttribute("type",event.get().getEventType());

        return "patch";
    }


    @GetMapping(value = "/shop")
    public String Shop(@RequestParam("id") short id, HttpSession session, Model model){

        if(session.getAttribute("userid") == null){

            model.addAttribute("erro", "Você deve estar logado!");
            return "index";
        }

        Optional<OffertModel> offert = ofertRepository.findById(id);

        if(!offert.isPresent()){
            model.addAttribute("erro", "Essa oferta não existe!");
            return "index";
        }

        model.addAttribute("offert", offert.get());

        return "shop";

    }


    @GetMapping(value = "/offerts")
    public String Offerts(@RequestParam("type") short type, @SessionAttribute("userid") short userid, Model model){

        List<OffertModel> offerts;
        if(type == 0){
            offerts = ofertRepository.findAll();
        }else{
            offerts = ofertRepository.findAllByOfferType(type);
        }

        model.addAttribute("offerts", offerts)
                .addAttribute("type", type);

        return "buylist";

    }

    @GetMapping(value = "/pay")
    public String Pay(Model model){
        model.addAttribute("erro", "Sistema de pagamento desativado!");

        return "index";
    }

    @GetMapping(value = "/trade")
    public String Trade(Model model){
        model.addAttribute("erro", "Sistema de trade em breve!!");

        return "index";
    }


}


