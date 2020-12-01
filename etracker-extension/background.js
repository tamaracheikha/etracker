function getCookie() {
  const cookie = chrome.cookies.getAll({"domain": "localhost", "name": "capture_user_id"}, function (cookies) { chrome.runtime.sendMessage(cookies[0]) })
}
