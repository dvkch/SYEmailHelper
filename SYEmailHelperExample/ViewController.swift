//
//  ViewController.swift
//  SYEmailHelperExample
//
//  Created by Stanislas Chevallier on 20/03/2019.
//  Copyright © 2019 Syan. All rights reserved.
//

import UIKit
import SYEmailHelper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        completionLabel.text = nil
    }
    
    // MARK: Views
    @IBOutlet private var emailField: UITextField!
    @IBOutlet private var subjectField: UITextField!
    @IBOutlet private var bodyField: UITextField!
    @IBOutlet private var completionLabel: UILabel!

    // MARK: Actions
    @IBAction private func sendButtonTap(sender: UIButton?) {
        
        completionLabel.text = nil
        
        PasteboardEmailService.name = "Copy email address to pasteboard"
        
        EmailHelper.shared.showCopyToPasteBoard = true
        EmailHelper.shared.actionSheetTitle = "Which app you wanna use?"
        EmailHelper.shared.actionSheetMessage = "We support some third party apps, native email client and copying to clipboard if your favorite app is not supported"
        EmailHelper.shared.actionSheetCancelButtonText = "Meh..."
        
        EmailHelper.shared.presentActionSheet(
            address: emailField.text,
            subject: subjectField.text,
            body: bodyField.text,
            presentingViewController: self,
            sender: sender)
        { (canceled, service, error) in
            if (canceled) {
                self.completionLabel.text = "User cancelled"
            }
            else if let service = service, let error = error {
                self.completionLabel.text = String(format: "Service %@ encountered error: %@", service.name, error.localizedDescription)
            }
            else if let error = error {
                self.completionLabel.text = String(format: "Encountered error: %@", error.localizedDescription)
            }
            else if let service = service {
                self.completionLabel.text = String(format: "No error, used service %@", service.name)
            }
        }
    }
}
