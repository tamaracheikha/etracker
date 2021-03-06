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

// function fetchData() {
//   const jobDetails = document.querySelector('.a11y-text').innerText;
//   const jobTitle = document.querySelector('.jobs-details-top-card__job-title').innerText;
//   console.log(jobTitle);
//   const jobDescription = document.querySelector('#job-details').innerText;
//   console.log(jobDescription);
//   const url = window.location.href;
//   console.log(url);
//   return {
//     jobTitle: jobTitle,
//     jobDescription: jobDescription,
//     url: url
//   }
// }

// function sendData(data) {
//   const url = 'http://localhost:3000/extension';
//   fetch(url, {
//     method: 'POST',
//     headers: { "Content-Type": "application/json" },
//     body: JSON.stringify({
//       "job_title": `${data.jobTitle}`,
//       "job_description": `${data.jobDescription}`,
//       "company_link": `${data.url}`
//     })
//   })
// }

// sendData(fetchData());
