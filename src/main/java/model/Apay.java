package model;

import java.util.Date;

public class Apay {

	
	
	    private String name;
	    private String tel;
	    private String address;
	    private String memo;
	    private String pnum;
	    private Date regdate;
	    private String buy;
	    private int sp = 0;
	    private String id;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getMemo() {
			return memo;
		}
		public void setMemo(String memo) {
			this.memo = memo;
		}
		public String getPnum() {
			return pnum;
		}
		public void setPnum(String pnum) {
			this.pnum = pnum;
		}
		public Date getRegdate() {
			return regdate;
		}
		public void setRegdate(Date regdate) {
			this.regdate = regdate;
		}
		public String getBuy() {
			return buy;
		}
		public void setBuy(String buy) {
			this.buy = buy;
		}
		public int getSp() {
			return sp;
		}
		public void setSp(int sp) {
			this.sp = sp;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		@Override
		public String toString() {
			return "Apay [name=" + name + ", tel=" + tel + ", address=" + address + ", memo=" + memo + ", pnum=" + pnum
					+ ", regdate=" + regdate + ", buy=" + buy + ", sp=" + sp + ", id=" + id + "]";
		}
	    
	    
	   
	
		
	    
	    
	
}
