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
