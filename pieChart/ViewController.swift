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
        addRing()
        
    }
    
    
    func addRing() {
        
      
        
        let aDegree = CGFloat.pi/180
        let lineWidth: CGFloat = 20
        let radius: CGFloat = 80
        let startAngle: CGFloat = 120
        let endAngle: CGFloat = 60
        let centerPoint: CGPoint = CGPoint(x: lineWidth + radius - 10, y: lineWidth + radius - 10)
      
        let ringPath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: aDegree * startAngle, endAngle: aDegree * endAngle, clockwise: true)
        
        let ringLayer = CAShapeLayer()
        ringLayer.fillColor = UIColor.clear.cgColor
        ringLayer.lineWidth = lineWidth
        ringLayer.lineCap = .round
        ringLayer.path = ringPath.cgPath
        ringLayer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(ringLayer)
   
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 50, y: 400, width: radius * 3,height: radius * 3)
        gradientLayer.colors = [UIColor.blue.cgColor,
                                UIColor.cyan.cgColor,
                                UIColor.yellow.cgColor,
                                UIColor.orange.cgColor,
                                UIColor.red.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
      
        
        view.layer.addSublayer(gradientLayer)

        gradientLayer.mask = ringLayer
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
            let textPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: aDegree * textCenterDegree, endAngle: aDegree * textCenterDegree, clockwise: true)
            
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

