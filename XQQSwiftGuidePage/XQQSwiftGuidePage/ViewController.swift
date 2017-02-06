//
//  ViewController.swift
//  XQQSwiftGuidePage
//
//  Created by XQQ on 2016/11/1.
//  Copyright © 2016年 UIP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    
    
    
    
    
    
    
    
    func stepName(input:String) -> String {
        return input + "你好"
    }
    
    func stepAge(input:Int) -> Int {
        return input + 8
    }
    
    
    
    
//    func choseNameOrAge(juge: Bool) -> (String,Int) -> (String) -> Int{
//    
//        return juge ? stepName : stepName
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let faulesFun = self.choseNameOrAge(juge: false)
        
        
    
        
        
        
        
        
        
        //返回一个函数
        let returnNumber = self.chooseStepFunction(backwards: true)
        
        
        
        
        
       // print("函数的返回值是:\(returnNumber)")
        
        
        
        //print(self.sumNumber(num1: 5, num2: 6))
        
//        var tmpResult = (name: "小红", age: 12, score: 22.3)
//        
//        
//        tmpResult = self.classNameToAge(name:tmpResult.name, age: tmpResult.age, score: tmpResult.score)
//        
//        print(tmpResult)
        
        
        //var sum : Int! = result.age
        
        
//        let name = "xiaohong"
//        let age = 18
        
       
        
        //let tmp = "\(name)\(age)"
        
        
        
        //let message = name + age
        
        
        
        
        
       // print(message)
        
        
       
        
        
        
        let tmpStr = "1"
        
        if tmpStr.isEmpty {
            print("空的")
        }
        
        
        
        //数组
        let  tmpArr : [Any] = ["1" as AnyObject,"2" as AnyObject,"3","1",["1"]]
        
        
        
        
        
        for (index,value) in tmpArr.enumerated() {
            //print("序号是:\(index)值是\(value)")
        }
        
        
        
        //print("数组的个数是\(tmpArr.count)个")
        
        
        
        
        //字典
        let tmpDict :Dictionary<String,Any> = ["hehe":["23",["33"]],"wode":22]
        
        //遍历字典
        for (keyName ,valueName) in tmpDict {
            //print("key is \(keyName) value is \(valueName)")
        }
        
        
        for keyName in tmpDict.values {
            //print("所有的key是:\(keyName)")
        }
        
        let dictArr = Array(tmpDict.values)
    
       // print("所有的值:\(dictArr)")
        
       
        
        
        
        switch dictArr.count {
        case 1:
            print("")
        case 2:
            print("")
        case 3:
           print("")
        default:
           print("")
        }
        
        
        
        
        
        
        
        
        //选择分支
        
//        let point = (2,0)
//        
//        switch point {
//            
//        case (let x , 0):
//          //print("1 x is \(x) ")
//            
//        case (0 , let y ):
//           // print("2 x is \(y) ")
//            
//        case let (x , y):
//           // print("3 x is \(x) y is \(y)")
//            
//        default:
//           print("end")
//        }
        
        
    
        
        
        
        var anotherThreeDoubles : [Any] = ["1","2",23,["12"]]
        
        anotherThreeDoubles.append("xuqinqiang")
        anotherThreeDoubles.append(["12","34"])
        
        
        //print("新建立的数组是:\(anotherThreeDoubles)")
        
        
        
        
        
        
    
        
        self.addOldNameWithNewName(oldName: "12", newName: "22")
        
        
    }

    
    
    func addOldNameWithNewName(oldName:String,newName:String) -> String {
        return "12"
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    
    func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
        return backwards ? stepBackward : stepForward
    }
    
    
    func classNameToAge(name:String,age:NSInteger,score:Double) -> (name:String,age:NSInteger,score:Double) {
        
        
        //let resultFun = self.chooseStepFunction(backwards: true)
        
        
       
        
        
        
        
        
        
        
        var name1 = "小学生"
        name1 = "中学生"
        
        let oldAge = age + 13
        
        return (name1,oldAge,88.9)
    }
    
    
    
    
    
    
    
    
    func sumNumber(num1:NSInteger,num2:NSInteger) -> NSInteger {
        return num1 + num2
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

