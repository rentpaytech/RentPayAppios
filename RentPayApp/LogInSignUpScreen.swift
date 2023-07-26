//
//  ViewController.swift
//  RentPayApp
//
//  Created by yadav, Ritik on 11/05/23.
//

import UIKit
import FirebaseCore

class LogInSignUpScreen: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var enterPhoneNumber: UITextField!
    
    @IBOutlet weak var enterOtp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Add observer for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Add tap gesture recognizer to dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        scrollView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func verifyButton(_ sender: UIButton) {
        if let phoneNumber = enterPhoneNumber.text {
            print("Phone number entered: \(phoneNumber)")
            let modifiedPhoneNumber = "+91" + phoneNumber
            print("Modified phone number: \(modifiedPhoneNumber)")
            AuthManager.shared.startAuth(phoneNumber: modifiedPhoneNumber) { [weak self] success in
                guard success else {return}
            }
        }
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        if let otp = enterOtp.text {
            print("OTP entered: \(otp)")
            AuthManager.shared.verifyCode(smsCode: otp) { [weak self] success in
                guard success else {return}
            }
        }
        performSegue(withIdentifier: "logInToCreateAccount", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logInToCreateAccount" {
            // Add any data to pass to CreateAccountScreen
        }
    }
    
    // Code to lift screen up when keyboard comes on screen
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
        
        var visibleRect = view.frame
        visibleRect.size.height -= keyboardFrame.height
        if let activeTextField = findActiveTextField(in: scrollView) {
            if !visibleRect.contains(activeTextField.frame.origin) {
                scrollView.scrollRectToVisible(activeTextField.frame, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = .zero
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func findActiveTextField(in view: UIView) -> UITextField? {
        for subview in view.subviews {
            if let textField = subview as? UITextField, textField.isFirstResponder {
                return textField
            } else if let activeTextField = findActiveTextField(in: subview) {
                return activeTextField
            }
        }
        
        return nil
    }
    
}

