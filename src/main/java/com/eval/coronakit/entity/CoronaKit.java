package com.eval.coronakit.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Coronakitdetails") 
public class CoronaKit {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Embedded
	private UserAddress deliveryAddress;
	@Column(name="OrderDate")
	private String orderDate;
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	@Column(name="TotalAmount")
	private int totalAmount;
	public CoronaKit() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public UserAddress getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(UserAddress deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	
	public int getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	



}
