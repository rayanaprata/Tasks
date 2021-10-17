//
//  CreateTaskTableViewController.swift
//  Tasks
//
//  Created by Rayana Prata Neves on 15/10/21.
//

import UIKit

class CreateTaskTableViewController: UITableViewController, UITextFieldDelegate {

    private var datePicker: UIDatePicker = UIDatePicker()
    private var dateFormatter = DateFormatter()
    private var selectedIntexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        datePicker.datePickerMode = .dateAndTime
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Task Name"
        case 1: return "Category"
        case 2: return "Date and Time"
        default: return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDescriptionCell", for: indexPath) as! TaskDescriptionTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateTimeTableViewCell
            cell.textFieldDateTime.inputView = datePicker
            cell.textFieldDateTime.delegate = self
            cell.textFieldDateTime.inputAccessoryView = acessoryView()
            return cell
        }
        
    }

    // MARK: - Action Buttons
    
    @IBAction func tapSaveButton(_ sender: Any) {
        print("Task Saved")
    }
    
    // MARK: - UITextFieldDelegate Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let cell = textField.superview?.superview as? DateTimeTableViewCell
        if let dateCell = cell {
            self.selectedIntexPath = tableView.indexPath(for: dateCell)
        }
    }
    
    // MARK: - UIView Functions
    
    func acessoryView() -> UIView {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        
        let barItemSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(CreateTaskTableViewController.selectDate))
        
        toolBar.setItems([barItemSpace, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        return toolBar
    }
    
    @objc func selectDate() {
        if let indexPath = self.selectedIntexPath {
            let cell = tableView.cellForRow(at: indexPath) as? DateTimeTableViewCell
            if let dateCell = cell {
                dateCell.textFieldDateTime.text = dateFormatter.string(from: datePicker.date)
                self.view.endEditing(true)
            }
        }
    }
    
}
