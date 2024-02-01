//
//  AddTaskViewController.swift
//  Task-Organizer
//
//  Created by Henry Calderon on 1/30/24.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    let fieldStackOne: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let fieldStackTwo: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackview: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
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
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.addTarget(AddTaskViewController.self, action: #selector(saveTask), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = "Save"
        button.titleLabel?.font = UIFont(name: "Ariel", size: 20)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        viewSetup()
    }
    
    func viewSetup() {
        self.view.addSubview(stackview)
        self.view.addSubview(saveButton)
        
        fieldStackOne.addArrangedSubview(taskNameLabel)
        fieldStackOne.addArrangedSubview(titleField)
        fieldStackTwo.addArrangedSubview(taskDescLabel)
        fieldStackTwo.addArrangedSubview(detailField)
        stackview.addArrangedSubview(fieldStackOne)
        stackview.addArrangedSubview(fieldStackTwo)
        stackview.addArrangedSubview(selector)
        
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
        self.navigationController?.popViewController(animated: true)
    }

}
