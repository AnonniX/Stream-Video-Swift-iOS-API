//
// OwnCapability.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** All possibility of string to use */
internal enum OwnCapability: String, Codable, CaseIterable {
    case blockUsers = "block-users"
    case createCall = "create-call"
    case createReaction = "create-reaction"
    case endCall = "end-call"
    case joinBackstage = "join-backstage"
    case joinCall = "join-call"
    case joinEndedCall = "join-ended-call"
    case muteUsers = "mute-users"
    case readCall = "read-call"
    case screenshare = "screenshare"
    case sendAudio = "send-audio"
    case sendVideo = "send-video"
    case startBroadcastCall = "start-broadcast-call"
    case startRecordCall = "start-record-call"
    case stopBroadcastCall = "stop-broadcast-call"
    case stopRecordCall = "stop-record-call"
    case updateCall = "update-call"
    case updateCallPermissions = "update-call-permissions"
    case updateCallSettings = "update-call-settings"
    case startTranscriptionCall = "start-transcription-call"
    case stopTranscriptionCall = "stop-transcription-call"
}
