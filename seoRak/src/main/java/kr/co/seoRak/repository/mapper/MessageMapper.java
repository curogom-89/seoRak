package kr.co.seoRak.repository.mapper;

import java.util.List;

import kr.co.seoRak.repository.domain.Message;

public interface MessageMapper {

	String receiverCheck(String memberNickname);
	void sendMessage(Message message);
	List<Message> receiveList (String memberNickname);
	Message readMessage (int messageNo);
	List<Message> sendList (String memberNickname);
	List<Message> receiveTrash (String memberNickname);
	List<Message> sendTrash (String memberNickname);
	void readMessageDate (int messageNo);
	void receiveMoveTrash (int messageNo);
	void sendMoveTrash (int messageNo);
	void receiveMoveList (int messageNo);
	void sendMoveList (int messageNo);
	void receiveRemove (int messageNo);
	void sendRemove (int messageNo);
	void deleteMessage (int messageNo);
	
}
