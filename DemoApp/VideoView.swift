//
//  VideoView.swift
//  StreamVideoSwiftUI
//
//  Created by Martin Mitrevski on 24.6.22.
//

import SwiftUI

struct VideoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: VideoViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModelFactory.shared.makeVideoViewModel())
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                CameraView(
                    webRTCClient: viewModel.webRTCClient,
                    frame: CGRect(origin: .zero, size: CGSize(width: reader.size.width, height: reader.size.height / 2)),
                    isCurrentUser: true,
                    cameraPosition: viewModel.cameraPosition
                )
                .frame(maxHeight: reader.size.height / 2)
                .overlay(
                    BottomRightView {
                        Button {
                            viewModel.changeCameraPosition()
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32)
                        }
                        .padding(.horizontal)
                    }
                )
                
                CameraView(
                    webRTCClient: viewModel.webRTCClient,
                    frame: CGRect(origin: CGPoint(x: 0, y: reader.size.height / 2), size: CGSize(width: reader.size.width, height: reader.size.height / 2)),
                    isCurrentUser: false,
                    cameraPosition: viewModel.cameraPosition
                )
                .frame(maxHeight: reader.size.height / 2)
            }
            .overlay(
                ZStack {
                    TopRightView {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 36, height: 36)
                        }
                        .offset(y: 40)
                        .padding()
                    }
                    
                    VStack {
                        Spacer()
                        VideoControlsView(
                            videoShown: viewModel.videoShown,
                            muteOn: viewModel.muteOn,
                            onVideoIconTap: viewModel.changeVideoState,
                            onStopCallTap: {
                                viewModel.stopCall {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            },
                            onMuteTap: viewModel.changeMuteState
                        )
                        .padding(.bottom)
                    }
                }
            )
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct VideoControlsView: View {
    
    private let iconSize: CGFloat = 60

    var videoShown: Bool
    var muteOn: Bool
    var onVideoIconTap: () -> ()
    var onStopCallTap: () -> ()
    var onMuteTap: () -> ()
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                onMuteTap()
            } label: {
                Image(systemName: muteOn ? "mic.circle.fill" : "mic.slash.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: iconSize)
            }
            
            Button {
                onStopCallTap()
            } label: {
                Image(systemName: "phone.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: iconSize)
                    .foregroundColor(.red)
            }

            Button {
                onVideoIconTap()
            } label: {
                Image(systemName: videoShown ? "video.slash.fill" : "video.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: iconSize)
            }
        }
        .padding()
    }
    
}
