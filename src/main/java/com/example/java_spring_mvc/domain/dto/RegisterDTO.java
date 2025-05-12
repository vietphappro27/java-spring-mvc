package com.example.java_spring_mvc.domain.dto;

import com.example.java_spring_mvc.service.validator.RegisterChecked;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;

@RegisterChecked
public class RegisterDTO {

    @Size(min = 2, message = "Tên phải có ít nhất 2 ký tự")
    private String fullname;

    @Size(min = 6, message = "Mật khẩu phải có ít nhất 6 ký tự")
    private String confirmPassword;

    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")
    private String email;

    private String password;
    private String phone;
    private String address;

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "RegisterDTO [fullname=" + fullname + ", password=" + password + ", confirmPassword=" + confirmPassword
                + ", email=" + email + ", phone=" + phone + ", address=" + address + "]";
    }

}
