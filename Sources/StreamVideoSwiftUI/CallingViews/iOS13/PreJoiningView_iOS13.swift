//
// Copyright © 2023 Stream.io Inc. All rights reserved.
//

import NukeUI
import StreamVideo
import SwiftUI

@available(iOS, introduced: 13, obsoleted: 14)
struct LobbyView_iOS13: View {
    
    @ObservedObject var callViewModel: CallViewModel
    @BackportStateObject var viewModel = LobbyViewModel()
    @BackportStateObject var microphoneChecker = MicrophoneChecker()
    
    var callId: String
    var callType: String
    var callParticipants: [Member]
    @Binding var callSettings: CallSettings
    var onJoinCallTap: () -> ()
    var onCloseLobby: () -> ()
    
    public init(
        callViewModel: CallViewModel,
        callId: String,
        callType: String,
        callParticipants: [Member],
        callSettings: Binding<CallSettings>,
        onJoinCallTap: @escaping () -> (),
        onCloseLobby: @escaping () -> ()
    ) {
        _callViewModel = ObservedObject(wrappedValue: callViewModel)
        _callSettings = callSettings
        self.callId = callId
        self.callType = callType
        self.callParticipants = callParticipants
        self.onJoinCallTap = onJoinCallTap
        self.onCloseLobby = onCloseLobby
    }
    
    public var body: some View {
        LobbyContentView(
            viewModel: viewModel,
            microphoneChecker: microphoneChecker,
            callId: callId,
            callType: callType,
            callParticipants: callParticipants,
            callSettings: $callSettings,
            onJoinCallTap: onJoinCallTap,
            onCloseLobby: onCloseLobby
        )
    }
}
