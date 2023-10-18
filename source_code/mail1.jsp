<!DOCTYPE html>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %> 

<% 
    String to = request.getParameter("txtmail");
    String from = "manishac7429@gmail.com";
    final String username = "manishac7429";
    final String password = "egwojjcbsvhbkvnk";
    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", "587");
    
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(username, password);
}
});
    
    try {
        Message message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject("MedCheck Medicine Reminder");
        message.setText("Dear Customer,\nYour medicines are going to end soon! \nIf you need to purchase More then please do visit our shop\nWith Regards MedCheck");
        Transport.send(message);
    }catch (MessagingException mex) {
            throw new RuntimeException(mex);
}
    out.println("Sent mail successfully....");
    %>