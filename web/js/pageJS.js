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

window.onload = function () {
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

function startBannerSlideshow() {
    setTimeout("changeBanner()", 5000);
}

function changeBanner() {
    document.getElementById("banner_image").style.transform = "translateX(-100%)";
    
    setTimeout("updateBanner()", 1000);
}

function updateBanner() {
    var banners = [
        "../Images/banner1.jpg",
        "../Images/banner2.jpg",
        "../Images/banner3.jpg",
        "../Images/banner4.jpg",
        "../Images/banner5.jpg"
    ];
    
    var bannerElement = document.getElementById("banner_image");
    
    if (typeof currentIndex === "undefined") {
        currentIndex = 0;
    }

    currentIndex = (currentIndex + 1) % banners.length;
    bannerElement.style.backgroundImage = "url(" + banners[currentIndex] + ")";

    bannerElement.style.transition = "none";
    bannerElement.style.transform = "translateX(100%)";

    setTimeout("slideInBanner()", 50);
}

function slideInBanner() {
    document.getElementById("banner_image").style.transition = "transform 1s ease-in-out";
    document.getElementById("banner_image").style.transform = "translateX(0)";

    setTimeout("changeBanner()", 5000); // Continue the loop
}

// Start the slideshow when the page loads
document.addEventListener("DOMContentLoaded", function () {
    startBannerSlideshow();
});
