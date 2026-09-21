package com.cinebook.controller;

import com.cinebook.entity.Combo;
import com.cinebook.entity.Voucher;
import com.cinebook.repository.ComboRepository;
import com.cinebook.repository.VoucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ComboApiController {

    @Autowired
    private ComboRepository comboRepository;

    @Autowired
    private VoucherRepository voucherRepository;

    // Lấy danh sách Combo bắp nước đang kinh doanh
    @GetMapping("/combos")
    public List<Combo> getAllCombos() {
        return comboRepository.findAll();
    }

    // Lấy danh sách Mã khuyến mãi hệ thống
    @GetMapping("/vouchers")
    public List<Voucher> getAllVouchers() {
        return voucherRepository.findAll();
    }
}