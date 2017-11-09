//
//  MenuBar.swift
//  YouTubeMedia
//
//  Created by ashim Dahal on 11/8/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class MenuBar : UIView, UICollectionViewDataSource , UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    
    lazy var  collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cView.backgroundColor = UIColor(r: 230, g: 32, b: 31)
        cView.dataSource = self
        cView.delegate = self
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
        
    }()
    
    
//      MARK: View component
    let cellID = "cellID"
    let imageNames = [#imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "trending"), #imageLiteral(resourceName: "subscriptions") , #imageLiteral(resourceName: "account")]
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        handleView()
        backgroundColor = UIColor(r: 230, g: 32, b: 31)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellID)
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .top)
    }
    
    func handleView() {
        addSubview(collectionView)
        setupAnchorForViews()
    }
    func setupAnchorForViews() {
        // anchor for collection view left,top, right , bottom
        NSLayoutConstraint.activate([collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),collectionView.topAnchor.constraint(equalTo: self.topAnchor), collectionView.rightAnchor.constraint(equalTo: self.rightAnchor), collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
    
//    MARK: CollectionView Properties
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageName = imageNames[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MenuCell
        cell.imageView.image = imageName.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor(r: 91, g: 14, b: 13)
        
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MenuCell : BaseCell {
    
    let imageView : UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysTemplate)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(r: 91, g: 14, b: 13)
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                imageView.tintColor = UIColor.white
                return
            }else {
                imageView.tintColor = UIColor(r: 91, g: 14, b: 13)
            }
        }
    }
    
    override var isSelected: Bool{
        didSet {
            if isSelected {
                imageView.tintColor = UIColor.white
                return
            }else {
                imageView.tintColor = UIColor(r: 91, g: 14, b: 13)
            }
        }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor(r: 230, g: 32, b: 31)
        addSubview(imageView)
        
        setupConstrintForView()
    }
    func setupConstrintForView() {
        NSLayoutConstraint.activate([imageView.centerXAnchor.constraint(equalTo: centerXAnchor), imageView.centerYAnchor.constraint(equalTo: centerYAnchor), imageView.widthAnchor.constraint(equalToConstant: 28), imageView.heightAnchor.constraint(equalToConstant: 28)])
    }
}
