//
//  ProfileViewController.swift
//  SurfSummerTest
//
//  Created by Лаванда on 01.08.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var person: Person?
    
    private lazy var personView = PersonView(person: person)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.Strings.profile
        view.backgroundColor = Resources.Colors.background
        self.person = Person.getMockPerson()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(personView)
    }
    
    private func setConstraints() {
        personView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            personView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            personView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
