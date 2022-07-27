// Generated by protoc-gen-siwftwirp. DO NOT EDIT
import Foundation;
import SwiftProtobuf;public typealias ProtoModel = SwiftProtobuf.Message & SwiftProtobuf._ProtoNameProviding



class Stream_Video_CallCoordinatorService {
	private let httpClient: HTTPClient
	var hostname: String
	var token: String

	let pathPrefix: String = "/stream.video.CallCoordinatorService/"

	init(httpClient: HTTPClient, hostname: String, token: String) {
        self.httpClient = httpClient
		self.hostname = hostname
		self.token = token
	}
    
	func createCall(createCallRequest: Stream_Video_CreateCallRequest) async throws -> Stream_Video_CreateCallResponse {
        return try await execute(request: createCallRequest, path: "CreateCall")
	}
    
	func getCall(getCallRequest: Stream_Video_GetCallRequest) async throws -> Stream_Video_GetCallResponse {
        return try await execute(request: getCallRequest, path: "GetCall")
	}
    
	func updateCall(updateCallRequest: Stream_Video_UpdateCallRequest) async throws -> Stream_Video_UpdateCallResponse {
        return try await execute(request: updateCallRequest, path: "UpdateCall")
	}
    
	func deleteCall(deleteCallRequest: Stream_Video_DeleteCallRequest) async throws -> Stream_Video_DeleteCallResponse {
        return try await execute(request: deleteCallRequest, path: "DeleteCall")
	}
    
	func joinCall(joinCallRequest: Stream_Video_JoinCallRequest) async throws -> Stream_Video_JoinCallResponse {
        return try await execute(request: joinCallRequest, path: "JoinCall")
	}
    
	func selectEdgeServer(selectEdgeServerRequest: Stream_Video_SelectEdgeServerRequest) async throws -> Stream_Video_SelectEdgeServerResponse {
        return try await execute(request: selectEdgeServerRequest, path: "SelectEdgeServer")
	}
    
	func leaveCall(leaveCallRequest: Stream_Video_LeaveCallRequest) async throws -> Stream_Video_LeaveCallResponse {
        return try await execute(request: leaveCallRequest, path: "LeaveCall")
	}
    
	func endCall(endCallRequest: Stream_Video_EndCallRequest) async throws -> Stream_Video_EndCallResponse {
        return try await execute(request: endCallRequest, path: "EndCall")
	}
    
	func addDevice(addDeviceRequest: Stream_Video_AddDeviceRequest) async throws -> Stream_Video_AddDeviceResponse {
        return try await execute(request: addDeviceRequest, path: "AddDevice")
	}
    
	func removeDevice(removeDeviceRequest: Stream_Video_RemoveDeviceRequest) async throws -> Stream_Video_RemoveDeviceResponse {
        return try await execute(request: removeDeviceRequest, path: "RemoveDevice")
	}
    
	func listDevices(listDevicesRequest: Stream_Video_ListDevicesRequest) async throws -> Stream_Video_ListDevicesResponse {
        return try await execute(request: listDevicesRequest, path: "ListDevices")
	}
    
	func sendEvent(sendEventRequest: Stream_Video_SendEventRequest) async throws -> Stream_Video_SendEventResponse {
        return try await execute(request: sendEventRequest, path: "SendEvent")
	}
    
	func sendCustomEvent(sendCustomEventRequest: Stream_Video_SendCustomEventRequest) async throws -> Stream_Video_SendCustomEventResponse {
        return try await execute(request: sendCustomEventRequest, path: "SendCustomEvent")
	}
    
	func createOrUpdateCalls(createOrUpdateCallsRequest: Stream_Video_CreateOrUpdateCallsRequest) async throws -> Stream_Video_CreateOrUpdateCallsResponse {
        return try await execute(request: createOrUpdateCallsRequest, path: "CreateOrUpdateCalls")
	}
    
	func createOrUpdateUsers(createOrUpdateUsersRequest: Stream_Video_CreateOrUpdateUsersRequest) async throws -> Stream_Video_CreateOrUpdateUsersResponse {
        return try await execute(request: createOrUpdateUsersRequest, path: "CreateOrUpdateUsers")
	}
    
	func transcribeCall(transcribeCallRequest: Stream_Video_TranscribeCallRequest) async throws -> Stream_Video_TranscribeCallResponse {
        return try await execute(request: transcribeCallRequest, path: "TranscribeCall")
	}
    
	func stopTranscribeCall(stopTranscribeCallRequest: Stream_Video_StopTranscribeCallRequest) async throws -> Stream_Video_StopTranscribeCallResponse {
        return try await execute(request: stopTranscribeCallRequest, path: "StopTranscribeCall")
	}
    
	func startBroadcast(startBroadcastRequest: Stream_Video_StartBroadcastRequest) async throws -> Stream_Video_StartBroadcastResponse {
        return try await execute(request: startBroadcastRequest, path: "StartBroadcast")
	}
    
	func stopBroadcast(stopBroadcastRequest: Stream_Video_StopBroadcastRequest) async throws -> Stream_Video_StopBroadcastResponse {
        return try await execute(request: stopBroadcastRequest, path: "StopBroadcast")
	}
    
	func startRecording(startRecordingRequest: Stream_Video_StartRecordingRequest) async throws -> Stream_Video_StartRecordingResponse {
        return try await execute(request: startRecordingRequest, path: "StartRecording")
	}
    
	func stopRecording(stopRecordingRequest: Stream_Video_StopRecordingRequest) async throws -> Stream_Video_StopRecordingResponse {
        return try await execute(request: stopRecordingRequest, path: "StopRecording")
	}
    
	func getRecordings(getRecordingsRequest: Stream_Video_GetRecordingsRequest) async throws -> Stream_Video_GetRecordingsResponse {
        return try await execute(request: getRecordingsRequest, path: "GetRecordings")
	}
    
	func createUser(createUserRequest: Stream_Video_CreateUserRequest) async throws -> Stream_Video_CreateUserResponse {
        return try await execute(request: createUserRequest, path: "CreateUser")
	}
    
	func deleteUser(deleteUserRequest: Stream_Video_DeleteUserRequest) async throws -> Stream_Video_DeleteUserResponse {
        return try await execute(request: deleteUserRequest, path: "DeleteUser")
	}
    
	func exportUser(exportUserRequest: Stream_Video_ExportUserRequest) async throws -> Stream_Video_ExportUserResponse {
        return try await execute(request: exportUserRequest, path: "ExportUser")
	}
    
	func storeCallStats(storeCallStatsRequest: Stream_Video_StoreCallStatsRequest) async throws -> Stream_Video_StoreCallStatsResponse {
        return try await execute(request: storeCallStatsRequest, path: "StoreCallStats")
	}
    
	func getCallStats(getCallStatsRequest: Stream_Video_GetCallStatsRequest) async throws -> Stream_Video_GetCallStatsResponse {
        return try await execute(request: getCallStatsRequest, path: "GetCallStats")
	}
    
	func reviewCall(reviewCallRequest: Stream_Video_ReviewCallRequest) async throws -> Stream_Video_ReviewCallResponse {
        return try await execute(request: reviewCallRequest, path: "ReviewCall")
	}
    
	func reportIssue(reportIssueRequest: Stream_Video_ReportIssueRequest) async throws -> Stream_Video_ReportIssueResponse {
        return try await execute(request: reportIssueRequest, path: "ReportIssue")
	}
    
    func update(userToken: String) {
        self.token = userToken
    }
    
    private func execute<Request: ProtoModel, Response: ProtoModel>(request: Request, path: String) async throws -> Response {
        let requestData = try request.serializedData()
        var request = try makeRequest(for: path)
        request.httpBody = requestData
        let responseData = try await httpClient.execute(request: request)
        let response = try Response.init(serializedData: responseData)
        return response
    }
    
    private func makeRequest(for path: String) throws -> URLRequest {
    	let url = hostname + pathPrefix + path
        guard let url = URL(string: url) else {
            throw NSError(domain: "stream", code: 123)
        }
        var request = URLRequest(url: url)
        request.setValue("application/protobuf", forHTTPHeaderField: "Content-Type")
        request.setValue(token, forHTTPHeaderField: "authorization")
        request.httpMethod = "POST"
        return request
    }        

}



