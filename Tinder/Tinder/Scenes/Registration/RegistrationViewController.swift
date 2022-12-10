//
//  RegistrationViewController.swift
//  Tinder
//
//  Created by Ellen_Kapii on 08.11.22.
//

import UIKit
import ProgressHUD

class RegistrationViewController: UIViewController {
    // MARK: - UIViews
    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "loginBackground")
        view.addSubview(background)
        return background
    }()
    
    private lazy var signUpLbl: UILabel = {
        let signUpLbl = UILabel()
        signUpLbl.text = "Sign Up"
        signUpLbl.font = UIFont.boldSystemFont(ofSize: 36)
        signUpLbl.textColor = .white
        signUpLbl.textAlignment = .center
        view.addSubview(signUpLbl)
        return signUpLbl
    }()
    
    
    private lazy var usernameTxtField: UITextField = {
        let usernameTxtField = UITextField()
        usernameTxtField.font = UIFont.boldSystemFont(ofSize: 15)
        usernameTxtField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        usernameTxtField.backgroundColor = .clear
        view.addSubview(usernameTxtField)
        return usernameTxtField
    }()
    
    private lazy var txtFieldBtmLine1: UIView = {
        let txtFieldBtmLine2 = UIView()
        txtFieldBtmLine2.backgroundColor = .white
        txtFieldBtmLine2.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine2)
        return txtFieldBtmLine2
    }()
    
    private lazy var emailTxtField: UITextField = {
        let emailTxtField = UITextField()
        emailTxtField.font = UIFont.boldSystemFont(ofSize: 15)
        emailTxtField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        emailTxtField.backgroundColor = .clear
        view.addSubview(emailTxtField)
        return emailTxtField
    }()
    
    private lazy var txtFieldBtmLine2: UIView = {
        let txtFieldBtmLine = UIView()
        txtFieldBtmLine.backgroundColor = .white
        txtFieldBtmLine.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine)
        return txtFieldBtmLine
    }()
    
    private lazy var cityTxtField: UITextField = {
        let cityTxtField = UITextField()
        cityTxtField.font = UIFont.boldSystemFont(ofSize: 15)
        cityTxtField.attributedPlaceholder = NSAttributedString(string: "City", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        cityTxtField.backgroundColor = .clear
        view.addSubview(cityTxtField)
        return cityTxtField
    }()
    
    private lazy var txtFieldBtmLine3: UIView = {
        let txtFieldBtmLine = UIView()
        txtFieldBtmLine.backgroundColor = .white
        txtFieldBtmLine.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine)
        return txtFieldBtmLine
    }()
    
    private lazy var genderPicker: UISegmentedControl = {
        let genderPicker = UISegmentedControl(items: ["Male", "Female"])
        genderPicker.selectedSegmentIndex = 0
        genderPicker.tintColor = UIColor.white
        genderPicker.selectedSegmentTintColor = .white
        view.addSubview(genderPicker)
        return genderPicker
    }()
    
    private lazy var dateOfBirthLbl: UILabel = {
       let dateOfBirthLbl = UILabel()
        dateOfBirthLbl.text = "Date of Birth"
        dateOfBirthLbl.textColor = .systemGray2
        view.addSubview(dateOfBirthLbl)
        return dateOfBirthLbl
    }()
    
    private lazy var dateOfBirthPicker: UIDatePicker = {
        let dateOfBirthPicker = UIDatePicker()
        dateOfBirthPicker.datePickerMode = .date
        dateOfBirthPicker.tintColor = .white
        view.addSubview(dateOfBirthPicker)
        return dateOfBirthPicker
    }()
    
    private lazy var txtFieldBtmLine4: UIView = {
        let txtFieldBtmLine2 = UIView()
        txtFieldBtmLine2.backgroundColor = .white
        txtFieldBtmLine2.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine2)
        return txtFieldBtmLine2
    }()
    
    private lazy var passwordTxtField: UITextField = {
        let passwordTxtField = UITextField()
        passwordTxtField.font = UIFont.boldSystemFont(ofSize: 15)
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        passwordTxtField.isSecureTextEntry = true
        passwordTxtField.backgroundColor = .clear
        view.addSubview(passwordTxtField)
        return passwordTxtField
    }()
    
    private lazy var txtFieldBtmLine5: UIView = {
        let txtFieldBtmLine = UIView()
        txtFieldBtmLine.backgroundColor = .white
        txtFieldBtmLine.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine)
        return txtFieldBtmLine
    }()
    
    private lazy var cnfrmPasswordTxtField: UITextField = {
        let cnfrmPasswordTxtField = UITextField()
        cnfrmPasswordTxtField.font = UIFont.boldSystemFont(ofSize: 15)
        cnfrmPasswordTxtField.attributedPlaceholder = NSAttributedString(string: "Confirm Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        cnfrmPasswordTxtField.isSecureTextEntry = true
        cnfrmPasswordTxtField.backgroundColor = .clear
        view.addSubview(cnfrmPasswordTxtField)
        return cnfrmPasswordTxtField
    }()
    
    private lazy var txtFieldBtmLine6: UIView = {
        let txtFieldBtmLine = UIView()
        txtFieldBtmLine.backgroundColor = .white
        txtFieldBtmLine.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine)
        return txtFieldBtmLine
    }()
    
    private lazy var registerBtn: UIButton = {
        let registerBtn = UIButton()
        registerBtn.setTitle("REGISTER", for: .normal)
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        registerBtn.backgroundColor = .green
        registerBtn.layer.cornerRadius = 10
        view.addSubview(registerBtn)
        return registerBtn
    }()
    
    private lazy var loginLbl: UILabel = {
        let signUpLbl = UILabel()
        signUpLbl.text = "Already have an account?"
        signUpLbl.textColor = .white
        signUpLbl.textAlignment = .left
        signUpLbl.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(signUpLbl)
        return signUpLbl
    }()
    
    private lazy var loginBtn: UIButton = {
        let signUpBtn = UIButton()
        signUpBtn.setTitle("Login", for: .normal)
        signUpBtn.setTitleColor(UIColor.systemBlue, for: .normal)
        signUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        signUpBtn.titleLabel?.textAlignment = .left
        view.addSubview(signUpBtn)
        return signUpBtn
    }()
    
    //MARK: - Class Variables
    var isMale: Bool = true
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUp()
        setUpBackgroundTouch()
        addBtnActions()
        
    }
    
    // MARK: - Configuration Private Functions
    
    private func setUpView() {
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    private func setUp() {
        addBackground()
        addSignUpLbl()
        addUsernameField()
        addEmailField()
        addCityField()
        addGenderPicker()
        addDateOfBirthLbl()
        addBirthdayPicker()
        addPasswordField()
        addCnfrmPsswrdField()
        addRegisterBtn()
        addLoginLbl()
        addLoginBtn()
    }
    
    private func setUpBackgroundTouch() {
        background.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        background.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    private func addBtnActions() {
        didTapLogin()
        didTapRegister()
        genderValueChange()
    }
    
    // MARK: - Adding views
    private func addUsernameField() {
        addUsernameTxtField()
        addTxtFieldBtmLine1()
    }
    
    private func addEmailField() {
        addEmailTxtField()
        addTxtFieldBtmLine2()
    }
    
    private func addCityField() {
        addCityTxtField()
        addTxtFieldBtmLine3()
    }
    
    private func addBirthdayPicker() {
        addDateOfBirthPicker()
        addTxtFieldBtmLine4()
    }
    
    private func addPasswordField() {
        addPasswordTxtField()
        addTxtFieldBtmLine5()
    }
    
    private func addCnfrmPsswrdField() {
        addCnfrmPasswordTxtField()
        addTxtFieldBtmLine6()
    }
    
    private func addBackground() {
        background.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: background, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: background, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: background, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: background, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([top, left, right, bottom])
    }
    
    private func addSignUpLbl() {
        signUpLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: signUpLbl, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: signUpLbl, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: signUpLbl, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        
        NSLayoutConstraint.activate([top, left, right])
    }
    
    private func addUsernameTxtField() {
        usernameTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: usernameTxtField, attribute: .top, relatedBy: .equal, toItem: signUpLbl, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: usernameTxtField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: usernameTxtField, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: usernameTxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine1() {
        txtFieldBtmLine1.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine1, attribute: .top, relatedBy: .equal, toItem: usernameTxtField, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine1, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine1, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addEmailTxtField() {
        emailTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: emailTxtField, attribute: .top, relatedBy: .equal, toItem: usernameTxtField, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: emailTxtField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: emailTxtField, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: emailTxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine2() {
        txtFieldBtmLine2.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .top, relatedBy: .equal, toItem: emailTxtField, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addCityTxtField() {
        cityTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: cityTxtField, attribute: .top, relatedBy: .equal, toItem: emailTxtField, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: cityTxtField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: cityTxtField, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: cityTxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine3() {
        txtFieldBtmLine3.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine3, attribute: .top, relatedBy: .equal, toItem: cityTxtField, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine3, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine3, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addGenderPicker() {
        genderPicker.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: genderPicker, attribute: .top, relatedBy: .equal, toItem: cityTxtField, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: genderPicker, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: genderPicker, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: genderPicker, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addDateOfBirthLbl() {
        dateOfBirthLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: dateOfBirthLbl, attribute: .top, relatedBy: .equal, toItem: genderPicker, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: dateOfBirthLbl, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
//        let right = NSLayoutConstraint(item: dateOfBirthLbl, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: dateOfBirthLbl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, height])
    }
    
    private func addDateOfBirthPicker() {
        dateOfBirthPicker.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: dateOfBirthPicker, attribute: .top, relatedBy: .equal, toItem: genderPicker, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: dateOfBirthPicker, attribute: .left, relatedBy: .equal, toItem: dateOfBirthLbl, attribute: .right, multiplier: 1, constant: 5)
        let right = NSLayoutConstraint(item: dateOfBirthPicker, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: dateOfBirthPicker, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine4() {
        txtFieldBtmLine4.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine4, attribute: .top, relatedBy: .equal, toItem: dateOfBirthPicker, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine4, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine4, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine4, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addPasswordTxtField() {
        passwordTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: passwordTxtField, attribute: .top, relatedBy: .equal, toItem: dateOfBirthPicker, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: passwordTxtField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: passwordTxtField, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: passwordTxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine5() {
        txtFieldBtmLine5.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine5, attribute: .top, relatedBy: .equal, toItem: passwordTxtField, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine5, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine5, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine5, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addCnfrmPasswordTxtField() {
        cnfrmPasswordTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: cnfrmPasswordTxtField, attribute: .top, relatedBy: .equal, toItem: passwordTxtField, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: cnfrmPasswordTxtField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: cnfrmPasswordTxtField, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: cnfrmPasswordTxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine6() {
        txtFieldBtmLine6.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine6, attribute: .top, relatedBy: .equal, toItem: cnfrmPasswordTxtField, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine6, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine6, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine6, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addRegisterBtn() {
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: registerBtn, attribute: .top, relatedBy: .equal, toItem: cnfrmPasswordTxtField, attribute: .bottom, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: registerBtn, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 100)
        let right = NSLayoutConstraint(item: registerBtn, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -100)
        let height = NSLayoutConstraint(item: registerBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addLoginLbl() {
        loginLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let left = NSLayoutConstraint(item: loginLbl, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 80)
        let bottom = NSLayoutConstraint(item: loginLbl, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -30)
        
        NSLayoutConstraint.activate([left, bottom])
    }
    
    private func addLoginBtn() {
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let left = NSLayoutConstraint(item: loginBtn, attribute: .left, relatedBy: .equal, toItem: loginLbl, attribute: .right, multiplier: 1, constant: -10)
        let right = NSLayoutConstraint(item: loginBtn, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let bottom = NSLayoutConstraint(item: loginBtn, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -30)
        
        NSLayoutConstraint.activate([left, right, height, bottom])
    }
    
    //MARK: - Segmented Control
    private func genderValueChange() {
        genderPicker.addTarget(self, action: #selector(handleGenderValueChange), for: .valueChanged)
    }
    
    @objc private func handleGenderValueChange(_ sender: UISegmentedControl!) {
        isMale = sender.selectedSegmentIndex == 0
    }
    
    //MARK: - RegisterUser
    private func didTapRegister() {
        registerBtn.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
    }
    
    @objc private func registerTapped() {
        if isTextDataImputed() {
            if passwordTxtField.text! == cnfrmPasswordTxtField.text! {
                registerUser()
            } else { ProgressHUD.showError("The password confirmation does not match") }
        } else {
            ProgressHUD.showError("All Fields are Required!")
        }
    }
    
    //TODO: - add error enum in another swift file for error handling purpouses
    private func registerUser() {
        ProgressHUD.show()
        FirebaseUser.registerUserWith(username: usernameTxtField.text!, email: emailTxtField.text!, city: cityTxtField.text!, isMale: isMale, dateOfBirth: dateOfBirthPicker.date, password: passwordTxtField.text!) { error in
            if error == nil {
                ProgressHUD.showSuccess("Verification email sent!")
                self.navigationController?.popViewController(animated: true)
            } else {
                ProgressHUD.showError(error!.localizedDescription)
            }
        }
    }
    
    //MARK: - Navigation Functions
    private func didTapLogin() {
        loginBtn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    private func isTextDataImputed() -> Bool {
        return usernameTxtField.text != "" && emailTxtField.text != "" && cityTxtField.text != "" && passwordTxtField.text != "" && cnfrmPasswordTxtField.text != ""
    }
}
