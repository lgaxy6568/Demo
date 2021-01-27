//
//  ClassUtils.swift
//  Demo
//
//  Created by 李果 on 2021/1/26.
//

import Foundation
public final class ClassUtils{
    static func getClassName(_ obj:NSObject) -> String{
        return obj.className
    }
}
extension NSObject{
    // MARK:返回className
        var className:String{
            get{
              let name =  type(of: self).description()
                if(name.contains(".")){
                    return name.components(separatedBy: ".")[1];
                }else{
                    return name;
                }

            }
        }
}
