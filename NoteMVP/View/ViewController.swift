//
//  ViewController.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class ViewController: UIViewController {

    var mainView: MainView!
    var presenter: Presenter!
    
    override func loadView() {
        super.loadView()
        let noteView = NoteView()
        let mainView = MainView()
        self.presenter = Presenter(mainView: mainView, noteView: noteView) { [weak self] in
            self?.present(noteView, animated: true, completion: nil)
        }
        view.addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        ])
        self.mainView = mainView
    }


}

