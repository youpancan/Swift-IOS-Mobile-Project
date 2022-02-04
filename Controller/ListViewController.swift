//
//  ListViewController.swift
//  FinalTest
//
//  Created by english on 2021-12-09.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    public var loggedUserName:String=""
    
    var context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedRow:Int=0
    
    
    @IBOutlet weak var lblLoggedUserName: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLoggedUserName.text=loggedUserName
        
        tableView.delegate=self
        
        tableView.dataSource=self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Book.all(context:self.context).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        
        let book=Book.all(context: self.context)[indexPath.row]
        
        cell.textLabel!.text=book.title
        return cell
    }
    
    @IBAction func btnRefreshTouchUp(_ sender: Any) {
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedRow = indexPath.row
        
        performSegue(withIdentifier: Segue.toInfoViewEditing, sender: nil)
        
    }
    
    
    override func prepare(for segue:UIStoryboardSegue,sender:Any?)
    {
        if segue.identifier == Segue.toInfoViewEditing {
            
            let book = Book.all(context: self.context)[self.selectedRow]
            
            (segue.destination as! InfoViewController).selectedBook = book
        }
    }
    
}
