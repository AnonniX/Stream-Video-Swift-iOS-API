//
// Copyright © 2023 Stream.io Inc. All rights reserved.
//

import Foundation

class EventsController {
    
    private let callCoordinatorController: CallCoordinatorController
    private let currentUser: User
    
    private var coordinatorClient: CoordinatorClient {
        callCoordinatorController.coordinatorClient
    }
    
    /// A closure that is called when a custom event is received.
    var onCustomEvent: ((CustomEvent) -> Void)?
    /// A closure that is called when a new reaction is received.
    var onNewReaction: ((CallReaction) -> Void)?
    
    /// Initializes a new instance of the controller.
    /// - Parameters:
    ///   - callCoordinatorController: The `CallCoordinatorController` instance that manages the call.
    ///   - currentUser: The `User` model representing the current user.
    init(
        callCoordinatorController: CallCoordinatorController,
        currentUser: User
    ) {
        self.callCoordinatorController = callCoordinatorController
        self.currentUser = currentUser
    }
    
    /// Sends a custom event to the call.
    /// - Parameter event: The `CustomEventRequest` object representing the custom event to send.
    /// - Throws: An error if the sending fails.
    func send(event: CustomEventRequest) async throws {
        let sendEventRequest = SendEventRequest(
            custom: RawJSON.convert(extraData: event.extraData),
            type: event.type.rawValue
        )
        let request = EventRequestData(
            id: event.callId,
            type: event.callType.name,
            sendEventRequest: sendEventRequest
        )
        _ = try await coordinatorClient.sendEvent(with: request)
    }
    
    /// Sends a reaction to the call.
    /// - Parameter reaction: The `CallReactionRequest` object representing the reaction to send.
    /// - Throws: An error if the sending fails.
    func send(reaction: CallReactionRequest) async throws {
        let request = SendReactionRequest(
            custom: RawJSON.convert(extraData: reaction.extraData),
            emojiCode: reaction.emojiCode,
            type: reaction.reactionType
        )
        let requestData = SendReactionRequestData(
            id: reaction.callId,
            type: reaction.callType.name,
            sendReactionRequest: request
        )
        _ = try await coordinatorClient.sendReaction(with: requestData)
    }
    
    /// Returns an asynchronous stream of custom events received during the call.
    /// - Returns: An `AsyncStream` of `CustomEvent` objects.
    func customEvents() -> AsyncStream<CustomEvent> {
        let requests = AsyncStream(CustomEvent.self) { [weak self] continuation in
            self?.onCustomEvent = { event in
                continuation.yield(event)
            }
        }
        return requests
    }
    
    /// Returns an asynchronous stream of reactions received during the call.
    /// - Returns: An `AsyncStream` of `CallReaction` objects.
    func reactions() -> AsyncStream<CallReaction> {
        let requests = AsyncStream(CallReaction.self) { [weak self] continuation in
            self?.onNewReaction = { event in
                continuation.yield(event)
            }
        }
        return requests
    }
}

public struct CustomEvent {
    public let callCid: String
    public let createdAt: Date
    public let extraData: [String: Any]
    public let type: String
    public let user: User
}

public struct CallReaction {
    public let callCid: String
    public let createdAt: Date
    public let extraData: [String: Any]
    public let type: String
    public let emojiCode: String?
    public let user: User
}

extension CustomVideoEvent {
    func toCustomEvent() -> CustomEvent {
        CustomEvent(
            callCid: callCid,
            createdAt: createdAt,
            extraData: mapped,
            type: type,
            user: User(
                id: user.id,
                name: user.name,
                imageURL: URL(string: user.image ?? "")
            )
        )
    }
    
    var mapped: [String: Any] {
        var result = [String: Any]()
        for (key, value) in custom {
            result[key] = value.value
        }
        return result
    }
}

extension CallReactionEvent {
    func toVideoReaction() -> CallReaction {
        CallReaction(
            callCid: callCid,
            createdAt: createdAt,
            extraData: mapped,
            type: reaction.type,
            emojiCode: reaction.emojiCode,
            user: User(
                id: reaction.user.id,
                name: reaction.user.name,
                imageURL: URL(string: reaction.user.image ?? "")
            )
        )
    }
    
    var mapped: [String: Any] {
        var result = [String: Any]()
        for (key, value) in reaction.custom {
            result[key] = value.value
        }
        return result
    }
}
