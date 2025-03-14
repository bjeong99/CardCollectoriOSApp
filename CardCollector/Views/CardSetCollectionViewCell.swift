//
//  CardSetCollectionViewCell.swift
//  CardCollector
//
//  Created by Brian Jeong on 3/6/25.
//

import UIKit

/// Single cell for a card set
class CardSetCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CardSetCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let seriesLabel: UILabel = {
        let seriesLabel = UILabel()
        seriesLabel.textColor = .secondaryLabel
        seriesLabel.font = .systemFont(ofSize: 12, weight: .regular)
        seriesLabel.translatesAutoresizingMaskIntoConstraints = false
        return seriesLabel
    }()
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, seriesLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            seriesLabel.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5)

        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        seriesLabel.text = nil
    }
    
    public func configure(with viewModel: CardSetCollectionViewCellViewModel) {
        
    }
}
