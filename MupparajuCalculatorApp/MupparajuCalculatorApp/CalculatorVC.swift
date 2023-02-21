//
//  ViewController.swift
//  MupparajuCalculatorApp
//
//  Created by Mupparaju,Lakshmi on 2/10/23.
//

import UIKit
import MathExpression
import Foundation

class CalculatorVC: UIViewController {

 
    @IBOutlet weak var mathExpressionLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearExpression(_ sender: UIButton) {
        self.mathExpressionLBL.text = " "
    }
    
    @IBAction func backspace(_ sender: UIButton) {
        if let txt = mathExpressionLBL.text{
            mathExpressionLBL.text = String(txt.dropLast())
        }
    }
    
    @IBAction func flipsign(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                  if let result = try? self.evaluate(exp: expression) {
                      if result == 0 {
                          mathExpressionLBL.text = "0"
                      } else {
                          mathExpressionLBL.text = String(result * -1)
                      }
                  }
          
    }
    
    @IBAction func percent(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                      if let result = try? self.evaluate(exp: self.mathExpressionLBL.text!) {
                          mathExpressionLBL.text = String(result / 100)
                      }
    }
    
    @IBAction func naturalLog(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                        if let result = try? self.evaluate(exp: expression) {
                            mathExpressionLBL.text = String(log(result))
    }
    
    @IBAction func factorial(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                      if let result = try? self.evaluate(exp: expression) {
                          mathExpressionLBL.text = String(factorial(Int(result)))
                      }
            }
        func factorial(_ n: Int) -> Int {
                if n <= 1 {
                    return 1
                }
                return n * factorial(n - 1)
            }
    
    @IBAction func tenPow(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                        if let result = try? self.evaluate(exp: expression) {
                            mathExpressionLBL.text = String(pow(10, result))
                        }
    }
    
    @IBAction func calcSin(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                      if let result = try? self.evaluate(exp: expression) {
                          mathExpressionLBL.text = String(sin(result))
                      }
       
      
    }
    
    
    @IBAction func calcCos(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
               if let result = try? self.evaluate(exp: expression) {
                        mathExpressionLBL.text = String(cos(result))
                    }
        
    }
    
    @IBAction func calcTan(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                        if let result = try? self.evaluate(exp: expression) {
                            mathExpressionLBL.text = String(tan(result))
                        }
        
    }
    
    @IBAction func inverse(_ sender: UIButton) {
        let expression = self.mathExpressionLBL.text!
                       if let result = try? self.evaluate(exp: expression) {
                           mathExpressionLBL.text = String(1 / result)
                       }
    }
    
    
    @IBAction func result(_ sender: UIButton) {
        guard let Title = sender.titleLabel, let buttonText = Title.text else {
                  return
              }
              guard let exprsn = self.mathExpressionLBL.text else{
                  return
              }
              
              if buttonText == "="{
                 // let value = self.evaluate(exp: "\(expression + "0")")
                  let value = self.evaluate(exp: exprsn + "+0")
                  self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
                  return
              }
    }
    
    @IBAction func tappedChar(_ sender: UIButton) {
        guard let Title = sender.titleLabel, let btnText = Title.text else {
                    return
                }
                guard let exprsn = self.mathExpressionLBL.text else{
                    return
                }
         if btnText == "="{
            let value = self.evaluate(exp: exprsn + "+0")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            return
        }
                
                if btnText == "-" || btnText == "+"{
                    let value = self.evaluate(exp: exprsn + "+0")
                    self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
                    self.mathExpressionLBL.text! += btnText == "-" ? "-" : "+"
                    
                }
                else if btnText == "×" || btnText == "÷"{
                    let expression = self.mathExpressionLBL.text!
                    let lastChar = expression.last ?? "0"
                    if lastChar.isNumber{
                        let value = self.evaluate(exp: expression)
                        self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
                    }else if lastChar == "."{
                        self.mathExpressionLBL.text?.removeLast()
                    }
                     if btnText == "×"{
                        self.mathExpressionLBL.text! += "*"
                    }
                    else if btnText == "÷"{
                        self.mathExpressionLBL.text! += "/"
                    }
                    
                }
                else{
                    if self.mathExpressionLBL.text == "0"{
                        self.mathExpressionLBL.text! = btnText
                    }else{
                        self.mathExpressionLBL.text! += btnText
                    }
                    
                }
                
                
            }
            
         private func evaluate(exp: String) -> Double {
            do{
             let exp = try MathExpression(exp)
                return exp.evaluate()
            }
            catch{
                print("Invalid expression")
            }
            return 0.0
        }
    private func isInteger(value: Double)-> Bool{
        value.truncatingRemainder(dividingBy: 1.0).isZero
    }
        
    }//class looop
    

