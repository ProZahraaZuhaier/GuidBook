//
//  NotesViewController.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 03/09/2021.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {
    
    // MARK:- Variables and Properties
    var place : Place?
    
    @IBOutlet weak var tableView: UITableView!
    private let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchedNotesRC : NSFetchedResultsController<Note>?
    
    
    
    // MARK:- ViewController LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
      
    }
    

    // MARK:- Methods
   
    override func viewWillAppear(_ animated: Bool) {
        refresh()
   }
    
    
    
    func refresh(){
        // Check if there is a plase set
        if let place = place {
        
        // Get a fetch request for places
            let request: NSFetchRequest<Note> = Note.fetchRequest()
            request.predicate = NSPredicate(format: "place = %@", place)
            
        // Set a sort descrriptor
        let sort = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [sort]
        
       do{
                
                // Create a fetched results controller
                     fetchedNotesRC = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
                
                // Execute the fetch
                    try fetchedNotesRC!.performFetch()
            }
            catch{}
            
            tableView.reloadData()
 
        
        }
    }
        
        
    
    
    @IBAction func addNotesBtnTapped(_ sender: UIButton) {
        
        let addNoteVC = storyboard?.instantiateViewController(identifier: Constants.ADDNOTES_VC) as! AddNotesViewController
        
        // Set self as delegate
        addNoteVC.delegate = self
        addNoteVC.place = place
        
        addNoteVC.modalPresentationStyle = .overCurrentContext
        
        present(addNoteVC, animated: true, completion: nil)
    }
    
}
extension NotesViewController : AddNoteDeleate{
    func noteAdded() {
        refresh()
    }
}
//MARK:- Table View Delegate Methoods
extension NotesViewController : UITableViewDelegate , UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedNotesRC?.fetchedObjects?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NOTE_CELL, for: indexPath)
        
        // Get refrences to the labels
        let dateLabel = cell.viewWithTag(1) as! UILabel
        let noteLabel = cell.viewWithTag(2) as! UILabel
        
        // Get the note for this indexpath
       let note =  fetchedNotesRC?.object(at: indexPath)
        
        if let note = note {
            
            let df = DateFormatter()
            df.dateFormat = "MMM d, yyyy - h:mm a"
            
            dateLabel.text = df.string(from: note.date!)
            noteLabel.text = note.text
            
        }
        
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
      let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            
        if self.fetchedNotesRC == nil{
            return
        }
            // Get a refrence to the note to be deleted
        let note = self.fetchedNotesRC?.object(at: indexPath)
            
            // Pass it to the core data context delete method
        self.context.delete(note!)
        
        // save the context
        self.appDelegate.saveContext()
        
        // Refresh results
        self.refresh()
        
        }
        
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

}
