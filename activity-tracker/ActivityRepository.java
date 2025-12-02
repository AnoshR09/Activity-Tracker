package com.tracker;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ActivityRepository extends JpaRepository<Activity, Long> {
    List<Activity> findByStatusOrderByUpdatedAtDesc(String status);
    List<Activity> findAllByOrderByUpdatedAtDesc();
}