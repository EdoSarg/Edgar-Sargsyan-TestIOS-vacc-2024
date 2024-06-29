//
//  ViewController2.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 12.06.24.
//

import UIKit

class PizzaCategory: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var scrollView: UIScrollView!
    var titleLabel: UILabel!

    var labels: [String] = ["Тонкое тесто", "Тонкое тесто", "Тонкое тесто", "Тонкое тесто", "Тонкое тесто"]

    var images: [String] = ["pizzaColection", "pizzaColection", "pizzaColection", "pizzaColection", "pizzaColection", "pizzaColection", "pizzaColection", "pizzaColection", "pizzaColection"]
    
    var movieNames: [String] = ["Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик...", "Филадельфия с лососем и базилик..."]
    
    var prices: [String] =    ["359₽", "359₽", "359₽", "359₽", "359₽", "359₽", "359₽", "359₽", "359₽"]
    var discounts: [String] = ["453₽", "453₽", "453₽", "453₽", "453₽", "453₽", "453₽", "453₽", "453₽"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTitleLabel()
        setupScrollView()
        setupCollectionView()
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24) 
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        var lastLabel: UILabel? = nil
        
        for label in labels {
            let lbl = UILabel()
            lbl.text = label
            lbl.backgroundColor = .systemGray5
            lbl.textAlignment = .center
            lbl.layer.cornerRadius = 15
            lbl.layer.masksToBounds = true
            lbl.translatesAutoresizingMaskIntoConstraints = false
            
            scrollView.addSubview(lbl)
            
            NSLayoutConstraint.activate([
                lbl.widthAnchor.constraint(equalToConstant: 150),
                lbl.heightAnchor.constraint(equalToConstant: 35),
                lbl.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
            ])
            
            if let lastLabel = lastLabel {
                lbl.leadingAnchor.constraint(equalTo: lastLabel.trailingAnchor, constant: 10).isActive = true
            } else {
                lbl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10).isActive = true
            }
            
            lastLabel = lbl
        }
        
        if let lastLabel = lastLabel {
            lastLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        }
    }
    
    func setupCollectionView() {
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension PizzaCategory: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.index = indexPath.row
        cell.imageView.image = UIImage(named: images[indexPath.row])
        
        let fullText = movieNames[indexPath.row]
        if let range = fullText.range(of: " ") {
            let modifiedText = fullText[..<range.lowerBound] + "\n" + fullText[range.upperBound...]
            cell.titleLbl.text = String(modifiedText)
        } else {
            cell.titleLbl.text = fullText
        }
        
        
        cell.priceLbl.text = prices[indexPath.row]
        
        
        let discountText = discounts[indexPath.row]
        cell.discountLbl.attributedText = NSAttributedString(
            string: discountText,
            attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )
        
        
        let descriptionText = NSMutableAttributedString(string: "200 гр · ", attributes: [.foregroundColor: UIColor.gray])
        let benefitText = NSAttributedString(string: "Выгода 100₽!", attributes: [.foregroundColor: UIColor.green])
        descriptionText.append(benefitText)
        cell.descriptionLbl.attributedText = descriptionText
        
        cell.complition = { [weak self] index in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CardController") as! CardController
            print(index)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 10) / 2
        let height: CGFloat = 300 
        return CGSize(width: width, height: height)
    }
}







 
 

 

 

