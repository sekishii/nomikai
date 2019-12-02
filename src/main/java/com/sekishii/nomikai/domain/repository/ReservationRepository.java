package com.sekishii.nomikai.domain.repository;

import com.sekishii.nomikai.domain.model.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ReservationRepository extends JpaRepository<Reservation, String> {

  @Query("Select T from Reservation T " +
      " where T.deleteFlg = '0' ")
  List<Reservation> findActiveReservationList();
}
