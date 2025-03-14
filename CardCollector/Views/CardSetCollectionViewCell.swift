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
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            seriesLabel.heightAnchor.constraint(equalToConstant: 15),
            
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            seriesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            seriesLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            nameLabel.bottomAnchor.constraint(equalTo: seriesLabel.topAnchor, constant: -3),
            seriesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        seriesLabel.text = nil
    }
    
    public func configure(with viewModel: CardSetCollectionViewCellViewModel) {
        nameLabel.text = viewModel.setName
        seriesLabel.text = viewModel.setSeries
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                break
            }
        }
    }
}
