//
//  NoteListCV.swift
//  NoteMVP
//
//  Created by Александр Беляев on 18.03.2021.
//

import UIKit

class NoteListCV: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate  {
    var notes: [NoteModel]?
    
    init() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .lightGray
        delegate = self
        dataSource = self
        register(NoteListCell.self, forCellWithReuseIdentifier: "NoteListCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if notes != nil {
            return notes!.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NoteListCell", for: indexPath) as! NoteListCell
        if let note = notes?[indexPath.row] {
            cell.createCell(labelText: note.noteText)
        }
        return cell
    }
    
    func updateData(notes: [NoteModel]) {
        self.notes = notes
        self.reloadData()
    }

}
