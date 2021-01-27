//
//  ThreadUtils.swift
//  Demo
//
//  Created by 李果 on 2021/1/27.
//

import Foundation
public final class ThreadUtils{
    public static func isMainThread() -> Bool {
        return Thread.isMainThread;
    }
}
