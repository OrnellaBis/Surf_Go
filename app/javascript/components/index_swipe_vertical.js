const swiperIndex = () => {
    let touchStartY = 0;
    let touchEndY = 0;
    let swiped = false

    const swipeContainer = document.querySelector('.card-list-header')
    if (!swipeContainer) return;

    swipeContainer.addEventListener("touchstart", (e)=>{ touchStartY = e.changedTouches[0].screenY })

    swipeContainer.addEventListener("touchend", (e)=>{
        touchEndY = e.changedTouches[0].screenY;
        if (touchEndY < touchStartY) {
            if (swiped) return;

            swipeContainer.click()
        }
    })
    swipeContainer.addEventListener("click", (e)=>{ swiped = !swiped })
};

  export { swiperIndex };
  