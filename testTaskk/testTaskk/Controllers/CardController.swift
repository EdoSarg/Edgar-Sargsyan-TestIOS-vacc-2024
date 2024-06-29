//
//  cardController.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 14.06.24.
//

import UIKit

class CardController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!

    let pizzaInfo = "Римское тесто,Курица,Помидоры черри,Сыр сливочный,Сыр Моцарелла,Соус песто,Салат руколла,Чеснок"
    let nutritionInfo = ["450 ккал", "45 белки", "20 жиры", "33 углеводы"]
    let extraIngredients = [
        ("Сырный бортик", UIImage(named: "cheeseCrust")),
        ("Сырный бортик сырный", UIImage(named: "cheeseCrust")),
        ("Сырный бортик", UIImage(named: "cheeseCrust"))
    ]
    let removableIngredients = ["Лук", "Помидоры", "Лук", "Помидоры"]

    var ingredientsToRemove = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(PizzaImageCell.self, forCellReuseIdentifier: PizzaImageCell.identifier)
        tableView.register(PizzaInfoCell.self, forCellReuseIdentifier: PizzaInfoCell.identifier)
        tableView.register(NutritionInfoCell.self, forCellReuseIdentifier: NutritionInfoCell.identifier)
        tableView.register(SizeAndCrustSelectionCell.self, forCellReuseIdentifier: SizeAndCrustSelectionCell.identifier)
        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: IngredientTableViewCell.identifier)
        tableView.register(ActionButtonCell.self, forCellReuseIdentifier: ActionButtonCell.identifier)
        tableView.register(ShowAllButtonCell.self, forCellReuseIdentifier: ShowAllButtonCell.identifier)
        tableView.register(IngredientRemovalCell.self, forCellReuseIdentifier: IngredientRemovalCell.identifier)

        tableView.estimatedRowHeight = 100  
        tableView.rowHeight = UITableView.automaticDimension

        self.view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
        case 5:
            return 1
        case 6:
            return removableIngredients.count
        case 7:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PizzaImageCell.identifier, for: indexPath) as! PizzaImageCell
            cell.configure(with: UIImage(named: "pizzaImage"))
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: PizzaInfoCell.identifier, for: indexPath) as! PizzaInfoCell
            cell.configure(with: "Римская пицца цыпленок с соусом песто", description: pizzaInfo)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: NutritionInfoCell.identifier, for: indexPath) as! NutritionInfoCell
            cell.configure(with: nutritionInfo)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: SizeAndCrustSelectionCell.identifier, for: indexPath) as! SizeAndCrustSelectionCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as! IngredientTableViewCell
            cell.configure(with: extraIngredients)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShowAllButtonCell.identifier, for: indexPath) as! ShowAllButtonCell
            cell.configure(with: "Показать все", action: #selector(showAllButtonTapped), target: self)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: IngredientRemovalCell.identifier, for: indexPath) as! IngredientRemovalCell
            let ingredient = removableIngredients[indexPath.row]
            cell.configure(with: ingredient) { [weak self] ingredient, isSelected in
                guard let self = self else { return }
                if isSelected {
                    self.ingredientsToRemove.append(ingredient)
                } else {
                    self.ingredientsToRemove.removeAll { $0 == ingredient }
                }
            }
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: ActionButtonCell.identifier, for: indexPath) as! ActionButtonCell
            cell.configure(with: "Добавить за 690₽")
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Описание"
        case 2:
            return "Пищевая ценность"
        case 3:
            return "Вид"
        case 4:
            return "Добавить ингредиенты"
      
        default:
            return ""
        }
    }
  

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1, 2, 3, 4:
            return 30
        default:
            return 0
        }
    }

    @objc func showAllButtonTapped() {
        // Действие для кнопки "Показать все"
    }
}
