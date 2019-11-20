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
document.getElementById('facebook').addEventListener('mouseover',changeColorFacebook);
function changeColorFacebook(){
  this.style.backgroundColor='#3B5998';
  document.getElementById('facebookIcon').style.color='white';
}
document.getElementById('facebook').addEventListener('mouseout',rechangeColorFacebook);
function rechangeColorFacebook(){
  this.style.backgroundColor='grey';
  document.getElementById('facebookIcon').style.color='black';
}
document.getElementById('instagram').addEventListener('mouseover',changeColorInstagram);
function changeColorInstagram(){
  this.style.background='linear-gradient(218deg, rgba(131,58,180,1) 0%, rgba(253,29,29,1) 50%, rgba(252,176,69,1) 100%)';
  document.getElementById('instagramIcon').style.color='white';
}
document.getElementById('instagram').addEventListener('mouseout',rechangeColorInstagram);
function rechangeColorInstagram(){
  this.style.background='grey';
  document.getElementById('instagramIcon').style.color='black';
}
document.getElementById('twitter').addEventListener('mouseover',changeColorTwitter);
function changeColorTwitter(){
  this.style.backgroundColor='#1DA1F2';
  document.getElementById('twitterIcon').style.color='white';
}
document.getElementById('twitter').addEventListener('mouseout',rechangeColorTwitter);
function rechangeColorTwitter(){
  this.style.backgroundColor='grey';
  document.getElementById('twitterIcon').style.color='black';
}
