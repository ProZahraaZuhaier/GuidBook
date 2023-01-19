//
//  AddNotesViewController.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 05/09/2021.
//

import UIKit

protocol AddNoteDeleate {
    func noteAdded()
}

class AddNotesViewController: UIViewController {
    
    
    //MARK:- Set Variables & Properties
    
    private let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var textView: UITextView!
    var place:Place?
    var delegate:AddNoteDeleate?
    
    //MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cardView.layer.cornerRadius = 5
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = .zero
        cardView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
    
    }
    

     //MARK:- Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
        // create a new note
        let note = Note(context: context)
        
        // Configure the properties
        note.date = Date()
        note.text = textView.text
        note.place = place
        
        // save the core data conntext
        appDelegate.saveContext()
        delegate?.noteAdded()
        
        // dissmiss view after save it
        dismiss(animated: true, completion: nil)
        
    }
}
