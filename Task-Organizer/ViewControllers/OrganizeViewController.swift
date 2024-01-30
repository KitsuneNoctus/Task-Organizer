//
//  OrganizeViewController.swift
//  Task-Organizer
//
//  Created by Henry Calderon on 1/30/24.
//

import UIKit

class OrganizeViewController: UIViewController {
    
    let selector: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let testValues = ["Daily","Weekly","Fitness","Educational","Chores"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveFilter))
    }
    
    @objc func saveFilter() {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension OrganizeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return testValues.count
    }
    
    
}
