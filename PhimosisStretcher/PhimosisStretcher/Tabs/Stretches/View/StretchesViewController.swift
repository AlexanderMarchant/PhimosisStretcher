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
    
    let understandingPhimosis = Bundle.main.decode(UnderstandingPhimosis.self, from: "understandingPhimosis.json")
    let safetyMeasures = Bundle.main.decode(SafetyMeasures.self, from: "safetyMeasures.json")
    let stretches = Bundle.main.decode([StretchInfo].self, from: "stretches.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Stretches"
        
        tableView.register(UINib.init(nibName: Constants.stretchCell, bundle: nil), forCellReuseIdentifier: Constants.stretchCell)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return stretches.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Important Information"
        case 1:
            return "Stretches"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.stretchCell, for: indexPath) as! StretchCell
        
        var cellImage: UIImage!
        var cellTitle: String!
        var previewText: String!
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
            
                if let image = UIImage(named: understandingPhimosis.image) {
                    cellImage = image
                }
            
                cellTitle = understandingPhimosis.title
                previewText = understandingPhimosis.introduction
            case 1:
            
                if let image = UIImage(named: safetyMeasures.image) {
                    cellImage = image
                }
            
                cellTitle = safetyMeasures.title
                previewText = safetyMeasures.introduction
            default:
                cellTitle = "Not found"
                previewText = "Not found"
            }
        } else {
            let stretch = stretches[indexPath.row]
            
            if let image = UIImage(named: stretch.image) {
                cellImage = image
            }
            
            cellTitle = stretch.title
            previewText = stretch.stretchInfo
        }

        cell.stretchImage.image = cellImage
        cell.stretchTitle.text = cellTitle
        cell.previewText.text = previewText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                stretchesPresenter.didSelectUnderstandingPhimosis(understandingPhimosis)
            case 1:
                stretchesPresenter.didSelectSafetyMeasures(safetyMeasures)
            default:
                return
            }
        case 1:
            let selectedStretch = stretches[indexPath.row]
            
            stretchesPresenter.didSelectStretch(selectedStretch)
        default:
            return
        }
    }

}

extension StretchesViewController: StretchesPresenterView {
    
}
