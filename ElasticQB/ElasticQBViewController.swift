//
//  ViewController.swift
//  ElasticQB
//
//  Created by Matthew Mondok on 5/12/15.
//  Copyright (c) 2015 Matthew Mondok. All rights reserved.
//

import Cocoa


class ElasticQBViewController: NSViewController {

    @IBOutlet var _resultText: NSTextView!

    @IBOutlet weak var _url: NSTextField!
    override func viewDidLoad() {
        self.title = "ElasticQB"
        _url.stringValue = "http://localhost:9200/_mappings"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func updateMappingsClicked(sender: NSButton) {
        request(.GET,  _url.stringValue)
            .responseJSON { (_, _, JSON, _) in
                self._resultText.string = self.JSONStringify(JSON!, prettyPrinted: true)
        }
    }
    
    func JSONStringify(value: AnyObject, prettyPrinted: Bool = false) -> String {
        var options = prettyPrinted ? NSJSONWritingOptions.PrettyPrinted : nil
        if NSJSONSerialization.isValidJSONObject(value) {
            if let data = NSJSONSerialization.dataWithJSONObject(value, options: options, error: nil) {
                if let string = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    return string as String
                }
            }
        }
        return ""
    }
}

