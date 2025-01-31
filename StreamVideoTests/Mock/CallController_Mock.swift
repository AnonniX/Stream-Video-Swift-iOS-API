//
// Copyright © 2023 Stream.io Inc. All rights reserved.
//

@testable import StreamVideo

class CallController_Mock: CallController {
    
    let mockResponseBuilder = MockResponseBuilder()
            
    internal lazy var webRTCClient = WebRTCClient(
        user: StreamVideo.mockUser,
        apiKey: "key1",
        hostname: "localhost",
        webSocketURLString: "wss://localhost/ws",
        token: StreamVideo.mockToken.rawValue,
        callCid: "default:test",
        sessionID: nil,
        ownCapabilities: [.sendAudio, .sendVideo],
        videoConfig: VideoConfig(),
        audioSettings: AudioSettings(
            accessRequestEnabled: true,
            defaultDevice: .speaker,
            micDefaultOn: true,
            opusDtxEnabled: true,
            redundantCodingEnabled: true,
            speakerDefaultOn: true
        ),
        environment: WebSocketClient.Environment.mock
    )

    override func joinCall(
        create: Bool = true,
        callType: String,
        callId: String,
        callSettings: CallSettings?,
        videoOptions: VideoOptions,
        options: CreateCallOptions? = nil,
        migratingFrom: String? = nil,
        sessionID: String? = nil,
        ring: Bool = false,
        notify: Bool = false
    ) async throws -> JoinCallResponse {
        webRTCClient.onParticipantsUpdated = { [weak self] participants in
            executeOnMain {
                self?.call?.state.participantsMap = participants
            }
        }
        return mockResponseBuilder.makeJoinCallResponse(cid: "\(callType):\(callId)")
    }
    
    override func changeAudioState(isEnabled: Bool) async throws { /* no op */ }
    
    override func changeVideoState(isEnabled: Bool) async throws { /* no op */ }
    
    override func changeCameraMode(position: CameraPosition, completion: @escaping () -> ()) {
        completion()
    }
    
    override func changeSoundState(isEnabled: Bool) async throws { /* no op */ }
    
    override func changeSpeakerState(isEnabled: Bool) async throws { /* no op */ }
    
}

extension CallController_Mock {
    static func make() -> CallController_Mock {
        CallController_Mock(
            defaultAPI: DefaultAPI(
                basePath: "test.com",
                transport: HTTPClient_Mock(),
                middlewares: []
            ),
            user: StreamVideo.mockUser,
            callId: "123",
            callType: "default",
            apiKey: "key1",
            videoConfig: VideoConfig(),
            cachedLocation: nil
        )
    }
}
