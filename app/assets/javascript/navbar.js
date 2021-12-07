document.getElementById('openNav').onclick = function(){

  openNav();

}

document.getElementById('openNav2').onclick = function(){

  openNav();

}

document.getElementById('closeNav').onclick = function(){

  closeNav();

}

function openNav() {
  document.getElementById("mySidenav").style.width = "300px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
