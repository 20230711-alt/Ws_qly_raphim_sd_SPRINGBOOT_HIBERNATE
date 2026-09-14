package com.cinebook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String adminDashboard() {
        return "admin"; // Trả về file admin.html
    }

    @GetMapping("/admin/phim")
    public String quanLyPhim() {
        return "admin/quan-ly-phim";
    }

    @GetMapping("/admin/suat-chieu")
    public String quanLySuatChieu() {
        return "admin/quan-ly-suat-chieu";
    }

    @GetMapping("/admin/dat-ve")
    public String quanLyDatVe() {
        return "admin/quan-ly-dat-ve";
    }

    @GetMapping("/admin/combo")
    public String quanLyCombo() {
        return "admin/quan-ly-combo";
    }

    @GetMapping("/admin/khuyen-mai")
    public String quanLyKhuyenMai() {
        return "admin/quan-ly-khuyen-mai";
    }

    @GetMapping("/admin/bao-cao")
    public String baoCao() {
        return "admin/bao-cao";
    }

    @GetMapping("/admin/cai-dat")
    public String caiDat() {
        return "admin/cai-dat-he-thong";
    }
}