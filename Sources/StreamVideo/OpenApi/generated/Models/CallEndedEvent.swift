//
// CallEndedEvent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
/** This event is sent when a call is mark as ended for all its participants. Clients receiving this event should leave the call screen */

public struct CallEndedEvent: @unchecked Sendable, Event, Codable, JSONEncodable, Hashable, WSCallEvent {
    public var callCid: String
    public var createdAt: Date
    /** The type of event: \"call.ended\" in this case */
    public var type: String = "call.ended"
    public var user: UserResponse?

    public init(callCid: String, createdAt: Date, type: String = "call.ended", user: UserResponse? = nil) {
        self.callCid = callCid
        self.createdAt = createdAt
        self.type = type
        self.user = user
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case callCid = "call_cid"
        case createdAt = "created_at"
        case type
        case user
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(callCid, forKey: .callCid)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(user, forKey: .user)
    }
}

