package model;

import java.util.Date;

public class Report {
	
	private String reportid; //신고한사람
	private int reportpnum;
	private String content ;
	private Date regdate ;
	private int pnum;
	
	private String reportedid;//신고당한사람
	private int reportcount;
	
	 
	public int getReportcount() {
		return reportcount;
	}
	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}
	public String getReportid() {
		return reportid;
	}
	public void setReportid(String reportid) {
		this.reportid = reportid;
	}
	public int getReportpnum() {
		return reportpnum;
	}
	public void setReportpnum(int reportpnum) {
		this.reportpnum = reportpnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getReportedid() {
		return reportedid;
	}
	public void setReportedid(String reportedid) {
		this.reportedid = reportedid;
	}
	@Override
	public String toString() {
		return "Report [reportid=" + reportid + ", reportpnum=" + reportpnum + ", content=" + content + ", regdate="
				+ regdate + ", pnum=" + pnum + ", reportedid=" + reportedid + ", reportcount=" + reportcount + "]";
	}
	
	
	
	
	
	
	
	
}
