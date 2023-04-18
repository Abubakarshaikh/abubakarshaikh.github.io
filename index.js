// To Top Button

const toTop = document.querySelector(".to-top");

window.addEventListener("scroll", () => {
  if (window.pageYOffset > 100) {
    toTop.classList.add("active");
  } else {
    toTop.classList.remove("active");
  }
});

// Smooth Scrolling

const headerSection = document.querySelector("header");

document.querySelector(".to-top-link").addEventListener("click", () => {
  headerSection.scrollIntoView({ behavior: "smooth" });
});

const contactSection = document.querySelector(".contact-section");

document.querySelector(".btn-link").addEventListener("click", () => {
  contactSection.scrollIntoView({ behavior: "smooth" });
});

document.querySelector(".contact-link").addEventListener("click", () => {
  contactSection.scrollIntoView({ behavior: "smooth" });
});

const workSection = document.querySelector(".work-section");

document.querySelector(".work-link").addEventListener("click", () => {
  workSection.scrollIntoView({ behavior: "smooth" });
});

const clientsSection = document.querySelector(".clients-section");

document.querySelector(".client-link").addEventListener("click", () => {
  clientsSection.scrollIntoView({ behavior: "smooth" });
});

const aboutSection = document.querySelector(".about-section");

document.querySelector(".about-link").addEventListener("click", () => {
  aboutSection.scrollIntoView({ behavior: "smooth" });
});

// Image Scroll

window.addEventListener("scroll", reveal);

function reveal() {
  var reveals = document.querySelectorAll(".reveal");

  for (var i = 0; i < reveals.length; i++) {
    var windowheight = window.innerHeight;
    var revealtop = reveals[i].getBoundingClientRect().top;
    var revealpoint = 150;

    if (revealtop < windowheight - revealpoint) {
      reveals[i].classList.add("active");
    } else {
      reveals[i].classList.remove("active");
    }
  }
}
