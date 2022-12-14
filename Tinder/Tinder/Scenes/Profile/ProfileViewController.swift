//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Ellen_Kapii on 14.12.22.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - UIViews
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    //MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpTableView()
    }
    
    // MARK: - Configuration Private Functions
    private func setUp() {
        addTableView()
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileCell.nibFile, forCellReuseIdentifier: ProfileCell.identifier)
        tableView.register(AboutMeCell.nibFile, forCellReuseIdentifier: AboutMeCell.identifier)
        tableView.register(LabelCell.nibFile, forCellReuseIdentifier: LabelCell.identifier)
        tableView.register(TextFieldCell.nibFile, forCellReuseIdentifier: TextFieldCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .yellow
    }
    
    //MARK: - Adding Views
    private func addTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: tableView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: tableView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([top, left, right, bottom])
        
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 420
        case 1:
            if indexPath.row == 0 {
                return 60
            } else {
                return 150
            }
        case 2...3: return 60
        default: return 10
        }
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        case 3:
            return 6
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else { return UITableViewCell() }
            return cell
        } else if indexPath.section == 1  {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.identifier, for: indexPath) as? LabelCell else { return UITableViewCell() }
                cell.titleLbl.text = "About Me"
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: AboutMeCell.identifier, for: indexPath) as? AboutMeCell else { return UITableViewCell() }
                return cell
            default: return UITableViewCell()
            }
        } else if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.identifier, for: indexPath) as? LabelCell else { return UITableViewCell() }
                cell.titleLbl.text = "My Work & Education"
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
                cell.txtField.placeholder = "Add Job"
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
                cell.txtField.placeholder = "Add Education"
                return cell
            default: return UITableViewCell()
            }
        } else if indexPath.section == 3 {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.identifier, for: indexPath) as? LabelCell else { return UITableViewCell() }
                cell.titleLbl.text = "My Basic Info"
                return cell
            case 1...5:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
                switch indexPath.row {
                case 1:
                    cell.txtField.placeholder = "Gender"
                case 2:
                    cell.txtField.placeholder = "City"
                case 3:
                    cell.txtField.placeholder = "Country"
                case 4:
                    cell.txtField.placeholder = "Height"
                case 5:
                    cell.txtField.placeholder = "Looking for"
                default: print("")
                }
                return cell
            default: return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
    }
}
