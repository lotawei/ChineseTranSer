//
//  ViewController.swift
//  ChineseTranSer
//
//  Created by lotawei on 17/2/13.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit
import CoreFoundation

class ViewController: UIViewController {

    var    str =  ""
    @IBOutlet weak var txtinput: UITextField!
    
    @IBAction func end(_ sender: Any) {
        if sgment.selectedSegmentIndex == 0 {
            
            //带音标
            let   ss =  txtinput.text
            str = transformToPinYinshengdiao(str:ss!)
            
            
        }
        else{
           //不带音标
            let   ss =  txtinput.text
            str = transformToPinYin(str: ss!)
            
            
        }
        
        createbandanimation()
        
    }
    @IBAction func sgchange(_ sender: Any) {
        let   sgm = sender  as!  UISegmentedControl
        if str.characters.count != 0{
            if sgm.selectedSegmentIndex == 0 {
                    //带音标
                let   ss =  txtinput.text
                str = transformToPinYinshengdiao(str:ss!)
            }
            else{
                //
                let   ss =  txtinput.text
                str = transformToPinYin(str: ss!)
                
            }
            createbandanimation()
            
            
        }
        
        
        
    }
    @IBOutlet weak var sgment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var outputview: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func createbandanimation()  {
        if   str.characters.count != 0{
        
        for lay in self.view.layer.sublayers! {
            if lay.isKind(of: ZYAnimationLayer.classForCoder()) {
                lay.removeFromSuperlayer()
            }
        }
        
        ZYAnimationLayer.createAnimationLayer(with: str as String!, andRect: outputview.bounds, andView: outputview, andFont: UIFont.systemFont(ofSize: 40), andStroke: UIColor.black)
        }
    }
    
    func transformToPinYinshengdiao(str:String)->String{
        let mutableString = NSMutableString(string: str)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
  
        let string = String(mutableString)
        return string.replacingOccurrences(of: " ", with: "")
    }
  
    func transformToPinYin(str:String)->String{
        let mutableString = NSMutableString(string: str)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = String(mutableString)
        return string.replacingOccurrences(of: " ", with: "")
    }

}

