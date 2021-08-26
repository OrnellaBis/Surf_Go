
const modal = document.getElementById("myModal");

// Get the button that opens the modal
const btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
const span = document.getElementsByClassName("close");

// When the user clicks the button, open the modal 
btn.addEventListener("click",  ()=>{ 
    console.log("HELOOOOOOOOO")
  modal.style.display = "block";
})

// When the user clicks on <span> (x), close the modal
span.addEventListener("click",  ()=>{ 
    modal.style.display = "none";
})

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  
}
window.addEventListener("click",  (event)=>{ 
    if (event.target == modal) {
        modal.style.display = "none";
      }
})
