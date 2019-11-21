//
//  Logger.swift
//  SwiftLogger
//
 
import Foundation

/// Enum which maps an appropiate symbol which added as prefix for each log message
///
/// - error: Log type error
/// - info: Log type info
/// - debug: Log type debug
/// - verbose: Log type verbose
/// - warning: Log type warning
/// - severe: Log type severe
enum LogEvent: String {
    case e = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}


/// Wrapping Swift.print() within DEBUG flag
///
/// - Note: *print()* might cause [security vulnerabilities](https://codifiedsecurity.com/mobile-app-security-testing-checklist-ios/)
///
/// - Parameter object: The object which is to be logged
///
func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
    Swift.print(object)
    #endif
}

public class Log {
    
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    // 2019.10.16 关闭时间显示
    public static var isShowDateEnabled:Bool {
        return false
    }
    
    // MARK: - Loging methods
    
    /// Logs error messages on console with prefix [‼️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func e( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            let dateStr  = "\(Date().toString())"
            let rawValue = "\(LogEvent.e.rawValue)"
            var printStr = ""
            if isShowDateEnabled {
                printStr = dateStr + " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }else {
                printStr = " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }
            print(printStr)
        }
    }
    
    /// Logs info messages on console with prefix [ℹ️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func i ( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            let dateStr  = "\(Date().toString())"
            let rawValue = "\(LogEvent.i.rawValue)"
            var printStr = ""
            if isShowDateEnabled {
                printStr = dateStr + " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }else {
                printStr = " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }
            print(printStr)
        }
    }
    
    /// Logs debug messages on console with prefix [💬]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func d( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            let dateStr  = "\(Date().toString())"
            let rawValue = "\(LogEvent.d.rawValue)"
            var printStr = ""
            if isShowDateEnabled {
                printStr = dateStr + " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }else {
                printStr = " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }
            print(printStr)
        }
    }
    
    /// Logs messages verbosely on console with prefix [🔬]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func v( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            let dateStr  = "\(Date().toString())"
            let rawValue = "\(LogEvent.v.rawValue)"
            var printStr = ""
            if isShowDateEnabled {
                printStr = dateStr + " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }else {
                printStr = " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }
            print(printStr)
        }
    }
    
    /// Logs warnings verbosely on console with prefix [⚠️]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func w( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            let dateStr  = "\(Date().toString())"
            let rawValue = "\(LogEvent.w.rawValue)"
            var printStr = ""
            if isShowDateEnabled {
                printStr = dateStr + " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }else {
                printStr = " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }
            print(printStr)
        }
    }
    
    /// Logs severe events on console with prefix [🔥]
    ///
    /// - Parameters:
    ///   - object: Object or message to be logged
    ///   - filename: File name from where loggin to be done
    ///   - line: Line number in file from where the logging is done
    ///   - column: Column number of the log message
    ///   - funcName: Name of the function from where the logging is done
    public class func s( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            let dateStr  = "\(Date().toString())"
            let rawValue = "\(LogEvent.s.rawValue)"
            var printStr = ""
            if isShowDateEnabled {
                printStr = dateStr + " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }else {
                printStr = " \(sourceFileName(filePath: filename)) 第\(line)行 \(funcName)\n \(rawValue) \(object) \n"
            }
            print(printStr)
        }
    }
    
    
    /// Extract the file name from the file path
    ///
    /// - Parameter filePath: Full file path in bundle
    /// - Returns: File Name with extension
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

internal extension Date {
    func toString() -> String {
        return Log.dateFormatter.string(from: self as Date)
    }
}
