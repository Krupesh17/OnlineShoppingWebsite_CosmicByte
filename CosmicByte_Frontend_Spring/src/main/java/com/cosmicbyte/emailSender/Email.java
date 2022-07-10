package com.cosmicbyte.emailSender;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {

	String to;
	String subject;
	String text;
	
	public Email(String to, String subject, String text) {
		 
		this.to = to;
		this.subject = subject;
		this.text = text;
	}
	
	public void sendEmail() throws Exception {
		
		System.out.println("#############|Mail|#############");
		final String username = "kriptopair@gmail.com";
		final String password = "pass@Kripto123";
		
		Properties properties = new Properties();	
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(username, password);
			}
		});

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(text);

			Transport.send(message);

			System.out.println("Done");		
	}
}
