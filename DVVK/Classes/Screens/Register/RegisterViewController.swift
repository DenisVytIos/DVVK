//
//  RegisterViewController.swift
//  DVVK
//
//  Created by Denis on 5/4/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
  
  private let datePickerView: UIDatePicker = {
    let picker = UIDatePicker()
    picker.maximumDate = Date()
    
    return picker
  }()

//    private var models:[CellModel] = [ .userInfo]
    private let models: [HeaderModel] = [.info, .sex, .birthday]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Register"
        
        Decorator.decorate(vc: self)
        registerCells()
        delegating()
      configureDatePicker()
    }
  
  private func configureDatePicker() {
    datePickerView.addTarget(self, action: #selector(datePickerChanged(sender:)), for: .valueChanged)
  }
  @objc private func datePickerChanged(sender: UIDatePicker){
    let date = sender.date
    print(date)
  }
    private func delegating() {
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    private func registerCells() {
//        InfoUserTableViewCell
        tableView.register(InfoUserTableViewCell.nib, forCellReuseIdentifier: InfoUserTableViewCell.name)
      tableView.register(SegmenterTableViewCell.nib, forCellReuseIdentifier: SegmenterTableViewCell.name)
      tableView.register(TextTableViewCell.nib, forCellReuseIdentifier: TextTableViewCell.name)
      tableView.register(TextFieldTableViewCell.nib, forCellReuseIdentifier: TextFieldTableViewCell.name)
    }
}

extension RegisterViewController {
    fileprivate enum CellModel {
        case userInfo
        case sex
        case birthday
    }
    fileprivate enum HeaderModel: CellHeaderProtocol {
        typealias CellType = CellModel
        case sex
        case info
        case birthday
        
        var cellModels: [RegisterViewController.CellModel]{
            switch self {
            case .sex: return [.sex]
            case .info: return [.userInfo]
            case .birthday: return [.birthday]
            }
        }
    }
}

extension RegisterViewController {
    private static let tableViewTopInset: CGFloat = 16
    fileprivate class Decorator {
        static func decorate(vc: RegisterViewController) {
            vc.tableView.separatorColor = .clear
          vc.tableView.keyboardDismissMode = .onDrag
            vc.tableView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            vc.navigationController?.navigationBar.prefersLargeTitles = true
            vc.tableView.contentInset = UIEdgeInsets(top: tableViewTopInset, left: 0, bottom: 0, right: 0)
        }
    }
}
extension RegisterViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models[indexPath.section].cellModels[indexPath.row]
        switch model {
        case .userInfo:
                return 100
        case .sex, .birthday:
          return 44
        }
    }
    
}
extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerModel = models[section]
        switch headerModel {
        case .sex:
            let view = HeaderTitleView.loadFromNib()
            view.set(title: "Ваш пол:")
            return view
        default:
            return nil
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerModel = models[section]
        switch headerModel {
        case .sex, .birthday:
            return 44
        default: return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].cellModels[indexPath.row]
        switch model {
        case .userInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: InfoUserTableViewCell.name, for: indexPath) as? InfoUserTableViewCell {
                 return cell
            }
        case .sex:
          if let cell = tableView.dequeueReusableCell(withIdentifier: SegmenterTableViewCell.name, for: indexPath) as? SegmenterTableViewCell{
            cell.indexChanged = {
              index in
              
              print(index)
            }
              return cell
          }
        case .birthday:
          if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.name, for: indexPath) as? TextFieldTableViewCell{
            cell.textField.inputView = datePickerView
           return cell
            
          }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models[section].cellModels.count
        }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    }


