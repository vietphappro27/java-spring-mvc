package com.example.java_spring_mvc.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class OtpService {

    // Store OTPs with expiry time (email -> [otp, expiry time])
    private Map<String, Map<String, Object>> otpStorage = new HashMap<>();
    private static final long OTP_VALID_DURATION = 5 * 60 * 1000; // 5 minutes in milliseconds

    public String generateOTP(String email) {
        // Generate 6-digit OTP
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        String otpString = String.valueOf(otp);

        // Store OTP with expiry time
        Map<String, Object> otpData = new HashMap<>();
        otpData.put("otp", otpString);
        otpData.put("expiryTime", System.currentTimeMillis() + OTP_VALID_DURATION);

        otpStorage.put(email, otpData);

        return otpString;
    }

    public boolean validateOTP(String email, String otp) {
        Map<String, Object> otpData = otpStorage.get(email);

        if (otpData == null) {
            return false; // No OTP found for this email
        }

        String storedOtp = (String) otpData.get("otp");
        long expiryTime = (long) otpData.get("expiryTime");

        if (System.currentTimeMillis() > expiryTime) {
            // OTP expired, remove it
            otpStorage.remove(email);
            return false;
        }

        if (storedOtp.equals(otp)) {
            // OTP matched, remove it after successful validation
            otpStorage.remove(email);
            return true;
        }

        return false;
    }

    public void clearOTP(String email) {
        otpStorage.remove(email);
    }
}