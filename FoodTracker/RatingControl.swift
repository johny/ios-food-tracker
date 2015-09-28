//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Jan Kraus on 27/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import UIKit

class RatingControl: UIView {

  // MARK: Properties
  var rating = 0 {
    didSet {
      setNeedsLayout()
    }
  }
  var ratingButtons = [UIButton]()
  
  let spacing = 5
  let stars = 5
  
  // MARK: Initialization
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addButtons()
  }
  
  override func intrinsicContentSize() -> CGSize {
    let buttonSize = Int(frame.size.height)
    let width = (buttonSize + spacing) * stars
    
    return CGSize(width: width, height: buttonSize)
  }
  
  override func layoutSubviews() {
    
    let buttonSize = Int(frame.size.height)
    var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
    
    // offset
    for (i, button) in ratingButtons.enumerate() {
      buttonFrame.origin.x = CGFloat(i * (buttonSize + spacing))
      button.frame = buttonFrame
    }
    
    updateButtonSelectionStates()
    
  }
  
  
  func addButtons() {
    
    let filledStarImage = UIImage(named: "filledStar")
    let emptyStarImage = UIImage(named: "emptyStar")
    
    for _ in 0..<stars {
      
      // define button
      let button = UIButton()
      button.setImage(emptyStarImage, forState: .Normal)
      button.setImage(filledStarImage, forState: .Selected)
      button.setImage(filledStarImage, forState: [.Selected, .Highlighted])
      button.adjustsImageWhenHighlighted = false
      
      // add handler
      button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
      
      // place it to array
      ratingButtons += [button]
      
      // add as subview
      addSubview(button)
    }
    
  }
  
  // MARK: Button actions
  
  func ratingButtonTapped(button: UIButton) {
    rating = ratingButtons.indexOf(button)! + 1
  }
  
  func updateButtonSelectionStates() {
    for(i, button) in ratingButtons.enumerate() {
      button.selected = i < rating
    }
  }
  
  
}
