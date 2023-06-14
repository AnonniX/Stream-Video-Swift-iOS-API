//
// CallUpdatedEvent.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** This event is sent when a call is updated, clients should use this update the local state of the call.  This event also contains the capabilities by role for the call, clients should update the own_capability for the current. */




public struct CallUpdatedEvent: Codable, JSONEncodable, Hashable, WSCallEvent {

    public var call: CallResponse
    public var callCid: String
    /** The capabilities by role for this call */
    public var capabilitiesByRole: [String: [String]]
    public var createdAt: Date
    /** The type of event: \"call.ended\" in this case */
    public var type: String = "call.updated"

    public init(call: CallResponse, callCid: String, capabilitiesByRole: [String: [String]], createdAt: Date, type: String = "call.updated") {
        self.call = call
        self.callCid = callCid
        self.capabilitiesByRole = capabilitiesByRole
        self.createdAt = createdAt
        self.type = type
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case call
        case callCid = "call_cid"
        case capabilitiesByRole = "capabilities_by_role"
        case createdAt = "created_at"
        case type
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(call, forKey: .call)
        try container.encode(callCid, forKey: .callCid)
        try container.encode(capabilitiesByRole, forKey: .capabilitiesByRole)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(type, forKey: .type)
    }
}

