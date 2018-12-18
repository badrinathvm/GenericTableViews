//
//  TableObservations.swift
//  GenericeTableViews
//
//  Created by Badarinath Venkatnarayansetty on 12/13/18.
//  Copyright © 2018 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation

class TableObservations {
    
    typealias Observator = (_ name: String , _ object: Any) -> ()
    
    var observations = [String: [Observator]]()
    
    func addObserver(_ name: String , using block: @escaping Observator) {
        
        //check if there is any observation already added else add it to the observations.
        guard var observe = observations[name] else {
            observations[name] = [block]
            return
        }
        
        //since there is already one observer withe name, append it to the array.
        observe.append(block)
        observations[name] = observe
    }
    
    //As part of post we need to pass the closure.
    func post(name: String, using block: Any) {
        let values = observations[name]
        values?.forEach {
            $0(name, block)
        }
    }
    
    //remove respective observer by passing name.
    func removeObserver(_ name: String) {
        observations.removeValue(forKey: name)
    }
    
    deinit {
        observations.removeAll()
    }
    
}
