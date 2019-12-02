package com.sekishii.nomikai.domain.model;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity
@Table(name = "reservation")
public class Reservation {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private long id;

  @Column(name = "reservation_id")
  private String reservationId;

  @Column(name = "reservation_name")
  private String reservationName;

  @Column(name = "position")
  private String position;

  @Column(name = "content")
  private String content;

  @Column(name = "img_url")
  private String imgUrl;

  @Column(name = "organizer_id")
  private String organizerId;

  @Column(name = "begin_time")
  private Timestamp beginTime;

  @Column(name = "estimate_time")
  private int estimateTime;

  @Column(name = "delete_flg")
  private String deleteFlg;

  @Column(name = "created_at")
  private Timestamp createdAt;

  @Column(name = "updated_at")
  private Timestamp updatedAt;

  /**
   * 活动发起时执行
   */
  @PrePersist
  public void onPrePersist() {
    setCreatedAt(new Timestamp(System.currentTimeMillis()));
    setUpdatedAt(new Timestamp(System.currentTimeMillis()));
  }

  /**
   * 活动更新时执行
   */
  @PreUpdate
  public void onPreUpdate() {
    setUpdatedAt(new Timestamp(System.currentTimeMillis()));
  }

}
