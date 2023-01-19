//
//  PlaceTableViewCell.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 04/09/2021.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        shadowView.layer.cornerRadius = 5
        cardView.layer.cornerRadius = 5
        shadowView.layer.shadowColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)
        shadowView.layer.shadowOpacity = 1
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    func setCell(_ p : Place) {
        
        // Set the Image
        if p.imageName != nil
        { self.placeImageView.image = UIImage(named: p.imageName!)
        }
        else{
            print("can't find images!")
        }
        
        // Set the name
        self.placeNameLabel.text = p.name
    }
}
