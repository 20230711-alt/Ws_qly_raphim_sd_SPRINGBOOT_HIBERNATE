package com.cinebook.repository;

import com.cinebook.entity.Ticket;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, Long> {

    List<Ticket> findByUserId(Long userId);

    @Query("SELECT t FROM Ticket t LEFT JOIN t.user u WHERE " +
           "(:keyword IS NULL OR " +
           " LOWER(t.movieTitle) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           " LOWER(t.cinemaName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           " LOWER(t.seats) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           " LOWER(u.fullName) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           " LOWER(u.email) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
           " u.phone LIKE CONCAT('%', :keyword, '%') OR " +
           " CAST(t.id AS string) = :cleanId OR " +
           " CAST(t.id AS string) LIKE CONCAT('%', :keyword, '%')) AND " +
           "(:startDate IS NULL OR t.bookingDate >= :startDate) AND " +
           "(:status IS NULL OR t.status = :status)")
    Page<Ticket> searchAndFilterTickets(
            @Param("keyword") String keyword,
            @Param("cleanId") String cleanId,
            @Param("startDate") LocalDateTime startDate,
            @Param("status") String status,
            Pageable pageable);

    // Tính tổng doanh thu vé theo khoảng thời gian
    @Query("SELECT COALESCE(SUM(t.totalPrice), 0) FROM Ticket t WHERE " +
           "(:startDate IS NULL OR t.bookingDate >= :startDate) AND " +
           "(:endDate IS NULL OR t.bookingDate <= :endDate)")
    Double sumTicketRevenueByDateRange(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate);

    // Đếm tổng số vé bán được theo khoảng thời gian
    @Query("SELECT COUNT(t) FROM Ticket t WHERE " +
           "(:startDate IS NULL OR t.bookingDate >= :startDate) AND " +
           "(:endDate IS NULL OR t.bookingDate <= :endDate)")
    Long countTicketsByDateRange(
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate);
 // 1. Tổng doanh thu thực tế
    @Query("SELECT COALESCE(SUM(t.totalPrice), 0) FROM Ticket t")
    Double sumTotalRevenue();

    // 2. Tổng số vé đã bán
    @Query("SELECT COUNT(t) FROM Ticket t")
    Long countTotalTickets();

    // 3. Đếm số vé theo trạng thái (cho biểu đồ tròn Doughnut)
    @Query("SELECT COUNT(t) FROM Ticket t WHERE t.status = :status OR (:status = 'Đã thanh toán' AND t.status IS NULL)")
    Long countTicketsByStatus(@Param("status") String status);

    // 4. Lấy danh sách giao dịch gần đây
    List<Ticket> findTop5ByOrderByIdDesc();
}