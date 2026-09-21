package com.cinebook.controller;

import com.cinebook.entity.Combo;
import com.cinebook.repository.ComboRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/combo")
public class ComboController {

    @Autowired
    private ComboRepository comboRepository;

    @GetMapping
    public String index(Model model) {
        model.addAttribute("combos", comboRepository.findAll());
        model.addAttribute("newCombo", new Combo());
        return "admin/quan-ly-combo";
    }

    @PostMapping("/save")
    public String saveCombo(@ModelAttribute("newCombo") Combo combo) {
        comboRepository.save(combo);
        return "redirect:/admin/combo";
    }

    @GetMapping("/delete/{id}")
    public String deleteCombo(@PathVariable("id") Long id) {
        comboRepository.deleteById(id);
        return "redirect:/admin/combo";
    }
}