//
//  CarListViewController.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 14.10.2021.
//

import UIKit

class CarListViewController: GenericBaseViewController<CarListViewModel> {
    
    var tableView = UITableView()
    var cars: Cars = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCars(completion: resultHandler)
    }
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        title = "ANS CARS"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        setTableViewDelegates()
        
        tableView.register(CarListTableViewCell.self, forCellReuseIdentifier: CarListTableViewCell.identifier)
        tableView.expandView(to: view)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private lazy var resultHandler: CarsResultBlock = { [weak self] response in
        switch response{
        case .success(let response):
            print("RESPONSE: \(response)")
            DispatchQueue.main.async {
                self?.cars = response
                self?.configureTableView()
            }
        case .failure(let error):
            print("ERROR: \(error)")
        }
    }
    
}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarListTableViewCell.identifier) as? CarListTableViewCell else { return UITableViewCell() }
        cell.setData(car: cars[indexPath.row])
        cell.separatorInset = .zero
        return cell
    }
}
