//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Admin on 14.08.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy private var mainView: MainView = {
        let view = MainView()
        view.backgroundColor = .systemGray4
        return view
    }()
    var networking: NetworkService?
    private var jokeResponse: JokeResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
        self.networking = NetworkService()
        fetchData()
        
    }

    private func setupView(){
        view.addSubview(mainView)
        mainView.frame = view.bounds
    }

    func fetchData() {
      
        self.networking?.parsSearchResults() {(searchData) in
            guard let searchData = searchData else {return}
            self.jokeResponse = searchData
            
            guard (self.jokeResponse != nil) else {return}
            self.mainView.jokeTextLabel.text = self.jokeResponse?.setup
            guard let id = self.jokeResponse?.id else {return}
            self.mainView.jokeIdNumberLabel.text = "\(id)"
            self.mainView.jokeTypeTextLabel.text = self.jokeResponse?.type
        }
        
    }
}

