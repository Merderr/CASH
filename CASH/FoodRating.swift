//
//  FoodRating.swift
//  CASH
//
//  Created by costin popescu on 3/1/22.
//

import UIKit

class FoodRating: UIControl {
    
    let imgFilledStar = UIImage(systemName :"star.fill")?.withTintColor(UIColor.yellow)
    let imgEmptyStar = UIImage(systemName: "star.fill")?.withTintColor(UIColor.gray)
    
    var rating = 0
    var totalStars = 5
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.systemOrange.cgColor)
        //context!.setFillColor(red: 0.9, green: 0.5 , blue: 0.1, alpha: 1.0)
        context!.fill(rect)
        let availWidth = rect.size.width
        let cellWidth = availWidth / CGFloat(totalStars)
        let starSide = (cellWidth <= rect.size.height) ? cellWidth : rect.size.height
        
        for index in 0...totalStars {
            let value = cellWidth * CGFloat(index) + cellWidth/2
            
            let center = CGPoint(x: value+1, y: rect.size.height/2)
            let frame = CGRect(x: center.x-starSide/2, y: center.y - starSide/2, width: starSide, height: starSide)
            
            let highlighted = (index+1 <= self.rating)
            
            drawStar(with: frame, highlighted: highlighted)
        } // End of loop.
        
    } // End of draw()
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        guard self.isEnabled else {return false}
        
        super.beginTracking(touch, with: event)
        handle(with: touch)
        return true
    }
    
}

private extension FoodRating{
    
    func drawStar(with frame: CGRect, highlighted: Bool){
        
        let image = highlighted ? imgFilledStar : imgEmptyStar
        draw(with: image!, and: frame)
    }
    
    func draw(with image:UIImage, and frame:CGRect){
        image.draw(in: frame)
    }
    // Handle the event listener.
    func handle(with touch: UITouch){
        let cellWidth = self.bounds.size.width / CGFloat(totalStars)
        let location = touch.location(in: self)
        let value = location.x / cellWidth
        
        updateRating(with: Int(value + 1))
    }
    
    
    func updateRating(with value: Int){
        
        // Make sure the touch was made within the stars rating system.
        if(self.rating != value && value >= 0 && value <= totalStars){
            self.rating = value
            print(self.rating)
            setNeedsDisplay()
        }
    }
    
}

