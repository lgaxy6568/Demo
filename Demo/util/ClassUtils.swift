//
//  ClassUtils.swift
//  Demo
//
//  Created by 李果 on 2021/1/26.
//

import Foundation
public final class ClassUtils{
    static func getClassName(_ obj:AnyObject) -> String{
        return String(describing: obj)
    }
}
