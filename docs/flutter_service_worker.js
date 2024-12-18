'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "5aeabb5e41b5e242c1c5fb3a61ee536f",
"version.json": "cc1fa9cce5af273c0909d105387fee89",
"favicon.ico": "5d3e29c4e3505884d107fedfe7fe753e",
"index.html": "50a9bf171cbb22776da7d55921e645c2",
"/": "50a9bf171cbb22776da7d55921e645c2",
"main.dart.js": "abd18fc4ac2330b3963640b9199f9a2c",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"site.webmanifest": "053100cb84a50d2ae7f5492f7dd7f25e",
"icons/favicon-16x16.png": "72c9019d7e3bb12484bd46317389562f",
"icons/android-chrome-192x192.png": "c6185838261d2650bf1021d05ee8e876",
"icons/apple-touch-icon.png": "4f7b4067d838d46b78909412080bbcce",
"icons/android-chrome-512x512.png": "e05dde1b215c6e5ecbd89820d5339598",
"icons/favicon-32x32.png": "31bf3a8f2a077838cfc3d61be950e7af",
"manifest.json": "3f78fe301a0d9b71fd190bd7d6dd8ba5",
"assets/AssetManifest.json": "5fefc18e0d3b7bbaa363bafa7fed98ea",
"assets/NOTICES": "946409712a93fb504460a067b7a782eb",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "b4bc22c59785bdf4e36b5c7396a18d71",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "ab2c1265be9305b76b2fa5bc7058ae8b",
"assets/fonts/MaterialIcons-Regular.otf": "81624a4583116a251ed8c71d2cb60ccf",
"assets/assets/images/coin.webp": "31758b677e4a66cb809d9fa0215a3d78",
"assets/assets/images/social_icons/logo-youtube.svg": "8fc08e85302be21146a35cd762a59078",
"assets/assets/images/social_icons/logo-instagram.svg": "cb8f7a8de204f1abcdb89066871e7d32",
"assets/assets/images/social_icons/logo-linkedin.svg": "5f3ed37f1edda8308053bfe8923c31f8",
"assets/assets/images/social_icons/logo-twitter.svg": "8f272cf50cff435c08b26afbfc44781e",
"assets/assets/images/social_icons/logo-github.svg": "54222910d2c3c7176905a72f86244310",
"assets/assets/images/arrow.svg": "0bf9d2197bf2f175f455ae71a2dee0e6",
"assets/assets/images/github.svg": "ecaefd058c8b50de9e3070d4abab72e9",
"assets/assets/images/pimera.webp": "ca4fa2aa8d3527b0d4d8c26de249be29",
"assets/assets/images/tether.webp": "1e4f49eeaf18dc1c919e574dda21268b",
"assets/assets/images/fiverr.webp": "b91028403488a1d57d5e6e28d4bdb94e",
"assets/assets/images/chippy.png": "ceee1a869235218a31c6ad45cacc2121",
"assets/assets/images/upwork.webp": "bfbd3db07a6e84fac95251a85a228890",
"assets/assets/images/salesflo.webp": "3d3a93bf5f93aa9ce6581424bd68c2bb",
"assets/assets/images/goldengrid.png": "e719cb00abc48ea59c4c6903c5fefbe1",
"assets/assets/images/josef.webp": "796f38b6cebc16730a7cd522779810e0",
"assets/assets/images/fiverr.png": "58db05bb8c82a0850f702655c1667c4e",
"assets/assets/images/favicon.png": "225a76f4ad6bf5b3538b544a5eef5065",
"assets/assets/images/favicon.webp": "e09cc712972b14671236601dbf0869b6",
"assets/assets/images/candy.webp": "abd576ce66f36958bedb14dca2ec84f8",
"assets/assets/images/header_image.webp": "e6a3f889d2cf2305d957d24f8dc17a34",
"assets/assets/images/vico.webp": "215112d9b7d6556384d9a20729dead46",
"assets/assets/images/synapp.webp": "aab11c2177c9addb35924469124e327f",
"assets/assets/images/mighty-furnitures.png": "91f268c59e3b7c23b7438969e805fc59",
"assets/assets/images/fastlane.png": "1414bfc3f70537c559689690e4fd8425",
"assets/assets/images/inversa.webp": "57bdc9f5f028b9ce80f7809d4900691b",
"assets/assets/images/bullseye.png": "7d0846a79f1e254bb011854acd7f785f",
"assets/assets/images/about-img.webp": "a7f4f93e80825c0744361e0794982df2",
"assets/assets/images/ronjones.png": "e8571cfaf603a1936d1fe08b5527a748",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
