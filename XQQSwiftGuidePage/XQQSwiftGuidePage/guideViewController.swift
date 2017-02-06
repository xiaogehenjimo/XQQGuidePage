//
//  guideViewController.swift
//  XQQSwiftGuidePage
//
//  Created by XQQ on 2016/11/1.
//  Copyright © 2016年 UIP. All rights reserved.
//

import UIKit


protocol myDelegate {
    func jump(name:String)
}


class guideViewController: UIViewController,UIScrollViewDelegate {

    let iphoneWidth  = UIScreen.main.bounds.size.width
    let iphoneHeight = UIScreen.main.bounds.size.height
    
    /*滚动视图*/
    let backScrollView = UIScrollView()
    /**进入app按钮*/
    let enterBtn = UIButton()
    /**跳过按钮*/
    let jumpBtn = UIButton()
    /*pageControl*/
    let pageControl = UIPageControl()
    /*图片数组*/
    var imageArr = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tmpArr = NSArray.init(objects: "1","2","3")
        for index in 0...tmpArr.count - 1 {
            let photoName = String.init(format: "%ld.jpg", index)
            imageArr.add(photoName)
        }
        /**添加滚动视图*/
        self.createScrollView()
        /**添加pageControl*/
        self.createPageControl()
        /**创建跳过按钮*/
        self.createJumpBtn()
    }
    
    /**创建pageControl*/
    func createPageControl(){
        pageControl.bounds = CGRect.init(x: 0, y: 0, width: 150, height: 44)
        pageControl.center = CGPoint.init(x: iphoneWidth/2, y: iphoneHeight - 60)
        pageControl.isUserInteractionEnabled = false
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.numberOfPages = imageArr.count
        self.view.addSubview(pageControl)
    }
    
    /* 创建scrollView */
    func createScrollView() {
        backScrollView.frame = CGRect.init(x: 0, y: 0, width: iphoneWidth, height: iphoneHeight)
        backScrollView.isPagingEnabled = true
        backScrollView.showsVerticalScrollIndicator = false
        backScrollView.showsHorizontalScrollIndicator = false
        backScrollView.bounces = false
        backScrollView.contentSize = CGSize.init(width: iphoneWidth * CGFloat(imageArr.count), height: iphoneHeight)
        backScrollView.delegate = self;
        for (index,value) in imageArr.enumerated() {
            let imageView = UIImageView.init(frame: CGRect.init(x: CGFloat(index) * iphoneWidth, y: 0, width: iphoneWidth, height: iphoneHeight))
            imageView.image = UIImage (named: value as! String)
            backScrollView.addSubview(imageView)
        }
        self.view.addSubview(backScrollView)
    }
    
    
    //UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index :NSInteger = NSInteger(scrollView.contentOffset.x / iphoneWidth)
        pageControl.currentPage = index;
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.x >= CGFloat(imageArr.count - 1) * iphoneWidth) {
            //创建进入app按钮
            self.createEnterBtn()
            pageControl.removeFromSuperview()
            jumpBtn.removeFromSuperview()
        }else
        {
            if !self.view.subviews.contains(pageControl) {
                self.view.addSubview(pageControl)
            }
            if !self.view.subviews.contains(jumpBtn) {
                self.view.addSubview(jumpBtn)
            }
            enterBtn.removeFromSuperview()
        }
    }
    
    /**创建跳过按钮*/
    func createJumpBtn() {
        jumpBtn.frame = CGRect.init(x: iphoneWidth - 90, y: 30, width: 80, height: 44)
        jumpBtn.setTitle("跳过", for: UIControlState.normal)
        jumpBtn.backgroundColor = UIColor.init(red: 71/255.0, green: 159/255.0, blue: 219/255.0, alpha: 0.8)
        jumpBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        jumpBtn.addTarget(self, action: #selector(jumpBtnDidPress(button:)), for: UIControlEvents.touchUpInside)
        jumpBtn.layer.cornerRadius = 14
        jumpBtn.layer.masksToBounds = true
        jumpBtn.alpha = 0.8
        self.view.addSubview(jumpBtn)
    }
    
    
    /**跳过按钮点击了*/
    func jumpBtnDidPress(button:UIButton) {
        print("跳过点击了")
    }
    
    /**创建进入app按钮*/
    func createEnterBtn() {
        enterBtn.frame = CGRect.init(x: iphoneWidth/2 - 70, y: iphoneHeight - 10 - 44 - 20, width: 140, height: 44)
        enterBtn.backgroundColor = UIColor.init(red: 71/255.0, green: 159/255.0, blue: 219/255.0, alpha: 0.8)
        enterBtn.setTitle("进入APP", for: UIControlState.normal)
        enterBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        enterBtn.layer.cornerRadius = 14
        enterBtn.layer.masksToBounds = true
        enterBtn.addTarget(self, action:#selector(enterBtnDidPress(button:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(enterBtn)
    }
    
    
    
    /**进入APP按钮点击方法*/
    func enterBtnDidPress(button:UIButton) {
        print("进入APP")
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
