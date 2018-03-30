//
//  ViewController.swift
//  TimeLine
//
//  Created by GQ-JK on 2018/3/30.
//  Copyright © 2018年 GQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let lineView1 = CustomItem(frame: CGRect(x: 10, y: 10, width: kScreenWidth - 20, height: 100), titleDatasource: ["发起申请", "审核中", "审核结果"], statusArray: ["1", "0", "2"], timeArray: ["2017.10.24", "2017.10.31", "2017.11.7"])
        self.view.addSubview(lineView1)
        
        let lineView3 = CustomItem(frame: CGRect(x: 10, y: 100*2, width: kScreenWidth - 20, height: 60), titleDatasource: ["开始", "第一期", "第二期","第三期"], statusArray: ["1","2","1", "2"], timeArray: ["2017.10.24", "2017.10.31", "2017.11.7", "2017.11.14"])
        self.view.addSubview(lineView3)
        
        let lineView2 = CustomItem(frame: CGRect(x: 10, y: 100, width: kScreenWidth - 20, height: 60), titleDatasource: ["开始", "第一期", "第二期","第三期","第四期","第五期"], statusArray: ["1", "0","1","2", "2"], timeArray: ["2017.10.24", "2017.10.31", "2017.11.7", "2017.11.14", "2017.11.21", "2017.11.28"])
        self.view.addSubview(lineView2)
        
        
        let lineView4 = CustomItem(frame: CGRect(x: 10, y: 100*3, width: kScreenWidth - 20, height: 60), titleDatasource: ["开始", "第一期", "第二期","第三期","第四期"], statusArray: ["1", "0","1","0", "2"], timeArray: ["2017.10.24", "2017.10.31", "2017.11.7", "2017.11.14", "2017.11.21"])
        self.view.addSubview(lineView4)
        
        let lineView5 = CustomItem(frame: CGRect(x: 10, y: 100*4, width: kScreenWidth - 20, height: 60), titleDatasource: ["开始", "第一期", "第二期","第三期","第四期","第五期", "第六期"], statusArray: ["1", "0","1","0", "2", "1", "2"], timeArray: ["2017.10.24", "2017.10.31", "2017.11.7", "2017.11.14", "2017.11.21", "2017.11.28", "2017.12.04"])
        self.view.addSubview(lineView5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

