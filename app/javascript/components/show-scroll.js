const scrollIntoHour = () => {
  const currentHour = document.querySelector("#current-hour");
  if (currentHour) {
    currentHour.scrollIntoView({
      block: "nearest",
      behavior: "smooth",
      inline: "center",
    });
  }
}

export { scrollIntoHour };
