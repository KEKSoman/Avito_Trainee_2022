//
//  TableViewCell.swift
//  Avito_Trainee_2022
//
//  Created by Евгений колесников on 07.04.2024.
//

import Foundation
import UIKit


class TableviewCell: UITableViewCell {
    
    let stack = UIStackView()
    let name = UILabel()
    let phoneNumber = UILabel()
    let skills = UILabel()
    var model: Employees?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(phoneNumber)
        stack.addArrangedSubview(skills)
        setConstraints()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setUI() {
        [name, phoneNumber, skills].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            item.textAlignment = .left
            item.textColor = .black
            item.font = .systemFont(ofSize: 14)
        }
        stack.axis = .vertical
        stack.spacing = 10
        
//        name.text = "Name: \(model?.name ?? "Default name")"
//        phoneNumber.text = "Phone number: \(model?.phone_number ?? "000-000-000")"
//        skills.text = "Skills: "
//        model?.skills.forEach({ skill in
//            skills.text! += skill
//        })
    }
}

