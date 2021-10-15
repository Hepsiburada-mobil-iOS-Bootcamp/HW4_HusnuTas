//
//  CarListViewController.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 14.10.2021.
//

import UIKit

class CarListViewController: UIViewController {
    
    var tableView = UITableView()
    var cars: Cars = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ANS CARS"
        
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        setTableViewDelegates()
        tableView.rowHeight = 100
        
        tableView.expandView(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
