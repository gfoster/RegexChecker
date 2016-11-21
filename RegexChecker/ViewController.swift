//
//  ViewController.swift
//  RegexChecker
//
//  Created by Gary Foster on 11/18/16.
//  Copyright © 2016 Gary Foster. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var matchText: NSTextField!
    @IBOutlet weak var matchPattern: NSTextField!
    
    @IBOutlet weak var match0: NSTextField!
    @IBOutlet weak var match1: NSTextField!
    @IBOutlet weak var match2: NSTextField!
    @IBOutlet weak var match3: NSTextField!
    @IBOutlet weak var match4: NSTextField!
    @IBOutlet weak var match5: NSTextField!
    @IBOutlet weak var match6: NSTextField!
    @IBOutlet weak var match7: NSTextField!
    @IBOutlet weak var match8: NSTextField!
    @IBOutlet weak var match9: NSTextField!

    // outlet collections seem to only exist in IOS, not in macOSX
    
    var matchFields: [NSTextField] {
        return [match0, match1, match2, match3,
                match4, match5, match6, match7,
                match8, match9]
    }
    
    @IBOutlet var fooFields: [NSTextField]!
    
    @IBAction func testButton(_ sender: Any) {
        // triggers when the "test pattern" button is pressed
        let text = matchText.stringValue
        let pattern = matchPattern.stringValue

        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            var match = [String]()
            for result in results {
                for i in 0..<result.numberOfRanges {
                    match.append(nsString.substring( with: result.rangeAt(i) ))
                }
            }
        
            clearFields()
            
            displayResults(results: match)
            
        } catch let error as NSError {
            match0.stringValue = "invalid regex: \(error.localizedDescription)"
        }
    }

    func clearFields() {
        for counter in 0...9 {
            matchFields[counter].stringValue = ""
        }
    }
    
    func displayResults(results: [String]) {
        var counter: Int = 0
    
        for result in results {
            matchFields[counter].stringValue = result
            counter += 1
            if counter == 10 {
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

