//
//  ViewController.swift
//  MuffinButton2
//
//  Created by Matt (Work) on 10/4/14.
//  Copyright (c) 2014 RaBallin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var muffinsLabel: UILabel!
    @IBOutlet weak var muffinNumberLabel: UILabel!
    @IBOutlet weak var muffinButton: UIButton!
    @IBOutlet weak var baconLabel: UILabel!

    @IBOutlet weak var factoryNumberLabel: UILabel!
    @IBOutlet weak var factoryButton: UIButton!
    @IBOutlet weak var baconNumberLabel: UILabel!
    @IBOutlet weak var baconButton: UIButton!
    
    
    var muffins = 0
    var bacon = 0
    var factories = 0
    var runBefore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !runBefore{
        makeInvisible(muffinsLabel)
        makeInvisible(baconLabel)
        makeInvisible(baconButton)
            NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("timedUpgrade"), userInfo: nil, repeats: true)
            runBefore=true
        }
        
    }
    

    @IBAction func addMuffin(sender: AnyObject) {
        muffins++
        makeVisible(muffinsLabel)
        updateLabels()
        if muffins>9{
            makeVisible(baconButton)
        }
        
        
    }
    
    @IBAction func addBacon(sender: AnyObject) {
        if muffins<10{
            return
        }
        bacon++
        muffins-=10
        updateLabels()
    }
    
    @IBAction func addFactory(sender: AnyObject) {
        factories++
        factoryNumberLabel.text=String(factories)
    }

    func updateLabels(){
        if muffins>0{
            muffinsLabel.enabled=1
        }
        muffinNumberLabel.text = String(muffins)
        if bacon>0{
            makeVisible(baconLabel)
            baconNumberLabel.text = String(bacon)
        }
        
    }
    
    func timedUpgrade(){
        muffins=muffins+factories
        updateLabels()
    }
    
    func makeInvisible(label: UILabel)
    {
        label.textColor = UIColor.whiteColor()
    }
    
    func makeInvisible(button: UIButton)
    {
        button.enabled=0
    }
    
    func makeVisible(label: UILabel)
    {
        label.textColor = UIColor.blackColor()
    }
    
    func makeVisible(button: UIButton)
    {
        button.enabled=1
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

