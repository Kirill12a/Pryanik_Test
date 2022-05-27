//
//  MainCell.swift
//  Pryanik_Test
//
//  Created by Kirill Drozdov on 27.05.2022.
//

import UIKit
import Kingfisher

class MainCell: UITableViewCell {

    static let reuseId = "cellid"

    weak var viewModel: MainCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            categoryLabel.text = viewModel.text
            if let imgString = viewModel.imgString {
                pryanikyImageView.isHidden = false
                activityIndicator.startAnimating()
                activityIndicator.hidesWhenStopped = true
                    guard let imageURL = URL(string: imgString) else {return}
                    DispatchQueue.main.async {
                        self.pryanikyImageView.kf.setImage(with: imageURL)
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                    }
            } else {
                pryanikyImageView.isHidden = true
            }
        }
    }


    var categoryLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    var pryanikyImageView: UIImageView = {
        var view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.contentMode = .scaleAspectFit
        return view
    }()

    var activityIndicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.isHidden = true
        return indicator
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - Setup Constraints
    private func setupConstraints(){

        addSubview(categoryLabel)
        addSubview(pryanikyImageView)
        pryanikyImageView.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            categoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
        ])

        NSLayoutConstraint.activate([
            pryanikyImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            pryanikyImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            pryanikyImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            pryanikyImageView.widthAnchor.constraint(equalTo: pryanikyImageView.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: pryanikyImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: pryanikyImageView.centerXAnchor)
        ])
    }
}

