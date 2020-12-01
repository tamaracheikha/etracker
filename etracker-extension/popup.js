const listenClick = () => {
  const button = document.getElementById('capture-this-btn');
  button.addEventListener('click', () => {

    // chrome.runtime.sendMessage({execute: "exectute"},
    //   function response() {
    //     console.log(cookie)
    //   })
    chrome.extension.getBackgroundPage().getCookie()

    chrome.runtime.onMessage.addListener(MessageReceived)
    function MessageReceived(message, sender, reply) {
      const cookie = message
      console.log(cookie)
      // chrome.runtime.sendMessage(cookie)

    function sendCookie(cookie) {
      let params = {
        active: true,
        currentWindow: true
      }
      chrome.tabs.query(params, gotTabs)

      function gotTabs(tabs) {
        let message = cookie
        chrome.tabs.sendMessage(tabs[0].id, message)
      }
    }
    sendCookie(cookie);
};

    chrome.tabs.executeScript({
      file: 'scripts/find-send-data.js'
    })
    chrome.tabs.executeScript({
      file: 'scripts/highlight-text.js'
    });
    // window.close();
  })
}

listenClick()
