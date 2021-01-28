//
//  ExtUIView.swift
//  Demo
//
//  Created by 李果 on 2021/1/28.
//

import Foundation
import UIKit
extension UIView{
    func addOnClickListener(target:AnyObject,action:Selector)  {
        let gr = UITapGestureRecognizer(target: target, action: action)
        gr.numberOfTapsRequired = 1 //轻点次数
        gr.numberOfTouchesRequired = 1  //手指个数
        self.isUserInteractionEnabled = true //用户交互状态打开
        self.addGestureRecognizer(gr)
    }
}
