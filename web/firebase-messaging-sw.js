mportScripts("https://www.gstatic.com/firebasejs/7.5.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.5.0/firebase-messaging.js");
firebase.initializeApp({
    apiKey: "AIzaSyC2onuL4-UEGa8xDziv5-ZevBXMx5f_p8s",
    authDomain: "sbeutasklet.firebaseapp.com",
    projectId: "sbeutasklet",
    storageBucket: "sbeutasklet.appspot.com",
    messagingSenderId: "285417917451",
    appId: "1:285417917451:web:5ced8713fd9eb3c4010b0e",
    measurementId: "G-EPT0HJEFSE"
});
const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            return registration.showNotification("New Message");
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});