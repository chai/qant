//
//  LoginViewController.swift
//  qant
//
//  Created by Chai on 9/7/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit




class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    
    //MARK: Properties
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
   
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            // User is already logged in, do work such as go to next view controller.
                      write_log( "Permission to use FB Login already provided previously")
        }
        else
        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.delegate = self
        }
     
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Actions
    

    @IBAction func localLoginButton(sender: UIButton) {
 
        
        write_log("restr")
        
        //returnUserData()
      //  loginButton()
        
        self.returnUserData()
    }
    
    
    
    //MARK: Action
    
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                write_log("Error: \(error)")
            }
            else
            {
               write_log ("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
             write_log(  "User Name is: \(userName)")
               // let userEmail : NSString = result.valueForKey("email") as! NSString
                //self.statusLabel.text = self.statusLabel.text! + "User Email is: \(userEmail)"
            }
        })
    }
    
    
    
    
    let facebookReadPermissions = ["public_profile", "email", "user_friends"]
    //Some other options: "user_about_me", "user_birthday", "user_hometown", "user_likes", "user_interests", "user_photos", "friends_photos", "friends_hometown", "friends_location", "friends_education_history"
    
    func loginToFacebookWithSuccess(successBlock: () -> (), andFailure failureBlock: (NSError?) -> ()) {
        
        if FBSDKAccessToken.currentAccessToken() != nil {
            //For debugging, when we want to ensure that facebook login always happens
            //FBSDKLoginManager().logOut()
            //Otherwise do:
            return
        }
        
        FBSDKLoginManager().logInWithReadPermissions(self.facebookReadPermissions, handler: { (result:FBSDKLoginManagerLoginResult!, error:NSError!) -> Void in
            if error != nil {
                //According to Facebook:
                //Errors will rarely occur in the typical login flow because the login dialog
                //presented by Facebook via single sign on will guide the users to resolve any errors.
                
                // Process error
                FBSDKLoginManager().logOut()
                failureBlock(error)
            } else if result.isCancelled {
                // Handle cancellations
                FBSDKLoginManager().logOut()
                failureBlock(nil)
            } else {
                // If you ask for multiple permissions at once, you
                // should check if specific permissions missing
                var allPermsGranted = true
                
                //result.grantedPermissions returns an array of _NSCFString pointers
                let grantedPermissions = Array(result.grantedPermissions).map( {"\($0)"} )
                for permission in self.facebookReadPermissions {
                    if grantedPermissions.contains(permission) {
                        allPermsGranted = false
                        break
                    }
                }
                if allPermsGranted {
                    // Do work
                    let fbToken = result.token.tokenString
                    let fbUserID = result.token.userID
                    
                              write_log ("fbToken: \(fbToken) \n fbUserID: \(fbUserID)")
                    
                    //Send fbToken and fbUserID to your web API for processing, or just hang on to that locally if needed
                    //self.post("myserver/myendpoint", parameters: ["token": fbToken, "userID": fbUserId]) {(error: NSError?) ->() in
                    //	if error != nil {
                    //		failureBlock(error)
                    //	} else {
                    //		successBlock(maybeSomeInfoHere?)
                    //	}
                    //}
                    
                    successBlock()
                } else {
                    //The user did not grant all permissions requested
                    //Discover which permissions are granted
                    //and if you can live without the declined ones
                    
                    failureBlock(nil)
                }
            }
        })
    }
    
    //MARK: Delegates
    
    
    // Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        write_log("User Logged In")
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
      write_log("User Logged Out")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
