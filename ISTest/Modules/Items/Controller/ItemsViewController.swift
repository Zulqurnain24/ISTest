//
//  ItemsViewController.swift
//  ISTest
//
//  Created by macbook on 27/07/2020.
//  Copyright © 2020 Mohammad Zulqurnain. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    //View model object
    var viewModel: ItemsViewModel?
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        
        setTableView()
        
        setViewModel()
    
        populateData()
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 88
    }
    
    func setViewModel() {
        viewModel = ItemsViewModel()
        viewModel?.delegate = self
    }
    
    func populateData() {
        viewModel?.fetchItemList()
    }
    
    func registerTableViewCells() {
        tableView.register(UINib(nibName: String(describing: ItemCell.self), bundle: nil), forCellReuseIdentifier: StringConstants.itemCell.rawValue)
    }
    
    func performSegueToDetailScreen() {
        self.performSegue(withIdentifier: StringConstants.segueToDetailScreen.rawValue, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if (segue.identifier == StringConstants.segueToDetailScreen.rawValue) {
            
            if let target = segue.destination as? DetailViewController,
               let item = viewModel?.getItemList()[selectedIndex] {
                target.viewModel.setItem(item: item)
            }
        }
    }
}

extension ItemsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getItemList().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.itemCell.rawValue, for: indexPath) as? ItemCell
        else { return UITableViewCell() }
        
        viewModel?.configure(row: row, cell: cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegueToDetailScreen()
    }
    
}

extension ItemsViewController: ItemsViewModelDelegate {
    func getItemList(_ itemList: [Item]?, _ error: String?) {
        guard error == nil
            else {
                CommonFunctionality.showGeneralAlert(viewController: self, title: StringConstants.internetErrorTitleText.rawValue, message: StringConstants.unableToAuthenticate.rawValue, okCallback: nil, cancelCallback: nil)
                return
        }

        tableView.reloadData()
    }
}
