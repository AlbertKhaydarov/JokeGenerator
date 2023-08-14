//
//  MainView.swift
//  JokeGenerator
//
//  Created by Admin on 14.08.2023.
//

import UIKit

class MainView: UIView {
    let stackView = UIStackView()
    
    lazy var jokeIdLabelstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.layer.cornerRadius = 8
        stackView.layer.borderWidth = 2
        stackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        stackView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var jokeIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Joke ID"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var jokeIdNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var jokeTypeLabelstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.layer.cornerRadius = 8
        stackView.layer.borderWidth = 2
        stackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        stackView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var jokeTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var jokeTypeTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var jokeTextLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 195, height: 300))
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
   
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 30
        stackView.backgroundColor = .blue
        
    }
    func layout() {
    
        jokeIdLabelstackView.addArrangedSubview(jokeIdLabel)
        jokeIdLabelstackView.addArrangedSubview(jokeIdNumberLabel)
        
        jokeTypeLabelstackView.addArrangedSubview(jokeTypeLabel)
        jokeTypeLabelstackView.addArrangedSubview(jokeTypeTextLabel)
       
        stackView.addArrangedSubview(jokeIdLabelstackView)
        stackView.addArrangedSubview(jokeTypeLabelstackView)
        stackView.addArrangedSubview(jokeTextLabel)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            jokeIdLabelstackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            jokeIdLabelstackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            jokeIdLabelstackView.heightAnchor.constraint(equalToConstant: 64),
            
            jokeTypeLabelstackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            jokeTypeLabelstackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            jokeTypeLabelstackView.heightAnchor.constraint(equalToConstant: 64),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
//            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor ,constant: -64),
        ])
    }
}
