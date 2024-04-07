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
    let backView = UIView()
    let loader = UIActivityIndicatorView()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableview)
        view.addSubview(backView)
        backView.addSubview(loader)
        setConstraints()
        setUI()
        getData()
    }
    
    private func getData() {
        showLoader()
        Task {
            do {
                let response = try await Network.shared.fetchData()
                model = response
                tableview.reloadData()
                hideLoader()
            } catch {
                print(error.localizedDescription)
                hideLoader()
            }
        }
    }
    
    private func setConstraints() {
        tableview.frame = view.frame
        backView.frame = view.frame
        loader.frame = backView.frame
        
    }
    
    private func setUI() {
       
        tableview.backgroundColor = bgColor
        tableview.register(TableviewCell.self, forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.showsVerticalScrollIndicator = false
        tableview.separatorColor = .red
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = isIpad() ? 100 : 80
        
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        
        backView.backgroundColor = .black.withAlphaComponent(0.7)
        loader.color = .white
        loader.style = .large
        
        tableview.addSubview(refreshControl)
    }
    
    @objc private func refreshTableView() {
        getData()
    }
    
    
    private func showLoader() {
        UIView.animate(withDuration: 0.3) {
            self.backView.isHidden = false
            self.loader.isHidden = false
            self.loader.startAnimating()
        }
    }
    
    private func hideLoader() {
        UIView.animate(withDuration: 0.3) {
            self.refreshControl.endRefreshing()
            self.backView.isHidden = true
            self.loader.isHidden = true
            self.loader.stopAnimating()
           
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableview.estimatedRowHeight
    }
}
