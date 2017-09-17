//
//  DangNhapViewController.swift
//  Duy
//
//  Created by Duy on 4/25/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import FirebaseAuth

class DangNhapViewController: UIViewController {

    @IBOutlet weak var Emailtext: UITextField!
    
    
    @IBOutlet weak var Passwordtext: UITextField!
    
    
    
    @IBOutlet weak var segmentcontrol: UISegmentedControl!
    
  
    
    @IBAction func actionButton(_ sender: Any) {
        
        
        if Emailtext.text != "" && Passwordtext.text != ""
        {
            if segmentcontrol.selectedSegmentIndex == 0 // dang nhap
            {
                FIRAuth.auth()?.signIn(withEmail: Emailtext.text!, password: Passwordtext.text!, completion: { (user, error) in
                    if user != nil
                    {
                        //dang nhap thanh cong
                        print("dang nhap thanh cong")
                        self.performSegue(withIdentifier: "segue", sender: self)
                        
                        
                        
                        
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            let alertController = UIAlertController(title: "Thông báo lổi", message: "Đăng Nhập Không Thành Công", preferredStyle: UIAlertControllerStyle.alert)
                            print(myError)
                        }
                        else
                        {
                            print("loi roi")
                        }
                    }
                })
            }
            else // dang ky thanh vien
            {
                FIRAuth.auth()?.createUser(withEmail: Emailtext.text!, password: Passwordtext.text!, completion: { (user, error) in
                    if user != nil
                    {
                        //dang ky thanh cong
                        print("dangkythanhcong")
                    }
                    else
                    {
                        if let myError = error?.localizedDescription
                        {
                            print(myError)
                        }
                        else
                        {
                            print("loi roi")
                        }
                    }
                    
                })
                
            }
        }
        

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
