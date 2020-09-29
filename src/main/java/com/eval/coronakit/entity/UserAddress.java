package com.eval.coronakit.entity;

import javax.persistence.Embeddable;
import javax.validation.constraints.NotBlank;

@Embeddable
public class UserAddress {
	
	@NotBlank(message="Address1 cannot be blank value")
	
	private String Address1;
	
	@NotBlank(message="Address2 cannot be blank value")
	private String Address2;
	
	@NotBlank(message="City cannot be blank value")
	private String City;
	
	@NotBlank(message="State cannot be blank value")
	private String State;
	
	public String getAddress1() {
		return Address1;
	}
	public void setAddress1(String address1) {
		Address1 = address1;
	}
	public String getAddress2() {
		return Address2;
	}
	public void setAddress2(String address2) {
		Address2 = address2;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	@Override
	public String toString() {
		return "UserAddress [Address1=" + Address1 + ", Address2=" + Address2 + ", City=" + City + ", State=" + State
				+ "]";
	}
	
	

}
