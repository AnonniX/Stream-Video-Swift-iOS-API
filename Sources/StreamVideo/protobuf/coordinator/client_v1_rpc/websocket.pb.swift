//
// Copyright © 2022 Stream.io Inc. All rights reserved.
//

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

/// WebsocketEvent only includes events that are sent to the client via websocket connection
/// This is not an exhaustive list of events, since not all of them are sent via websocket
struct Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// All users mentioned in the event payload, indexed by User.id
    var users: [String: Stream_Video_Coordinator_UserV1_User] = [:]

    /// All calls mentioned in the event payload, indexed by Call.call_cid
    var calls: [String: Stream_Video_Coordinator_CallV1_Call] = [:]

    /// All calls details for calls mentioned in the event payload, indexed by Call.call_cid
    /// Call details contain contextual data. For example, for MembersDeleted event, call_details[cid].Members will contain a list of
    /// members that were deleted.
    var callDetails: [String: Stream_Video_Coordinator_CallV1_CallDetails] = [:]

    /// The ID of the user sending the event, this field is populated only for events that are initiated by users
    /// such as accepting, rejecting or canceling a call
    var eventSenderID: String = String()

    var event: Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent.OneOf_Event?

    var healthcheck: Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck {
        get {
            if case let .healthcheck(v)? = event { return v }
            return Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck()
        }
        set { event = .healthcheck(newValue) }
    }

    /// Call events
    var callCreated: Stream_Video_Coordinator_EventV1_CallCreated {
        get {
            if case let .callCreated(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallCreated()
        }
        set { event = .callCreated(newValue) }
    }

    var callUpdated: Stream_Video_Coordinator_EventV1_CallUpdated {
        get {
            if case let .callUpdated(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallUpdated()
        }
        set { event = .callUpdated(newValue) }
    }

    var callDeleted: Stream_Video_Coordinator_EventV1_CallDeleted {
        get {
            if case let .callDeleted(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallDeleted()
        }
        set { event = .callDeleted(newValue) }
    }

    var callMembersUpdated: Stream_Video_Coordinator_EventV1_CallMembersUpdated {
        get {
            if case let .callMembersUpdated(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallMembersUpdated()
        }
        set { event = .callMembersUpdated(newValue) }
    }

    var callMembersDeleted: Stream_Video_Coordinator_EventV1_CallMembersDeleted {
        get {
            if case let .callMembersDeleted(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallMembersDeleted()
        }
        set { event = .callMembersDeleted(newValue) }
    }

    var callEnded: Stream_Video_Coordinator_EventV1_CallEnded {
        get {
            if case let .callEnded(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallEnded()
        }
        set { event = .callEnded(newValue) }
    }

    /// User initiated call events
    var callAccepted: Stream_Video_Coordinator_EventV1_CallAccepted {
        get {
            if case let .callAccepted(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallAccepted()
        }
        set { event = .callAccepted(newValue) }
    }

    var callRejected: Stream_Video_Coordinator_EventV1_CallRejected {
        get {
            if case let .callRejected(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallRejected()
        }
        set { event = .callRejected(newValue) }
    }

    var callCancelled: Stream_Video_Coordinator_EventV1_CallCancelled {
        get {
            if case let .callCancelled(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_CallCancelled()
        }
        set { event = .callCancelled(newValue) }
    }

    /// User events
    var userUpdated: Stream_Video_Coordinator_EventV1_UserUpdated {
        get {
            if case let .userUpdated(v)? = event { return v }
            return Stream_Video_Coordinator_EventV1_UserUpdated()
        }
        set { event = .userUpdated(newValue) }
    }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum OneOf_Event: Equatable {
        case healthcheck(Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck)
        /// Call events
        case callCreated(Stream_Video_Coordinator_EventV1_CallCreated)
        case callUpdated(Stream_Video_Coordinator_EventV1_CallUpdated)
        case callDeleted(Stream_Video_Coordinator_EventV1_CallDeleted)
        case callMembersUpdated(Stream_Video_Coordinator_EventV1_CallMembersUpdated)
        case callMembersDeleted(Stream_Video_Coordinator_EventV1_CallMembersDeleted)
        case callEnded(Stream_Video_Coordinator_EventV1_CallEnded)
        /// User initiated call events
        case callAccepted(Stream_Video_Coordinator_EventV1_CallAccepted)
        case callRejected(Stream_Video_Coordinator_EventV1_CallRejected)
        case callCancelled(Stream_Video_Coordinator_EventV1_CallCancelled)
        /// User events
        case userUpdated(Stream_Video_Coordinator_EventV1_UserUpdated)

        #if !swift(>=4.1)
        static func == (
            lhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent.OneOf_Event,
            rhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent.OneOf_Event
        ) -> Bool {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch (lhs, rhs) {
            case (.healthcheck, .healthcheck): return {
                    guard case let .healthcheck(l) = lhs, case let .healthcheck(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callCreated, .callCreated): return {
                    guard case let .callCreated(l) = lhs, case let .callCreated(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callUpdated, .callUpdated): return {
                    guard case let .callUpdated(l) = lhs, case let .callUpdated(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callDeleted, .callDeleted): return {
                    guard case let .callDeleted(l) = lhs, case let .callDeleted(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callMembersUpdated, .callMembersUpdated): return {
                    guard case let .callMembersUpdated(l) = lhs,
                          case let .callMembersUpdated(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callMembersDeleted, .callMembersDeleted): return {
                    guard case let .callMembersDeleted(l) = lhs,
                          case let .callMembersDeleted(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callEnded, .callEnded): return {
                    guard case let .callEnded(l) = lhs, case let .callEnded(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callAccepted, .callAccepted): return {
                    guard case let .callAccepted(l) = lhs, case let .callAccepted(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callRejected, .callRejected): return {
                    guard case let .callRejected(l) = lhs, case let .callRejected(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.callCancelled, .callCancelled): return {
                    guard case let .callCancelled(l) = lhs, case let .callCancelled(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.userUpdated, .userUpdated): return {
                    guard case let .userUpdated(l) = lhs, case let .userUpdated(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            default: return false
            }
        }
        #endif
    }

    init() {}
}

/// WebsocketClientEvent contains all events that client is allowed to send to the server
/// When clients sends any of mentioned events, they should be wrapped into ClientEvent
struct Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var event: Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent.OneOf_Event?

    var healthcheck: Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck {
        get {
            if case let .healthcheck(v)? = event { return v }
            return Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck()
        }
        set { event = .healthcheck(newValue) }
    }

    var authRequest: Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest {
        get {
            if case let .authRequest(v)? = event { return v }
            return Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest()
        }
        set { event = .authRequest(newValue) }
    }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum OneOf_Event: Equatable {
        case healthcheck(Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck)
        case authRequest(Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest)

        #if !swift(>=4.1)
        static func == (
            lhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent.OneOf_Event,
            rhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent.OneOf_Event
        ) -> Bool {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch (lhs, rhs) {
            case (.healthcheck, .healthcheck): return {
                    guard case let .healthcheck(l) = lhs, case let .healthcheck(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.authRequest, .authRequest): return {
                    guard case let .authRequest(l) = lhs, case let .authRequest(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            default: return false
            }
        }
        #endif
    }

    init() {}
}

/// A payload that is sent through websocket to authenticate a connection
struct Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Application API key that matches a secret is used to sign a token
    var apiKey: String = String()

    /// A client JWT token
    var token: String = String()

    /// Optional UserInput. When present, it is used to create or update user information.
    /// If contains some changes, a permission check will be performed
    var user: Stream_Video_Coordinator_UserV1_UserInput {
        get { _user ?? Stream_Video_Coordinator_UserV1_UserInput() }
        set { _user = newValue }
    }

    /// Returns true if `user` has been explicitly set.
    var hasUser: Bool { self._user != nil }
    /// Clears the value of `user`. Subsequent reads from it will return its default value.
    mutating func clearUser() { _user = nil }

    /// Optional DeviceInput. When present, a device will be created for a user. If device
    /// already exists, nothing will happen
    var device: Stream_Video_Coordinator_PushV1_DeviceInput {
        get { _device ?? Stream_Video_Coordinator_PushV1_DeviceInput() }
        set { _device = newValue }
    }

    /// Returns true if `device` has been explicitly set.
    var hasDevice: Bool { self._device != nil }
    /// Clears the value of `device`. Subsequent reads from it will return its default value.
    mutating func clearDevice() { _device = nil }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    fileprivate var _user: Stream_Video_Coordinator_UserV1_UserInput?
    fileprivate var _device: Stream_Video_Coordinator_PushV1_DeviceInput?
}

/// Healthcheck is sent back and forth between websocket client and server
/// When server sends a healthcheck, it is wrapped into WebsocketEvent
/// When client sends healthcheck, it should be wrapped into WebsocketClientEvent
struct Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var userID: String = String()

    var clientID: String = String()

    var callType: String = String()

    var callID: String = String()

    var video: Bool = false

    var audio: Bool = false

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent: @unchecked Sendable {}
extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent.OneOf_Event: @unchecked Sendable {}
extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent: @unchecked Sendable {}
extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent.OneOf_Event: @unchecked Sendable {}
extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest: @unchecked Sendable {}
extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck: @unchecked Sendable {}
#endif // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "stream.video.coordinator.client_v1_rpc"

extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".WebsocketEvent"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "users"),
        2: .same(proto: "calls"),
        3: .standard(proto: "call_details"),
        4: .standard(proto: "event_sender_id"),
        20: .same(proto: "healthcheck"),
        30: .standard(proto: "call_created"),
        31: .standard(proto: "call_updated"),
        32: .standard(proto: "call_deleted"),
        33: .standard(proto: "call_members_updated"),
        34: .standard(proto: "call_members_deleted"),
        36: .standard(proto: "call_ended"),
        40: .standard(proto: "call_accepted"),
        41: .standard(proto: "call_rejected"),
        42: .standard(proto: "call_cancelled"),
        50: .standard(proto: "user_updated")
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeMapField(
                    fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString, Stream_Video_Coordinator_UserV1_User>
                        .self,
                    value: &self.users
                ) }()
            case 2: try { try decoder.decodeMapField(
                    fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString, Stream_Video_Coordinator_CallV1_Call>
                        .self,
                    value: &self.calls
                ) }()
            case 3: try { try decoder.decodeMapField(
                    fieldType: SwiftProtobuf._ProtobufMessageMap<
                        SwiftProtobuf.ProtobufString,
                        Stream_Video_Coordinator_CallV1_CallDetails
                    >
                    .self,
                    value: &self.callDetails
                ) }()
            case 4: try { try decoder.decodeSingularStringField(value: &self.eventSenderID) }()
            case 20: try {
                    var v: Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .healthcheck(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .healthcheck(v)
                    }
                }()
            case 30: try {
                    var v: Stream_Video_Coordinator_EventV1_CallCreated?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callCreated(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callCreated(v)
                    }
                }()
            case 31: try {
                    var v: Stream_Video_Coordinator_EventV1_CallUpdated?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callUpdated(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callUpdated(v)
                    }
                }()
            case 32: try {
                    var v: Stream_Video_Coordinator_EventV1_CallDeleted?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callDeleted(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callDeleted(v)
                    }
                }()
            case 33: try {
                    var v: Stream_Video_Coordinator_EventV1_CallMembersUpdated?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callMembersUpdated(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callMembersUpdated(v)
                    }
                }()
            case 34: try {
                    var v: Stream_Video_Coordinator_EventV1_CallMembersDeleted?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callMembersDeleted(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callMembersDeleted(v)
                    }
                }()
            case 36: try {
                    var v: Stream_Video_Coordinator_EventV1_CallEnded?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callEnded(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callEnded(v)
                    }
                }()
            case 40: try {
                    var v: Stream_Video_Coordinator_EventV1_CallAccepted?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callAccepted(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callAccepted(v)
                    }
                }()
            case 41: try {
                    var v: Stream_Video_Coordinator_EventV1_CallRejected?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callRejected(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callRejected(v)
                    }
                }()
            case 42: try {
                    var v: Stream_Video_Coordinator_EventV1_CallCancelled?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .callCancelled(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .callCancelled(v)
                    }
                }()
            case 50: try {
                    var v: Stream_Video_Coordinator_EventV1_UserUpdated?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .userUpdated(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .userUpdated(v)
                    }
                }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        if !users.isEmpty {
            try visitor.visitMapField(
                fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString, Stream_Video_Coordinator_UserV1_User>
                    .self,
                value: users,
                fieldNumber: 1
            )
        }
        if !calls.isEmpty {
            try visitor.visitMapField(
                fieldType: SwiftProtobuf._ProtobufMessageMap<SwiftProtobuf.ProtobufString, Stream_Video_Coordinator_CallV1_Call>
                    .self,
                value: calls,
                fieldNumber: 2
            )
        }
        if !callDetails.isEmpty {
            try visitor.visitMapField(
                fieldType: SwiftProtobuf._ProtobufMessageMap<
                    SwiftProtobuf.ProtobufString,
                    Stream_Video_Coordinator_CallV1_CallDetails
                >
                .self,
                value: callDetails,
                fieldNumber: 3
            )
        }
        if !eventSenderID.isEmpty {
            try visitor.visitSingularStringField(value: eventSenderID, fieldNumber: 4)
        }
        switch event {
        case .healthcheck?: try {
                guard case let .healthcheck(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 20)
            }()
        case .callCreated?: try {
                guard case let .callCreated(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 30)
            }()
        case .callUpdated?: try {
                guard case let .callUpdated(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 31)
            }()
        case .callDeleted?: try {
                guard case let .callDeleted(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 32)
            }()
        case .callMembersUpdated?: try {
                guard case let .callMembersUpdated(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 33)
            }()
        case .callMembersDeleted?: try {
                guard case let .callMembersDeleted(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 34)
            }()
        case .callEnded?: try {
                guard case let .callEnded(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 36)
            }()
        case .callAccepted?: try {
                guard case let .callAccepted(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 40)
            }()
        case .callRejected?: try {
                guard case let .callRejected(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 41)
            }()
        case .callCancelled?: try {
                guard case let .callCancelled(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 42)
            }()
        case .userUpdated?: try {
                guard case let .userUpdated(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 50)
            }()
        case nil: break
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (
        lhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent,
        rhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketEvent
    ) -> Bool {
        if lhs.users != rhs.users { return false }
        if lhs.calls != rhs.calls { return false }
        if lhs.callDetails != rhs.callDetails { return false }
        if lhs.eventSenderID != rhs.eventSenderID { return false }
        if lhs.event != rhs.event { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent: SwiftProtobuf.Message,
    SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".WebsocketClientEvent"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "healthcheck"),
        2: .standard(proto: "auth_request")
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try {
                    var v: Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .healthcheck(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .healthcheck(v)
                    }
                }()
            case 2: try {
                    var v: Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest?
                    var hadOneofValue = false
                    if let current = self.event {
                        hadOneofValue = true
                        if case let .authRequest(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.event = .authRequest(v)
                    }
                }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        switch event {
        case .healthcheck?: try {
                guard case let .healthcheck(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
            }()
        case .authRequest?: try {
                guard case let .authRequest(v)? = self.event else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
            }()
        case nil: break
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (
        lhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent,
        rhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketClientEvent
    ) -> Bool {
        if lhs.event != rhs.event { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest: SwiftProtobuf.Message,
    SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".WebsocketAuthRequest"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "api_key"),
        2: .same(proto: "token"),
        3: .same(proto: "user"),
        4: .same(proto: "device")
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeSingularStringField(value: &self.apiKey) }()
            case 2: try { try decoder.decodeSingularStringField(value: &self.token) }()
            case 3: try { try decoder.decodeSingularMessageField(value: &self._user) }()
            case 4: try { try decoder.decodeSingularMessageField(value: &self._device) }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        if !apiKey.isEmpty {
            try visitor.visitSingularStringField(value: apiKey, fieldNumber: 1)
        }
        if !token.isEmpty {
            try visitor.visitSingularStringField(value: token, fieldNumber: 2)
        }
        try { if let v = self._user {
            try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
        } }()
        try { if let v = self._device {
            try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
        } }()
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (
        lhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest,
        rhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketAuthRequest
    ) -> Bool {
        if lhs.apiKey != rhs.apiKey { return false }
        if lhs.token != rhs.token { return false }
        if lhs._user != rhs._user { return false }
        if lhs._device != rhs._device { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck: SwiftProtobuf.Message,
    SwiftProtobuf._MessageImplementationBase,
    SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".WebsocketHealthcheck"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "user_id"),
        2: .standard(proto: "client_id"),
        3: .standard(proto: "call_type"),
        4: .standard(proto: "call_id"),
        5: .same(proto: "video"),
        6: .same(proto: "audio")
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
            case 2: try { try decoder.decodeSingularStringField(value: &self.clientID) }()
            case 3: try { try decoder.decodeSingularStringField(value: &self.callType) }()
            case 4: try { try decoder.decodeSingularStringField(value: &self.callID) }()
            case 5: try { try decoder.decodeSingularBoolField(value: &self.video) }()
            case 6: try { try decoder.decodeSingularBoolField(value: &self.audio) }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !userID.isEmpty {
            try visitor.visitSingularStringField(value: userID, fieldNumber: 1)
        }
        if !clientID.isEmpty {
            try visitor.visitSingularStringField(value: clientID, fieldNumber: 2)
        }
        if !callType.isEmpty {
            try visitor.visitSingularStringField(value: callType, fieldNumber: 3)
        }
        if !callID.isEmpty {
            try visitor.visitSingularStringField(value: callID, fieldNumber: 4)
        }
        if video != false {
            try visitor.visitSingularBoolField(value: video, fieldNumber: 5)
        }
        if audio != false {
            try visitor.visitSingularBoolField(value: audio, fieldNumber: 6)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (
        lhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck,
        rhs: Stream_Video_Coordinator_ClientV1Rpc_WebsocketHealthcheck
    ) -> Bool {
        if lhs.userID != rhs.userID { return false }
        if lhs.clientID != rhs.clientID { return false }
        if lhs.callType != rhs.callType { return false }
        if lhs.callID != rhs.callID { return false }
        if lhs.video != rhs.video { return false }
        if lhs.audio != rhs.audio { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}
