//
//  ViewController.swift
//  TipCalc
//
//  Created by Simon Carroll on 7/29/16.
//  Copyright © 2016 Simon Carroll. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipAmountLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
  @IBOutlet weak var tipSelector: UISegmentedControl!

  let tipPercentages = [0.15, 0.18, 0.20]

  override func viewDidLoad() {
    super.viewDidLoad()

    billField.becomeFirstResponder();
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultPercentage = defaults.doubleForKey(KeyRing.DEFAULT_PERCENTAGE_KEY) ?? 0.0
    var index = 0

    for i in 0...(tipPercentages.count - 1) {
      if (tipPercentages[i] == defaultPercentage) {
        index = i
        break;
      }
    }

    tipSelector.selectedSegmentIndex = index
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    let defaults = NSUserDefaults.standardUserDefaults()
    let currentPercentage = defaults.doubleForKey(KeyRing.CURRENT_PERCENTAGE_KEY) ?? 0.0
    defaults.setDouble(-1.0, forKey: KeyRing.CURRENT_PERCENTAGE_KEY)

    for i in 0...(tipPercentages.count - 1) {
      if (tipPercentages[i] == currentPercentage) {
        tipSelector.selectedSegmentIndex = i
        calculate(self)
        break;
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  @IBAction func onTap(sender: AnyObject) {
    view.endEditing(true)
  }

  @IBAction func calculate(sender: AnyObject) {

    if (billField.text == "") {
      return
    }

    let bill = Double(billField.text!) ?? 0
    let tip = bill * tipPercentages[tipSelector.selectedSegmentIndex]
    let total = bill + tip

    tipAmountLabel.text = String.init(format: "$%.2f", tip)
    totalAmountLabel.text = String.init(format: "$%.2f", total)
  }
}

