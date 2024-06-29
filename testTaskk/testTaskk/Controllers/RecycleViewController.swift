//
//  RecycleViewController.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 29.06.24.
//

import UIKit

struct RecycleModel {
    var title: String
    var price: String
}

class RecycleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = [RecycleModel(title: "Круассан с семгой и сыром с семгой и сыром ", price: "359₽"),
                 RecycleModel(title: "Круассан с семгой и сыром с семгой и сыром ", price: "359₽"),
                 RecycleModel(title: "Круассан с семгой и сыром с семгой и сыром ", price: "359₽")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "RecycleTableViewCell", bundle: nil), forCellReuseIdentifier: "RecycleTableViewCell")
    }
}

extension RecycleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecycleTableViewCell", for: indexPath) as! RecycleTableViewCell
        
        cell.configureUI(model: model[indexPath.row])
        
        return cell
    }
}
