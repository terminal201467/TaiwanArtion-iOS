//
//  ShareAlertViewController.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/4.
//

import UIKit


class ShareAlertViewController: UIViewController {
    
    @IBOutlet var optionView: UIView!
    
    @IBOutlet var tableView: UITableView!
    
    private let viewModel = ShareAlertViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setGesture()
        setOptionView()
    }
    
    //設置可滑動區域
    private func setOptionView() {
        optionView.addRoundedCornersToTopLeftAndTopRight(cornerRadius: 10)
        
    }
    
    private func setGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        optionView.addGestureRecognizer(pan)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: optionView.superview)
        optionView.center.y += translation.y
        gesture.setTranslation(CGPoint.zero, in: optionView.superview)
        let maxHeight = optionView.superview!.bounds.height * 0.66
        if optionView.frame.origin.y < optionView.superview!.bounds.height - maxHeight {
            optionView.frame.origin.y = optionView.superview!.bounds.height - maxHeight
        }
        
        if optionView.frame.origin.y > view.frame.height * 0.7 {
            dismiss(animated: true)
        }
    }
    
    
    private func setTableView() {
        tableView.register(ShareAppTableViewCell.self, forCellReuseIdentifier: ShareAppTableViewCell.identifier)
        tableView.register(ShareItemsTableViewCell.self, forCellReuseIdentifier: ShareItemsTableViewCell.idnetifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(ShareItemHeaderView.self, forCellReuseIdentifier: ShareItemHeaderView.identifier)
        tableView.alwaysBounceVertical = false
        tableView.showsVerticalScrollIndicator = false
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ShareAlertViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ShareKinds(rawValue: indexPath.row) {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShareItemHeaderView.identifier, for: indexPath) as! ShareItemHeaderView
            cell.closeAction = { self.dismiss(animated: true)}
            cell.selectionStyle = .none
            return cell
        case .person:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShareItemsTableViewCell.idnetifier, for: indexPath) as! ShareItemsTableViewCell
            cell.selectionStyle = .none
            cell.shareMembers = []
            return cell
        case .socialAPP:
            let cell = tableView.dequeueReusableCell(withIdentifier: ShareAppTableViewCell.identifier, for: indexPath) as! ShareAppTableViewCell
            cell.selectionStyle = .none
            return cell
        case .copyLink:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
            cell.selectionStyle = .none
            cell.textLabel?.text = viewModel.cellForItemAt(indexPath: indexPath) as! String
            cell.accessoryView = UIImageView.init(image: UIImage(named: "copyLink"))
            return cell
        case .addReadList:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCell
            cell.selectionStyle = .none
            cell.textLabel?.text = viewModel.cellForItemAt(indexPath: indexPath) as! String
            cell.accessoryView = UIImageView.init(image: UIImage(named: "addReadingList"))
            return cell
        case .none: print("none")
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch ShareKinds(rawValue: indexPath.row) {
        case .header: return 70
        case .person: return 100
        case .socialAPP: return 100
        case .copyLink: return 50
        case .addReadList: return 50
        case .none: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }
}
