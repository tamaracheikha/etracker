function listenClick() {
  const button = document.getElementById('send-data');
  button.addEventListener('click', () => {
    chrome.tabs.executeScript({
      file: 'scripts/send-data.js'
    });
  })
  // console.log("hi")
  // const form = document.getElementById('form-extension');
  // button.addEventListener('submit', () => {
  //   chrome.tabs.executeScript({
  //     file: 'scripts/send-data.js'
  //   });
  // })
}

listenClick();
