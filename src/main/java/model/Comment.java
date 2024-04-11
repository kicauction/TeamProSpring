package model;

public class Comment {
   private int ser;
   private int num;
   private String content;
   private String regdate;
   private String userid;
   private int upcnt;
public int getSer() {
	return ser;
}
public void setSer(int ser) {
	this.ser = ser;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getRegdate() {
	return regdate;
}
public void setRegdate(String regdate) {
	this.regdate = regdate;
}
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public int getUpcnt() {
	return upcnt;
}
public void setUpcnt(int upcnt) {
	this.upcnt = upcnt;
}
@Override
public String toString() {
	return "Comment [ser=" + ser + ", num=" + num + ", content=" + content + ", regdate=" + regdate + ", userid="
			+ userid + ", upcnt=" + upcnt + "]";
}

   
}
