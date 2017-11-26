//
//  SubmissionViewController.swift
//  SimpleTwoWayBinding_Example
//
//  Created by Manish Katoch on 11/26/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class SubmissionViewController: UIViewController {
    
    var submissionString: String = "--"
    
    @IBOutlet weak var submissionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "View Your Submission"
        self.navigationItem.backBarButtonItem?.title = "BACK"
        submissionTextView.text = submissionString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
