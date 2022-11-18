//
//  UIView.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

extension UIView {

  func createStackView(arrangedSubviews: [UIView],
                         axis: NSLayoutConstraint.Axis,
                         spacing: CGFloat,
                         distribution: UIStackView.Distribution,
                         alignment: UIStackView.Alignment) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.distribution = distribution
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    func createIcon(name: String) -> UIImageView {
        let icon = UIImage(systemName: name)
        let imageView = UIImageView(image: icon)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 33, weight: .regular)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    func createSeparatorView() -> UIView {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
