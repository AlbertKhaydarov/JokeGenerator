//
//  MainView.swift
//  JokeGenerator
//
//  Created by Admin on 14.08.2023.
//

import UIKit
protocol ButtonFuncDelegate{
    func showPunchline()
    func fetchData()
}

class MainView: UIView {
    
    var delegate: ButtonFuncDelegate?
    
   lazy private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 24
        stackView.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
        return stackView
    }()
    
    lazy private var jokeIdLabelstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        stackView.layer.borderWidth = 2
        stackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        stackView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy private var jokeIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        label.text = "Joke ID"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var jokeIdNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var jokeTypeLabelstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        stackView.layer.borderWidth = 2
        stackView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        stackView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy private var jokeTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.text = "Type"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var jokeTypeTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy private var jokeSetupLabelstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 18
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        stackView.layer.borderWidth = 2
        stackView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.5607843137, blue: 0.768627451, alpha: 1)
        stackView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy private var jokeSetupLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Medium", size: 16)
        label.text = "Setup"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var jokeTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto-Bold", size: 24)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy private var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        stackView.backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.alignment = .fill
        //        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy private var refreshButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let image = UIImage(named: "refresh")
        button.setImage(image, for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.refreshTappedAction(button)
        }), for: .touchUpInside)
        return button
    }()
    
    private func refreshTappedAction(_ sender: UIButton){
        delegate?.fetchData()
    }
    
    lazy private var showPunchlineTappedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 16)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                             , for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5607843137, green: 0.9490196078, blue: 0.5607843137, alpha: 1)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("Show punchline", for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.punchlineTappedAction(button)
        }), for: .touchUpInside)
        return button
    }()
    
    private func punchlineTappedAction(_ sender: UIButton){
        delegate?.showPunchline()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        jokeIdLabelstackView.addArrangedSubview(jokeIdLabel)
        jokeIdLabelstackView.addArrangedSubview(jokeIdNumberLabel)
        
        jokeTypeLabelstackView.addArrangedSubview(jokeTypeLabel)
        jokeTypeLabelstackView.addArrangedSubview(jokeTypeTextLabel)
        
        jokeSetupLabelstackView.addArrangedSubview(jokeSetupLabel)
        jokeSetupLabelstackView.addArrangedSubview(jokeTextLabel)
        
        buttonsStackView.addArrangedSubview(refreshButton)
        buttonsStackView.addArrangedSubview(showPunchlineTappedButton)
        
        
        mainStackView.addArrangedSubview(jokeIdLabelstackView)
        mainStackView.addArrangedSubview(jokeTypeLabelstackView)
        mainStackView.addArrangedSubview(jokeSetupLabelstackView)
        mainStackView.addArrangedSubview(buttonsStackView)
        
        addSubview(mainStackView)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTopAndBottomBorders(label: UILabel) {
        let thickness: CGFloat = 2.0
        let topBorder = CALayer()
        let bottomBorder = CALayer()
        
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: label.frame.size.width, height: thickness)
        topBorder.backgroundColor = UIColor.black.cgColor
        bottomBorder.frame = CGRect(x:0, y: label.frame.size.height - thickness, width: label.frame.size.width, height:thickness)
        
        bottomBorder.backgroundColor = UIColor.black.cgColor
        label.layer.addSublayer(topBorder)
        label.layer.addSublayer(bottomBorder)
    }
    
    private func layout() {
        
        NSLayoutConstraint.activate([
            jokeIdLabelstackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            jokeIdLabelstackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            jokeIdLabelstackView.heightAnchor.constraint(equalToConstant: 64),
            
            jokeTypeLabelstackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            jokeTypeLabelstackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            jokeTypeLabelstackView.heightAnchor.constraint(equalToConstant: 64),
            
            jokeSetupLabelstackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            jokeSetupLabelstackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            jokeSetupLabel.heightAnchor.constraint(equalToConstant: 19),
            refreshButton.widthAnchor.constraint(equalTo: refreshButton.heightAnchor),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 64),
            
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 64),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor ,constant: -64),
        ])
    }
}
