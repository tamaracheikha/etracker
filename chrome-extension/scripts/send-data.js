function fetchData() {
  const title = document.querySelector('title').innerText;
  const url = window.location.href;
  const firstName = document.getElementById('first-name').value;
  console.log(firstName);
  return {
    first_name: firstName
  }
}

function sendData(data) {
  const url = '/extension';
  console.log(data);
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      "first_name": data.first_name
    })
  })
}

sendData(fetchData());
