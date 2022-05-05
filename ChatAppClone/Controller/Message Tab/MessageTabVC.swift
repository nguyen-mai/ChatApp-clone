//
//  MessageTabVC.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/7.
//

import UIKit

class MessageTabVC: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var container: UIView!
    @IBOutlet var newMessageBtn: UIButton!
    
    var users = User.getDummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        customUI()
    }
    
    private func customUI() {
                
        Custom.custom.customLabel(label: titleLabel, text: "Message", font: "Lato-Bold", size: 32, color: .white)
        
        container.layer.cornerRadius = 40
        newMessageBtn.layer.cornerRadius = newMessageBtn.frame.size.width / 2
    }
}

extension MessageTabVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.configure(with: users[indexPath.item])
        return cell
    }
}

extension MessageTabVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        cell.configure(with: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            print("index path of delete: \(indexPath)")
            self.users.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
//            self.edit
            print("index path of edit: \(indexPath)")
            completionHandler(true)
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        // không kéo hết cell
        swipeActions.performsFirstActionWithFullSwipe = false
        return swipeActions
    }
        
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailMessageVC") as! DetailMessageVC
        navigationController?.pushViewController(vc, animated: true)
    }
}

