//
// CallReactionEvent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** This event is sent when a reaction is sent in a call, clients should use this to show the reaction in the call screen */




public struct CallReactionEvent: Codable, JSONEncodable, Hashable, WSCallEvent {

    public var callCid: String
    public var createdAt: Date
    public var reaction: ReactionResponse
    /** The type of event: \"call.reaction_new\" in this case */
    public var type: String = "call.reaction_new"

    public init(callCid: String, createdAt: Date, reaction: ReactionResponse, type: String = "call.reaction_new") {
        self.callCid = callCid
        self.createdAt = createdAt
        self.reaction = reaction
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case callCid = "call_cid"
        case createdAt = "created_at"
        case reaction
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(callCid, forKey: .callCid)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(reaction, forKey: .reaction)
        try container.encode(type, forKey: .type)
    }
}

