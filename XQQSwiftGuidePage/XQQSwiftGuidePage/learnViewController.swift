//
//  learnViewController.swift
//  XQQSwiftGuidePage
//
//  Created by XQQ on 2016/11/7.
//  Copyright © 2016年 UIP. All rights reserved.
//

import UIKit

class learnViewController: UIViewController {
//按钮
    
    let nextBtn = UIButton()
    //按钮点击的方法
    var buttonDidPress : (_ s1:String) -> Int
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.frame = CGRect.init(x: 10, y: 100, width: 80, height: 44)
        nextBtn.setTitle("点击一下", for: UIControlState.normal)
        nextBtn.backgroundColor = UIColor.yellow
        nextBtn.addTarget(self, action: #selector(myButtonDidPress), for: UIControlEvents.touchUpInside)
        self.view.addSubview(nextBtn)
    }

    
    func myButtonDidPress() {
        //这里怎么执行这个闭包
        //buttonDidPress("123")
        
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
