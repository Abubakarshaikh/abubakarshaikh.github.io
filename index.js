// Scroll Animation

window.addEventListener("scroll", reveal);

function reveal() {
  var reveals = document.querySelectorAll(".reveal");

  for (var i = 0; i < reveals.length; i++) {
    var windoheight = window.innerHeight;
    var revealtop = reveals[i].getBoundingClientRect().top;
    var revealpoint = 150;

    if (revealtop < windoheight - revealpoint) {
      reveals[i].classList.add("active");
    } else {
      reveals[i].classList.remove("active");
    }
  }
}

// Active Links

const navLinksEls = document.querySelectorAll(".navbar-links");

navLinksEls.forEach((navLinkEl) => {
  navLinkEl.addEventListener("click", () => {
    document.querySelector(".active")?.classList.remove("active");
    navLinkEl.classList.add("active");
  });
});

// Testimonial Swiper

var swiper = new Swiper(".mySwiper", {
  spaceBetween: 30,
  grabCursor: "true",
  autoplay: {
    delay: 2500,
  },
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
    dynamicBullets: "true",
  },
});

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

const headerSection = document.querySelector(".header");

document.querySelector(".to-top-link").addEventListener("click", () => {
  headerSection.scrollIntoView({ behavior: "smooth" });
});

const workSection = document.querySelector(".work-section");

document.querySelector(".work-link").addEventListener("click", () => {
  workSection.scrollIntoView({ behavior: "smooth" });
});

const clientSection = document.querySelector(".client-section");

document.querySelector(".client-link").addEventListener("click", () => {
  clientSection.scrollIntoView({ behavior: "smooth" });
});

const aboutSection = document.querySelector(".about-section");

document.querySelector(".about-link").addEventListener("click", () => {
  aboutSection.scrollIntoView({ behavior: "smooth" });
});

var contactSection = document.querySelector(".contact-section");

document.querySelector(".contact-link").addEventListener("click", () => {
  contactSection.scrollIntoView({ behavior: "smooth" });
});

var contactSection = document.querySelector(".contact-section");

document.querySelector(".help-btn-link").addEventListener("click", () => {
  contactSection.scrollIntoView({ behavior: "smooth" });
});
