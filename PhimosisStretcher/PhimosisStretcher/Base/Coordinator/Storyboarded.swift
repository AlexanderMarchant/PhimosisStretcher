//
//  Storyboarded.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboard: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard: String = "Main") -> Self {
        let storyboardIdentifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError()
        }
        
        return viewController
    }
}
