let navbar = document.getElementById('navbar');
let sticky = navbar.offsetTop;
window.onscroll = function() {stickyNavbar()};//Appel de la fonction stickyNavbar lors du scroll de la page
function stickyNavbar(){
  if (window.pageYOffset >= sticky) {
    navbar.classList.add('sticky');
  } else {
    navbar.classList.remove('sticky');
  }
}
