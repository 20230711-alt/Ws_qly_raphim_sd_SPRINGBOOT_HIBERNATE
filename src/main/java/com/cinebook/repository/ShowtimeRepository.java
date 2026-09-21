package com.cinebook.repository;

import com.cinebook.entity.Showtime;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShowtimeRepository extends JpaRepository<Showtime, Long> {
    
    // Tìm danh sách suất chiếu theo Tên rạp và Tên phim cho giao diện Người dùng
    List<Showtime> findByCinemaNameAndMovieTitle(String cinemaName, String movieTitle);
    List<Showtime> findByMovieTitle(String movieTitle);

    // Bổ sung: Đếm tổng số suất chiếu hiện có cho Dashboard
    @Query("SELECT COUNT(s) FROM Showtime s")
    Long countTotalShowtimes();
}