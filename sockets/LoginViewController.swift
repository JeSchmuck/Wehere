//
//  LoginViewController.swift
//  sockets
//
//  Created by Zakhar Rudenko on 07.05.16.
//  Copyright © 2016 Zakhar Rudenko. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    var token : String = ""

    //--------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func lolginButtonTapped(sender: AnyObject) {
        
        let userEmail = userEmailTextField.text as String!
        let userPassword = userPasswordTextField.text as String!
        
        if (userEmail!.isEmpty || userPassword!.isEmpty) {
            displayAlert("Все поля обязательны для заполнения")
            return
        }
//        if userPassword {
//            // Проверка на то чтобы не вылетало без кривого пароля, кароч сделать надо так, чтобы сверялся с кодом ошибки, вот
//        }
        
        let myUrl = NSURL(string: "http://176.56.50.175:8080/core/api/get-token/")
        let params = ["username" : userEmail,"password": userPassword]
        
        Alamofire.request(.POST, myUrl!, parameters: params).responseJSON { response in
            
            let token = response.result.value?.valueForKey("token")
            if (ConnectSockets.isConnection){
                if let getToken = token{
                    TokenManager.setToken(getToken as! String)
                }
            }else{
                print("PUTIN")
            }
      
//            if let json = JSON(response.result.value) {
//                self.token = json["token"].string
//                TokenManager.mainToken = self.token
//            }
          
//            if let getToken = json["token"].string {
//                self.token = getToken
//                
//                TokenManager.mainToken = self.token
//            }
        }
    }
    
    func displayAlert(userMessage:String){
        
        let myAlert=UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}