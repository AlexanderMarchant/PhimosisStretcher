//
//  StretchesViewController.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class StretchesViewController: AdvertScreenTableViewController, Storyboarded {
    
    var stretchesPresenter: StretchesPresenterProtocol!
    var alertHandlerService: AlertHandlerServiceProtocol!
    
    let items = Bundle.main.decode([StretchInfo].self, from: "stretches.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stretches"
        
        tableView.register(UINib.init(nibName: Constants.stretchCell, bundle: nil), forCellReuseIdentifier: Constants.stretchCell)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.stretchCell, for: indexPath) as! StretchCell
        
        let stretch = items[indexPath.row]
        
        if let image = UIImage(named: stretch.image) {
            cell.stretchImage.image = image
        }
        
        cell.stretchTitle.text = stretch.title
        cell.previewText.text = stretch.stretchInfo
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStretch = items[indexPath.row]
        
        stretchesPresenter.didSelectStretch(selectedStretch)
    }

}

extension StretchesViewController: StretchesPresenterView {
    
}
