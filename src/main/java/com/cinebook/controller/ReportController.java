package com.cinebook.controller;

import com.cinebook.entity.Ticket;
import com.cinebook.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.YearMonth;
import java.util.List;

@Controller
public class ReportController {

    @Autowired
    private TicketRepository ticketRepository;

    @GetMapping("/admin/bao-cao")
    public String viewReport(
            @RequestParam(defaultValue = "ALL") String filterType,
            @RequestParam(required = false) String selectedDate,
            @RequestParam(required = false) Integer selectedMonth,
            @RequestParam(required = false) Integer selectedYear,
            Model model) {

        LocalDate now = LocalDate.now();
        int year = (selectedYear != null) ? selectedYear : now.getYear();
        int month = (selectedMonth != null) ? selectedMonth : now.getMonthValue();

        // 1. Xác định mốc thời gian lọc dạng mảng hoặc biến final để dùng cho stream/repository
        LocalDateTime start = null;
        LocalDateTime end = null;

        if ("DATE".equals(filterType) && selectedDate != null && !selectedDate.isEmpty()) {
            LocalDate date = LocalDate.parse(selectedDate);
            start = date.atStartOfDay();
            end = date.atTime(LocalTime.MAX);
        } else if ("MONTH".equals(filterType)) {
            YearMonth yearMonth = YearMonth.of(year, month);
            start = yearMonth.atDay(1).atStartOfDay();
            end = yearMonth.atEndOfMonth().atTime(LocalTime.MAX);
        } else if ("YEAR".equals(filterType)) {
            start = LocalDate.of(year, 1, 1).atStartOfDay();
            end = LocalDate.of(year, 12, 31).atTime(LocalTime.MAX);
        }

        final LocalDateTime startDate = start;
        final LocalDateTime endDate = end;

        // 2. Truy vấn CSDL theo thời gian đã lọc
        Double ticketRevenue = ticketRepository.sumTicketRevenueByDateRange(startDate, endDate);
        if (ticketRevenue == null) ticketRevenue = 0.0;

        Long totalTickets = ticketRepository.countTicketsByDateRange(startDate, endDate);
        if (totalTickets == null) totalTickets = 0L;

        // Lấy tất cả vé và lọc thủ công bằng Stream để tính doanh thu combo
        List<Ticket> allTickets = ticketRepository.findAll();
        List<Ticket> tickets;
        if (startDate != null && endDate != null) {
            tickets = allTickets.stream()
                .filter(t -> t.getBookingDate() != null && 
                            !t.getBookingDate().isBefore(startDate) && 
                            !t.getBookingDate().isAfter(endDate))
                .toList();
        } else {
            tickets = allTickets;
        }

        double comboRevenue = 0.0;
        long totalCombos = 0L;

        for (Ticket t : tickets) {
            String comboStr = t.getCombos();
            if (comboStr != null && !comboStr.trim().isEmpty() && !comboStr.equals("Không có")) {
                String[] parts = comboStr.split(",");
                for (String part : parts) {
                    part = part.trim();
                    if (part.contains("x")) {
                        try {
                            String[] subParts = part.split("x");
                            int qty = Integer.parseInt(subParts[0].trim());
                            totalCombos += qty;

                            String comboName = subParts[1].trim();
                            if (comboName.contains("Solo")) {
                                comboRevenue += 69000 * qty;
                            } else if (comboName.contains("Siêu To")) {
                                comboRevenue += 89000 * qty;
                            } else if (comboName.contains("Gia Đình")) {
                                comboRevenue += 159000 * qty;
                            } else {
                                comboRevenue += 50000 * qty;
                            }
                        } catch (Exception e) {
                            // Bỏ qua lỗi định dạng chuỗi
                        }
                    }
                }
            }
        }

        Double totalRevenue = ticketRevenue + comboRevenue;

        // 3. Đưa dữ liệu sang Thymeleaf View
        model.addAttribute("filterType", filterType);
        model.addAttribute("selectedDate", selectedDate != null ? selectedDate : now.toString());
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedYear", year);

        model.addAttribute("ticketRevenue", ticketRevenue);
        model.addAttribute("totalTickets", totalTickets);
        model.addAttribute("comboRevenue", comboRevenue);
        model.addAttribute("totalCombos", totalCombos);
        model.addAttribute("totalRevenue", totalRevenue);

        return "admin/bao-cao";
    }
}