//
//  PersonView.swift
//  SurfSummerTest
//
//  Created by Лаванда on 01.08.2023.
//

import UIKit

class PersonView: UIView {
    
    private let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60
        imageView.image = UIImage(systemName: "person.circle")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = Resources.Colors.baceText
        return label
    }()
    
    private let detailInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = Resources.Colors.additionalText
        return label
    }()
    
    private let placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame")
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.height = 16
        imageView.frame.size.width = 16
        return imageView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = Resources.Colors.additionalText
        return label
    }()
    
    private let sityPlaceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        return stackView
    }()
    
    init(person: Person?) {
        super.init(frame: .zero)
        backgroundColor = Resources.Colors.background
        setupViews()
        setConstraints()
        if let person = person {
            setupPersonData(person)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPersonData(_ person: Person) {
        self.nameLabel.text = "\(person.surname) \(person.name) \(person.patronymic ?? "")"
        
        if let photoData = person.photo {
            if let photo = UIImage(data: photoData) {
                self.photoView.image = photo
            }
        } else {
            self.photoView.image = UIImage(named: "photo")
        }
        self.detailInfoLabel.text = "\(person.position ?? "Должность не указана"), \(getExperienceText(for: person))"
        
        self.cityLabel.text = "\(person.city ?? "местоположение не указано")"
        
    }
    
    private func getExperienceText(for person: Person) -> String {
        if let experience = person.experience {
            switch experience {
            case 0 ..< 12: return "опыт более \(experience) месяцев"
            case 12..<24: return "опыт более 1-го года"
            case 24..<60: return "опыт более \(experience / 12)-х лет"
            case 60...Int.max: return "опыт более \(experience / 12)-ти лет"
            default:
                return ""
            }
        } else {
            return "опыт не указан"
        }
    }
    
    private func setupViews() {
        addSubview(photoView)
        addSubview(nameLabel)
        addSubview(detailInfoLabel)
        addSubview(sityPlaceStackView)
        sityPlaceStackView.addArrangedSubview(placeImageView)
        sityPlaceStackView.addArrangedSubview(cityLabel)
    }
    
    private func setConstraints() {
        photoView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        detailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        sityPlaceStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoView.heightAnchor.constraint(equalToConstant: 120),
            photoView.widthAnchor.constraint(equalToConstant: 120),
            photoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            photoView.topAnchor.constraint(equalTo: topAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            detailInfoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            detailInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            sityPlaceStackView.topAnchor.constraint(equalTo: detailInfoLabel.bottomAnchor),
            sityPlaceStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
     
}
