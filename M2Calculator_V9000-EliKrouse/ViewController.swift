//
//  ViewController.swift
//  M2Calculator_V9000-EliKrouse
//
//  Created by Krouse, William E. on 2/24/26.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var operand1TextField: UITextField!
    @IBOutlet weak var operand2TextField: UITextField!
    @IBOutlet weak var selectOperator: UIButton!
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func operatorButton(_ sender: Any)
    {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "+", style: .default) {_ in self.selectOperator.setTitle("+", for: .normal)})
        actionSheet.addAction( UIAlertAction(title: "-", style: .default) {_ in self.selectOperator.setTitle("-", for: .normal)})
        actionSheet.addAction( UIAlertAction(title: "*", style: .default) {_ in self.selectOperator.setTitle("*", for: .normal)})
        actionSheet.addAction( UIAlertAction(title: "/", style: .default) {_ in self.selectOperator.setTitle("/", for: .normal)})
    
    }
    
    func showAlert(_ myMessage: String, _ title: String? = "Error")
    {
        let alert = UIAlertController(title: title, message: myMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func calculate(_ sender: Any)
    {
        guard let op = selectOperator.title(for: .normal), op != "?" else
        {
            showAlert("Please select a valid operator", "Operator Error")
            return
            
        }
        
        guard let a = operand1TextField.text, let op1 = Int(a) else
        {
            showAlert("Please input a number for operand 1.")
            return
            
        }
        guard let b = operand2TextField.text, let op2 = Int(b) else
        {
            showAlert("Please input a number for operand 2.")
            return
            
        }
        var result : Int? = nil
            
        switch op
        {
        case "+":
            result = op1 + op2
        case "-":
            result = op1 - op2
        case "*":
            result = op1 + op2
        case "/":
            result = op1 - op2
        default:
            print("Invalid Operand")
        }
        guard let result = result else
        {
            return
        }
        resultLabel.text = "\(result)"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        operand1TextField.delegate = self
        operand2TextField.delegate = self
         
         ^ pogramatically adding delegation requires the extension or a pull from the main class of UITextFieldDelegate!!
         */
    }


}

extension ViewController: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else
        {
            return true
        }
        guard let _ = Int(string) else
        {
            return false
        }
        
        return true
    }
}
