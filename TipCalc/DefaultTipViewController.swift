//
//  DefaultTipViewController.swift
//  TipCalc
//
//  Created by Simon Carroll on 7/29/16.
//  Copyright © 2016 Simon Carroll. All rights reserved.
//

import UIKit

class DefaultTipViewController: UIViewController, UIPopoverPresentationControllerDelegate {

  let DEFAULT_PERCENTAGE = "default_percentage"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func setDefault15Percent(sender: AnyObject) {
    setDefaultTipPercentage(0.15)
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func setDefault18Percent(sender: AnyObject) {
    setDefaultTipPercentage(0.18)
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func setDefault20Percent(sender: AnyObject) {
    setDefaultTipPercentage(0.20)
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func nevermind(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  func setDefaultTipPercentage(percentage: Double) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(percentage, forKey: KeyRing.DEFAULT_PERCENTAGE_KEY)
    defaults.setDouble(percentage, forKey: KeyRing.CURRENT_PERCENTAGE_KEY)
    defaults.synchronize()
  }

  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little
  // preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "settingsPopoverSegue" {
      let popoverViewController = segue.destinationViewController
      popoverViewController.modalPresentationStyle = UIModalPresentationStyle.Popover
      popoverViewController.popoverPresentationController!.delegate = self
    }
  }

  func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
    return UIModalPresentationStyle.None
  }
}
