//
//  ViewFactory.swift
//  Task-Organizer
//
//  Created by Henry Calderon on 2/1/24.
//

import Foundation
import UIKit

//Will be used to build the view items and not cause the view controllers to be clogged with UI items
public class ViewFactory {
    init() {
        
    }
}

public class AddTaskViewFactory: ViewFactory {
    
    func buildSaveButton() -> UIButton {
        let saveButton: UIButton = {
            let button = UIButton()
//            button.addTarget(AddTaskViewController.self, action: #selector(saveTask), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.text = "Save"
            button.titleLabel?.font = UIFont(name: "Ariel", size: 20)
            button.backgroundColor = .systemGreen
            button.layer.cornerRadius = 5
            button.setTitle("Save", for: .normal)
            button.setTitleColor(.white, for: .normal)
            return button
        }()
        return saveButton
    }
}
