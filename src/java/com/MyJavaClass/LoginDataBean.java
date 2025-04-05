package com.MyJavaClass;

public class LoginDataBean
{
    private int id;
    private long mobile;
    private String userType, name, profileImage, email, address, password, status, registerTime;

    public String getUserType() 
    {
        return userType;
    }

    public void setUserType(String userType) 
    {
        this.userType = userType;
    }

    public int getId() 
    {
        return id;
    }

    public void setId(int id) 
    {
        this.id = id;
    }

    public String getName() 
    {
        return name;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getProfileImage() 
    {
        return profileImage;
    }

    public void setProfileImage(String profileImage) 
    {
        this.profileImage = profileImage;
    }

    public String getEmail() 
    {
        return email;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public long getMobile() 
    {
        return mobile;
    }

    public void setMobile(long mobile) 
    {
        this.mobile = mobile;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getPassword() 
    {
        return password;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getRegisterTime() 
    {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) 
    {
        this.registerTime = registerTime;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }   
}
