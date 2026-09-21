package com.cinebook.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.cinebook.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    
    // Đảm bảo dùng findByEmail thay vì findByUsername
    Optional<User> findByEmail(String email);

    // Bổ sung: Đếm tổng số người dùng đăng ký cho Dashboard
    @Query("SELECT COUNT(u) FROM User u")
    Long countTotalUsers();
}