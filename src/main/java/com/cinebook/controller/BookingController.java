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

            // Format chuẩn: HH:mm - yyyy-MM-dd (VD: 09:30 - 2026-09-20)
            String formattedShowTime = request.getTime() + " - " + request.getDate();

            Ticket ticket = new Ticket();
            ticket.setUserId(user.getId());
            ticket.setMovieTitle(request.getMovieTitle());
            ticket.setShowTime(formattedShowTime);
            ticket.setSeats(seatsStr);
            ticket.setTotalPrice(request.getTotalPrice());
            ticket.setBookingDate(LocalDateTime.now());
            ticket.setCinemaName(request.getCinema());
            
            // THÊM: Thiết lập trạng thái ban đầu khi vừa bấm đặt vé là "Chờ thanh toán"
            ticket.setStatus("Chờ thanh toán");

            // Lưu vé
            Ticket savedTicket = ticketRepository.save(ticket);

            // Lưu giao dịch tương ứng
            Transaction tx = new Transaction();
            tx.setUserId(user.getId());
            tx.setTransactionCode("#TR-" + (System.currentTimeMillis() % 100000));
            tx.setSeatsDescription(seatsStr);
            tx.setAmount(request.getTotalPrice());
            tx.setCreatedAt(LocalDateTime.now());
            tx.setStatus("Chờ thanh toán");
            transactionRepository.save(tx);

            // Trả về ID vé vừa lưu để giao diện gửi các lệnh tiếp theo (Thanh toán / Hủy)
            return ResponseEntity.ok(savedTicket.getId());

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("Lỗi Server: " + e.getMessage());
        }
    }

    // THÊM: API chuyển trạng thái sang "Đã thanh toán"
    @PostMapping("/api/tickets/{id}/pay")
    @ResponseBody
    public ResponseEntity<?> payTicket(@PathVariable("id") Long id) {
        Ticket ticket = ticketRepository.findById(id).orElse(null);
        if (ticket != null) {
            ticket.setStatus("Đã thanh toán");
            ticketRepository.save(ticket);
            return ResponseEntity.ok("Thanh toán thành công");
        }
        return ResponseEntity.badRequest().body("Không tìm thấy vé");
    }

    // THÊM: API chuyển trạng thái sang "Đã hủy"
    @PostMapping("/api/tickets/{id}/cancel")
    @ResponseBody
    public ResponseEntity<?> cancelTicket(@PathVariable("id") Long id) {
        Ticket ticket = ticketRepository.findById(id).orElse(null);
        if (ticket != null) {
            ticket.setStatus("Đã hủy");
            ticketRepository.save(ticket);
            return ResponseEntity.ok("Hủy vé thành công");
        }
        return ResponseEntity.badRequest().body("Không tìm thấy vé");
    }
}

class BookingRequest {
    private String movieTitle;
    private String cinema;
    private String date;
    private String time;
    private String room;
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
    public String getRoom() { return room; }
    public void setRoom(String room) { this.room = room; }
    public List<String> getSeats() { return seats; }
    public void setSeats(List<String> seats) { this.seats = seats; }
    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
}