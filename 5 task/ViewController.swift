//
//  ViewController.swift
//  5 task
//
//  Created by Руслан Гайфуллин on 13.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var pushButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Push me", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(pushButton)
        setupConstrait()
        // Do any additional setup after loading the view.
    }

    private func setupConstrait() {
        NSLayoutConstraint.activate([
        
            pushButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            pushButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            pushButton.heightAnchor.constraint(equalToConstant: 40),
            pushButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        
        presentPopUp(sender, sourceRect: sender.bounds)
//        let modalVC = ModalViewController()
//        modalVC.modalTransitionStyle = .crossDissolve
//        modalVC.modalPresentationStyle = .popover
//        modalVC.preferredContentSize = CGSizeMake(UIScreen.main.bounds.width-100, 280)
//        let mVC = modalVC.popoverPresentationController
//        mVC?.permittedArrowDirections = .any
//        mVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
//
//
//        present(modalVC, animated: true, completion: nil)
    }

}
extension UIViewController {
    func presentPopUp(_ button: UIButton, sourceRect: CGRect) {
        let view = ModalViewController()
        view.preferredContentSize = CGSize(width: 300, height: 280)
        view.modalPresentationStyle = .popover
        view.popoverPresentationController?.delegate = view 
        view.popoverPresentationController?.permittedArrowDirections = .up
        view.popoverPresentationController?.sourceView = button
        view.popoverPresentationController?.sourceRect = sourceRect
        self.present(view, animated: true, completion: {
            view.view.superview?.layer.cornerRadius = 4.0
        })
    }
}
