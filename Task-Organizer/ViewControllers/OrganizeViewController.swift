//
//  OrganizeViewController.swift
//  Task-Organizer
//
//  Created by Henry Calderon on 1/30/24.
//

import UIKit

protocol OrganizeDelegate: AnyObject {
    func updateFilter(title: String)
}

class OrganizeViewController: UIViewController {
    
    
    let testValues = ["Daily","Weekly","Fitness","Educational","Chores"]
    
    private var organizeVM = OragnizeTaskViewModel()
    
    weak var delegate: OrganizeDelegate?
    
    let selector: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        organizeVM.filters = testValues

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveFilter))
        
        selector.dataSource = self
        selector.delegate = self
        
        setup()
    }
    
    func setup() {
        self.view.addSubview(selector)
        
        NSLayoutConstraint.activate([
            self.selector.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.selector.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.selector.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.selector.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
        return organizeVM.filters?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return organizeVM.filters?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let filterTitle = organizeVM.filters?[row] else {
            return
        }
        delegate?.updateFilter(title: filterTitle)
    }
}
