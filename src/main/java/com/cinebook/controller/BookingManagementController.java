package com.cinebook.controller;

import com.cinebook.entity.Ticket;
import com.cinebook.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BookingManagementController {

    @Autowired
    private TicketRepository ticketRepository;

    @GetMapping("/admin/dat-ve")
    public String quanLyDatVe(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "ALL") String timeRange,
            @RequestParam(defaultValue = "ALL") String status,
            Model model) {

        // 1. Định dạng phân trang: Tải 'size' bản ghi/trang, sắp xếp vé mới nhất lên đầu
        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());

        // 2. Tính toán mốc thời gian lọc
        LocalDateTime startDate = null;
        LocalDateTime now = LocalDateTime.now();

        if ("TODAY".equals(timeRange)) {
            startDate = now.withHour(0).withMinute(0).withSecond(0).withNano(0);
        } else if ("7DAYS".equals(timeRange)) {
            startDate = now.minusDays(7);
        } else if ("MONTH".equals(timeRange)) {
            startDate = now.minusDays(30);
        }

        // 3. Chuẩn hóa tham số lọc (tách số nếu người dùng nhập mã vé dạng #CB00010)
        String searchKeyword = null;
        String cleanId = null;

        if (keyword != null && !keyword.trim().isEmpty()) {
            searchKeyword = keyword.trim();
            cleanId = searchKeyword.replaceAll("[^0-9]", "");
            if (cleanId.isEmpty()) {
                cleanId = null;
            }
        }

        String searchStatus = "ALL".equals(status) ? null : status;

        // 4. Truy vấn phân trang Server-Side
        Page<Ticket> ticketPage = ticketRepository.searchAndFilterTickets(
                searchKeyword, cleanId, startDate, searchStatus, pageable);

        // 5. Truyền dữ liệu sang Thymeleaf View
        model.addAttribute("ticketPage", ticketPage);
        model.addAttribute("keyword", keyword);
        model.addAttribute("timeRange", timeRange);
        model.addAttribute("status", status);

        return "admin/quan-ly-dat-ve";
    }

    // API trả về JSON chi tiết vé cho Modal Popup
    @GetMapping("/admin/dat-ve/api/chi-tiet/{id}")
    @ResponseBody
    public Map<String, Object> getTicketDetailApi(@PathVariable("id") Long id) {
        Map<String, Object> response = new HashMap<>();

        Ticket ticket = ticketRepository.findById(id).orElse(null);
        if (ticket != null) {
            response.put("id", ticket.getId());
            response.put("movieTitle", ticket.getMovieTitle());
            response.put("cinemaName", ticket.getCinemaName());
            response.put("showTime", ticket.getShowTime());
            response.put("seats", ticket.getSeats());
            response.put("totalPrice", ticket.getTotalPrice());
            response.put("bookingDate", ticket.getBookingDate() != null ? ticket.getBookingDate().toString().replace("T", " ") : "N/A");
            response.put("status", ticket.getStatus() != null ? ticket.getStatus() : "Đã thanh toán");

            // BỔ SUNG: Truyền dữ liệu combo và voucher ra JSON để modal hiển thị chính xác
            response.put("combos", ticket.getCombos() != null ? ticket.getCombos() : "Không có");
            response.put("voucher", ticket.getVoucher() != null ? ticket.getVoucher() : "Không có");

            if (ticket.getUser() != null) {
                response.put("customerName", ticket.getUser().getFullName());
                response.put("customerContact", ticket.getUser().getPhone() + " - " + ticket.getUser().getEmail());
            } else {
                response.put("customerName", "Khách vãng lai");
                response.put("customerContact", "N/A");
            }
        }
        return response;
    }
}