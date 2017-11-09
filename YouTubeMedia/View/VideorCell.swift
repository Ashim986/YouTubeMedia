//
//  HomeControllerCell.swift
//  YouTubeMedia
//
//  Created by ashim Dahal on 11/6/17.
//  Copyright © 2017 ashim Dahal. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    func setupViews(){
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class VideoCell : BaseCell{
    
    let thumbnailImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let saparatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift - Blank Space"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleTextView : UITextView = {
        let textView = UITextView()
        textView.text = "TaylorSwiftVevo • 1,604,684,607 views • 2 years  " //  • you get from edit - symbol / emoji
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.textAlignment = .justified
        textView.textColor = .lightGray
        return textView
    }()
    
    override func setupViews(){
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
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8), titleLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8), titleLabel.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor),titleLabel.heightAnchor.constraint(equalToConstant: 20) ])
        
        // top,left, right , bottom
        NSLayoutConstraint.activate([subTitleTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2), subTitleTextView.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8), subTitleTextView.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor),subTitleTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant : -6) ])
        
    }
    
}
