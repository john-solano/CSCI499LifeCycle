//
//  AddItemFormVC.swift
//  LifeCycle
//
//  Created by John Solano on 10/25/20.
//  Copyright © 2020 John Solano. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseDatabase

// structure of an item
public struct Item: Codable {

    let refID: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case refID
        case name
    }
}


class AddItemFormVC: UIViewController {


    @IBOutlet weak var buttonCancel: UIBarButtonItem!
    @IBOutlet weak var labelItemName: UILabel!
    @IBOutlet weak var textfieldItemName: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.AppColors.AshGrey
    }
    
    // add item to users list of items
    func addRefToUserList(item: Item){
        
        print(item)
        print(item.refID)
        print(item.name)
        
        let userID = Auth.auth().currentUser!.uid
        print(userID)
        //ref to db
        let db = Firestore.firestore()
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        let userRef = db.collection("users").document("\(userID)")
        
        print(userRef)
        
    ref.child("users").child("\(userID)").child("items").setValue(["refID": item.refID])
        
        /*ref.child("users").child(userID).child("items").setValue(
            [
                "refID": item.refID,
            ]
        ){
          (error:Error?, ref:DatabaseReference) in
          if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("\n*** New Item Added to User ***")
            print(item)
            print("***\n")
          }
        }*/
            
                

    }
    
    
    // Adds text in itemName to db
    @IBAction func addItemBtn(_ sender: Any) {
        //ref to db
        let db = Firestore.firestore()
        
        //ref to userID
        //let userID = Auth.auth().currentUser?.uid
        
        // Get text in item Name
        let name = textfieldItemName.text!
        
        // Make an empty document in items collection with autogenerated ID in DB
        let newItemRef = db.collection("items").document()
        
        // from item struct, Make an item object
        let Newitem = Item(
            refID: "\(newItemRef.documentID)",
            name: "\(name)"
        )
        
        do {
            try db.collection("items").document("\(newItemRef.documentID)").setData(from: Newitem)
                print("\n*** New Item Added to DB ***")
                print(Newitem)
                print(newItemRef.documentID)
                print("***\n")
            
        } catch let error {
            print("Error writing city to Firestore: \(error)")
        }
        
        //print(name)// Testitem
        //print(Newitem) // Item(name: "Testitem")
        //print(newItemRef.documentID) // idruO37rH0hmFOPPuRfp
        
       addRefToUserList(item: Newitem)
        
        
 
    }
    
    @IBAction func buttonCancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
