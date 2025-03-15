var req_email = /^([a-z0-9._]{3,15})@([a-z0-9]{3,10})\.([a-z.]{2,5})$/;
var req_pwd = /^([a-zA-Z0-9._!@#$%^&*<>:";']{1,})$/;

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