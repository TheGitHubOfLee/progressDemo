//
//  CustomItem.swift
//  TimeLine
//
//  Created by GQ-JK on 2018/3/30.
//  Copyright © 2018年 GQ. All rights reserved.
//

import UIKit

class CustomItem: UIView {
    var statusArr:NSMutableArray!
    
    init(frame: CGRect, titleDatasource:NSMutableArray, statusArray:NSMutableArray, timeArray:NSMutableArray) {
        super.init(frame: frame)
        self.backgroundColor = WhiteColor
        let itemCount = statusArray.count
        statusArr = NSMutableArray(array: statusArray)
        setSubview(count: itemCount,titleDatasource: titleDatasource, statusArray: statusArray,timeArray:timeArray)
    }
    
    func setSubview(count:Int, titleDatasource:NSMutableArray, statusArray:NSMutableArray, timeArray:NSMutableArray) {
        let itemWidth = (kScreenWidth - 40)/CGFloat(count)
        let itemHeigth = 0.203 * kScreenHeight - 30.0
        
        for i in 0...(count - 1) {
            let itemBackView = UIView(frame: CGRect(x: 10 + itemWidth * CGFloat(i), y: 0, width: itemWidth, height: itemHeigth))
            self.addSubview(itemBackView)
            
            let topLabel = Configuration.creatCustomLabel(title: titleDatasource[i] as! String, backGroundColor: ClearColor, titleColor: BlackColor, isBorder: false, iscornerRadius: false, font: UIFont.systemFont(ofSize: 10), view: itemBackView, textAlignment: .center)
            topLabel.snp.makeConstraints({ (make) in
                make.left.top.right.equalTo(itemBackView)
                make.height.equalTo(itemHeigth/3)
            })
            
            let statusImage = UIImageView()
            itemBackView.addSubview(statusImage)
            statusImage.snp.makeConstraints({ (make) in
                make.center.equalTo(itemBackView)
                make.height.width.equalTo(itemHeigth/3)
            })
            
            let bottomLabel = Configuration.creatCustomLabel(title: timeArray[i] as! String, backGroundColor: ClearColor, titleColor: BlackColor, isBorder: false, iscornerRadius: false, font: UIFont.systemFont(ofSize: 10), view: itemBackView, textAlignment: .center)
            bottomLabel.snp.makeConstraints({ (make) in
                make.left.bottom.right.equalTo(itemBackView)
                make.height.equalTo(itemHeigth/3)
            })


            
            switch statusArray[i] as! String {
            case "2":
                statusImage.image = UIImage(named:"等待")

                break
            case "0":
                statusImage.image = UIImage(named:"错误")
                break
                
            default:
                statusImage.image = UIImage(named:"完成")

                break
            }
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        let count = statusArr.count
        let itemWidth = (kScreenWidth - 40)/CGFloat(count)
        let itemHeigth = 0.203 * kScreenHeight - 30.0
        
        for i in 0...(count - 2) {
            
            let context: CGContext = UIGraphicsGetCurrentContext()!
            let arr:[CGFloat] = [0.5,6]
            context.setLineDash(phase: 0, lengths: arr)
            //画虚线,可参考http://blog.csdn.net/zhangao0086/article/details/7234859
            context.setLineCap(CGLineCap.round)
            //设置笔触宽度
            context.setLineWidth(2)
            if isDevice8{
                //开始画线, x，y 为开始点的坐标
                context.move(to: CGPoint(x: 12 + itemWidth * CGFloat(i + 1) - (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
                //画直线, x，y 为线条结束点的坐标
                context.addLine(to: CGPoint(x: 9 + itemWidth * CGFloat(i + 1) + (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
            }else if isDevice8P{
                
                //开始画线, x，y 为开始点的坐标
                context.move(to: CGPoint(x: 14 + itemWidth * CGFloat(i + 1) - (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
                //画直线, x，y 为线条结束点的坐标
                context.addLine(to: CGPoint(x: 9 + itemWidth * CGFloat(i + 1) + (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
            }else if isDeviceX{
                //开始画线, x，y 为开始点的坐标
                context.move(to: CGPoint(x: 14 + itemWidth * CGFloat(i + 1) - (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
                //画直线, x，y 为线条结束点的坐标
                context.addLine(to: CGPoint(x: 9 + itemWidth * CGFloat(i + 1) + (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
            }else{
                //开始画线, x，y 为开始点的坐标
                context.move(to: CGPoint(x: 12.5 + itemWidth * CGFloat(i + 1) - (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
                //画直线, x，y 为线条结束点的坐标
                context.addLine(to: CGPoint(x: 9 + itemWidth * CGFloat(i + 1) + (itemWidth/2 - itemHeigth/6), y: itemHeigth/2))
            }
            
            
            switch statusArr[i + 1] as! String{
            case "0":
                //线条颜色
                context.setStrokeColor(RedColor.cgColor)
                break
            case "1":
                //线条颜色
                context.setStrokeColor(DefultColor.cgColor)
                break
            default:
                //线条颜色
                context.setStrokeColor(GrayColor.cgColor)
                break
                
            }
            
            //开始画线
            context.strokePath()
        }
       

    }
 

}
