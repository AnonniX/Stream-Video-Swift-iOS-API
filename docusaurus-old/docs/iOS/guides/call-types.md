---
title: Call Types
---

When you start a call, you also need to provide the call type. Call types come with some predefined settings and permissions, depending on the video calling use-case they represent.

#### Development

The `development` call type has all the permissions enabled, and can be used during development. It's not recommended to use this call type in production, since all the participants in the calls would be able to do everything (blocking, muting everyone, etc).

For these call types, backstage is not enabled, therefore you don't have to explicitly call `goLive` in order for the call to be started.

#### Default

The `default` call type can be used for different video-calling apps, such as 1-1 calls, group calls or meetings with multiple people. Both video and audio are enabled, and backstage is disabled. It has permissions settings in place, where admins and hosts have elevated permissions over other types of users.

#### Audio Room

The `audio_room` call type is suitable for apps like Clubhouse or Twitter Spaces. It has pre-configured workflow around requesting permissions to speak for regular listeners. Backstage is enabled, and new calls are going to the backstage mode when created. You will need to explicitly call the `goLive` method to make the call active for all participants.

You can find a guide on how to handle this [here](./quickstart/audio-room.md).

#### Livestream

The `livestream` call type is configured to be used for livestreaming apps. Access to calls is granted to all authenticated users, and backstage is enabled by default.