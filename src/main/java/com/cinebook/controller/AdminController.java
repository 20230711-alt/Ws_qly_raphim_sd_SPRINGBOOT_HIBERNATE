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

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
        List<Ticket> allTickets = ticketRepository.findAll();

        // --- TÍNH TOÁN DOANH THU 7 NGÀY QUA ---
        LocalDate today = LocalDate.now();
        List<String> chartLabels = new ArrayList<>();
        List<Double> chartData = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM");

        for (int i = 6; i >= 0; i--) {
            LocalDate date = today.minusDays(i);
            chartLabels.add(date.format(formatter));

            double dailySum = allTickets.stream()
                .filter(t -> t.getBookingDate() != null && t.getBookingDate().toLocalDate().equals(date))
                .mapToDouble(t -> t.getTotalPrice() != null ? t.getTotalPrice() : 0.0)
                .sum();
            
            chartData.add(dailySum);
        }

        // --- TÍNH TOÁN DOANH THU THÁNG NÀY ---
        List<String> monthLabels = new ArrayList<>();
        List<Double> monthData = new ArrayList<>();
        int daysInMonth = today.lengthOfMonth();
        for (int day = 1; day <= daysInMonth; day++) {
            LocalDate d = LocalDate.of(today.getYear(), today.getMonth(), day);
            monthLabels.add(String.valueOf(day));

            double daySum = allTickets.stream()
                .filter(t -> t.getBookingDate() != null && t.getBookingDate().toLocalDate().equals(d))
                .mapToDouble(t -> t.getTotalPrice() != null ? t.getTotalPrice() : 0.0)
                .sum();
            monthData.add(daySum);
        }

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

        // Đưa dữ liệu biểu đồ ra giao diện
        model.addAttribute("chartLabels", chartLabels);
        model.addAttribute("chartData", chartData);
        model.addAttribute("monthLabels", monthLabels);
        model.addAttribute("monthData", monthData);

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