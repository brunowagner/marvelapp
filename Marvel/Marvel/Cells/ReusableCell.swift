//
//  ReusableCell.swift
//  Marvel
//
//  Created by Thiago Lioy on 15/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit

protocol ReusableCell {
    
}

extension ReusableCell where Self: UITableViewCell {
    
    static func cellIdentifier() -> String {
        return String(describing: Self.self)
    }
    
    static func registerForTableView(_ tableView: UITableView) {
        let nib = UINib(nibName: cellIdentifier(), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier())
    }
    
    static func dequeueCell(from tableView: UITableView, at indexPath: IndexPath) -> Self {
        if let cell = tableView
            .dequeueReusableCell(withIdentifier: cellIdentifier(), for: indexPath) as? Self {
            return cell
        } else {
            return Self()
        }
    }
}
