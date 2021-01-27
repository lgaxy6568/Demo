//
//  LaunchScreenViewController.swift
//  Demo
//
//  Created by 李果 on 2021/1/26.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    @IBOutlet weak var uiLabelView: UILabel!
    
    var limitTime = 3
    @IBOutlet weak var qqq: UILabel!
    
    var scheduleTimer:DispatchSourceTimer? = nil
    
    deinit {
        let tag = ClassUtils.getClassName(self)
        LogUtils.LogD("\(tag)已销毁~")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        startCountDownTimer(time: limitTime)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
//            self?.gotoHome()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func gotoHome()
    {
        LogUtils.LogD("gotoMain()");
        let page  = HomeViewController.init()
        page.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(page, animated: true)
    }
    
    
    private func startCountDownTimer(time:Int) {
        scheduleTimer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
        scheduleTimer?.schedule(deadline: .now(),repeating: .seconds(1))
        scheduleTimer?.setEventHandler(handler: {
            DispatchQueue.main.async { [weak self] in
                self?.updateLabelText()
            }
        })
        if(!scheduleTimer!.isCancelled){
            scheduleTimer?.resume()
        }
    }
    
    private func updateLabelText(){             
        LogUtils.LogD("updateLabelText(),\(limitTime)")
        self.uiLabelView.text = "\(limitTime)秒"
        self.limitTime -= 1
        if(self.limitTime <= 0){
            scheduleTimer?.cancel()
            self.gotoHome()
        }
    }

}
