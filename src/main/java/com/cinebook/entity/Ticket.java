package com.cinebook.entity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tickets")
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    private String movieTitle;
    private String showTime;
    private String seats;
    private Double totalPrice;

    @Column(name = "booking_date")
    private LocalDateTime bookingDate;

    // Tên rạp chiếu
    @Column(name = "cinema_name")
    private String cinemaName;

    // Trạng thái vé
    @Column(name = "status")
    private String status = "Đã thanh toán";

    // Thuộc tính lưu combo bắp nước
    @Column(name = "combos")
    private String combos;

    // Bổ sung thuộc tính lưu mã ưu đãi (voucher)
    @Column(name = "voucher")
    private String voucher;

    // Khai báo liên kết với bảng User (để truy xuất tên, sdt, email khách hàng)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", insertable = false, updatable = false)
    private User user;

    // --- GETTERS AND SETTERS ---

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }

    public String getMovieTitle() { return movieTitle; }
    public void setMovieTitle(String movieTitle) { this.movieTitle = movieTitle; }

    public String getShowTime() { return showTime; }
    public void setShowTime(String showTime) { this.showTime = showTime; }

    public String getSeats() { return seats; }
    public void setSeats(String seats) { this.seats = seats; }

    public Double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(Double totalPrice) { this.totalPrice = totalPrice; }

    public LocalDateTime getBookingDate() { return bookingDate; }
    public void setBookingDate(LocalDateTime bookingDate) { this.bookingDate = bookingDate; }

    public String getCinemaName() { return cinemaName; }
    public void setCinemaName(String cinemaName) { this.cinemaName = cinemaName; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getCombos() { return combos; }
    public void setCombos(String combos) { this.combos = combos; }

    public String getVoucher() { return voucher; }
    public void setVoucher(String voucher) { this.voucher = voucher; }

    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}