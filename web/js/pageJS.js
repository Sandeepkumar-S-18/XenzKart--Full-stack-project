/* ====================================== SEARCHBAR ====================================== */
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
/* ====================================== /SEARCHBAR ====================================== */

/* ====================================== SLIDER ====================================== */
function startBannerSlideshow() 
{
    setTimeout("changeBanner()", 5000);
}

function changeBanner() 
{
    document.getElementById("banner_image").style = "transform: translateX(-100%);";
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
/* ====================================== /SLIDER ====================================== */

/* ====================================== CONTACT ====================================== */
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
/* ====================================== /CONTACT ====================================== */

/* ====================================== PROFILE ====================================== */
function enable() 
{
    document.getElementById("profile_photo").hidden = false;
    document.getElementById("user_name").disabled = false;
    document.getElementById("user_mobile").disabled = false;
    document.getElementById("user_address").disabled = false;
    document.getElementById("user_upd_pwd").hidden = false;
    
    let elements = document.getElementsByClassName("profile-details-text-box");
    for (let i = 0; i < elements.length; i++) 
    {
        if(i != 2)
        {
            elements[i].style.border = "1px solid var(--purple-color)";
        }
    }
}
/* ====================================== /PROFILE ====================================== */

/* ====================================== VIDEO ====================================== */
function playVideo()
{
    document.getElementById("overlay").style.display="block";
    document.getElementById("video_window").style.display="block"
}

function cls()
{
    document.getElementById("overlay").style.display="none";
}
/* ====================================== /VIDEO ====================================== */

/* ====================================== PRODUCT ====================================== */
let currentSection = 0;

function showSection(index) 
{
    let sections = Array.from(document.querySelectorAll(".product_collection"));
    for (let i = 0; i < sections.length; i++) 
    {
        sections[i].style.display = i === index ? "flex" : "none";
    }
}

function nextSection() 
{
    let sections = document.querySelectorAll(".product_collection");
    if (currentSection < sections.length - 1) 
    {
        currentSection++;
        showSection(currentSection);
    }
}

function prevSection() 
{
    if (currentSection > 0) 
    {
        currentSection--;
        showSection(currentSection);
    }
}

function productDetailsPanel(productArr)
{
    document.getElementById("overlay").style.display = "block";
    
    let product_id = productArr[0];
    let product_name = productArr[1];
    let product_image = productArr[2];
    let product_description = productArr[3];
    let product_price = productArr[4];
    let product_discount_price = productArr[5];
    let product_rating = productArr[6];
    let product_quantity = productArr[7];
    let product_category = productArr[8];
    
    document.querySelector("#product_picture_div img").src = "../Product_images/"+product_image;
    document.getElementById("product_name_detls").innerText = product_name;
    document.getElementById("product_category").innerText = product_category;
    document.getElementById("product_rating_detls").innerHTML = generateStarRating(product_rating);
    document.getElementById("product_discription_detls").innerText = product_description;
    if(product_quantity <= 0)
    {
        document.getElementById("product_quantity").innerText = `Out of stack.`;
    }
    else
    {
        document.getElementById("product_quantity").innerText = `Only ${product_quantity} product are available.`;
    }
    document.getElementById("product_price_detls").innerHTML = `<del>₹ ${product_price}</del>`;
    document.getElementById("product_discounted_price_detls").innerText = `₹ ${product_discount_price}`;
}

function generateStarRating(rating)
{
    let starsHTML = "";
    let fullStars = Math.floor(rating);
    let halfStar = rating % 1 >= 0.5 ? 1 : 0;
    let emptyStars = 5 - fullStars - halfStar;

    for (let i = 0; i < fullStars; i++)
    {
        starsHTML += `<span class="fa fa-star"></span> `;
    }
    if (halfStar)
    {
        starsHTML += `<span class="fa fa-star-half-alt"></span> `;
    }
    for (let i = 0; i < emptyStars; i++)
    {
        starsHTML += `<span class="far fa-star"></span> `;
    }

    return starsHTML;
}
/* ====================================== /PRODUCT ====================================== */

/* ====================================== PAYMENT ====================================== */
function payment(order_id, product_id, product_name, product_price) 
{
    document.getElementById("checkout_section").style.display = "block";
    let p_id = `product_qty_box_` + product_id;
    let qtyBox = document.getElementById(p_id);

    let qty = parseInt(qtyBox.value);  
    let tableBody = document.getElementById("product_list");

    let newRow = tableBody.insertRow();
    newRow.setAttribute("align", "center");
    newRow.setAttribute("id", `order_${order_id}`);
    
    let totalPrice = product_price * qty;  

    newRow.innerHTML = `
        <td>${order_id}</td>
        <td>${product_name}</td>
        <td>${qty}</td>
        <td>₹${product_price}</td>
        <td class='totalAmountPerProduct'>₹${totalPrice}</td>
        <td> 
            <button class="remove_item fad fa-trash" onclick="removeItemFromPayment(${order_id})"></button> 
            <input type="checkbox" value="${order_id}" checked hidden />
        </td>
    `;

    updateTotalAmount();
}

function removeItemFromPayment(order_id) 
{
    let row = document.getElementById(`order_${order_id}`);
    if(row) 
    {
        row.remove();
        updateTotalAmount();
    }
}

function updateTotalAmount() 
{
    let elements = document.getElementsByClassName("totalAmountPerProduct");
    let totalAmount = 0;

    for(let i = 0; i < elements.length; i++) 
    {
        let amountText = elements[i].innerHTML.replace("₹", "").trim();
        totalAmount += parseFloat(amountText) || 0;
    }

    document.getElementById("total_amount").innerHTML = `₹${totalAmount.toFixed(2)}`;
}
/* ====================================== PAYMENT ====================================== */

/* ====================================== ACTIVE LINK ====================================== */
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
    
    showSection(0);
    
    let element1 = document.getElementsByClassName("cart_div");
    let count1 = 0;
    for (let i = 0; i < element1.length; i++) 
    {
        count1 += 1;
    }
    document.getElementById("heading1").innerHTML = `YOUR CART (${count1})`;
};
/* ====================================== /ACTIVE LINK ====================================== */