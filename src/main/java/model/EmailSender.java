
package model;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailSender {

    public static void sendTemporaryPassword(String toEmail, String temporaryPassword) {
        // Gmail 계정 설정
        String fromEmail = "tjddns0409@gmail.com"; // 발신자 Gmail 계정
        String password = "dbqh xntu beyw yqox"; // 앱 비밀번호

        // SMTP 서버 설정
        String host = "smtp.gmail.com";
        int port = 587;

        // 이메일 속성 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);

        // 세션 생성
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            // 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("임시 비밀번호 발급");
            message.setText("안녕하세요, 임시 비밀번호는 " + temporaryPassword + " 입니다.");

            // 메시지 전송
            Transport.send(message);

            System.out.println("임시 비밀번호 이메일 전송 성공");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
