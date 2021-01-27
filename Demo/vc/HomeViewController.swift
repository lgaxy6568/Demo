//
//  ViewController.swift
//  Demo
//
//  Created by 李果 on 2021/1/25.
//

import UIKit
//https://blog.csdn.net/jhx_84/article/details/95201633
class HomeViewController: BaseViewController {
    
    //必须要重写这几个方法才能和xib绑定成功
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(){
        let nibNameOrNil = "HomeViewController" //对应的HomeViewController.xib文件名称
        self.init(nibName:nibNameOrNil,bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //视图加载完成，但还没显示出来
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //在视图即将显示在屏幕上时调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //隐藏NavigationBar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func gotoLogin(sender: UIButton){
        LogUtils.LogD("gotoLogin()");
        let page  = LoginViewController.init()
        startActivity(page)
     
    }
}

