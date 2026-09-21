package com.cinebook.entity;

import javax.persistence.*;

@Entity
@Table(name = "showtimes")
public class Showtime {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String cinemaName;   // Tên rạp (VD: CINEBOOK Vincom Đồng Khởi)
    private String movieTitle;   // Tên phim
    private String room;         // Phòng chiếu (IMAX, Phòng 1...)
    private String showDate;     // Ngày chiếu (yyyy-MM-dd)
    private String showTime;     // Giờ chiếu (HH:mm)
    private Double ticketPrice;  // Giá vé cơ bản
    private String status;       // Trạng thái (Đang chiếu, Sắp chiếu, Đã hủy)

    public Showtime() {}

    public Showtime(String cinemaName, String movieTitle, String room, String showDate, String showTime, Double ticketPrice, String status) {
        this.cinemaName = cinemaName;
        this.movieTitle = movieTitle;
        this.room = room;
        this.showDate = showDate;
        this.showTime = showTime;
        this.ticketPrice = ticketPrice;
        this.status = status;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCinemaName() { return cinemaName; }
    public void setCinemaName(String cinemaName) { this.cinemaName = cinemaName; }

    public String getMovieTitle() { return movieTitle; }
    public void setMovieTitle(String movieTitle) { this.movieTitle = movieTitle; }

    public String getRoom() { return room; }
    public void setRoom(String room) { this.room = room; }

    public String getShowDate() { return showDate; }
    public void setShowDate(String showDate) { this.showDate = showDate; }

    public String getShowTime() { return showTime; }
    public void setShowTime(String showTime) { this.showTime = showTime; }

    public Double getTicketPrice() { return ticketPrice; }
    public void setTicketPrice(Double ticketPrice) { this.ticketPrice = ticketPrice; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}