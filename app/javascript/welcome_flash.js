var flash = document.createElement("div");
flash.id = "flash";
flash.className = "flash";
flash.textContent = "Welcome to the site!";

flash.style.position = "fixed";
flash.style.top = "0";
flash.style.width = "100%";
flash.style.display = "flex";
flash.style.justifyContent = "center";
flash.style.alignItems = "center";
document.body.appendChild(flash);

setTimeout(function() {
  document.body.removeChild(flash);
}, 5000);
