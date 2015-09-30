//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Jan Kraus on 30/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
  
    // MARK: Properties
    var meals = [Meal]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleMealsData()
    }
  
    func loadSampleMealsData() {
      
      let meal1 = Meal(name: "Vegetarian Pasta", photo: nil, rating: 5)!
      let meal2 = Meal(name: "Vegetarian Lasagne", photo: nil, rating: 5)!
      let meal3 = Meal(name: "Pizza Vegetariana", photo: nil, rating: 4)!
      
      meals += [meal1, meal2, meal3]

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        // Table view cells are reused and should be dequeued using a cell identifier
        let cellIdentifier = "MealTableViewCell"
      
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
      
        let meal = meals[indexPath.row]
      
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
      
        return cell
      
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
