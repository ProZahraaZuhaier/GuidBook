//
//  PlaceDetailsViewController.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 03/09/2021.
//

import UIKit

class PlaceDetailsViewController: UIViewController {
    
    // MARK:- Set Variables and Properties
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    lazy var infoViewController:InfoViewController = {
        let infoVC = self.storyboard?.instantiateViewController(identifier: Constants.INFO_VIEWCONTROLLER) as! InfoViewController
        return infoVC
    }()
    
    lazy var mapViewController:MapViewController = {
        let mapVC = self.storyboard?.instantiateViewController(identifier: Constants.MAP_VIEWCONTROLLER) as! MapViewController
        return mapVC
    }()
    
    lazy var notesViewController:NotesViewController = {
        let notesVC = self.storyboard?.instantiateViewController(identifier: Constants.NOTES_VIEWCONTROLLER) as! NotesViewController
        return notesVC
    }()
    
    var place:Place?
    
    
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:- Methods
    override func viewWillAppear(_ animated: Bool) {
        // Set the Image
        if place?.imageName != nil {
            placeImage.image = UIImage(named: place!.imageName!)
            
        }
        
        // Set the name
        placeName.text = place?.name
        
        segmentChanged(self.segmentedControl)
    }
    
    func switchChildViewControllers(_ childVC : UIViewController) {
        
        // Add it as a child view controller of this one
        addChild(childVC)
        
        // Add it's view as a subview of container view
        containerView.addSubview(childVC.view)
        
        // Set it's frame and sizing
        childVC.view.frame = containerView.bounds
        childVC.view.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        
        // Indicate that it's now a child view controller
        childVC.didMove(toParent: self)
    }
    
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        
        case 0:
            infoViewController.place = self.place
            switchChildViewControllers(infoViewController)
            
        case 1:
            mapViewController.place = self.place
            switchChildViewControllers(mapViewController)
            
        case 2:
            notesViewController.place = self.place
            switchChildViewControllers(notesViewController)
            
        default:
            infoViewController.place = self.place
            switchChildViewControllers(infoViewController)
        }
    }
    
    
    
}
