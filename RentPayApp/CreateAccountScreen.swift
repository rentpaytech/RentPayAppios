//
//  CreateAccountScreen.swift
//  RentPayApp
//
//  Created by yadav, Ritik on 12/05/23.
//

import UIKit

class CreateAccountScreen: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var enterFirstName: UITextField!
    
    @IBOutlet weak var enterMiddleName: UITextField!
    
    @IBOutlet weak var enterLastName: UITextField!
    
    @IBOutlet weak var enterEmail: UITextField!
    
    @IBOutlet weak var enterDateOfBirth: UITextField!
    
    @IBAction func signUp(_ sender: UIButton) {
        print(enterFirstName.text!)
        print(enterMiddleName.text!)
        print(enterLastName.text!)
        print(enterEmail.text!)
        print(enterDateOfBirth.text!)
        performSegue(withIdentifier: "createAccountToHome", sender: self)
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAccountToHome" {
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
