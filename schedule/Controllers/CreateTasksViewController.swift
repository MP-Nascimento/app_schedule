//
//  CreateTasksViewController.swift
//  schedule
//
//  Created by Miguel Nascimento on 14/09/21.
//

import UIKit

class CreateTasksViewController: UITableViewController, UITextFieldDelegate  {
    private var datePicker: UIDatePicker =  UIDatePicker()
    private var dateFormatter = DateFormatter()
    private var selectedIndexPath: IndexPath?
    private var taskRepository = TaskRespository.instance
    var task: Task = Task()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Descricao da tarefa"
            
        }else  if    section == 1 {
            return "Categorias"
        }else {
            return "Data e hora"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDescriptionCell", for:   indexPath) as! TaskDescrptionTableViewCell
            cell.taskDescriptionTextField.delegate = self
            return cell
        }
        
        if indexPath.section == 1 {
           let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath )
            cell.textLabel?.text  = self.task.category.name
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateTimeTableViewCell
        cell.dateTimeTextField.inputView = datePicker
        cell.dateTimeTextField.delegate = self
        cell.dateTimeTextField.inputAccessoryView = acessoryView()
        
            
        return cell
        
    }
    //Mark: Action Buttons
    @IBAction func tapSaveButton(_ sender: Any) {
        
        taskRepository.save(task: task)
        self.navigationController?.popViewController(animated: true)
    }
    //Mark: UITextViewDelegate Methods
    
    func textFieldDidBeginEditing(_ textField: UITextField )  {
        let cell = textField.superview?.superview as? DateTimeTableViewCell
        if let dateCell = cell{
            self.selectedIndexPath   =  tableView.indexPath(for: dateCell)
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if self.task.name == ""{
            self.task.name = textField.text!
        }
        else{
            self.task.date = datePicker.date
        }
        
    
    }
    //Mark: - UIView Functions
    func acessoryView() -> UIView {
        
        let  toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let barItemSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Feito", style:.done,target:self,action:#selector(selectDate))
        toolBar.setItems([barItemSpace,doneButton], animated: true)
        toolBar.isUserInteractionEnabled =  true
        toolBar.sizeToFit()
        return toolBar
        
    }
    @objc func selectDate() {
        if let indexPath = self.selectedIndexPath{
            let cell = tableView.cellForRow(at: indexPath) as? DateTimeTableViewCell
            if let dateCell = cell{
                dateCell.dateTimeTextField.text = dateFormatter.string(from: datePicker.date)
                self.view.endEditing(true)
                self.task.date = datePicker.date
            }
            
        }
    }
    //Mark: - Segue Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToCategoriesTableViewController" {
            let categorysController = segue.destination as! CategorysTableViewController
            categorysController.chosenCategory = { category in
                self.task.category = category
                self.tableView.reloadData()
            }
             
        }
    }
}
