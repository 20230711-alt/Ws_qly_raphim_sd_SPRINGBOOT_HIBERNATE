package com.cinebook.repository;

import com.cinebook.entity.Voucher;
import com.cinebook.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VoucherRepository extends JpaRepository<Voucher, Long> {
    
    // Lấy danh sách voucher thuộc về một user cụ thể
    List<Voucher> findByUser(User user);
    
    // Kiểm tra xem user đã lưu mã này trong kho chưa để tránh trùng lặp
    boolean existsByUserAndCode(User user, String code);

    // Bổ sung: Lấy danh sách voucher hệ thống cho Admin (user IS NULL)
    @Query("SELECT v FROM Voucher v WHERE v.user IS NULL ORDER BY v.id DESC")
    List<Voucher> findAllSystemVouchers();
}