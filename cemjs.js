// JavaScript Document
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function div1() {
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


function div2() {
    document.getElementById("div2drop").classList.toggle("show2");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.div2but')) {
    var divimgdrop = document.getElementById("div2drop");
      if (divimgdrop.classList.contains('show2')) {
        divimgdrop.classList.remove('show2');
      }
  }
}