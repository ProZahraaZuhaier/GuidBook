//
//  InfoViewController.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 03/09/2021.
//

import UIKit

class InfoViewController: UIViewController {
   
    // MARK:- Variables and Properties
    @IBOutlet weak var summaryLabel: UILabel!
    var place:Place?
    
    
    
    // MARK:- ViewControllers LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        summaryLabel.text = place?.summary
    }
    
    
    // MARK:- Methods



}
