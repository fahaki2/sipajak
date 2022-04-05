if ('serviceWorker' in navigator) {
    //set the scope to an upper path of the script location
    //Response included "Service-Worker-Allowed : /"
    navigator.serviceWorker.register("/sw.js")
        .then((reg) => "")
        .catch((err) => console.log('service worker not registered', err))
}