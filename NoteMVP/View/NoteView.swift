//
//  NoteView.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteView: UIViewController {
    var label: UILabel!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = .darkGray
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test test test test"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        self.label = label
    }
}
