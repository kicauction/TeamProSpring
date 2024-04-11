package model;

import java.util.Date;

public class Cart {
   
    private String id;
    private int pnum;
   private String pname;
    private String price;
    private String file1;
    private Date regdate;
    private int readcnt;
    private String subject;
    private String ser;
   private String prompt;
   private String maxid; 
   
   public String getMaxid() {
      return maxid;
   }
   public void setMaxid(String maxid) {
      this.maxid = maxid;
   }
   public String getUserid() {
      return id;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getPnum() {
      return pnum;
   }
   public void setPnum(int pnum) {
      this.pnum = pnum;
   }
   public void setUserid(String id) {
      this.id = id;
   }
   public int getItemid() {
      return pnum;
   }
   public void setItemid(int pnum) {
      this.pnum = pnum;
   }
   public String getPname() {
      return pname;
   }
   public void setPname(String pname) {
      this.pname = pname;
   }
   public String getPrice() {
      return price;
   }
   public void setPrice(String price) {
      this.price = price;
   }
   public String getFile1() {
      return file1;
   }
   public void setFile1(String file1) {
      this.file1 = file1;
   }
   public Date getRegdate() {
      return regdate;
   }
   public void setRegdate(Date regdate) {
      this.regdate = regdate;
   }
   public int getReadcnt() {
      return readcnt;
   }
   public void setReadcnt(int readcnt) {
      this.readcnt = readcnt;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getSer() {
      return ser;
   }
   public void setSer(String ser) {
      this.ser = ser;
   }
   public String getPrompt() {
      return prompt;
   }
   public void setPrompt(String prompt) {
      this.prompt = prompt;
   }
   @Override
   public String toString() {
      return "Cart [pnum=" + pnum + ", id=" + id + ", pnum=" + pnum + ", pname=" + pname + ", price="
            + price + ", file1=" + file1 + ", regdate=" + regdate + ", readcnt=" + readcnt + ", subject=" + subject
            + ", ser=" + ser + ", prompt=" + prompt + "]";
   }
   
   
        
}