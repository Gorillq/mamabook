document.addEventListener("DOMContentLoaded", function() {
  const calendarDays = document.getElementsByClassName("calendar-day");

  Array.prototype.forEach.call(calendarDays, function(day) {
    day.addEventListener("click", function() {
      const date = day.dataset.date;
      fetch("/calendars/create_event", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ date: date })
      })
      .then(response => response.json())
      .then(data => console.log(data))
      .catch(error => console.error(error));
    });
  });
});
