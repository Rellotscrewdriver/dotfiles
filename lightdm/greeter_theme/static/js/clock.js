const spanMonth = document.getElementById("month")
const spanDay = document.getElementById("day")
const spanHours = document.getElementById("hours")
const spanMinutes = document.getElementById("minutes")


const updateTime = () => {
  const now = new Date()
  const month = now.getMonth() + 1
  const day = now.getDate()
  const hours = now.getHours().toString().padStart(2, "0")
  const minutes = now.getMinutes().toString().padStart(2, "0")
  spanMonth.textContent = `${month}/`
  spanDay.textContent = `${day}/`
  spanHours.textContent = `${hours} : `
  spanMinutes.textContent = minutes
}

setInterval(updateTime, 100)
