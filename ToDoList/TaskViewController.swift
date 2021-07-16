//
//  TaskViewController.swift
//  ToDoList
//
//  Created by Jordan Daniels on 7/10/21.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!;
    
    var task: String?;
    var updateFromDelete: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad();
        
        label.text = task;

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        let defaults = UserDefaults();
        var tasks = defaults.value(forKey: "tasks") as? [String] ?? [String]();
        tasks.remove(at: tasks.firstIndex(of: task!)!);
        defaults.setValue(tasks, forKey: "tasks");
        updateFromDelete?();
        navigationController?.popViewController(animated: true)

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
