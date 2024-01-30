//
//  ViewController.swift
//  Task-Organizer
//
//  Created by Henry Calderon on 1/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    let taskTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "[Task Titles]"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(filterTasks))
        customizeViews()
        setupViews()
    }
    
    func customizeViews() {
        
    }
    
    func setupViews() {
        self.view.addSubview(taskTitleLabel)
        NSLayoutConstraint.activate([
            taskTitleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            taskTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskTitleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func addTask() {
        
    }
    
    @objc func filterTasks() {
        let vc = OrganizeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }


}

