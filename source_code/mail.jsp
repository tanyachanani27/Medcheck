<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %> 
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Sending Mail</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                background-color:powderblue;
            }
           table{
                margin-top: 350px;
                font-size:30px;
            }
            tr{
                
                font-size:30px;
            }
            .btn{
                height: 50px;
                width: 70px;
                font-size: 20px;
            }
            .a{
                height: 30px;
                width: 500px;
            }
        </style>
    </head>
    <body >
        
        <form name="emailForm" method="post">
<table align="center" >

<tr>
    <td>
        <label >Enter Customer Email ID :</label>
        
        <input type="email" name="txtmail" size="65" class="a" >
        <br>
    </td>
</tr>
<tr>
<td align="center" >
    <br>
<input  type="submit" value="Send" name="btn1" class="btn">
</td>
</tr>
</table>
</form>

    </body>
</html>





<%
if (request.getParameter("btn1") != null)
{
//Creating a result for getting status that messsage is delivered or not!
String result;

// Get recipient's email-ID, message & subject-line from mail.html page
 String to= request.getParameter("txtmail");
//String[] recipient=to.split(",");
//InternetAddress[] recipientAdd=new InternetAddress[recipient.length];


final String subject = "ALERT!!";
final String messg = "Dear Customer,\nYour medicines are going to end soon! \nIf you need to purchase More then please do visit our shop\nWith Regards MedCheck";


// Sender's email ID and password needs to be mentioned
final String from = "manishac7429@gmail.com";
final String pass = "egwojjcbsvhbkvnk";

// Defining the gmail host
String host = "smtp.gmail.com";

// Creating Properties object
Properties props = new Properties();

// Defining properties
props.put("mail.smtp.ssl.enable", "true");
props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.user", from);
props.put("mail.password", pass);
props.put("mail.port", "465"); // there are some other ports also available

// Authorized the Session object.
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
@Override
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(from, pass);
}
});

try {
// Create a default MimeMessage object.
MimeMessage message = new MimeMessage(mailSession);

// Set From: header field of the header.
message.setFrom(new InternetAddress(from));

// Set To: header field of the header.
message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

// Set Subject: header field
message.setSubject(subject);

// Now set the actual message
message.setText(messg);

// Send message
Transport.send(message);
result = "Your mail sent successfully....";
out.println(result);
} catch (MessagingException mex) {
mex.printStackTrace();
result = "Error: unable to send mail....";
out.println(mex);
out.println(result);}
}

 %>
