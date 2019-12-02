package com.sekishii.nomikai.domain.model;


import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity
@Table(name = "reservation")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id", nullable = false)
  private long id;

  @Column(name = "user_id")
  private String userId;

  @Column(name = "user_name")
  private String userName;

  @Column(name = "sex")
  private String sex;

  @Column(name = "age")
  private int age;

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
