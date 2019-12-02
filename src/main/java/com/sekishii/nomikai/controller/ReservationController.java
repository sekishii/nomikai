package com.sekishii.nomikai.controller;

import com.sekishii.nomikai.domain.model.Reservation;
import com.sekishii.nomikai.domain.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ReservationController {

  @Autowired
  private ReservationService reservationService;

  @GetMapping(value = {"/", "/reservation/list"})
  @ResponseBody
  public ModelAndView index() {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("reservation/list");

    List<Reservation> reservationList = reservationService.findReservationList();
    mav.addObject("reservationList", reservationList);

    return mav;
  }
}
