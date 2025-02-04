//
//  ViewController.swift
//  search
//
//  Created by Nooralam Shaikh on 30/01/25.
//

import UIKit

class ViewController: UIViewController {
    private var searchController: UISearchController!
    private var searchContainerViewController: UISearchContainerViewController!
    private var resultsViewController: ResuktsViewController!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        resultsViewController = ResuktsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchContainerViewController = UISearchContainerViewController(searchController: searchController)

        setupSearchController()
    }

    // MARK: - Setup Search Controller
    private func setupSearchController() {
        searchController.searchResultsUpdater = resultsViewController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Fruits"

        addChild(searchContainerViewController)
        searchContainerViewController.view.frame = view.bounds
        view.addSubview(searchContainerViewController.view)
        searchContainerViewController.didMove(toParent: self)
        searchController.searchControllerObservedScrollView = resultsViewController.collectionView
    }
}
