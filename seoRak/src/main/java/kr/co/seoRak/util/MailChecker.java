package kr.co.seoRak.util;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailChecker {
	
	public void mailSend(String email, String confirm) throws UnsupportedEncodingException{
		try {
			String emailList = email;// 메일 보낼사람 리스트 
			String emailFromAddress = "seorakBooks@gmail.com";// 메일 보내는 사람
			String emailMsgTxt = "안녕하세요 SeoRak 입니다. \n" +
					"입력하실 인증 번호는 "+ confirm +"입니다."; // 내용
			String emailSubjectTxt = "SeoRak 회원가입 인증 메일입니다.";// 제목

			// 메일보내기 
			postMail(emailList, emailSubjectTxt, emailMsgTxt, emailFromAddress);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private void postMail(String receiver, String subject, String message, String from) throws MessagingException {
		boolean debug = false;
		java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

		String SMTP_HOST_NAME = "gmail-smtp.l.google.com";

		// Properties 설정
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.starttls.enable","true");
		props.put("mail.smtp.host", SMTP_HOST_NAME);
		props.put("mail.smtp.auth", "true");

		Authenticator auth = new SMTPAuthenticator();
		Session session = Session.getDefaultInstance(props, auth);

		session.setDebug(debug);

		// create a message
		Message msg = new MimeMessage(session);

		// set the from and to address
		InternetAddress addressFrom = new InternetAddress(from);
		msg.setFrom(addressFrom);

		InternetAddress addressTo = new InternetAddress(receiver);
		msg.setRecipient(Message.RecipientType.TO, addressTo);

		// Setting the Subject and Content Type
		msg.setSubject(subject);
		msg.setContent(message, "text/html; charset=utf-8");
		Transport.send(msg);
	}

	/**
	 * 구글 사용자 메일 계정 아이디/패스 정보
	 */
	private class SMTPAuthenticator extends javax.mail.Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			String username =  "seorakBooks@gmail.com"; 
			// gmail 사용자;
			String password = "tjfkr1234"; // 패스워드;
			return new PasswordAuthentication(username, password);
		}
	}
}
