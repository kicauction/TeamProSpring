package model;

import java.util.Date;

public class AddbuyList {

	private int pnum;
	private String buyid;
	private Date buydate;
	private String buy;
	private int buycnt;
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getBuyid() {
		return buyid;
	}
	public void setBuyid(String buyid) {
		this.buyid = buyid;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
	public String getBuy() {
		return buy;
	}
	public void setBuy(String buy) {
		this.buy = buy;
	}
	public int getBuycnt() {
		return buycnt;
	}
	public void setBuycnt(int buycnt) {
		this.buycnt = buycnt;
	}
	@Override
	public String toString() {
		return "AddbuyList [pnum=" + pnum + ", buyid=" + buyid + ", buydate=" + buydate + ", buy=" + buy + ", buycnt="
				+ buycnt + "]";
	}
	
}
