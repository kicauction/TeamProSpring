package model;

public class Abuy {

	
	private int pnum;
	private String userid;
	private int price;
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Abuy [pnum=" + pnum + ", userid=" + userid + ", price=" + price + "]";
	}
	
	
}
