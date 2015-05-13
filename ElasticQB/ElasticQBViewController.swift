//
//  ViewController.swift
//  ElasticQB
//
//  Created by Matthew Mondok on 5/12/15.
//  Copyright (c) 2015 Matthew Mondok. All rights reserved.
//

import Cocoa

class ElasticQBViewController: NSViewController {

    @IBOutlet weak var _url: NSTextField!
    override func viewDidLoad() {
        self.title = "ElasticQB"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

