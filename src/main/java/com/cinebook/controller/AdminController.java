package com.cinebook.controller;

import com.cinebook.entity.Ticket;
import com.cinebook.repository.MovieRepository;
import com.cinebook.repository.ShowtimeRepository;
import com.cinebook.repository.TicketRepository;
import com.cinebook.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private ShowtimeRepository showtimeRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MovieRepository movieRepository;

    @GetMapping("/admin")
    public String adminDashboard(Model model) {
        // 1. Tính toán 4 chỉ số tổng quan từ CSDL
        Double totalRevenue = ticketRepository.sumTotalRevenue();
        Long totalTickets = ticketRepository.countTotalTickets();
        Long totalShowtimes = showtimeRepository.countTotalShowtimes();
        Long totalUsers = userRepository.countTotalUsers();

        // 2. Thống kê vé theo trạng thái cho Biểu đồ Tròn
        Long countPaid = ticketRepository.countTicketsByStatus("Đã thanh toán");
        Long countPending = ticketRepository.countTicketsByStatus("Chờ thanh toán");
        Long countCancelled = ticketRepository.countTicketsByStatus("Đã hủy");

        // 3. Lấy dữ liệu danh sách giao dịch vé gần đây & danh sách phim
        List<Ticket> recentTickets = ticketRepository.findTop5ByOrderByIdDesc();

        // 4. Truyền dữ liệu sang Thymeleaf View
        model.addAttribute("totalRevenue", totalRevenue != null ? totalRevenue : 0.0);
        model.addAttribute("totalTickets", totalTickets != null ? totalTickets : 0L);
        model.addAttribute("totalShowtimes", totalShowtimes != null ? totalShowtimes : 0L);
        model.addAttribute("totalUsers", totalUsers != null ? totalUsers : 0L);

        model.addAttribute("countPaid", countPaid);
        model.addAttribute("countPending", countPending);
        model.addAttribute("countCancelled", countCancelled);

        model.addAttribute("recentTickets", recentTickets);
        model.addAttribute("movies", movieRepository.findAll());

        return "admin"; // Trả về file admin.html
    }

    @GetMapping("/admin/phim")
    public String quanLyPhim() {
        return "admin/quan-ly-phim";
    }

    @GetMapping("/admin/cai-dat")
    public String caiDat() {
        return "admin/cai-dat-he-thong";
    }
}