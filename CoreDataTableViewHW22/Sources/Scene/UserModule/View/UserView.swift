//
//  UserView.swift
//  CoreDataTableViewHW22
//
//  Created by Sergio on 17.11.22.
//

import UIKit

class UsersView: UIView {

    // MARK: - Views

    lazy var textFieldPrint: UITextField = {
        let textField = UITextField()
        textField.placeholder = Strings.printName
        textField.backgroundColor = .systemGray5
        textField.borderStyle = .roundedRect
        textField.becomeFirstResponder()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    lazy var pressButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle(Strings.newUserButtonTitle, for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = Metric.radius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableView.backgroundColor = .systemGray5
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

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

    private func setupHierarchy() {
        addSubview(textFieldPrint)
        addSubview(pressButton)
        addSubview(tableView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            textFieldPrint.topAnchor.constraint(equalTo: self.topAnchor, constant: Metric.textFieldTopInset),
            textFieldPrint.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.indentLeft),
            textFieldPrint.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metric.indentRight),
            textFieldPrint.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),

            pressButton.topAnchor.constraint(equalTo: textFieldPrint.bottomAnchor, constant: Metric.pressButtonTopIndent),
            pressButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metric.indentLeft),
            pressButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metric.indentRight),
            pressButton.heightAnchor.constraint(equalToConstant: Metric.textFieldHeight),

            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: pressButton.bottomAnchor, constant: Metric.tableViewTopIndent),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: - Constants

extension UsersView {

    enum Metric {
        static let radius: CGFloat = 6
        static let indentLeft: CGFloat = 20
        static let indentRight: CGFloat = -20
        static let textFieldHeight: CGFloat = 50
        static let textFieldTopInset: CGFloat = 150
        static let tableViewTopIndent: CGFloat = 30
        static let pressButtonTopIndent: CGFloat = 25
    }

    enum Strings {
        static let printName: String = "Print your name here"
        static let newUserButtonTitle: String = "Add user"
    }
}
