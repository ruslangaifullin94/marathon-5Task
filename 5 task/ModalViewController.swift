//
//  ModalViewController.swift
//  5 task
//
//  Created by Руслан Гайфуллин on 13.05.2023.
//

import UIKit

class ModalViewController: UIViewController {
    
    private lazy var switchUP: UISegmentedControl = {
       let swUP = UISegmentedControl(items: ["280pt","150pt"])
        swUP.translatesAutoresizingMaskIntoConstraints = false
        swUP.selectedSegmentIndex = 0
        swUP.tintColor = .black
        swUP.backgroundColor = .systemGray3
        swUP.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        
        return swUP
    }()
    
    private lazy var closeButton: UIButton = {
    
        let button = UIButton()
        let buttonImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .large)
        button.tintColor = .systemGray3
        button.setImage(UIImage(systemName: "xmark.circle.fill", withConfiguration: buttonImageConfig), for: .normal)
        button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.definesPresentationContext = true

        view.addSubview(switchUP)
        view.addSubview(closeButton)
        setupConstraits()
    }
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
        
            switchUP.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            switchUP.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: switchUP.centerYAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    @objc private func switchValueChanged(_ sender:UISegmentedControl) {
       
        switch (sender.selectedSegmentIndex) {
        case 0:
            self.preferredContentSize = CGSize(width: 300, height: 280)
        case 1:
            self.preferredContentSize = CGSize(width: 300, height: 150)

        default:
            break
        }
        
    }
    
    @objc private func didTapCloseButton() {
        self.dismiss(animated: true)
    }

}

extension ModalViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = UIColor.black.withAlphaComponent(0.1)
    }
}
