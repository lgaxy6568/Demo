//
//  BaseViewController.swift
//  Demo
//
//  Created by 李果 on 2021/1/27.
//

import UIKit

class BaseViewController: UIViewController {
    
    private func getCurFileName() ->String{
        return "\(self.className).swift"
    }

    /**
     loadView 只有在你在代码中创建实现你的view时需要在对应UIViewController里重写该方法。
     如果你重写了loadView，你需要创建所有相关的views，并且赋值view一个非nil值。
     如果你没有重写这个方法，默认初始化方式使用view controller的nibName和nibBundle属性来试图从一个专有的nib文件加载。
     如果没有找到那个专有的那个nib文件，默认会去找一个名字与view controller相匹配的nib文件去加载。
     如果没有有效的nib文件，默认实现最后会返回一个空view，并且赋值给view。
     注意：不要[super loadView]，减少不必要的资源消耗
     */
//    override func loadView() {
//        super.loadView()
//        LogUtils.LogD("loadView(),开始加载视图",file: getCurFileName())
//    }

    //视图加载完成，但还没显示出来
    override func viewDidLoad() {
        super.viewDidLoad()
        LogUtils.LogD("viewDidLoad(),视图加载完成,hash=\(self.hashValue)",file: getCurFileName())
    }

    //在视图即将显示在屏幕上时调用
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LogUtils.LogD("viewWillAppear(),视图即将显示",file: getCurFileName())
    }

    //在视图显示在屏幕上时调用时调用
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LogUtils.LogD("viewDidAppear(),视图已显示在屏幕上",file: getCurFileName())
    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        LogUtils.LogD("viewWillLayoutSubviews(),即将布局~子View",file: getCurFileName())
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        LogUtils.LogD("viewWillLayoutSubviews(),完成布局~子View",file: getCurFileName())
//    }

    //视图即将消失、被覆盖或是隐藏时调用
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LogUtils.LogD("viewWillDisappear(),视图即将消失",file: getCurFileName())
    }

    //视图已经消失、被覆盖或是隐藏时调用
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LogUtils.LogD("viewDidDisappear(),视图已经消失",file: getCurFileName())
    }

    //当收到内存警告时调用
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        LogUtils.LogD("didReceiveMemoryWarning(),收到了内存警告",file: getCurFileName())
    }

    deinit {
        LogUtils.LogD("deinit(),对象已被回收",file: getCurFileName())
    }
    
    func startActivity(_ page:UIViewController,completion: (() -> Void)? = nil) {
        page.modalPresentationStyle = .fullScreen
        //page.modalTransitionStyle = .partialCurl
        // 进入：从下至上 | 退出：从上至下
        //self.present(page, animated: true, completion: nil) <---> dismiss() 相对应
        self.navigationController?.pushViewController(page, animated: true)
    }
    
    func closeActivity() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func hideNavigationBar(animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func showNavigationBar(animated: Bool = true) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
