package kr.co.seoRak.repository.domain;

import java.util.Date;

public class Message {
	
	private int messageNo;
	private String recvId;
	private String sendId;
	private String messageTitle;
	private String messageContent;
	private Date sendDate;
	private Date readDate;
	private int recvDel;
	private int sendDel;
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getRecvId() {
		return recvId;
	}
	public void setRecvId(String recvId) {
		this.recvId = recvId;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public Date getReadDate() {
		return readDate;
	}
	public void setReadDate(Date readDate) {
		this.readDate = readDate;
	}
	public int getRecvDel() {
		return recvDel;
	}
	public void setRecvDel(int recvDel) {
		this.recvDel = recvDel;
	}
	public int getSendDel() {
		return sendDel;
	}
	public void setSendDel(int sendDel) {
		this.sendDel = sendDel;
	}
	


}
