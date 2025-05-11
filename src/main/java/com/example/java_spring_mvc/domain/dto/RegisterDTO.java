package com.example.java_spring_mvc.domain.dto;

public class RegisterDTO {
    private String fullname;
    private String password;
    private String confirmPassword;
    private String email;
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
