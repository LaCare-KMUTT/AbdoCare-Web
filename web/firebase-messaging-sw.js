importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/7.20.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyDu8_HYCIsMBc8PkNs5oddKhjcJLFoNaVk",
    authDomain: "abdocare-bdab0.firebaseapp.com",
    databaseURL: "https://abdocare-bdab0.firebaseio.com",
    projectId: "abdocare-bdab0",
    storageBucket: "abdocare-bdab0.appspot.com",
    messagingSenderId: "611491873650",
    appId: "1:611491873650:web:7c3d372d1cdf8f314393eb",
    measurementId: "G-Q85QT7BLYL"
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
    console.log("onBackgroundMessage", message);
  });