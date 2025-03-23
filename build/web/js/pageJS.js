/*====================================== SEARCHBAR ======================================*/
function searchBar()
{
    let x = document.getElementById('search_bar');

    if(x.style.display === "none")
    {
        x.style.display = "block";
    }
    else
    {
        x.style.display = "none";
    }
}
/*====================================== /SEARCHBAR ======================================*/

/*====================================== ACTIVE LINK ======================================*/
window.onload = function () 
{
    var currentLocation = window.location.pathname.split("/").pop();

    var menuLinks = document.getElementById("menu").getElementsByTagName("a");

    for (var i = 0; i < menuLinks.length; i++)
    {
        menuLinks[i].className = menuLinks[i].className.replace("active", "");
    }

    for (var i = 0; i < menuLinks.length; i++) 
    {
        var linkHref = menuLinks[i].getAttribute("href").split("/").pop();

        if (linkHref === currentLocation)
        {
            menuLinks[i].className += " active";
            break;
        }
    }
};
/*====================================== /ACTIVE LINK ======================================*/

/*====================================== SLIDER ======================================*/
function startBannerSlideshow() 
{
    setTimeout("changeBanner()", 5000);
}

function changeBanner() 
{
    document.getElementById("banner_image").style.transform = "translateX(-100%)";
    setTimeout("updateBanner()", 1000);
}

function updateBanner() 
{
    var banners = [
        "../Images/banner1.jpg",
        "../Images/banner2.jpg",
        "../Images/banner3.jpg",
        "../Images/banner4.jpg",
        "../Images/banner5.jpg"
    ];
    
    var bannerElement = document.getElementById("banner_image");
    
    if (typeof currentIndex === "undefined") 
    {
        currentIndex = 0;
    }

    currentIndex = (currentIndex + 1) % banners.length;
    bannerElement.style.backgroundImage = "url(" + banners[currentIndex] + ")";

    bannerElement.style.transition = "none";
    bannerElement.style.transform = "translateX(100%)";

    setTimeout("slideInBanner()", 50);
}

function slideInBanner() 
{
    document.getElementById("banner_image").style.transition = "transform 1s ease-in-out";
    document.getElementById("banner_image").style.transform = "translateX(0)";

    setTimeout("changeBanner()", 5000);
}

document.addEventListener("DOMContentLoaded", function () 
{
    startBannerSlideshow();
});
/*====================================== /SLIDER ======================================*/

/*====================================== CONTACT ======================================*/
function sendEmail() 
{
    let name = document.getElementById("user-name").value.trim();
    let mobile = document.getElementById("user-mobile").value.trim();
    let comment = document.getElementById("user-msg").value.trim();

    if (name === "" || mobile === "" || comment === "") 
    {
        alert("Please fill in all the required fields before submitting your message.");
        return;
    }

    let subject = "XENZKART - Customer Inquiry";
    let body = `Dear Team,\n\nI hope this email finds you well. Below are my contact details:\n\n` +
               `Full Name: ${name}\n` +
               `Mobile Number: ${mobile}\n\n` +
               `Message:\n${comment}\n\n` +
               `Looking forward to your response.\n\nBest regards,\n${name}`;

    let mailtoLink = `mailto:sandeep6361460@gmail.com?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;

    document.getElementById("submit-anchor").href = mailtoLink;
}
/*====================================== /CONTACT ======================================*/