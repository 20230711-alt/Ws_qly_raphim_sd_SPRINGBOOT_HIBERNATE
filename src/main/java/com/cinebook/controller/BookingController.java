package com.cinebook.controller;

import com.cinebook.entity.Ticket;
import com.cinebook.entity.Transaction;
import com.cinebook.entity.User;
import com.cinebook.repository.TicketRepository;
import com.cinebook.repository.TransactionRepository;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class BookingController {

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    @PostMapping("/api/book-tickets")
    @ResponseBody
    public ResponseEntity<?> bookTickets(@RequestBody BookingRequest request, HttpSession session) {
        try {
            User user = (User) session.getAttribute("loggedInUser");
            if (user == null) {
                return ResponseEntity.status(401).body("Chưa đăng nhập");
            }

            String seatsStr = request.getSeats() != null ? String.join(", ", request.getSeats()) : "";

            // Lưu thông tin vé
            Ticket ticket = new Ticket();
            ticket.setUserId(user.getId());
            ticket.setMovieTitle(request.getMovieTitle());
            ticket.setShowTime(request.getTime() + " - " + request.getDate());
            ticket.setSeats(seatsStr);
            ticket.setTotalPrice(request.getTotalPrice());
            ticket.setBookingDate(LocalDateTime.now());
            ticket.setCinema(request.getCinema());
            ticketRepository.save(ticket);

            // Lưu thông tin giao dịch
            Transaction tx = new Transaction();
            tx.setUserId(user.getId());
            tx.setTransactionCode("#TR-" + (System.currentTimeMillis() % 100000));
            tx.setSeatsDescription(seatsStr);
            tx.setAmount(request.getTotalPrice());
            tx.setCreatedAt(LocalDateTime.now());
            tx.setStatus("Thành công");
            transactionRepository.save(tx);

            return ResponseEntity.ok("Đặt vé thành công");
            
        } catch (Exception e) {
            // IN LỖI CHI TIẾT RA CONSOLE ĐỂ XEM NÓ ĐANG SAI Ở ĐÂU
            e.printStackTrace();
            return ResponseEntity.status(500).body("Lỗi Server: " + e.getMessage());
        }
    }
}

class BookingRequest {
    private String movieTitle;
    private String cinema;
    private String date;
    private String time;
    private List<String> seats;
    private double totalPrice;

    public String getMovieTitle() { return movieTitle; }
    public void setMovieTitle(String movieTitle) { this.movieTitle = movieTitle; }
    public String getCinema() { return cinema; }
    public void setCinema(String cinema) { this.cinema = cinema; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }
    public List<String> getSeats() { return seats; }
    public void setSeats(List<String> seats) { this.seats = seats; }
    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
}