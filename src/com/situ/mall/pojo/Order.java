package com.situ.mall.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Order {

	private Integer id;
	private Integer order_no;
	private User user;
	private Shipping shipping;
	private BigDecimal payment;
	private Integer payment_type;
	private BigDecimal postage;
	private Integer status;
	private Date payment_time;
	private Date send_time;
	private Date end_time;
	private Date close_time;
	private Date create_time;
	private Date update_time;
	
	public Order() {
		super();
	}

	public Order(Integer id, Integer order_no, User user, Shipping shipping, BigDecimal payment, Integer payment_type,
			BigDecimal postage, Integer status, Date payment_time, Date send_time, Date end_time, Date close_time,
			Date create_time, Date update_time) {
		super();
		this.id = id;
		this.order_no = order_no;
		this.user = user;
		this.shipping = shipping;
		this.payment = payment;
		this.payment_type = payment_type;
		this.postage = postage;
		this.status = status;
		this.payment_time = payment_time;
		this.send_time = send_time;
		this.end_time = end_time;
		this.close_time = close_time;
		this.create_time = create_time;
		this.update_time = update_time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOrder_no() {
		return order_no;
	}

	public void setOrder_no(Integer order_no) {
		this.order_no = order_no;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

	public BigDecimal getPayment() {
		return payment;
	}

	public void setPayment(BigDecimal payment) {
		this.payment = payment;
	}

	public Integer getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(Integer payment_type) {
		this.payment_type = payment_type;
	}

	public BigDecimal getPostage() {
		return postage;
	}

	public void setPostage(BigDecimal postage) {
		this.postage = postage;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(Date payment_time) {
		this.payment_time = payment_time;
	}

	public Date getSend_time() {
		return send_time;
	}

	public void setSend_time(Date send_time) {
		this.send_time = send_time;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public Date getClose_time() {
		return close_time;
	}

	public void setClose_time(Date close_time) {
		this.close_time = close_time;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", order_no=" + order_no + ", user=" + user + ", shipping=" + shipping + ", payment="
				+ payment + ", payment_type=" + payment_type + ", postage=" + postage + ", status=" + status
				+ ", payment_time=" + payment_time + ", send_time=" + send_time + ", end_time=" + end_time
				+ ", close_time=" + close_time + ", create_time=" + create_time + ", update_time=" + update_time + "]";
	}
	
}
