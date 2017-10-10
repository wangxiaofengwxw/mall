package com.situ.mall.pojo;

public class ProductTotal {

	private String aprice;
	private String aid;
	
	public ProductTotal() {
		super();
	}

	public ProductTotal(String aprice, String aid) {
		super();
		this.aprice = aprice;
		this.aid = aid;
	}

	public String getAprice() {
		return aprice;
	}

	public void setAprice(String aprice) {
		this.aprice = aprice;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	@Override
	public String toString() {
		return "ProductTotal [aprice=" + aprice + ", aid=" + aid + "]";
	}
	
}
