//
//  AddTaskViewController.swift
//  Task-Organizer
//
//  Created by Henry Calderon on 1/30/24.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    let testValues = ["Daily","Weekly","Fitness","Educational","Chores"]
    
    let fieldStackOne: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let fieldStackTwo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let fieldStackThree: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let taskNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskDescLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Description"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let taskTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Task Type"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Task Name"
        return text
    }()
    
    let detailField: UITextView = {
        let detail = UITextView()
        detail.translatesAutoresizingMaskIntoConstraints = false
        return detail
    }()
    
    let selector: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    var saveButton: UIButton = UIButton()
    
    private var organizeVM = OragnizeTaskViewModel()
    private var viewFactory = AddTaskViewFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        organizeVM.filters = testValues
        
        saveButton = viewFactory.buildSaveButton()
        saveButton.addTarget(AddTaskViewController.self, action: #selector(saveTask), for: .touchUpInside)
        
        viewSetup()
        selector.delegate = self
        selector.dataSource = self
    }
    
    func viewSetup() {
        self.view.addSubview(stackview)
        self.view.addSubview(saveButton)
        
        fieldStackOne.addArrangedSubview(taskNameLabel)
        fieldStackOne.addArrangedSubview(titleField)
        fieldStackTwo.addArrangedSubview(taskDescLabel)
        fieldStackTwo.addArrangedSubview(detailField)
        fieldStackThree.addArrangedSubview(taskTypeLabel)
        fieldStackThree.addArrangedSubview(selector)
        stackview.addArrangedSubview(fieldStackOne)
        stackview.addArrangedSubview(fieldStackTwo)
        stackview.addArrangedSubview(fieldStackThree)
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            stackview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            stackview.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: 10),
            saveButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func saveTask() {
        //MARK: Issue with this
        self.navigationController?.popViewController(animated: true)
    }

}

//MARK: UIPicker Extension
extension AddTaskViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return organizeVM.filters?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return organizeVM.filters?[row]
    }
}
