//
//  UserInfoView.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

class UserInfoView: UIView {

    // MARK: - Views

    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Strings.avatarImage))
        imageView.layer.cornerRadius = Metric.photoImageViewRadius
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.tintColor = .secondarySystemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var avatarIcon = createIcon(name: Strings.avatarIcon)
    private lazy var calendarIcon = createIcon(name: Strings.calendarIcon)
    private lazy var genderIcon = createIcon(name: Strings.genderIcon)

    private lazy var iconsStackView = createStackView(arrangedSubviews:
                                                        [avatarIcon,
                                                         calendarIcon,
                                                         genderIcon],
                                                      axis: .vertical,
                                                      spacing: Metric.iconsStackViewSpacing,
                                                      distribution: .fillProportionally,
                                                      alignment: .leading)

    lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Strings.placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var birthdayDatePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.maximumDate = Date.now
        datePicker.datePickerMode = .date
        datePicker.isEnabled = true
        return datePicker
    }()

    lazy var genderControl: UISegmentedControl = {
        let segmentedItems = [Gender.female.rawValue, Gender.male.rawValue]
        let font = UIFont.systemFont(ofSize: Metric.systemFont)
        let segmentedControl = UISegmentedControl(items: segmentedItems)
        let selectedAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.black]
        let normalAttribute: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: UIColor.lightGray]
        segmentedControl.setTitleTextAttributes(selectedAttribute, for: .selected)
        segmentedControl.setTitleTextAttributes(normalAttribute, for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.isEnabled = true
        return segmentedControl
    }()

    private lazy var textStackView = createStackView(arrangedSubviews:
                                                        [userNameTextField,
                                                         birthdayDatePicker,
                                                         genderControl],
                                                     axis: .vertical,
                                                     spacing: Metric.textStackViewSpacing,
                                                     distribution: .fillProportionally,
                                                     alignment: .leading)

    private lazy var separatorView = createSeparatorView()
    private lazy var separatorSecondView = createSeparatorView()
    private lazy var separatorLastView = createSeparatorView()

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(photoImageView)
        addSubview(iconsStackView)
        addSubview(textStackView)
        addSubview(separatorView)
        addSubview(separatorSecondView)
        addSubview(separatorLastView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
        photoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metric.photoImageViewTopInset),
        photoImageView.heightAnchor.constraint(equalToConstant: Metric.photoImageViewSize),
        photoImageView.widthAnchor.constraint(equalToConstant: Metric.photoImageViewSize),

        iconsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.inset),
        iconsStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Metric.iconsStackViewTopInset),

        separatorView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Metric.separatorViewTopInsert),
        separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.inset),
        separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.inset),
        separatorView.heightAnchor.constraint(equalToConstant: Metric.separatorHeight),

        separatorSecondView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: Metric.separatorSecondViewTopInsert),
        separatorSecondView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.inset),
        separatorSecondView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.inset),
        separatorSecondView.heightAnchor.constraint(equalToConstant: Metric.separatorHeight),

        separatorLastView.topAnchor.constraint(equalTo: separatorSecondView.bottomAnchor, constant: Metric.separatorLastViewTopInsert),
        separatorLastView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.inset),
        separatorLastView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metric.inset),
        separatorLastView.heightAnchor.constraint(equalToConstant: Metric.separatorHeight),

        textStackView.leadingAnchor.constraint(equalTo: iconsStackView.trailingAnchor, constant: Metric.inset),
        textStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: Metric.textStackViewTopInset),
        ])
    }
}

// MARK: - Constants

extension UserInfoView {

    enum Metric {
        static let photoImageViewSize: CGFloat = 200
        static let photoImageViewRadius: CGFloat = Metric.photoImageViewSize/2
        static let photoImageViewTopInset: CGFloat = 150
        static let iconsStackViewTopInset: CGFloat = 30
        static let iconsStackViewSpacing: CGFloat = 32
        static let inset: CGFloat = 22
        static let separatorHeight: CGFloat = 1
        static let separatorViewTopInsert: CGFloat = 70
        static let separatorSecondViewTopInsert: CGFloat = 70
        static let separatorLastViewTopInsert: CGFloat = 70
        static let textStackViewTopInset: CGFloat = 40
        static let textStackViewSpacing: CGFloat = 40
        static let systemFont: CGFloat = 17
    }

    enum Strings {
        static let avatarImage: String = "avatar"
        static let avatarIcon: String = "person"
        static let calendarIcon: String = "calendar"
        static let genderIcon: String = "figure.dress.line.vertical.figure"
        static let placeholder: String = "Name"
    }
}
