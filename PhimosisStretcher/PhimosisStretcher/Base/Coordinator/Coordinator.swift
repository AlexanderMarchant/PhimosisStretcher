//
//  Coordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol CoordinatorProtocol: class {
    func start()
}

class Coordinator: NSObject, CoordinatorProtocol {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    func start() {
        preconditionFailure("This method needs to be overriden by a concrete subclass.")
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        } else {
            print("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
    
    func removeLastChildCoordinators() {
        if let lastCoordinator = childCoordinators.last {
            removeChildCoordinator(lastCoordinator)
        }
    }
}

