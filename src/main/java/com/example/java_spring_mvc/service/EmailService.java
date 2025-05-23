package com.example.java_spring_mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendOtpEmail(String email, String otp) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setFrom("phaplon32@gmail.com"); // Thêm địa chỉ email người gửi
            message.setSubject("Mã xác thực đặt lại mật khẩu");
            message.setText("Mã xác thực OTP của bạn là: " + otp);

            mailSender.send(message);
            System.out.println("Email đã được gửi thành công đến: " + email);
        } catch (Exception e) {
            System.out.println("Lỗi khi gửi email: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }
}