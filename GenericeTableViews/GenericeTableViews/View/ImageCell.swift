//
//  ImageCell.swift
//  GenericeTableViews
//
//  Created by Badarinath Venkatnarayansetty on 11/21/18.
//  Copyright © 2018 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "image.png")
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()

    func setup() {
        [cellImage, titleLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            cellImage.widthAnchor.constraint(equalToConstant: 100),
            cellImage.heightAnchor.constraint(equalTo: cellImage.widthAnchor),
             cellImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: cellImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
    
}
