//
//  AutoSuggestionTableViewCell.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import UIKit

class AutoSuggestionTableViewCell: UITableViewCell {

    // MARK: - IBOutlets    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    @IBOutlet weak var sepratorView: UIView!
    
    // MARK : - Properties
    
    // MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Configure Cell
    func configureCell(model: SuggestedLocations?, indexPath: IndexPath) {
        if let place = model?.placeName, place != "" {
            self.placeNameLabel.text = place
            self.placeNameLabel.font = UIFont.systemFont(ofSize: 13.0)
        } else {
            self.placeNameLabel.text = "No Data"
            self.placeNameLabel.font = UIFont.boldSystemFont(ofSize: 13.0)
        }
        if let address = model?.placeAddress, address != "" {
            self.placeAddressLabel.text = address
            self.placeAddressLabel.font = UIFont.systemFont(ofSize: 13.0)
        } else {
            self.placeAddressLabel.text = "No Data"
            self.placeAddressLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        }
    }
    
    //MARK: - Action Methods
    
}
