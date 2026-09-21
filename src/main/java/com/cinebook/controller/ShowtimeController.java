package com.cinebook.controller;

import com.cinebook.entity.Showtime;
import com.cinebook.entity.Ticket;
import com.cinebook.repository.MovieRepository;
import com.cinebook.repository.ShowtimeRepository;
import com.cinebook.repository.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ShowtimeController {

    @Autowired
    private ShowtimeRepository showtimeRepository;

    @Autowired
    private MovieRepository movieRepository;

    @Autowired
    private TicketRepository ticketRepository;

    // Tổng số ghế tiêu chuẩn cho 1 phòng chiếu (8 hàng x 12 cột = 96 ghế)
    private static final int TOTAL_SEATS_PER_ROOM = 96;

    // 1. GIAO DIỆN QUẢN LÝ SUẤT CHIẾU ADMIN
    @GetMapping("/admin/suat-chieu")
    public String quanLySuatChieu(Model model) {
        List<Showtime> showtimes = showtimeRepository.findAll();
        List<Ticket> allTickets = ticketRepository.findAll();

        Map<Long, String> occupancyMap = new HashMap<>();

        for (Showtime st : showtimes) {
            int bookedSeatsCount = 0;

            for (Ticket t : allTickets) {
                // So sánh Tên Rạp
                boolean isSameCinema = st.getCinemaName() != null && t.getCinemaName() != null 
                        && st.getCinemaName().trim().equalsIgnoreCase(t.getCinemaName().trim());

                // So sánh Tên Phim
                boolean isSameMovie = st.getMovieTitle() != null && t.getMovieTitle() != null 
                        && st.getMovieTitle().trim().equalsIgnoreCase(t.getMovieTitle().trim());

                // So sánh Ngày/Giờ chiếu
                boolean isSameTime = true;
                if (t.getShowTime() != null && st.getShowTime() != null) {
                    String ticketTimeStr = t.getShowTime().trim();
                    String stTimeStr = st.getShowTime().trim();
                    String stDateStr = st.getShowDate() != null ? st.getShowDate().trim() : "";

                    isSameTime = ticketTimeStr.contains(stTimeStr) || (!stDateStr.isEmpty() && ticketTimeStr.contains(stDateStr));
                }

                // Đếm số ghế nếu khớp thông tin
                if (isSameCinema && isSameMovie && isSameTime && t.getSeats() != null && !t.getSeats().trim().isEmpty()) {
                    String[] seatsArray = t.getSeats().split(",");
                    bookedSeatsCount += seatsArray.length;
                }
            }

            // Tính tỷ lệ % lấp đầy
            int percentage = (int) Math.round(((double) bookedSeatsCount / TOTAL_SEATS_PER_ROOM) * 100);
            String occupancyText = bookedSeatsCount + "/" + TOTAL_SEATS_PER_ROOM + " (" + percentage + "%)";
            occupancyMap.put(st.getId(), occupancyText);
        }

        model.addAttribute("showtimes", showtimes);
        model.addAttribute("occupancyMap", occupancyMap);
        if (movieRepository != null) {
            model.addAttribute("movies", movieRepository.findAll());
        }

        return "admin/quan-ly-suat-chieu";
    }

    // 2. API TRẢ VỀ DANH SÁCH SUẤT CHIẾU (JSON) CHO TRANG CHỌN SUẤT CHIẾU CỦA USER
    @GetMapping("/api/showtimes")
    @ResponseBody
    @CrossOrigin(origins = "*")
    public ResponseEntity<List<Showtime>> getShowtimesApi() {
        List<Showtime> showtimes = showtimeRepository.findAll();
        return ResponseEntity.ok(showtimes);
    }

    // 3. THÊM SUẤT CHIẾU MỚI
    @PostMapping("/admin/suat-chieu/add")
    public String addShowtime(@RequestParam String cinemaName,
                              @RequestParam String movieTitle,
                              @RequestParam String room,
                              @RequestParam Double ticketPrice,
                              @RequestParam String showDate,
                              @RequestParam String showTime) {

        Showtime st = new Showtime(cinemaName, movieTitle, room, showDate, showTime, ticketPrice, "Sắp chiếu");
        showtimeRepository.save(st);
        return "redirect:/admin/suat-chieu";
    }

    // 4. CẬP NHẬT SUẤT CHIẾU
    @PostMapping("/admin/suat-chieu/update")
    public String updateShowtime(@RequestParam Long id,
                                 @RequestParam String cinemaName,
                                 @RequestParam String movieTitle,
                                 @RequestParam String room,
                                 @RequestParam Double ticketPrice,
                                 @RequestParam String showDate,
                                 @RequestParam String showTime,
                                 @RequestParam String status) {

        Showtime st = showtimeRepository.findById(id).orElse(null);
        if (st != null) {
            st.setCinemaName(cinemaName);
            st.setMovieTitle(movieTitle);
            st.setRoom(room);
            st.setTicketPrice(ticketPrice);
            st.setShowDate(showDate);
            st.setShowTime(showTime);
            st.setStatus(status);
            showtimeRepository.save(st);
        }
        return "redirect:/admin/suat-chieu";
    }

    // 5. XÓA SUẤT CHIẾU
    @GetMapping("/admin/suat-chieu/delete/{id}")
    public String deleteShowtime(@PathVariable Long id) {
        showtimeRepository.deleteById(id);
        return "redirect:/admin/suat-chieu";
    }
}