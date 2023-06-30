//
//  StreamVideoSwiftUIApp+Sentry.swift
//  DemoApp
//
//  Created by Ilias Pavlidakis on 29/5/23.
//

import Foundation
import StreamVideo
import Sentry

extension StreamVideoSwiftUIApp {

    func configureSentry() {
    #if RELEASE
        // We're tracking Crash Reports / Issues from the Demo App to keep improving the SDK
        SentrySDK.start { options in
            options.dsn = "https://855ff07b9c1841e38842682d5a87d7b4@o389650.ingest.sentry.io/4505447573356544"
            options.debug = true
            options.tracesSampleRate = 1.0
            options.enableAppHangTracking = true
        }
        
        LogConfig.destinationTypes = [ConsoleLogDestination.self, SentryLogDestination.self]

    #endif
    }
}

/// Basic destination for outputting messages to console.
public class SentryLogDestination: LogDestination {
    open var identifier: String
    open var level: LogLevel
    open var subsystems: LogSubsystem
    
    open var dateFormatter: DateFormatter
    open var formatters: [LogFormatter]
    
    open var showDate: Bool
    open var showLevel: Bool
    open var showIdentifier: Bool
    open var showThreadName: Bool
    open var showFileName: Bool
    open var showLineNumber: Bool
    open var showFunctionName: Bool
    
    /// Initialize the log destination with given parameters.
    ///
    /// - Parameters:
    ///   - identifier: Identifier for this destination. Will be shown on the logs if `showIdentifier` is `true`
    ///   - level: Output level for this destination. Messages will only be shown if their output level is higher than this.
    ///   - showDate: Toggle for showing date in logs
    ///   - dateFormatter: DateFormatter instance for formatting the date in logs. Defaults to ISO8601 formatter.
    ///   - formatters: Log formatters to be applied in order before logs are outputted. Defaults to empty (no formatters).
    ///                 Please see `LogFormatter` for more info.
    ///   - showLevel: Toggle for showing log level in logs
    ///   - showIdentifier: Toggle for showing identifier in logs
    ///   - showThreadName: Toggle for showing thread name in logs
    ///   - showFileName: Toggle for showing file name in logs
    ///   - showLineNumber: Toggle for showing line number in logs
    ///   - showFunctionName: Toggle for showing function name in logs
    public required init(
        identifier: String,
        level: LogLevel,
        subsystems: LogSubsystem,
        showDate: Bool,
        dateFormatter: DateFormatter,
        formatters: [LogFormatter],
        showLevel: Bool,
        showIdentifier: Bool,
        showThreadName: Bool,
        showFileName: Bool,
        showLineNumber: Bool,
        showFunctionName: Bool
    ) {
        self.identifier = identifier
        self.level = level
        self.subsystems = subsystems
        self.showIdentifier = showIdentifier
        self.showThreadName = showThreadName
        self.showDate = showDate
        self.dateFormatter = dateFormatter
        self.formatters = formatters
        self.showLevel = showLevel
        self.showFileName = showFileName
        self.showLineNumber = showLineNumber
        self.showFunctionName = showFunctionName
    }
    
    open func isEnabled(level: LogLevel) -> Bool {
        assertionFailure("`isEnabled(level:)` is deprecated, please use `isEnabled(level:subsystem:)`")
        return true
    }
    
    /// Checks if this destination is enabled for the given level and subsystems.
    /// - Parameter level: Log level to be checked
    /// - Parameter subsystems: Log subsystems to be checked
    /// - Returns: `true` if destination is enabled for the given level, else `false`
    open func isEnabled(level: LogLevel, subsystems: LogSubsystem) -> Bool {
        level.rawValue >= self.level.rawValue && self.subsystems.contains(subsystems)
    }
    
    /// Process the log details before outputting the log.
    /// - Parameter logDetails: Log details to be processed.
    open func process(logDetails: LogDetails) {
        let scope = Scope()
        
        if showLevel {
            switch logDetails.level {
            case .debug:
                scope.setLevel(.debug)
            case .info:
                scope.setLevel(.info)
            case .warning:
                scope.setLevel(.warning)
            case .error:
                scope.setLevel(.error)
            }
        }
        
        if showIdentifier {
            scope.setExtra(value: "\(logDetails.loggerIdentifier)-\(identifier)", key: "identifier")
        }
        
        if showThreadName {
            scope.setExtra(value: logDetails.threadName, key: "threadName")
        }
        
        if showFileName {
            let fileName = (String(describing: logDetails.fileName) as NSString).lastPathComponent
            scope.setExtra(value: "\(fileName)\(showLineNumber ? ":\(logDetails.lineNumber)" : "")", key: "filename")
        } else if showLineNumber {
            scope.setExtra(value: "\(logDetails.lineNumber)", key: "linenumber")
        }
        
        if showFunctionName {
            scope.setExtra(value: "\(logDetails.functionName)", key: "functionName")
        }
        
        let message = logDetails.message
        
        if let error = logDetails.error {
            scope.setExtra(value: message, key: "message")
            SentrySDK.capture(error: error, scope: scope)
        } else {
            let formattedMessage = applyFormatters(logDetails: logDetails, message: message)
            SentrySDK.capture(message: formattedMessage, scope: scope)
        }
    }
    
    /// Apply formatters to the log message to be outputted
    /// Be aware that formatters are order dependent.
    /// - Parameters:
    ///   - logDetails: Log details to be passed on to formatters.
    ///   - message: Log message to be formatted
    /// - Returns: Formatted log message, formatted by all formatters in order.
    open func applyFormatters(logDetails: LogDetails, message: String) -> String {
        formatters.reduce(message) { $1.format(logDetails: logDetails, message: $0) }
    }
    
    static func configureSentry() {
    #if RELEASE
        // We're tracking Crash Reports / Issues from the Demo App to keep improving the SDK
        SentrySDK.start { options in
            options.dsn = "https://855ff07b9c1841e38842682d5a87d7b4@o389650.ingest.sentry.io/4505447573356544"
            options.debug = true
            options.tracesSampleRate = 1.0
            options.enableAppHangTracking = true
        }
        
        LogConfig.destinationTypes = [ConsoleLogDestination.self, SentryLogDestination.self]

    #endif
    }
}
