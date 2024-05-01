//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/20/24.
//

import UIKit

final class ChatViewController: UIViewController {
    
    private let chatView = ChatView()
    private lazy var tableView = chatView.tableView
    
    private let chatList = ChatModel.dummy()

    // MARK: - Life Cycles
    
    override func loadView() {
        view = chatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        register()
    }
}

// MARK: - Extensions

private extension ChatViewController {
    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func register() {
        tableView.register(ChatTableViewCell.self,forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatTableViewCell.identifier,
            for: indexPath
        ) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
