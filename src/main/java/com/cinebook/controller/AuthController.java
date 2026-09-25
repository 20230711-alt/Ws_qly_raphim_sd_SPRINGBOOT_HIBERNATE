package com.cinebook.controller;

import java.util.Optional;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cinebook.entity.User;
import com.cinebook.repository.UserRepository;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    // ----- ĐĂNG KÝ -----
    @GetMapping("/register")
    public String showRegisterPage() {
        return "dang-ky";
    }

    @PostMapping("/register")
    public String handleRegister(@RequestParam("fullName") String fullName,
                                 @RequestParam("email") String email,
                                 @RequestParam("phone") String phone,
                                 @RequestParam("password") String password) {
        try {
            User newUser = new User(fullName, email, phone, password);
            userRepository.save(newUser);
            return "redirect:/dang-nhap";
        } catch (Exception e) {
            return "redirect:/register?error";
        }
    }

    // ----- ĐĂNG NHẬP -----
    @GetMapping("/dang-nhap")
    public String showLoginPage() {
        return "dang-nhap";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam("email") String email,
                              @RequestParam("password") String password,
                              HttpSession session,
                              Model model) {
        // Tìm user theo email
        Optional<User> userOptional = userRepository.findByEmail(email);

        // Kiểm tra tài khoản có tồn tại và mật khẩu có khớp không
        if (!userOptional.isPresent() || !userOptional.get().getPassword().equals(password)) {
            model.addAttribute("error", "Email hoặc mật khẩu không chính xác!");
            return "dang-nhap";
        }

        User user = userOptional.get();

        // Lưu thông tin người dùng vào Session (khớp với "loggedInUser" ở TrangWebController)
        session.setAttribute("loggedInUser", user);

        // --- CHUYỂN HƯỚNG RIÊNG CHO TÀI KHOẢN ADMIN ---
        if ("admin@cinebook.com".equalsIgnoreCase(email)) {
            return "redirect:/admin"; // Đường dẫn đến trang quản trị của admin
        }

        return "redirect:/"; // Chuyển hướng sang trang chủ cho user thường
    }

    // ----- ĐĂNG XUẤT -----
    @GetMapping("/dang-xuat")
    public String handleLogout(HttpSession session) {
        // Xóa thông tin phiên làm việc hiện tại
        session.invalidate();
        // Chuyển hướng về trang đăng nhập
        return "redirect:/dang-nhap";
    }
}