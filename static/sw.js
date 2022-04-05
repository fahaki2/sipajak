importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');

const staticCacheName = "sipajak-v0.0";
workbox.setConfig({ debug: false });

if (workbox) {

    const cacheableResponse = new workbox.cacheableResponse.CacheableResponsePlugin({
        statuses: [0, 200]
    });

    const expiration = new workbox.expiration.ExpirationPlugin({
        maxAgeSeconds: 60 * 60 * 24 * 365,
        purgeOnQuotaError: true
    });

    workbox.core.skipWaiting();
    workbox.core.clientsClaim();

    workbox.routing.registerRoute(
        // cache all assets in './assets/' directory
        new RegExp('/assets/'),
        // use cache-first workbox strategy
        new workbox.strategies.CacheFirst({
            cacheName: staticCacheName,
            plugins: [
                cacheableResponse,
                expiration
            ],
        })
    );

    workbox.routing.registerRoute(
        // network first html
        new RegExp('/'),
        // use cache-first workbox strategy
        new workbox.strategies.NetworkFirst({
            cacheName: staticCacheName,
            plugins: [
                cacheableResponse,
                expiration
            ],
        })
    );


    workbox.precaching.precacheAndRoute([]);

    self.addEventListener('activate', evt => {
        evt.waitUntil(
            caches.keys().then(keys => {
                return Promise.all(
                    keys.filter(key => key !== staticCacheName)
                        .map(key => caches.delete(key))
                )
            })
        )
    });

    self.addEventListener('fetch', evt => {
        evt.respondWith(
            caches.match(evt.request).then(cacheRes => {
                return cacheRes || fetch(evt.request);
            })
        )
    });
} else {
    console.log('Boo! Workbox failed to load 😬');
}