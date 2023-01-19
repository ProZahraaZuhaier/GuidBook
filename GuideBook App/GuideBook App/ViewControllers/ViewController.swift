//
//  ViewController.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 03/09/2021.
//

import UIKit

class ViewController: UIViewController {
     
    // MARK:- Variables and Properties
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var mainTableView: UITableView!
    var places = [Place]()
    
    
    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
       do{
        try places = context.fetch(Place.fetchRequest())
        }
        catch{
            
        }
        mainTableView.delegate = self
        mainTableView.dataSource = self
}
    // MARK:- Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check that a row was selected
        if mainTableView.indexPathForSelectedRow == nil {
          // Nothing is selected
            return
        }
        // Get selected place
        let selectedPlace = self.places[mainTableView.indexPathForSelectedRow!.row]
        
        // Get a refrence to the place view controller
        let placeVC = segue.destination as! PlaceDetailsViewController
        
        // Set the place property
        placeVC.place = selectedPlace
    }


}



//MARK:- Main Table View Delegate Methods
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.PLACE_CELL_ID, for: indexPath) as! PlaceTableViewCell
        
        let place = self.places[indexPath.row]
        cell.setCell(place)
        
        return cell
    }
    
    
    
}

