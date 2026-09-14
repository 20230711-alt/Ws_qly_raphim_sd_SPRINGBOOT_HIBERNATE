package com.cinebook.controller;

import com.cinebook.entity.User;
import com.cinebook.entity.Ticket;
import com.cinebook.entity.Transaction;
import com.cinebook.repository.UserRepository;
import com.cinebook.repository.TicketRepository;
import com.cinebook.repository.TransactionRepository;
import com.cinebook.repository.VoucherRepository;
import com.cinebook.entity.Voucher;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TrangWebController {

    @Autowired
    private UserRepository userRepository;

    // Khai báo thêm Repository cho vé và giao dịch
    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private TransactionRepository transactionRepository;
    
    @Autowired
    private VoucherRepository voucherRepository;	

    @GetMapping({"/", "/trang-chu"})
    public String trangChu(HttpSession session, Model model) {
        // Lấy thông tin user vừa đăng nhập từ Session truyền sang Thymeleaf
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) {
            model.addAttribute("user", user);
        }
        return "index";
    }

    @GetMapping("/phim")
    public String danhSachPhim(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) { model.addAttribute("user", user); }
        return "danh-sach-phim";
    }

    @GetMapping("/chi-tiet-phim")
    public String chiTietPhim(@RequestParam(name = "movieId", required = false) String movieId, 
                               HttpSession session, 
                               Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) { 
            model.addAttribute("user", user); 
        }
        // Truyền mã movieId ra Thymeleaf để dùng khi cần
        model.addAttribute("movieId", movieId); 
        
        return "chi-tiet-phim";
    }

    @GetMapping("/chon-ghe")
    public String chonGhe(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) { model.addAttribute("user", user); }
        return "chon-ghe";
    }

    @GetMapping("/thanh-toan")
    public String thanhToan(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) { model.addAttribute("user", user); }
        return "thanh-toan";
    }
    @GetMapping("/chon-suat-chieu")
    public String chonSuatChieuPage(@RequestParam(name = "movieId", required = false, defaultValue = "P01") String movieId, Model model) {
        model.addAttribute("movieId", movieId);
        return "chon-suat-chieu";
    }
    @GetMapping("/khuyen-mai")
    public String khuyenMai(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user != null) { model.addAttribute("user", user); }
        return "khuyen-mai";
    }

    @GetMapping("/thanh-vien")
    public String member(HttpSession session, Model model) {
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login"; // Chưa đăng nhập thì đá về trang login
        }
        
        // Truy vấn danh sách vé và giao dịch của đúng user đang đăng nhập
        List<Ticket> tickets = ticketRepository.findByUserId(user.getId());
        List<Transaction> transactions = transactionRepository.findByUserId(user.getId());
        
        // --- THÊM PHẦN LẤY VOUCHER VÀO ĐÂY (GIỮ NGUYÊN HOÀN TOÀN CODE CŨ) ---
        List<Voucher> userVouchers = voucherRepository.findByUser(user);

        // Đẩy toàn bộ dữ liệu ra Thymeleaf
        model.addAttribute("user", user);
        model.addAttribute("tickets", tickets);
        model.addAttribute("transactions", transactions);
        model.addAttribute("userVouchers", userVouchers); // Thêm dòng này để đẩy voucher ra giao diện

        return "thanh-vien";
    }

    // ----- API XỬ LÝ LƯU VOUCHER TỪ TRANG KHUYẾN MÃI -----
    @PostMapping("/api/luu-voucher")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> saveVoucher(
            @RequestParam String code,
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String expiryDate,
            @RequestParam String iconClass,
            @RequestParam(required = false, defaultValue = "false") boolean isHot,
            HttpSession session) {

        Map<String, Object> response = new HashMap<>();

        // Kiểm tra xem người dùng đã đăng nhập chưa thông qua Session
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            response.put("success", false);
            response.put("message", "Vui lòng đăng nhập để lưu ưu đãi!");
            return ResponseEntity.status(401).body(response);
        }

        // Kiểm tra xem voucher này đã được user lưu trước đó chưa
        boolean exists = voucherRepository.existsByUserAndCode(user, code);
        if (exists) {
            response.put("success", false);
            response.put("message", "Mã giảm giá này đã có sẵn trong kho lưu trữ của bạn!");
            return ResponseEntity.ok(response);
        }

        // Tạo mới voucher và liên kết với user hiện tại
        Voucher voucher = new Voucher();
        voucher.setCode(code);
        voucher.setTitle(title);
        voucher.setDescription(description);
        voucher.setExpiryDate(expiryDate);
        voucher.setIconClass(iconClass);
        voucher.setHot(isHot);
        voucher.setUser(user);

        voucherRepository.save(voucher);

        response.put("success", true);
        response.put("message", "Lưu voucher vào kho thành công!");
        return ResponseEntity.ok(response);
    }

    // ----- XỬ LÝ CẬP NHẬT THÔNG TIN CÁ NHÂN -----
    @PostMapping("/cap-nhat-thong-tin")
    public String updateProfile(@RequestParam("fullName") String fullName,
                                @RequestParam("birthday") String birthday,
                                @RequestParam("phone") String phone,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        // Cập nhật thông tin vào đối tượng user
        currentUser.setFullName(fullName);
        currentUser.setBirthday(birthday);
        currentUser.setPhone(phone);

        // Lưu xuống Database
        userRepository.save(currentUser);
        
        // Cập nhật lại Session
        session.setAttribute("loggedInUser", currentUser);
        
        redirectAttributes.addFlashAttribute("message", "Cập nhật thông tin thành công!");
        
        // Điều hướng về trang chủ kèm tham số mở sẵn tab profile
        return "redirect:/?tab=profile-tab";
    }

    // ----- XỬ LÝ ĐỔI MẬT KHẨU -----
    @PostMapping("/doi-mat-khau")
    public String changePassword(@RequestParam("currentPassword") String currentPassword,
                                 @RequestParam("newPassword") String newPassword,
                                 @RequestParam("confirmPassword") String confirmPassword,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            return "redirect:/login";
        }

        // Kiểm tra mật khẩu hiện tại có đúng không
        if (!currentUser.getPassword().equals(currentPassword)) {
            redirectAttributes.addFlashAttribute("error", "Mật khẩu hiện tại không chính xác!");
            return "redirect:/?tab=password-tab";
        }

        // Kiểm tra mật khẩu mới và xác nhận có khớp nhau không
        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("error", "Xác nhận mật khẩu mới không khớp!");
            return "redirect:/?tab=password-tab";
        }

        // Cập nhật mật khẩu mới
        currentUser.setPassword(newPassword);
        userRepository.save(currentUser);
        
        // Cập nhật lại session
        session.setAttribute("loggedInUser", currentUser);

        redirectAttributes.addFlashAttribute("success", "Đổi mật khẩu thành công!");
        return "redirect:/?tab=password-tab"; // Hoặc đường dẫn trả về trang thành viên của bạn
    }

    // ----- ĐĂNG XUẤT -----
    @GetMapping("/logout")
    public String dangXuat(HttpSession session) {
        session.invalidate(); // Xóa sạch dữ liệu user trong Session
        return "redirect:/login"; // Chuyển về lại trang đăng nhập
    }
}