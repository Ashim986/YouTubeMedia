//
//  ViewController.swift
//  YouTubeMedia
//
//  Created by ashim Dahal on 10/31/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellID = "cellID"
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor(r: 230, g: 32, b: 31)
        navigationController?.navigationBar.isTranslucent = false
        titleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        navigationItem.titleView  = titleLabel
        collectionView?.backgroundColor = .white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        setupMenuBar()
        
    }
    
    let menuBar : MenuBar = {
       let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([menuBar.leftAnchor.constraint(equalTo: view.leftAnchor), menuBar.topAnchor.constraint(equalTo: view.topAnchor), menuBar.rightAnchor.constraint(equalTo: view.rightAnchor), menuBar.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9/16
        return CGSize(width: view.frame.width, height: height + 12 + 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}


