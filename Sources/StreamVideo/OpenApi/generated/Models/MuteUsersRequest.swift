//
// MuteUsersRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif





public struct MuteUsersRequest: Codable, JSONEncodable, Hashable {

    public var audio: Bool?
    public var muteAllUsers: Bool?
    public var screenshare: Bool?
    public var userIds: [String]?
    public var video: Bool?

    public init(audio: Bool? = nil, muteAllUsers: Bool? = nil, screenshare: Bool? = nil, userIds: [String]? = nil, video: Bool? = nil) {
        self.audio = audio
        self.muteAllUsers = muteAllUsers
        self.screenshare = screenshare
        self.userIds = userIds
        self.video = video
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case audio
        case muteAllUsers = "mute_all_users"
        case screenshare
        case userIds = "user_ids"
        case video
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(audio, forKey: .audio)
        try container.encodeIfPresent(muteAllUsers, forKey: .muteAllUsers)
        try container.encodeIfPresent(screenshare, forKey: .screenshare)
        try container.encodeIfPresent(userIds, forKey: .userIds)
        try container.encodeIfPresent(video, forKey: .video)
    }
}

