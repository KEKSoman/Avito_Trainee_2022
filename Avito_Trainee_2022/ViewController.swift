//
//  ViewController.swift
//  Avito_Trainee_2022
//
//  Created by Евгений колесников on 06.04.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    let tableview = UITableView()
    var model: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        setConstraints()
        setUI()
        getData()
        
    }
    
    private func getData() {
        Task {
            do {
                let response = try await Network.shared.fetchData()
                model = response
                tableview.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
        tableview.reloadData()
    }
    
    private func setConstraints() {
        tableview.frame = view.frame
    }
    
    private func setUI() {
        tableview.backgroundColor = .green
        tableview.register(TableviewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.showsVerticalScrollIndicator = false
        tableview.separatorColor = .red
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 44.3333
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.company.employees.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model?.company.name ?? "No company name"
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TableviewCell else { return }
        let employee = model?.company.employees[indexPath.row]
//        cell.model = model?.company.employees[indexPath.row]
        cell.phoneNumber.text = "Phone number: \(employee?.phone_number ?? "")"
        cell.name.text = "Name: \(employee?.name ?? "")"
        cell.skills.text = "Skills: "
        
        employee?.skills.forEach({ item in
            cell.skills.text! += "\(item) "
        })
    }
}
