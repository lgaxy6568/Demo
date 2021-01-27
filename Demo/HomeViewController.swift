//
//  ViewController.swift
//  Demo
//
//  Created by 李果 on 2021/1/25.
//

import UIKit
//https://blog.csdn.net/jhx_84/article/details/95201633
class HomeViewController: UIViewController {

    private var TAG:String = ""
   
    
    //必须要重写这几个方法才能和xib绑定成功
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.TAG = ClassUtils.getClassName(self)
    }
    convenience init(){
        let nibNameOrNil = "HomeViewController" //对应的HomeViewController.xib文件名称
        self.init(nibName:nibNameOrNil,bundle:nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.TAG = ClassUtils.getClassName(self)
    }
    
    override func loadView() {
        super.loadView()
        LogUtils.LogD("loadView(),开始加载视图")
    }
    
    //视图加载完成，但还没显示出来
    override func viewDidLoad() {
        super.viewDidLoad()
        LogUtils.LogD("viewDidLoad(),视图加载完成")
    }
    
    //在视图即将显示在屏幕上时调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LogUtils.LogD("viewWillAppear(),视图即将显示")
        //隐藏NavigationBar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    //在视图显示在屏幕上时调用时调用
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LogUtils.LogD("viewDidAppear(),视图已显示在屏幕上")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        LogUtils.LogD("viewWillLayoutSubviews(),即将布局~子View")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        LogUtils.LogD("viewWillLayoutSubviews(),完成布局~子View")
    }

    //视图即将消失、被覆盖或是隐藏时调用
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LogUtils.LogD("viewWillDisappear(),视图即将消失")
    }

    //视图已经消失、被覆盖或是隐藏时调用
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LogUtils.LogD("viewDidDisappear(),视图已经消失")
    }

    //当收到内存警告时调用
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        LogUtils.LogD("didReceiveMemoryWarning(),收到了内存警告")
    }

    deinit {
        LogUtils.LogD("deinit(),对象已被回收")
    }

    @IBAction func gotoLogin(sender: UIButton)
    {
        LogUtils.LogD("gotoLogin()");
        let page  = LoginViewController.init()
        page.modalPresentationStyle = .fullScreen
        //page.modalTransitionStyle = .partialCurl
        /*
         进入：从下至上
         退出：从上至下
         */
//        self.present(page, animated: true, completion: nil) <---> dismiss() 相对应
        self.navigationController?.pushViewController(page, animated: true) //popViewController() 对应
     
        
    }

}

