var req_email = /^([a-z0-9._]{3,15})@([a-z0-9]{3,10})\.([a-z.]{2,5})$/;
var req_pwd = /^([a-zA-Z0-9._!@#$%^&*<>:";']{1,})$/;
var req_mob = /^([0-9]{10})$/;

function loginValidation()
{
    let email = document.getElementById("login_email");
    let pwd = document.getElementById("login_pwd");
    let msg = document.getElementById("msg");
    
    email.style = "";
    pwd.style = "";
    msg.innerHTML = "";
    
    if(!(email.value.toLowerCase()).match(req_email))
    {
        email.style = "border: 2px solid var(--dark-purple-color); border-radius: var(--half-border-radius);";
        msg.innerHTML = "Enter the Email ID.";
        email.focus();
        return false;
    }
    else if(!(pwd.value).match(req_pwd))
    {
        pwd.style = "border: 2px solid var(--dark-purple-color); border-radius: var(--half-border-radius);";
        msg.innerHTML = "Enter the password.";
        pwd.focus();
        return false;
    }
    else
    {
        return true;
    }
}

function signupValidation()
{
    let name = document.getElementById("signup_uname");
    let email = document.getElementById("signup_email");
    let mobile = document.getElementById("signup_mobile");
    let address = document.getElementById("signup_address");
    let pwd = document.getElementById("signup_pwd");
    let msg = document.getElementById("msg");
    
    name.style = "";
    email.style = "";
    mobile.style = "";
    address.style = "";
    pwd.style = "";
    msg.innerHTML = "";
    
    if(name.value === "")
    {
        name.style = "border: 2px solid var(--dark-purple-color); border-radius: var(--half-border-radius);";
        msg.innerHTML = "Enter the your full name.";
        name.focus();
        return false;
    }
    else if(!(email.value.toLowerCase()).match(req_email))
    {
        email.style = "border: 2px solid var(--dark-purple-color); border-radius: var(--half-border-radius);";
        msg.innerHTML = "Enter the Email ID.";
        email.focus();
        return false;
    }
    else if(!(mobile.value).match(req_mob))
    {
        mobile.style = "border: 2px solid var(--dark-purple-color); border-radius: var(--half-border-radius);";
        msg.innerHTML = "Enter the Mobile number.";
        mobile.focus();
        return false;
    }
    else if(address.value === "")
    {
        address.style = "border: 2px solid var(--dark-purple-color); border-radius: var(--half-border-radius);";
        msg.innerHTML = "Enter the your address.";
        address.focus();
        return false;
    }
    else if(!(pwd.value).match(req_pwd))
    {
        pwd.style = "border: 2px solid var(--dark-purple-color); border-radius: var(--half-border-radius);";
        msg.innerHTML = "Enter the password.";
        pwd.focus();
        return false;
    }
    else
    {
        return true;
    }
}