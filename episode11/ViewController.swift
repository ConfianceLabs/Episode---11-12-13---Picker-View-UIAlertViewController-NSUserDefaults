//
//  ViewController.swift
//  episode11
//
//  Created by apple on 19/05/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var myToolbar: UIToolbar!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var selectedState: UILabel!
    var myDataArray = ["Delhi", "Pune", "Mumbai", "Jaipur","Gurgaon","Punjab","Chennai","Banglore","Goa"];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myPicker.delegate=self
        self.myPicker.dataSource=self
        
        self.myPicker.hidden=true
        self.myToolbar.hidden=true
        
        
        self.selectedState.text=NSUserDefaults.standardUserDefaults().objectForKey("state") as? String
        
            
        
        
       
       
        
    }

    @IBAction func showAlert(sender: AnyObject) {
        
        let alertController=UIAlertController(title:"Add state",message: "Please fill the state in box.",preferredStyle: .Alert)
        
        let OKAction=UIAlertAction(title: "Add",style: .Default){(action)in
            let stateTextField=alertController.textFields![0] as UITextField
            
            let stateName=stateTextField.text!
            self.myDataArray.append(stateName)
            self.myPicker.reloadAllComponents()
            
            
        }
        alertController.addAction(OKAction)
        
        let cancelAction=UIAlertAction(title: "Cancel",style: .Default){(action)in
            
            
        }
        alertController.addAction(cancelAction)
        
        alertController.addTextFieldWithConfigurationHandler{(textfield: UITextField!) -> Void in
            textfield.placeholder="Add Your state"
            
    }
    
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myDataArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.myDataArray[row]
    }

    @IBAction func Done(sender: AnyObject) {
        
        self.selectedState.text=self.myDataArray[self.myPicker.selectedRowInComponent(0)]
        NSUserDefaults.standardUserDefaults().setValue(self.selectedState.text!, forKey: "state")
        self.myPicker.hidden=true
        self.myToolbar.hidden=true
    }

    @IBAction func openPicker(sender: AnyObject) {
        
        self.myToolbar.hidden=false
        self.myPicker.hidden=false
        
    }
}

