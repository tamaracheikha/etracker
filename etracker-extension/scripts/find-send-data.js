function fetchData() {
  const selectedText = window.getSelection().toString();
  const url_of_quote = window.location.href
  const title = document.querySelector("h1").innerText
  const website = window.location.hostname
  const url_of_website = url_of_quote
  const photo_url = document.getElementsByTagName('img')
  const source_content = document.getElementsByTagName('p')

// Todo: 1. Get the Date, 2. Get the Author, 3. Find a solution for Favicons
  return {
    content: selectedText,
    url_of_quote: url_of_quote,
    title: title,
    website: website,
    url_of_website: url_of_website,
    photo_url: photo_url[0].currentSrc,
    source_content: source_content
  }
}

chrome.runtime.onMessage.addListener(MessageReceived)

    function MessageReceived(message) {
      const cookie = message
      console.log(cookie)
      const apiCookieHeader = `${cookie.name}=${cookie.value}`
      console.log(apiCookieHeader)
      console.log(cookie.value)

      console.log(fetchData())

      function sendData (data) {
        // const url = 'https://capture-maximilianjg.herokuapp.com/api/v1/quotes'
        const url = 'http://localhost:3000/api/v1/quotes'

        const params = {
          user: {
            user_id: cookie.value
          },
          quote: {
            content: data.content,
            url_of_quote: data.url_of_quote,
          },
          source: {
            title: data.title,
            website: data.website,
            url_of_website: data.url_of_website,
            content: data.source_content
          },
          photo: {
            photo_url: data.photo_url
          }
        }

        const options = {
          method: "POST",
          headers: { 'Content-Type': 'application/json', Cookie: apiCookieHeader },
          body: JSON.stringify(params)
        }

        console.log(options)
        console.log(params)

        fetch(url, options)
        .then(response => response.json())
        .then(data => console.log(data))
      }
      sendData(fetchData());
};
