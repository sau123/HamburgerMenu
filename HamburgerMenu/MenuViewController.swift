//
//  MenuViewController.swift
//  HamburgerMenu
//
//  Created by Saumeel Gajera on 8/7/16.
//  Copyright © 2016 walmart. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    private var greenNavigationController: UIViewController!
    private var pinkNavigationController: UIViewController!
    private var blueNavigationController: UIViewController!
    
    var viewControllers: [UIViewController] = []
    
    var hamburgerViewController: HamburgerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        greenNavigationController = storyboard.instantiateViewControllerWithIdentifier("GreenNavigationController")
        blueNavigationController = storyboard.instantiateViewControllerWithIdentifier("BlueNavigationController")
        pinkNavigationController = storyboard.instantiateViewControllerWithIdentifier("PinkNavigationController")
        
        viewControllers.append(greenNavigationController)
        viewControllers.append(blueNavigationController)
        viewControllers.append(pinkNavigationController)
        
        hamburgerViewController.contentViewController = greenNavigationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        let titles = ["Green", "Blue", "Pink"]
        cell.colorLabel.text = titles[indexPath.row]
        return cell
        
        
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
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
