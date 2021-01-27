//
//  LogUtils.swift
//  Demo
//
//  Created by 李果 on 2021/1/26.
//

import Foundation
public final class LogUtils{
    //封装的日志输出功能（T表示不指定日志信息参数类型）
    public static func LogD <T>(_ message: T , file: String  = #file, function: String  = #function,line: Int  = #line) {
         #if DEBUG
             //获取文件名
             let  fileName = (file  as  NSString).lastPathComponent
             //打印日志内容
             //print ( "\(fileName):\(line) \(function) | \(message)" )
             print ( "[\(fileName):\(line)] | \(message)" )
         #endif
    }
}
