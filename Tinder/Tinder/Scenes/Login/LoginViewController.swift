//
//  LoginViewController.swift
//  Tinder
//
//  Created by Ellen_Kapii on 08.11.22.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {
    // MARK: - UIViews
    private lazy var loginBackground: UIImageView = {
        let loginBackground = UIImageView()
        loginBackground.contentMode = .scaleAspectFill
        loginBackground.image = UIImage(named: "loginBackground")
        view.addSubview(loginBackground)
        return loginBackground
    }()
    
    private lazy var loginLbl: UILabel = {
        let loginLbl = UILabel()
        loginLbl.text = "Login"
        loginLbl.font = UIFont.boldSystemFont(ofSize: 36)
        loginLbl.textColor = .white
        loginLbl.textAlignment = .center
        view.addSubview(loginLbl)
        return loginLbl
    }()
    
    private lazy var emailLbl: UILabel = {
        let emailLbl = UILabel()
        emailLbl.text = "Email"
        emailLbl.font = UIFont.boldSystemFont(ofSize: 20)
        emailLbl.textColor = .white
        emailLbl.textAlignment = .left
        view.addSubview(emailLbl)
        return emailLbl
    }()
    
    private lazy var emailTxtField: UITextField = {
        let emailTxtField = UITextField()
        emailTxtField.font = UIFont.boldSystemFont(ofSize: 15)
        emailTxtField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray2])
        emailTxtField.backgroundColor = .clear
        view.addSubview(emailTxtField)
        return emailTxtField
    }()
    
    private lazy var txtFieldBtmLine: UIView = {
        let txtFieldBtmLine = UIView()
        txtFieldBtmLine.backgroundColor = .white
        txtFieldBtmLine.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine)
        return txtFieldBtmLine
    }()
    
    private lazy var passwordLbl: UILabel = {
        let passwordLbl = UILabel()
        passwordLbl.text = "Password"
        passwordLbl.font = UIFont.boldSystemFont(ofSize: 20)
        passwordLbl.textColor = .white
        passwordLbl.textAlignment = .left
        view.addSubview(passwordLbl)
        return passwordLbl
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
    
    private lazy var txtFieldBtmLine2: UIView = {
        let txtFieldBtmLine2 = UIView()
        txtFieldBtmLine2.backgroundColor = .white
        txtFieldBtmLine2.layer.cornerRadius = 5
        view.addSubview(txtFieldBtmLine2)
        return txtFieldBtmLine2
    }()
    
    private lazy var forgotPassBtn: UIButton = {
        let forgotPassBtn = UIButton()
        forgotPassBtn.setTitle("Forgot Password?", for: .normal)
        forgotPassBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(forgotPassBtn)
        return forgotPassBtn
    }()
    
    private lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("LOGIN", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        loginBtn.backgroundColor = .green
        loginBtn.layer.cornerRadius = 10
        view.addSubview(loginBtn)
        return loginBtn
    }()
    
    private lazy var signUpLbl: UILabel = {
        let signUpLbl = UILabel()
        signUpLbl.text = "Don't have an account?"
        signUpLbl.textColor = .white
        signUpLbl.textAlignment = .left
        signUpLbl.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(signUpLbl)
        return signUpLbl
    }()
    
    private lazy var signUpBtn: UIButton = {
        let signUpBtn = UIButton()
        signUpBtn.setTitle("Sign up", for: .normal)
        signUpBtn.setTitleColor(UIColor.systemBlue, for: .normal)
        signUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        signUpBtn.titleLabel?.textAlignment = .left
        view.addSubview(signUpBtn)
        return signUpBtn
    }()
    
    // MARK: - Class constants
    
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpBackgroundTouch()
        addBtnActions()
    }
    
    // MARK: - Configuration Private Functions
    private func setUp() {
        addLoginBackground()
        addLoginLbl()
        addEmailField()
        addPasswordField()
        addForgotPassBtn()
        addLoginBtn()
        addSignUp()
    }
    
    private func setUpBackgroundTouch() {
        loginBackground.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        loginBackground.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    private func addBtnActions() {
        didTapSignUp()
        didTapForgotPassword()
        didTapLogin()
    }
    
    // MARK: - Adding views
    private func addEmailField() {
        addEmailLbl()
        addEmailTxtField()
        addTxtFieldBtmLine()
    }
    
    private func addPasswordField() {
        addPasswordLbl()
        addPasswordTxtField()
        addTxtFieldBtmLine2()
    }
    
    private func addSignUp() {
        addSignUpLbl()
        addSignUpBtn()
    }
    
    private func addLoginBackground() {
        loginBackground.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: loginBackground, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: loginBackground, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0)
        let right = NSLayoutConstraint(item: loginBackground, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0)
        let bottom = NSLayoutConstraint(item: loginBackground, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([top, left, right, bottom])
    }
    
    private func addLoginLbl() {
        loginLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: loginLbl, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: loginLbl, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: loginLbl, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        
        NSLayoutConstraint.activate([top, left, right])
    }
    
    private func addEmailLbl() {
        emailLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: emailLbl, attribute: .top, relatedBy: .equal, toItem: loginLbl, attribute: .bottom, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: emailLbl, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: emailLbl, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        
        NSLayoutConstraint.activate([top, left, right])
    }
    
    private func addEmailTxtField() {
        emailTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: emailTxtField, attribute: .top, relatedBy: .equal, toItem: emailLbl, attribute: .top, multiplier: 1, constant: 20)
        let left = NSLayoutConstraint(item: emailTxtField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: emailTxtField, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: emailTxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine() {
        txtFieldBtmLine.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine, attribute: .top, relatedBy: .equal, toItem: emailTxtField, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addPasswordLbl() {
        passwordLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: passwordLbl, attribute: .top, relatedBy: .equal, toItem: txtFieldBtmLine, attribute: .bottom, multiplier: 1, constant: 25)
        let left = NSLayoutConstraint(item: passwordLbl, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: passwordLbl, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        
        NSLayoutConstraint.activate([top, left, right])
    }
    
    private func addPasswordTxtField() {
        passwordTxtField.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: passwordTxtField, attribute: .top, relatedBy: .equal, toItem: passwordLbl, attribute: .top, multiplier: 1, constant: 20)
        let left = NSLayoutConstraint(item: passwordTxtField, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: passwordTxtField, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: passwordTxtField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addTxtFieldBtmLine2() {
        txtFieldBtmLine2.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .top, relatedBy: .equal, toItem: passwordTxtField, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 16)
        let right = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -16)
        let height = NSLayoutConstraint(item: txtFieldBtmLine2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 2)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addForgotPassBtn() {
        forgotPassBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: forgotPassBtn, attribute: .top, relatedBy: .equal, toItem: txtFieldBtmLine2, attribute: .bottom, multiplier: 1, constant: 0)
        let left = NSLayoutConstraint(item: forgotPassBtn, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 5)
        let width = NSLayoutConstraint(item: forgotPassBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        let height = NSLayoutConstraint(item: forgotPassBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        
        NSLayoutConstraint.activate([top, left, width, height])
        
    }
    
    private func addLoginBtn() {
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: forgotPassBtn, attribute: .bottom, multiplier: 1, constant: 50)
        let left = NSLayoutConstraint(item: loginBtn, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 100)
        let right = NSLayoutConstraint(item: loginBtn, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -100)
        let height = NSLayoutConstraint(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        
        NSLayoutConstraint.activate([top, left, right, height])
    }
    
    private func addSignUpLbl() {
        signUpLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let left = NSLayoutConstraint(item: signUpLbl, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 80)
        let bottom = NSLayoutConstraint(item: signUpLbl, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -30)
        
        NSLayoutConstraint.activate([left, bottom])
    }
    
    private func addSignUpBtn() {
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let left = NSLayoutConstraint(item: signUpBtn, attribute: .left, relatedBy: .equal, toItem: signUpLbl, attribute: .right, multiplier: 1, constant: -10)
        let right = NSLayoutConstraint(item: signUpBtn, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -50)
        let height = NSLayoutConstraint(item: signUpBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        let bottom = NSLayoutConstraint(item: signUpBtn, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -30)
        
        NSLayoutConstraint.activate([left, right, height, bottom])
    }
    
    //MARK: - Forgot Password
    private func didTapForgotPassword() {
        forgotPassBtn.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
    }
    
    @objc private func forgotPasswordTapped() {
        if emailTxtField.text != "" {
            FirebaseUser.resetPasswordFor(email: emailTxtField.text!) { error in
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                } else {
                    ProgressHUD.showSuccess("Please check your email!")
                }
            }
        } else {
            ProgressHUD.showError("Please Insert Your Email Address.")
        }
    }
    
    //MARK: - Login
    private func didTapLogin() {
        loginBtn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc private func loginTapped() {
        if emailTxtField.text != "" && passwordTxtField.text != "" {
            ProgressHUD.show()
            FirebaseUser.loginUserWith(email: emailTxtField.text!, password: passwordTxtField.text!) { [self] error, isEmailVerified in
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                } else if isEmailVerified {
                    ProgressHUD.dismiss()
                    goToApp()
                } else {
                    ProgressHUD.showError("Please verify your email address!")
                }
            }
        } else {
            ProgressHUD.showError("All Fields are Required!")
        }
    }
    
    //MARK: - Navigation Functions
    private func didTapSignUp() {
        signUpBtn.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    
    @objc private func signUpTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: RegistrationViewController.identifier) as? RegistrationViewController
        guard let vc = vc else { return }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func goToApp() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainView = storyboard.instantiateViewController(withIdentifier: "MainView") as? UITabBarController
        guard let mainView = mainView else { return }
        mainView.modalPresentationStyle = .fullScreen
        self.present(mainView, animated: true)
    }
}
