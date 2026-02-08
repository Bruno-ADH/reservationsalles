package com.reservationsalles.reservationsalles.controllers;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservationsalles.reservationsalles.models.Salle;
import com.reservationsalles.reservationsalles.services.SalleService;

@Controller
@RequestMapping("/salles")
public class SalleController {

    @Autowired
    private SalleService salleService;

    @GetMapping("/liste")
    public String liste(ModelMap model) {
        model.addAttribute("salles", salleService.getAllSalles());
        return "salles/liste";
    }

    @GetMapping("/nouveau")
    public String nouveau(ModelMap model) {
        model.addAttribute("salle", new Salle());
        return "salles/formulaire";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Salle salle) {
        salleService.saveSalle(salle);
        return "redirect:/salles/liste";
    }

    @GetMapping("/modifier/{id}")
    public String modifier(@PathVariable Long id, ModelMap model) {
        Optional<Salle> salle = salleService.getSalleById(id);
        if (salle.isPresent()) {
            model.addAttribute("salle", salle.get());
            return "salles/formulaire";
        }
        return "redirect:/salles/liste";
    }

    @GetMapping("/supprimer/{id}")
    public String supprimer(@PathVariable Long id) {
        salleService.deleteSalle(id);
        return "redirect:/salles/liste";
    }
}
