package com.cinebook.controller;

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

        LocalDateTime startDate = null;
        LocalDateTime endDate = null;
        LocalDate now = LocalDate.now();

        int year = (selectedYear != null) ? selectedYear : now.getYear();
        int month = (selectedMonth != null) ? selectedMonth : now.getMonthValue();

        // 1. Xử lý tính toán mốc thời gian lọc
        if ("DATE".equals(filterType) && selectedDate != null && !selectedDate.isEmpty()) {
            LocalDate date = LocalDate.parse(selectedDate);
            startDate = date.atStartOfDay();
            endDate = date.atTime(LocalTime.MAX);
        } else if ("MONTH".equals(filterType)) {
            YearMonth yearMonth = YearMonth.of(year, month);
            startDate = yearMonth.atDay(1).atStartOfDay();
            endDate = yearMonth.atEndOfMonth().atTime(LocalTime.MAX);
        } else if ("YEAR".equals(filterType)) {
            startDate = LocalDate.of(year, 1, 1).atStartOfDay();
            endDate = LocalDate.of(year, 12, 31).atTime(LocalTime.MAX);
        }

        // 2. Truy vấn CSDL theo thời gian đã lọc
        Double ticketRevenue = ticketRepository.sumTicketRevenueByDateRange(startDate, endDate);
        Long totalTickets = ticketRepository.countTicketsByDateRange(startDate, endDate);

        Double comboRevenue = 0.0;
        Long totalCombos = 0L;
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