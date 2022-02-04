//
//  InfoViewController.swift
//  FinalTest
//
//  Created by english on 2021-12-09.
//

import UIKit

class InfoViewController: UIViewController {
    
    var context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public var selectedBook:Book?   // starts with nil
    
    @IBOutlet weak var txtTitle: UITextField!
    
    
    @IBOutlet weak var btnDelete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if self.selectedBook == nil{  // new book
            
            btnDelete.isHidden = true
            
        }
        else{
            btnDelete.isHidden = false
            
            txtTitle.text = self.selectedBook!.title
        }
        
        
        
        
    }
    
    
    @IBAction func btnSaveTouchUp(_ sender: Any) {
        
        if self.selectedBook == nil{
            let newBook = Book(context: self.context)
            newBook.title = txtTitle.text
            
            if newBook.save(context: self.context) != nil{
                navigationController?.popViewController(animated: true)
                
            }
            else{
                Toast.ok(view:self,title:"Error",message: "Something went wrong!")
            }
        }
        else{
            self.selectedBook!.title=txtTitle.text
            
            if self.selectedBook!.save(context: self.context) != nil
            {
                navigationController?.popViewController(animated: true)
            }
            
            else{
                Toast.ok(view: self, title: "Error", message: "Something went wrong!")
            }
            
            
        }
        
        
    }
    

    func deleteBook() {
        
        if self.selectedBook!.delete(context: self.context)
        {
            navigationController?.popViewController(animated:true)
        }
        else{
            Toast.ok(view:self, title:"Oops", message:"Something went wrong!")
        }

    }
    
    
    @IBAction func btnDeleteTouchUp(_ sender: Any) {
        
        let btnYes = Dialog.DialogButton(title: "Yes", style: .default, handler: {action in self.deleteBook()})
        let btnNo = Dialog.DialogButton(title: "No", style: .destructive, handler: nil)

        Dialog.show(view: self, title: "Atention!", message: "Do you really want to delete?", style: .actionSheet, completion: nil, presentAnimated: true, buttons: btnYes, btnNo)
    
    }
    
    
}
