//
//  ResuktsViewController.swift
//  search
//
//  Created by Nooralam Shaikh on 30/01/25.
//

import UIKit

class ResuktsViewController: UIViewController, UISearchResultsUpdating {
    var collectionView: UICollectionView!
    private var allItems: [String] = ["Apple", "Banana", "Cherry", "Date", "Grape", "Mango"]
    private var filteredItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
    }

    // MARK: - Setup Collection View
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 100)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }

    // MARK: - UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        filteredItems = searchText.isEmpty ? allItems : allItems.filter { $0.lowercased().contains(searchText.lowercased()) }
        collectionView.reloadData()
    }

}


// MARK: - UICollectionViewDataSource
extension ResuktsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let label = UILabel(frame: cell.bounds)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = allItems[indexPath.item]

        // Remove previous subviews
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(label)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = EnterPinViewController()
        controller.modalPresentationStyle = .blurOverFullScreen
        present(controller, animated: true)
    }
}
