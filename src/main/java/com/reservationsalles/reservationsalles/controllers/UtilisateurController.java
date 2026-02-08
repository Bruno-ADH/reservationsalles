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

import com.reservationsalles.reservationsalles.models.Utilisateur;
import com.reservationsalles.reservationsalles.services.UtilisateurService;

@Controller
@RequestMapping("/utilisateurs")
public class UtilisateurController {

    @Autowired
    private UtilisateurService utilisateurService;

    @GetMapping("/liste")
    public String liste(ModelMap model) {
        model.addAttribute("utilisateurs", utilisateurService.getAllUtilisateurs());
        return "utilisateurs/liste";
    }

    @GetMapping("/nouveau")
    public String nouveau(ModelMap model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "utilisateurs/formulaire";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Utilisateur utilisateur) {
        utilisateurService.saveUtilisateur(utilisateur);
        return "redirect:/utilisateurs/liste";
    }

    @GetMapping("/modifier/{id}")
    public String modifier(@PathVariable Long id, ModelMap model) {
        Optional<Utilisateur> utilisateur = utilisateurService.getUtilisateurById(id);
        if (utilisateur.isPresent()) {
            model.addAttribute("utilisateur", utilisateur.get());
            return "utilisateurs/formulaire";
        }
        return "redirect:/utilisateurs/liste";
    }

    @GetMapping("/supprimer/{id}")
    public String supprimer(@PathVariable Long id) {
        utilisateurService.deleteUtilisateur(id);
        return "redirect:/utilisateurs/liste";
    }
}
