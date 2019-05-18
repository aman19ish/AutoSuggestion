//
//  AutoSuggestionViewController.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import UIKit
import MapKit

let MAP_ZOOM_AREA = 1609.344 * 3.0

class AutoSuggestionViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    var autoSuggestion: AutoSuggestion?
    var searchText: String?
    var showLocationMapModel: SuggestedLocations?
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        registerNib()
        setupView()
        getAuthenticationToken()                // I am fetching this access token alays but we can handle this by the use of expires_in key
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup View Controller
    func registerNib() {
        tableView.register(UINib(nibName: AutoSuggestionTableViewCell.className(), bundle: nil), forCellReuseIdentifier: AutoSuggestionTableViewCell.className())
    }
    
    func setNavigationBar() {
        self.navigationItem.title = "Search Location By MapMyIndia"
    }
    
    func setupView() {
        
    }
    
    // MARK: - Action methods
    
}

// MARK : - TableView DataSourse Methods
extension AutoSuggestionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ((autoSuggestion?.suggestedLocations?.count) != nil) {
            self.tableView.isHidden = false
        } else {
            self.tableView.isHidden = true
        }
        return autoSuggestion?.suggestedLocations?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AutoSuggestionTableViewCell.className(), for: indexPath) as? AutoSuggestionTableViewCell
        if (indexPath.row + 1) == self.autoSuggestion?.suggestedLocations?.count {
            cell?.sepratorView.isHidden = true
        } else {
            cell?.sepratorView.isHidden = false
        }
        cell?.configureCell(model: self.autoSuggestion?.suggestedLocations?[indexPath.row] ?? nil, indexPath: indexPath)
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Helper Methods
    func addAnnotation(withSuggestedLocation model: SuggestedLocations?) {
        if let model = model {
            let pointAnnotation = MKPointAnnotation()
            pointAnnotation.title = model.placeAddress
            pointAnnotation.coordinate = CLLocationCoordinate2DMake(model.latitude ?? 0.0, model.longitude ?? 0.0)
            
            let annotationView = MKAnnotationView.init(annotation: pointAnnotation, reuseIdentifier: nil)
            
            guard let annotation = annotationView.annotation else { return }
            mapView.addAnnotation(annotation)
            
            mapView.region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(model.latitude ?? 0.0, model.longitude ?? 0.0), latitudinalMeters: MAP_ZOOM_AREA, longitudinalMeters: MAP_ZOOM_AREA)
        }
    }
    
}

// MARK : - TableView Delegate Methods
extension AutoSuggestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = autoSuggestion?.suggestedLocations?[indexPath.row]
        self.autoSuggestion = nil
        self.addAnnotation(withSuggestedLocation: model ?? nil)
        self.tableView.reloadData()
    }
    
}


// MARK:- UISearchBar Delegate
extension AutoSuggestionViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = searchBar.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        
        self.searchText = changedText
        // Call API
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(callAutoSuggestApi), object: nil)
        self.perform(#selector(callAutoSuggestApi), with: nil, afterDelay: 0.5)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBar.text = nil
        searchText = ""
        autoSuggestion = nil
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text {
            getAutoSuggestionResult(serachKey: searchText)
        }
    }
    
    // helper functions
    @objc func callAutoSuggestApi(serachKey: String) {
        getAutoSuggestionResult(serachKey: self.searchText ?? "")
    }
    
}

// MARK: - API Calls
extension AutoSuggestionViewController {
    
    func getAuthenticationToken() {
        let params = [kGrantType: "client_credentials",
                      kAPIClientId: kAPIkeyClientId,
                      kClientSecret: kAPIKeyClientSecret]
        
        SearchManager.sharedInstance.fetchAccessToken(params: params) { (success, errorMsg, authModel) in
            if success {
                CommonUtils.setCurrentAccessToken(model: authModel)
            } else {
                DispatchQueue.main.async {
                    self.showOkAlert(messageText: errorMsg ?? kErrorMessage)
                }
            }
        }
    }
    
    func getAutoSuggestionResult(serachKey: String) {
        SearchManager.sharedInstance.fetchAutoSuggestion(url: String(format: APPURL.autoSearch, serachKey)) { (success, errorMsg, autoSuggestionModel) in
            if success {
                self.autoSuggestion = autoSuggestionModel
                self.tableView.reloadData()
            } else {
                DispatchQueue.main.async {
                    self.showOkAlert(messageText: errorMsg ?? kErrorMessage)
                }
            }
        }
    }
    
}
