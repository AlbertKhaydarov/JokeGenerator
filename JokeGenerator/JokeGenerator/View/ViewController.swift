//
//  ViewController.swift
//  JokeGenerator
//
//  Created by Admin on 14.08.2023.
//

import UIKit

class ViewController: UIViewController, ButtonFuncDelegate  {
    
    var delegate: ButtonFuncDelegate!
    
    lazy private var mainView: MainView = {
        let view = MainView()
        view.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
        return view
    }()
    private var networking: NetworkService?
    private var jokeResponse: JokeResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        self.networking = NetworkService()
        fetchData()
        mainView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainView.addTopAndBottomBorders(label: mainView.jokeTextLabel)
    }
    
    func showPunchline() {
        guard let text = self.jokeResponse?.punchline else {return}
        let punchlineSubtitle = "\(text)"
        let viewModel = PunchlineViewModel(
            alertTitle: "Punchline",
            resultText: punchlineSubtitle,
            alertButtonText: "Ok")
        show(joke: viewModel)
        print("1")
    }
    
    private func show(joke punchline: PunchlineViewModel) {
        let alert = UIAlertController(title: punchline.alertTitle,
                                      message: punchline.resultText,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: punchline.alertButtonText, style: .default) { _ in
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupView(){
        view.addSubview(mainView)
        mainView.frame = view.frame
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

