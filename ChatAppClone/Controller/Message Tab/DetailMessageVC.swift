//
//  DetailMessageVC.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/18.
//

import UIKit
import SocketIO

final class SerVice: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string:"ws://localhost:3000")!,
                                        config: [.log(true), .compress])
    
    var messages = [String]()
    
    init() {
        let socket = manager.defaultSocket
        socket.on(clientEvent: .connect) { (data, ack) in
            print("Connected")
            socket.emit("NodeJS Server Port", "Hi Node.JS Server!")
        }
        socket.on("IOS Client Port") { [weak self] (data, ack) in
            if let data = data[0] as? [String: String],
               let rawMessage = data["msg"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                }
            }
        }
        
        socket.connect()
    }
}

class DetailMessageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Received messages from Node.js:")
        print(SerVice().messages)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
