package com.example.java_spring_mvc.domain;

public class User {
    private long id;
    private String email;
    private String fullname;
    private String password;
    private String address;
    private String phone;
    private String confirmPassword;
    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
    public String getEmail() {
        return email;
    }
    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", fullname=" + fullname + ", password=" + password
                + ", address=" + address + ", phone=" + phone + ", confirmPassword=" + confirmPassword + "]";
    }
    public void setEmail(String email) {
        this.email = email;
    }
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
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getConfirmPassword() {
        return confirmPassword;
    }
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    
}
