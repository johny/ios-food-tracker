//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Jan Kraus on 23/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import XCTest

class FoodTrackerTests: XCTestCase {
  
  
  // MARK: FoodTracker Tests
  
  // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
  
  func testMealInitialization() {
   
    // Success case.
    let item = Meal(name: "New meal", photo: nil, rating: 5)
    XCTAssertNotNil(item)
    
    // Failure cases.
    let noNameItem = Meal(name: "", photo: nil, rating: 3)
    XCTAssertNil(noNameItem, "Empty name is invalid")
    
    let badRatingItem = Meal(name: "Foo", photo: nil, rating: -1)
    XCTAssertNil(badRatingItem, "Negative ratings are invalid, be positive")
    
  }
  
}
