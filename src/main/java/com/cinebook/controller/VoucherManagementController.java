package com.cinebook.controller;

import com.cinebook.entity.Voucher;
import com.cinebook.repository.VoucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/khuyen-mai")
public class VoucherManagementController {

    @Autowired
    private VoucherRepository voucherRepository;

    @GetMapping
    public String index(Model model) {
        model.addAttribute("vouchers", voucherRepository.findAllSystemVouchers());
        return "admin/quan-ly-khuyen-mai";
    }

    @PostMapping("/save")
    public String saveVoucher(@ModelAttribute("voucher") Voucher voucher) {
        // Gán icon mặc định nếu để trống
        if (voucher.getIconClass() == null || voucher.getIconClass().trim().isEmpty()) {
            voucher.setIconClass("fa-solid fa-gift");
        }
        voucherRepository.save(voucher);
        return "redirect:/admin/khuyen-mai";
    }

    @GetMapping("/delete/{id}")
    public String deleteVoucher(@PathVariable("id") Long id) {
        voucherRepository.deleteById(id);
        return "redirect:/admin/khuyen-mai";
    }
}