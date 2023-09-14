// Create a div element to display the flash message
var flash = document.createElement("div");
// Set the id, class, and text of the flash element
flash.id = "flash";
flash.className = "flash";
flash.textContent = "Wellcome to the site!";
// Append the flash element to the body of the document
document.body.appendChild(flash);
// Set a timeout function to remove the flash element after 3 seconds
setTimeout(function() {
  document.body.removeChild(flash);
}, 3000);
