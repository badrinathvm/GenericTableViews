//
//  ViewController.swift
//  GenericeTableViews
//
//  Created by Badarinath Venkatnarayansetty on 11/21/18.
//  Copyright © 2018 Badarinath Venkatnarayansetty. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        //here contruct the Model
        let model = [
            CellTypes.text(Text(mainTitle: "First Main Title", subtitle: "First SubTitle")),
            CellTypes.image(Image(title: "First Image")),
            CellTypes.text(Text(mainTitle: "Second Main Title", subtitle: "Second SubTitle")),
            CellTypes.image(Image(title: "Second Image"))
        ]
        
        let tableViewController = TableViewController(items: model, cellDescriptor: {$0.detectCellType})
        add(tableViewController)
    }

}

struct Text {
    var mainTitle:String
    var subtitle:String
}

struct Image{
    var title:String
}

extension Text {
    func configureCell(_ cell: TextCell) {
        cell.titleLabel.text = mainTitle
        cell.subtitleLabel.text = subtitle
    }
}

extension Image {
    func configureCell(_ cell: ImageCell) {
        cell.titleLabel.text = title
    }
}

//Create a enum for different types of Cells.
enum CellTypes {
   case text(Text)
   case image(Image)
}

//write an extension and return the correct cellDescriptior having reuseidentifier and configure the cell.
extension CellTypes {
    var detectCellType:CellDescriptor {
        switch self {
        case .text(let model):
            return CellDescriptor(reuseIdentifier: "textCell", configure: { (cell: TextCell) in
                cell.titleLabel.text = model.mainTitle
                cell.subtitleLabel.text = model.subtitle
            })
        case .image(let model):
             return CellDescriptor(reuseIdentifier: "imageCell", configure: model.configureCell)
        }
    }
}
