'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "e8ca998783a4e7ce28586862f375aec2",
"version.json": "675fec389ffc080a2f0457811c137c02",
"splash/img/light-2x.png": "ca83d4385cdfc1b3f925525f882ebcf6",
"splash/img/branding-4x.png": "df3e58bdb83f7802f999513d366d88cf",
"splash/img/dark-4x.png": "9b881c13971abd213d9c40edf65d73fb",
"splash/img/branding-dark-1x.png": "b15b6b48234f7e03b7cec494b2f21882",
"splash/img/light-3x.png": "eb3a7a1f6fedd1a214652ed500095e66",
"splash/img/dark-3x.png": "eb3a7a1f6fedd1a214652ed500095e66",
"splash/img/light-4x.png": "9b881c13971abd213d9c40edf65d73fb",
"splash/img/branding-2x.png": "a5b918f736105aae5affe7fcea43be15",
"splash/img/branding-3x.png": "7488df98c944054220880c89aa77f361",
"splash/img/dark-2x.png": "ca83d4385cdfc1b3f925525f882ebcf6",
"splash/img/dark-1x.png": "518106548a58dce3fd5ea4d864028f49",
"splash/img/branding-dark-4x.png": "df3e58bdb83f7802f999513d366d88cf",
"splash/img/branding-1x.png": "b15b6b48234f7e03b7cec494b2f21882",
"splash/img/branding-dark-2x.png": "a5b918f736105aae5affe7fcea43be15",
"splash/img/light-1x.png": "518106548a58dce3fd5ea4d864028f49",
"splash/img/branding-dark-3x.png": "7488df98c944054220880c89aa77f361",
"index.html": "d1c45101f4f3d8faec83e16441047748",
"/": "d1c45101f4f3d8faec83e16441047748",
"main.dart.js": "2264300720166f768ec12c8ff60f3d7c",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "3406155581a9de65848fb89958495fe7",
"icons/Icon-192.png": "01d48de117f55167e363d84525f3298b",
"icons/Icon-maskable-192.png": "01d48de117f55167e363d84525f3298b",
"icons/Icon-maskable-512.png": "d3610b6507c4e865f6fc99aae9877fa4",
"icons/Icon-512.png": "d3610b6507c4e865f6fc99aae9877fa4",
"manifest.json": "263992d83d9960667640d1e8a6727092",
"assets/AssetManifest.json": "0b469985c9a45650b0011872ed3dddbd",
"assets/NOTICES": "b55e031edd9ff1a3be94cbd8ebe726d4",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "144f69a24f5fbfc6a24a41f4d45dad03",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6aafb6d6ab2fa640b6998f6b72583349",
"assets/packages/locale/translations/de-DE.json": "0bb3ab285c16da4d1180161b92bb9a1f",
"assets/packages/locale/translations/en-US.json": "fa6c82793419d239b21409a9916ea537",
"assets/packages/core/packages/common/assets/icons/search.svg": "201b1e4147b43cc5c0d70c118236cdb3",
"assets/packages/core/packages/common/assets/icons/connect.svg": "f69f7693c0d2eba2d587e8d09ce4b144",
"assets/packages/core/packages/common/assets/icons/servicenow_mc.svg": "e3ca725ef82665c380be4d9a35960318",
"assets/packages/core/packages/common/assets/icons/outlet.svg": "b68e5722858171b562c7e6f06a12ca5d",
"assets/packages/core/packages/common/assets/icons/favorite_filled.svg": "b364fcb8b60cd91f3e15803a81510cc1",
"assets/packages/core/packages/common/assets/icons/repeat.svg": "7b2eecb28782b88c5c947d638b99156d",
"assets/packages/core/packages/common/assets/icons/dining.svg": "b9b56adf5caade5a362e376e76209c6f",
"assets/packages/core/packages/common/assets/icons/face_id.svg": "466ed6ec962af75023a5b3b108756587",
"assets/packages/core/packages/common/assets/icons/todo.svg": "914b52d8bc7a803df17286e04079d1d3",
"assets/packages/core/packages/common/assets/icons/ticketing.svg": "e1c4dffff27e32b1991eef29c7ef2adf",
"assets/packages/core/packages/common/assets/icons/person.svg": "9270569b0e8f80d6146cb6fa9fae0390",
"assets/packages/core/packages/common/assets/icons/home.svg": "c6bbdcaa3166c2dad436f1ecb4cedb43",
"assets/packages/core/packages/common/assets/icons/room.svg": "7088eb1f725b4d62f15ab84c72a2a578",
"assets/packages/core/packages/common/assets/icons/location3.svg": "fd913d1e40f7414aaceb378dbe89fe69",
"assets/packages/core/packages/common/assets/icons/location2.svg": "69657f6006100b6a178c9ff94d6e7376",
"assets/packages/core/packages/common/assets/icons/arrow_back.svg": "7a6159fc4600d07288f75a426c59b2a3",
"assets/packages/core/packages/common/assets/icons/visibility.svg": "c5ad561e2ef68d4307ea01313d047d0d",
"assets/packages/core/packages/common/assets/icons/slack_mc.svg": "8bef4ce14864d6347bffa6458305acc2",
"assets/packages/core/packages/common/assets/icons/map.svg": "cd6b2fe1b02b11c137f01a6197f8442b",
"assets/packages/core/packages/common/assets/icons/community.svg": "12930dec9cbd3fd4c4eb639c0ed6f84e",
"assets/packages/core/packages/common/assets/icons/location1.svg": "8c47c6e83b1f68984770085e54c45539",
"assets/packages/core/packages/common/assets/icons/wellness.svg": "aa66d12fa209f2df3b24ad4864a1d9d2",
"assets/packages/core/packages/common/assets/icons/lock.svg": "80be22cb57f9b421c0df0af64c3f3ec0",
"assets/packages/core/packages/common/assets/icons/building2.svg": "5c37f7500421459377c94cdf971f4635",
"assets/packages/core/packages/common/assets/icons/arrow_left.svg": "ed905cfe7068ea584a0c1b8834eb5008",
"assets/packages/core/packages/common/assets/icons/policy.svg": "8ba10e8f069e3f99e011e129b95648de",
"assets/packages/core/packages/common/assets/icons/space.svg": "96678eb82a95a50725bf262ea913c485",
"assets/packages/core/packages/common/assets/icons/group.svg": "4717ae736095d449c0673b5914f7c292",
"assets/packages/core/packages/common/assets/icons/settings.svg": "02e42c56caf6a051d7742565a5d57d62",
"assets/packages/core/packages/common/assets/icons/building1.svg": "e4f3132cc7d2ccbfb56b1afe3b8a072c",
"assets/packages/core/packages/common/assets/icons/zoom_mc.svg": "0532aa978d1f77d552f84fff913de4e5",
"assets/packages/core/packages/common/assets/icons/navigate.svg": "fddac8d1a9ddb4a475d90af1a6ac9c16",
"assets/packages/core/packages/common/assets/icons/hub.svg": "9d03465b84d0a926ebc1ea9f52ec31d7",
"assets/packages/core/packages/common/assets/icons/transportation.svg": "a36872d713e6893dfa9630e56af9b2b5",
"assets/packages/core/packages/common/assets/icons/desk.svg": "7e92ac2bfa21db67baa50a9485681477",
"assets/packages/core/packages/common/assets/icons/videocam.svg": "bedb3bd6ba3f0f46db121cc540201e20",
"assets/packages/core/packages/common/assets/icons/star_filled.svg": "cf1b055e3c8b142c88b8c4c55ae5444e",
"assets/packages/core/packages/common/assets/icons/book.svg": "7ae7da4d765b28ef42a8b91ccac9bf08",
"assets/packages/core/packages/common/assets/icons/features.svg": "ae8e2f1b580c4499fee7a72eac1ce0be",
"assets/packages/core/packages/common/assets/icons/chevron_right.svg": "0547f8491661c730757234212b291ca8",
"assets/packages/core/packages/common/assets/icons/chevron_left.svg": "4eb7e5ad99605983ee285141727d6e07",
"assets/packages/core/packages/common/assets/icons/event.svg": "b1600ed3c08449c1b59d81fa33c17e9d",
"assets/packages/core/packages/common/assets/icons/booking.svg": "2f061b064c599ed33a6c440b2c46ec01",
"assets/packages/core/packages/common/assets/icons/linkedin_mc.svg": "a5526a6f297c10de9ccfff065eb538bc",
"assets/packages/core/packages/common/assets/icons/arrow_right.svg": "2d3a46796413431693b9254c4b9ef27f",
"assets/packages/core/packages/common/assets/icons/meeting.svg": "64773dfc6a2bd819983c6dbe714d8ddf",
"assets/packages/core/packages/common/assets/icons/support.svg": "4d707de06495a48c5701725c4c28c408",
"assets/packages/core/packages/common/assets/icons/work.svg": "7b828afca4a2acd1736c544b3c753702",
"assets/packages/core/packages/common/assets/icons/lock_open.svg": "d8c4858428644d61d9cef5594329b55e",
"assets/packages/core/packages/common/assets/icons/email.svg": "1b472a57099be3027fe3e55b2a6d640c",
"assets/packages/core/packages/common/assets/icons/teams_mc.svg": "5db36d93cc251e10b1677fce647bac32",
"assets/packages/core/packages/common/assets/icons/cross_mark.svg": "b3af932e92a2f03d2ae879262f7b2700",
"assets/packages/core/packages/common/assets/icons/news.svg": "0082fcc9c5c5ed5a2a4fe7509f010460",
"assets/packages/core/packages/common/assets/icons/info.svg": "31e4690e335569cb221b1c9629b565e6",
"assets/packages/core/packages/common/assets/icons/add.svg": "4b255f1b398a2f4170846aaca3dd9998",
"assets/packages/core/packages/common/assets/icons/video_call.svg": "75c3e53a4873d453a8c6f6bb8ceebab6",
"assets/packages/core/packages/common/assets/icons/people.svg": "31f352c8c7e0a143e358ef3b54dd4aeb",
"assets/packages/core/packages/common/assets/icons/mic.svg": "3370067260c5208dc0c32845f32826b7",
"assets/packages/core/packages/common/assets/icons/check_circle.svg": "e575ff1ffd1fa1a8d5936ae18e84bc85",
"assets/packages/core/packages/common/assets/icons/personal.svg": "18e60b5182e32103b378f1769da6671a",
"assets/packages/core/packages/common/assets/icons/map2.svg": "c79555b7b41fc7faf3c2fb429faa1b8a",
"assets/packages/core/packages/common/assets/icons/dragIndicator.svg": "478679362ac606e1c180d3bf8da6d280",
"assets/packages/core/packages/common/assets/icons/gridview.svg": "6ce0877041f14f75e276201a3e4794e2",
"assets/packages/core/packages/common/assets/icons/amenities.svg": "0a446bf534c0adb468400887b217a47e",
"assets/packages/core/packages/common/assets/icons/notification.svg": "2afc3f4869c7e63a60d9848e2b8c3e8f",
"assets/packages/core/packages/common/assets/icons/check_mark.svg": "c68a83d30a3546773c329f68740871b1",
"assets/packages/core/packages/common/assets/icons/send.svg": "d3f9308ddf065dde37d0424a3816d294",
"assets/packages/core/packages/common/assets/icons/camera.svg": "9987c35540df1ae132d30d8aace86897",
"assets/packages/core/packages/common/assets/icons/groups.svg": "5b61a9f07c457f676a49671e165e3848",
"assets/packages/core/packages/common/assets/icons/home_pin.svg": "86f47af4d8dc60b8de322c679836b11c",
"assets/packages/core/packages/common/assets/icons/locker_bank.svg": "74ca9d39c42b2b5d9494ef2f2281a3fd",
"assets/packages/core/packages/common/assets/icons/google_meet.svg": "8f94b515c7a8e6d512a99f296068ebc2",
"assets/packages/core/packages/common/assets/icons/star_outline.svg": "f7dda8cd1653b1954cd6713044d7202e",
"assets/packages/core/packages/common/assets/icons/outlook_mc.svg": "7838808182a779ba97eb3425f90f8d2b",
"assets/packages/core/packages/common/assets/icons/edit.svg": "c52884d84f5bbe9d27e57f18ccc9fd5d",
"assets/packages/core/packages/common/assets/icons/faq.svg": "5ec6346ac34a769a1792f55a2b2b4f24",
"assets/packages/core/packages/common/assets/icons/fitness.svg": "60548ad63ae6df2eeed64ab88c2c7d85",
"assets/packages/core/packages/common/assets/icons/exit.svg": "dbce5c5c7a16b80be07ac7b4c39ef862",
"assets/packages/core/packages/common/assets/icons/delete.svg": "45b01e8f0682ff64cfd72e2150b902bb",
"assets/packages/core/packages/common/assets/icons/clock.svg": "acf06e760e9eadfbaa377317d43c08cb",
"assets/packages/core/packages/common/assets/icons/phone.svg": "e79152291757012ba2eb8e043364c436",
"assets/packages/core/packages/common/assets/icons/floor.svg": "c4749a32a0114e99e67e85c85723e25f",
"assets/packages/core/packages/common/assets/icons/mic_translucent.svg": "f0d3acd09ca7c9516d3000283a3d5c6d",
"assets/packages/core/packages/common/assets/icons/profile.svg": "0bfd469e034e462c6de9bea6bef768dd",
"assets/packages/core/packages/common/assets/icons/schedule.svg": "0975533da2eb405cae69e34ff4b37b69",
"assets/packages/core/packages/common/assets/icons/filter.svg": "8c5bbf02434dc341ff26f0ee7a569072",
"assets/packages/core/packages/common/assets/icons/directory.svg": "3f3660aae1df20007a61557ea0b9c65a",
"assets/packages/core/packages/common/assets/icons/calendar.svg": "43cb3e4c2b0d1d278e343275b9747ba3",
"assets/packages/core/packages/common/assets/icons/notification2.svg": "8f19ca3f26bd3d32adc7160daa9aee11",
"assets/packages/core/packages/common/assets/icons/slack.svg": "8a1d51b00f1068c6c0dd52da8ebfb84e",
"assets/packages/core/packages/common/assets/icons/start_half_filled.svg": "83d791ff03f406045347dd10bf47d9cf",
"assets/packages/core/packages/common/assets/icons/upload.svg": "6155d28d36471bf8dc46b910752a8839",
"assets/packages/core/packages/common/assets/icons/logo.svg": "4d85286ae4f310270c52315fb67692ac",
"assets/packages/core/packages/common/assets/icons/arrow_forward.svg": "5a69027730573c2563a317de0e80c410",
"assets/packages/core/packages/common/assets/icons/online_meeting.svg": "301a092a4fca88ea666cb4cb464f1f84",
"assets/packages/core/packages/common/assets/icons/led.svg": "629e17e1e4b06545d8de209d6796246d",
"assets/packages/core/packages/common/assets/icons/workplace.svg": "6f9f5aafeaea90f3379b4cea37428837",
"assets/packages/core/packages/common/assets/icons/food.svg": "15f71eefe7a6747b61dbe2412eb91091",
"assets/packages/core/packages/common/assets/icons/favorite_outline.svg": "04c1ed00fe1ccc7065b2ec81317f7ef7",
"assets/packages/core/packages/common/assets/icons/birthday.svg": "511b46635bb57892871743ed51c90110",
"assets/packages/core/packages/common/assets/icons/minus.svg": "1a23b47cf777f310c60ed8ddc391d9b3",
"assets/packages/core/packages/common/assets/icons/planon_mc.svg": "50ea9086ff21a7d5b346e3676ffe6be0",
"assets/packages/core/packages/common/assets/icons/cross_circle.svg": "dca418380c0092841f57493225409796",
"assets/packages/core/packages/common/assets/icons/privacy.svg": "9ff337bf45a3cc0fd91d705bc716af6a",
"assets/packages/common/assets/icons/search.svg": "201b1e4147b43cc5c0d70c118236cdb3",
"assets/packages/common/assets/icons/connect.svg": "f69f7693c0d2eba2d587e8d09ce4b144",
"assets/packages/common/assets/icons/servicenow_mc.svg": "e3ca725ef82665c380be4d9a35960318",
"assets/packages/common/assets/icons/outlet.svg": "b68e5722858171b562c7e6f06a12ca5d",
"assets/packages/common/assets/icons/favorite_filled.svg": "b364fcb8b60cd91f3e15803a81510cc1",
"assets/packages/common/assets/icons/repeat.svg": "7b2eecb28782b88c5c947d638b99156d",
"assets/packages/common/assets/icons/dining.svg": "b9b56adf5caade5a362e376e76209c6f",
"assets/packages/common/assets/icons/face_id.svg": "466ed6ec962af75023a5b3b108756587",
"assets/packages/common/assets/icons/todo.svg": "914b52d8bc7a803df17286e04079d1d3",
"assets/packages/common/assets/icons/ticketing.svg": "e1c4dffff27e32b1991eef29c7ef2adf",
"assets/packages/common/assets/icons/person.svg": "9270569b0e8f80d6146cb6fa9fae0390",
"assets/packages/common/assets/icons/home.svg": "c6bbdcaa3166c2dad436f1ecb4cedb43",
"assets/packages/common/assets/icons/room.svg": "7088eb1f725b4d62f15ab84c72a2a578",
"assets/packages/common/assets/icons/location3.svg": "fd913d1e40f7414aaceb378dbe89fe69",
"assets/packages/common/assets/icons/location2.svg": "69657f6006100b6a178c9ff94d6e7376",
"assets/packages/common/assets/icons/arrow_back.svg": "7a6159fc4600d07288f75a426c59b2a3",
"assets/packages/common/assets/icons/visibility.svg": "c5ad561e2ef68d4307ea01313d047d0d",
"assets/packages/common/assets/icons/slack_mc.svg": "8bef4ce14864d6347bffa6458305acc2",
"assets/packages/common/assets/icons/map.svg": "cd6b2fe1b02b11c137f01a6197f8442b",
"assets/packages/common/assets/icons/community.svg": "12930dec9cbd3fd4c4eb639c0ed6f84e",
"assets/packages/common/assets/icons/location1.svg": "8c47c6e83b1f68984770085e54c45539",
"assets/packages/common/assets/icons/wellness.svg": "aa66d12fa209f2df3b24ad4864a1d9d2",
"assets/packages/common/assets/icons/lock.svg": "80be22cb57f9b421c0df0af64c3f3ec0",
"assets/packages/common/assets/icons/building2.svg": "5c37f7500421459377c94cdf971f4635",
"assets/packages/common/assets/icons/arrow_left.svg": "ed905cfe7068ea584a0c1b8834eb5008",
"assets/packages/common/assets/icons/policy.svg": "8ba10e8f069e3f99e011e129b95648de",
"assets/packages/common/assets/icons/space.svg": "96678eb82a95a50725bf262ea913c485",
"assets/packages/common/assets/icons/group.svg": "4717ae736095d449c0673b5914f7c292",
"assets/packages/common/assets/icons/settings.svg": "02e42c56caf6a051d7742565a5d57d62",
"assets/packages/common/assets/icons/building1.svg": "e4f3132cc7d2ccbfb56b1afe3b8a072c",
"assets/packages/common/assets/icons/zoom_mc.svg": "0532aa978d1f77d552f84fff913de4e5",
"assets/packages/common/assets/icons/navigate.svg": "fddac8d1a9ddb4a475d90af1a6ac9c16",
"assets/packages/common/assets/icons/hub.svg": "9d03465b84d0a926ebc1ea9f52ec31d7",
"assets/packages/common/assets/icons/transportation.svg": "a36872d713e6893dfa9630e56af9b2b5",
"assets/packages/common/assets/icons/desk.svg": "7e92ac2bfa21db67baa50a9485681477",
"assets/packages/common/assets/icons/videocam.svg": "bedb3bd6ba3f0f46db121cc540201e20",
"assets/packages/common/assets/icons/star_filled.svg": "cf1b055e3c8b142c88b8c4c55ae5444e",
"assets/packages/common/assets/icons/book.svg": "7ae7da4d765b28ef42a8b91ccac9bf08",
"assets/packages/common/assets/icons/features.svg": "ae8e2f1b580c4499fee7a72eac1ce0be",
"assets/packages/common/assets/icons/chevron_right.svg": "0547f8491661c730757234212b291ca8",
"assets/packages/common/assets/icons/chevron_left.svg": "4eb7e5ad99605983ee285141727d6e07",
"assets/packages/common/assets/icons/event.svg": "b1600ed3c08449c1b59d81fa33c17e9d",
"assets/packages/common/assets/icons/booking.svg": "2f061b064c599ed33a6c440b2c46ec01",
"assets/packages/common/assets/icons/linkedin_mc.svg": "a5526a6f297c10de9ccfff065eb538bc",
"assets/packages/common/assets/icons/arrow_right.svg": "2d3a46796413431693b9254c4b9ef27f",
"assets/packages/common/assets/icons/meeting.svg": "64773dfc6a2bd819983c6dbe714d8ddf",
"assets/packages/common/assets/icons/support.svg": "4d707de06495a48c5701725c4c28c408",
"assets/packages/common/assets/icons/work.svg": "7b828afca4a2acd1736c544b3c753702",
"assets/packages/common/assets/icons/lock_open.svg": "d8c4858428644d61d9cef5594329b55e",
"assets/packages/common/assets/icons/email.svg": "1b472a57099be3027fe3e55b2a6d640c",
"assets/packages/common/assets/icons/teams_mc.svg": "5db36d93cc251e10b1677fce647bac32",
"assets/packages/common/assets/icons/cross_mark.svg": "b3af932e92a2f03d2ae879262f7b2700",
"assets/packages/common/assets/icons/news.svg": "0082fcc9c5c5ed5a2a4fe7509f010460",
"assets/packages/common/assets/icons/info.svg": "31e4690e335569cb221b1c9629b565e6",
"assets/packages/common/assets/icons/add.svg": "4b255f1b398a2f4170846aaca3dd9998",
"assets/packages/common/assets/icons/video_call.svg": "75c3e53a4873d453a8c6f6bb8ceebab6",
"assets/packages/common/assets/icons/people.svg": "31f352c8c7e0a143e358ef3b54dd4aeb",
"assets/packages/common/assets/icons/mic.svg": "3370067260c5208dc0c32845f32826b7",
"assets/packages/common/assets/icons/check_circle.svg": "e575ff1ffd1fa1a8d5936ae18e84bc85",
"assets/packages/common/assets/icons/personal.svg": "18e60b5182e32103b378f1769da6671a",
"assets/packages/common/assets/icons/map2.svg": "c79555b7b41fc7faf3c2fb429faa1b8a",
"assets/packages/common/assets/icons/dragIndicator.svg": "478679362ac606e1c180d3bf8da6d280",
"assets/packages/common/assets/icons/gridview.svg": "6ce0877041f14f75e276201a3e4794e2",
"assets/packages/common/assets/icons/amenities.svg": "0a446bf534c0adb468400887b217a47e",
"assets/packages/common/assets/icons/notification.svg": "2afc3f4869c7e63a60d9848e2b8c3e8f",
"assets/packages/common/assets/icons/check_mark.svg": "c68a83d30a3546773c329f68740871b1",
"assets/packages/common/assets/icons/send.svg": "d3f9308ddf065dde37d0424a3816d294",
"assets/packages/common/assets/icons/camera.svg": "9987c35540df1ae132d30d8aace86897",
"assets/packages/common/assets/icons/groups.svg": "5b61a9f07c457f676a49671e165e3848",
"assets/packages/common/assets/icons/home_pin.svg": "86f47af4d8dc60b8de322c679836b11c",
"assets/packages/common/assets/icons/locker_bank.svg": "74ca9d39c42b2b5d9494ef2f2281a3fd",
"assets/packages/common/assets/icons/google_meet.svg": "8f94b515c7a8e6d512a99f296068ebc2",
"assets/packages/common/assets/icons/star_outline.svg": "f7dda8cd1653b1954cd6713044d7202e",
"assets/packages/common/assets/icons/outlook_mc.svg": "7838808182a779ba97eb3425f90f8d2b",
"assets/packages/common/assets/icons/edit.svg": "c52884d84f5bbe9d27e57f18ccc9fd5d",
"assets/packages/common/assets/icons/faq.svg": "5ec6346ac34a769a1792f55a2b2b4f24",
"assets/packages/common/assets/icons/fitness.svg": "60548ad63ae6df2eeed64ab88c2c7d85",
"assets/packages/common/assets/icons/exit.svg": "dbce5c5c7a16b80be07ac7b4c39ef862",
"assets/packages/common/assets/icons/delete.svg": "45b01e8f0682ff64cfd72e2150b902bb",
"assets/packages/common/assets/icons/clock.svg": "acf06e760e9eadfbaa377317d43c08cb",
"assets/packages/common/assets/icons/phone.svg": "e79152291757012ba2eb8e043364c436",
"assets/packages/common/assets/icons/floor.svg": "c4749a32a0114e99e67e85c85723e25f",
"assets/packages/common/assets/icons/mic_translucent.svg": "f0d3acd09ca7c9516d3000283a3d5c6d",
"assets/packages/common/assets/icons/profile.svg": "0bfd469e034e462c6de9bea6bef768dd",
"assets/packages/common/assets/icons/schedule.svg": "0975533da2eb405cae69e34ff4b37b69",
"assets/packages/common/assets/icons/filter.svg": "8c5bbf02434dc341ff26f0ee7a569072",
"assets/packages/common/assets/icons/directory.svg": "3f3660aae1df20007a61557ea0b9c65a",
"assets/packages/common/assets/icons/calendar.svg": "43cb3e4c2b0d1d278e343275b9747ba3",
"assets/packages/common/assets/icons/notification2.svg": "8f19ca3f26bd3d32adc7160daa9aee11",
"assets/packages/common/assets/icons/slack.svg": "8a1d51b00f1068c6c0dd52da8ebfb84e",
"assets/packages/common/assets/icons/start_half_filled.svg": "83d791ff03f406045347dd10bf47d9cf",
"assets/packages/common/assets/icons/upload.svg": "6155d28d36471bf8dc46b910752a8839",
"assets/packages/common/assets/icons/logo.svg": "4d85286ae4f310270c52315fb67692ac",
"assets/packages/common/assets/icons/arrow_forward.svg": "5a69027730573c2563a317de0e80c410",
"assets/packages/common/assets/icons/online_meeting.svg": "301a092a4fca88ea666cb4cb464f1f84",
"assets/packages/common/assets/icons/led.svg": "629e17e1e4b06545d8de209d6796246d",
"assets/packages/common/assets/icons/workplace.svg": "6f9f5aafeaea90f3379b4cea37428837",
"assets/packages/common/assets/icons/food.svg": "15f71eefe7a6747b61dbe2412eb91091",
"assets/packages/common/assets/icons/favorite_outline.svg": "04c1ed00fe1ccc7065b2ec81317f7ef7",
"assets/packages/common/assets/icons/birthday.svg": "511b46635bb57892871743ed51c90110",
"assets/packages/common/assets/icons/minus.svg": "1a23b47cf777f310c60ed8ddc391d9b3",
"assets/packages/common/assets/icons/planon_mc.svg": "50ea9086ff21a7d5b346e3676ffe6be0",
"assets/packages/common/assets/icons/cross_circle.svg": "dca418380c0092841f57493225409796",
"assets/packages/common/assets/icons/privacy.svg": "9ff337bf45a3cc0fd91d705bc716af6a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "9361f9b1a2e86574771d19c1a0326a26",
"assets/fonts/MaterialIcons-Regular.otf": "ff27469bc45d248a6d6f891c128ca1fc",
"assets/assets/icon.png": "bd3404abc15eceac2253d1db6fa2fdc6",
"assets/assets/branding.png": "6419b4e2008530e8423e205dceca3b62",
"assets/assets/logo12.png": "188651be2e45995ac3763781f8f455a9",
"assets/assets/branding12.png": "8ae19a1e0df7a4686a25c5d9484f972e",
"assets/assets/logo.png": "9986491930743f4c143d6370c9c833e5",
"assets/assets/icon_foreground.png": "9640836a45bc2e7e20f1e5904b403b3e",
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
