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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        collectionView?.backgroundColor = .white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: cellID)
        
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
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

class VideoCell : UICollectionViewCell{
    
    let thumbnailImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let saparatorView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel : UILabel = {
       let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleTextView : UITextView = {
        let label = UITextView()
        label.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(saparatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        
//        thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        // x,y, right , left
        
        NSLayoutConstraint.activate([thumbnailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12), thumbnailImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant : 12),thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant : -12 - 44 - 8), thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)])
        
        // left , bottom, width , height
        NSLayoutConstraint.activate([saparatorView.topAnchor.constraint(equalTo: bottomAnchor), saparatorView.leadingAnchor.constraint(equalTo: leadingAnchor), saparatorView.widthAnchor.constraint(equalTo: widthAnchor),saparatorView.heightAnchor.constraint(equalToConstant: 1)])
        //Top , left , width, height
        NSLayoutConstraint.activate([userProfileImageView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),userProfileImageView.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor), userProfileImageView.widthAnchor.constraint(equalToConstant: 44),
                                     userProfileImageView.heightAnchor.constraint(equalToConstant: 44)])
        // top,left, right , height
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8), titleLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8), titleLabel.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor),titleLabel.heightAnchor.constraint(equalToConstant: 22) ])
        
        // top,left, right , bottom
        NSLayoutConstraint.activate([subTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4), subTitleTextView.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8), subTitleTextView.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor),subTitleTextView.bottomAnchor.constraint(equalTo: userProfileImageView.bottomAnchor) ])
    
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

