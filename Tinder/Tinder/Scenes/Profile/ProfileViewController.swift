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
    
    //MARK: - Class variables
    private var editingMode = false
    
    //MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpTableView()
        settingsNotification()
        cameraOptionsNotification()
        editableModeNotification()
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
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .lightGray
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
    
    //MARK: - AlertControllers - Settings Options
    private func settingsNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showSettingsOptions), name: Notification.Name(NotificationName._settings.rawValue), object: nil)
    }
    
    @objc private func showSettingsOptions() {
        let alertController = UIAlertController(title: AlertTitle._settings.rawValue, message: AlertMessage._settings.rawValue, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: AlertOption.changeEmail.rawValue, style: .default, handler: { alertAction in
            
        }))
        
        alertController.addAction(UIAlertAction(title: AlertOption.changeName.rawValue, style: .default, handler: { alertAction in
            
        }))
        
        alertController.addAction(UIAlertAction(title: AlertOption.logOut.rawValue, style: .destructive, handler: { alertAction in
            
        }))
        
        alertController.addAction(UIAlertAction(title: AlertOption.cancel.rawValue, style: .cancel))
        
        self.present(alertController, animated: true)
    }
    
    //MARK: - AlertControllers - Camera Options
    private func cameraOptionsNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showCameraOptions), name: Notification.Name(NotificationName._camera.rawValue), object: nil)
    }
    
    @objc private func showCameraOptions() {
        let alertController = UIAlertController(title: AlertTitle._camera.rawValue, message: AlertMessage._camera.rawValue, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: AlertOption.changeAvatar.rawValue, style: .default, handler: { alertAction in
            
        }))
        
        alertController.addAction(UIAlertAction(title: AlertOption.uploadPictures.rawValue, style: .default, handler: { alertAction in
            
        }))
        
        alertController.addAction(UIAlertAction(title: AlertOption.cancel.rawValue, style: .cancel))
        
        self.present(alertController, animated: true)
    }
    
    //MARK: - Save user(edited) data
    private func editableModeNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(editBtnTapped), name: Notification.Name(NotificationName._edit.rawValue), object: nil)
    }
    
    @objc private func editBtnTapped() {
        editingMode.toggle()
        showSaveButton()
    }
    
    private func showSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveUserData))
        self.navigationItem.rightBarButtonItem = editingMode ? saveButton : nil
    }
    
    @objc private func saveUserData() {
        
    }
}

//MARK: - Extensions
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return HeightForRow.sec0.rawValue
        case 1:
            if indexPath.row == 0 {
                return HeightForRow.forTitle$TxtField.rawValue
            } else {
                return HeightForRow.sec1_1.rawValue
            }
        case 2...3: return HeightForRow.forTitle$TxtField.rawValue
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
            return NumberOfRowsInSection.sec0.rawValue
        case 1:
            return NumberOfRowsInSection.sec1.rawValue
        case 2:
            return NumberOfRowsInSection.sec2.rawValue
        case 3:
            return NumberOfRowsInSection.sec3.rawValue
        default:
            return NumberOfRowsInSection.secDefault.rawValue
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
                cell.titleLbl.text = SectionTitle.aboutMe.rawValue
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
                cell.titleLbl.text = SectionTitle.workEdu.rawValue
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
                cell.txtField.placeholder = Placeholder.addJob.rawValue
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
                cell.txtField.placeholder = Placeholder.addEdu.rawValue
                return cell
            default: return UITableViewCell()
            }
        } else if indexPath.section == 3 {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: LabelCell.identifier, for: indexPath) as? LabelCell else { return UITableViewCell() }
                cell.titleLbl.text = SectionTitle.basicInfo.rawValue
                return cell
            case 1...5:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldCell.identifier, for: indexPath) as? TextFieldCell else { return UITableViewCell() }
                switch indexPath.row {
                case 1:
                    cell.txtField.placeholder = Placeholder.gender.rawValue
                case 2:
                    cell.txtField.placeholder = Placeholder.city.rawValue
                case 3:
                    cell.txtField.placeholder = Placeholder.country.rawValue
                case 4:
                    cell.txtField.placeholder = Placeholder.height.rawValue
                case 5:
                    cell.txtField.placeholder = Placeholder.lookingFor.rawValue
                default: break
                }
                return cell
            default: return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
    }
}
