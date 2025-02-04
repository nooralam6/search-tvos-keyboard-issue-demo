//
//  EnterPinViewController.swift
//  search
//
//  Created by Nooralam Shaikh on 30/01/25.
//

import TVUIKit

class EnterPinViewController: UIViewController {

    var digitEntryViewController: TVDigitEntryViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up background and other UI elements (optional)
        view.backgroundColor = .black

        // Automatically show TVDigitEntryViewController when ParentViewController is shown
        showDigitEntryViewController()

        // Register for Menu button press
//        registerForMenuButton()
    }

    // MARK: - Show TVDigitEntryViewController Automatically
    private func showDigitEntryViewController() {
        let digitEntryVC = TVDigitEntryViewController()
        digitEntryVC.title = "Enter PIN"

        addChild(digitEntryVC)
        view.addSubview(digitEntryVC.view)
        digitEntryVC.didMove(toParent: self)
        digitEntryVC.numberOfDigits = 4

        self.digitEntryViewController = digitEntryVC
    }

    // MARK: - Menu Button Handling
    private func registerForMenuButton() {
        let menuKeyCommand = UIKeyCommand(input: UIKeyCommand.inputEscape, modifierFlags: [], action: #selector(menuButtonPressed))
        addKeyCommand(menuKeyCommand)
    }

    @objc private func menuButtonPressed() {
        print("Menu button pressed")

        // Dismiss TVDigitEntryViewController when the Menu button is pressed
        dismissDigitEntryViewController()
    }

    // MARK: - Dismiss TVDigitEntryViewController
    private func dismissDigitEntryViewController() {
        if let digitEntryVC = digitEntryViewController {
            digitEntryVC.view.removeFromSuperview()
            digitEntryVC.removeFromParent()
        }
    }

    // MARK: - TVDigitEntryViewControllerDelegate Methods
    func digitEntryViewController(_ digitEntryViewController: TVDigitEntryViewController, didComplete digits: String) {
        print("Entered digits: \(digits)")
    }

    func digitEntryViewControllerDidCancel(_ digitEntryViewController: TVDigitEntryViewController) {
        print("Digit entry canceled.")
        dismissDigitEntryViewController()
    }
}
