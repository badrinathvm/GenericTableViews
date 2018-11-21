//
//  TableViewController.swift
//  GenericeTableViews
//
//  Created by Badarinath Venkatnarayansetty on 11/21/18.
//  Copyright © 2018 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import UIKit

class TableViewController<Items>: UITableViewController {
    
    typealias Handler = (Items) -> CellDescriptor
    var items:[Items]
    var reuseIdentifiers:Set<String> = []
    var cellDescriptor:Handler
    
    init(items: [Items], cellDescriptor: @escaping Handler) {
        self.cellDescriptor = cellDescriptor
        self.items = items
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let descriptor = cellDescriptor(item)
        
        if !reuseIdentifiers.contains(descriptor.reuseIdentifier) {
            tableView.register(descriptor.cellClass, forCellReuseIdentifier: descriptor.reuseIdentifier)
            reuseIdentifiers.insert(descriptor.reuseIdentifier)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: descriptor.reuseIdentifier, for: indexPath)
         descriptor.configure(cell)
        return cell
    }
    
    override func viewDidLoad() {
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}


//1. Which type of cell Class

struct CellDescriptor {
    typealias Handler = (UITableViewCell) -> ()
    let cellClass:UITableViewCell.Type
    let reuseIdentifier:String
    let configure:Handler
    
    init<Cell:UITableViewCell>(reuseIdentifier: String, configure: @escaping (Cell) -> () ) {
        self.cellClass = Cell.self
        self.reuseIdentifier = reuseIdentifier
        
        //since we dont the type of cell , we have to make use of type erasure.
        self.configure = { cell in
            configure(cell as! Cell)
        }
    }
}
