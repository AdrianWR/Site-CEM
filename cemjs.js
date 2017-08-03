// JavaScript Document
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function mydiv() {
    document.getElementById("divimgdrop").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.divimagbut')) {
    var divimgdrop = document.getElementById("divimgdrop");
      if (divimgdrop.classList.contains('show')) {
        divimgdrop.classList.remove('show');
      }
  }
}