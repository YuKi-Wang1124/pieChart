//
//  ViewController.swift
//  pieChart
//
//  Created by 王昱淇 on 2021/8/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPieChart()
        addRainbowRing()
        
    }
    
   
    
    func addRainbowRing() {
        
        let aDegree = CGFloat.pi/180
        let lineWidth: CGFloat = 15
        let radius: CGFloat = 60
        let startAngle: CGFloat = 120
        let endAngle: CGFloat = 60
        let centerPoint: CGPoint = CGPoint(x: radius + 2 * lineWidth, y: radius + 3 * lineWidth)
      
        let ringPath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: aDegree * startAngle, endAngle: aDegree * endAngle, clockwise: true)
        
        let ringLayer = CAShapeLayer()
        ringLayer.fillColor = UIColor.clear.cgColor
        ringLayer.lineWidth = lineWidth
        ringLayer.lineCap = .round
        ringLayer.path = ringPath.cgPath
        ringLayer.strokeColor = UIColor.black.cgColor
   
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: radius*1.5,height: radius*3 )
        gradientLayer.colors = [
            CGColor(red: 48/255, green: 134/255, blue: 217/255, alpha: 1),
            CGColor(red: 48/255, green: 134/255, blue: 217/255, alpha: 1),
            CGColor(red: 108/255, green: 133/255, blue: 150/255, alpha: 1)]
        gradientLayer.startPoint = CGPoint(x: 0 ,y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        let gradientLayer1 = CAGradientLayer()
        gradientLayer1.frame = CGRect(x: radius*1.5, y: 0, width: radius*1.5,height: radius*3 )
        gradientLayer1.colors = [
            CGColor(red: 48/255, green: 134/255, blue: 217/255, alpha: 1),
            CGColor(red: 48/255, green: 134/255, blue: 217/255, alpha: 1),
            CGColor(red: 48/255, green: 134/255, blue: 217/255, alpha: 1),
            CGColor(red: 120/255, green: 200/255, blue: 105/255, alpha: 1),
            CGColor(red: 250/255, green: 149/255, blue: 56/255, alpha: 1),
            CGColor(red: 236/255, green: 60/255, blue: 60/255, alpha: 1),
            CGColor(red: 236/255, green: 60/255, blue: 60/255, alpha: 1)]
        gradientLayer.startPoint = CGPoint(x: 0 ,y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        let mainLayer = CALayer()
        mainLayer.frame = CGRect(x: 30, y: 400, width: radius*3, height: radius*3)
       
        mainLayer.addSublayer(gradientLayer)
        mainLayer.addSublayer(gradientLayer1)
        mainLayer.addSublayer(ringLayer)
        mainLayer.mask = ringLayer
    
        view.layer.addSublayer(mainLayer)
    }
    
    
    func addPieChart() {
        let aDegree = CGFloat.pi/180
        let radius: CGFloat = 100
        var startAngle: CGFloat = 270
        let center = CGPoint(x:30 +  radius, y: 100 + radius)
        var percentages: [CGFloat] = [ 22, 20, 11, 20, 27]
        
        for percentage in percentages {
            let endAngle = startAngle + 360 * percentage/100
            
            let percentagePath = UIBezierPath()
            percentagePath.move(to: center)
            percentagePath.addArc(withCenter: center, radius: radius, startAngle: aDegree * startAngle, endAngle: aDegree * endAngle, clockwise: true)
            
            let percentageLayer = CAShapeLayer()
            percentageLayer.path = percentagePath.cgPath
            percentageLayer.fillColor = CGColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 0.6)
            view.layer.addSublayer(percentageLayer)
            
            let textCenterDegree = startAngle + (360 * percentage/100) * 1/2
            let textPath = UIBezierPath(arcCenter: center, radius: radius * 0.6, startAngle: aDegree * textCenterDegree, endAngle: aDegree * textCenterDegree, clockwise: true)
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
            label.text = "\(percentage)%"
            label.sizeToFit()
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 14)
            label.backgroundColor = UIColor.white
            label.center = textPath.currentPoint
            view.addSubview(label)
            
            startAngle = endAngle
            
        }
        
    }
}

