package com.sekishii.nomikai.domain.service;

import com.sekishii.nomikai.domain.model.Reservation;
import com.sekishii.nomikai.domain.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReservationService {

  @Autowired
  private ReservationRepository reservationRepository;


  /**
   *
   * @return
   */
  public List<Reservation> findReservationList() {

    return reservationRepository.findActiveReservationList();

  }
}
