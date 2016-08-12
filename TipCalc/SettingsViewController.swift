//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Simon Carroll on 7/29/16.
//  Copyright © 2016 Simon Carroll. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
  @IBAction func clickDefaultTipButton(sender: AnyObject) {
    let alertController = UIAlertController(
      title: "Set Default Tip", message: nil, preferredStyle: .ActionSheet)

    alertController.addAction(
      UIAlertAction(title: "Cancel", style: .Cancel) { (action) in })

    let setTip15Percent = UIAlertAction(title: "15%", style: .Default) { (action) in
      self.setDefaultTipPercentage(0.15)
    }
    alertController.addAction(setTip15Percent)

    let setTip18Percent = UIAlertAction(title: "18%", style: .Default) { (action) in
      self.setDefaultTipPercentage(0.18)
    }
    alertController.addAction(setTip18Percent)

    let setTip20Percent = UIAlertAction(title: "20%", style: .Default) { (action) in
      self.setDefaultTipPercentage(0.20)
    }
    alertController.addAction(setTip20Percent)

    self.presentViewController(alertController, animated: true) {
    }
  }

  func setDefaultTipPercentage(percentage: Double) {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setDouble(percentage, forKey: KeyRing.DEFAULT_PERCENTAGE_KEY)
    defaults.setDouble(percentage, forKey: KeyRing.CURRENT_PERCENTAGE_KEY)
    defaults.synchronize()
  }
}
