//
//  ViewController.swift
//  Counter
//
//  Created by Алексей Петров on 27.04.2025.
//

import UIKit

final class ViewController: UIViewController {
    private var count: Int = 0
    private let formatter = DateFormatter()
    
    @IBOutlet weak private var historyOfChanges: UITextView!
    @IBOutlet weak private var resetButton: UIButton!
    @IBOutlet weak private var decrementButton: UIButton!
    @IBOutlet weak private var incrementButton: UIButton!
    @IBOutlet weak private var countLabel: UILabel!
    @IBOutlet weak private var pushButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // настройка формата даты и времени
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // настройка журнала изменений
        historyOfChanges.text = UserDefaults.standard.string(forKey: "history.historyOfChanges") ?? "ИСТОРИЯ ИЗМЕНЕНИЙ:"
        historyOfChanges.isEditable = false
        historyOfChanges.layer.borderWidth = 1
        historyOfChanges.layer.borderColor = UIColor.gray.cgColor
        // настройка лейбла с показанием счетчика
        let countFromMemory = UserDefaults.standard.integer(forKey: "lastValue.count")
        count = countFromMemory
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        countLabel.textAlignment = .center
        // настройка цветов кнопок
        pushButton.tintColor = .gray
        pushButton.titleLabel?.textAlignment = .center
        incrementButton.tintColor = .red
        decrementButton.tintColor = .blue
    }

    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(count, forKey: "lastValue.count")
        UserDefaults.standard.set(historyOfChanges.text, forKey: "history.historyOfChanges")
    }
    
    // обработка нажатия кнопки из базового задания
    @IBAction private func buttonDidTapped(_ sender: Any) {
        count += 1
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение изменено на +1")
    }
    
    // обработка нажатия кнопки "+"
    @IBAction private func incrementCounter(_ sender: Any) {
        count += 1
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение изменено на +1")
    }
    
    /// обработка нажатия кнопки "-"
    @IBAction private func decrementCounter(_ sender: Any) {
        if count > 0 {
            count -= 1
            historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение изменено на -1")
        } else {
            count = 0
            historyOfChanges.insertText("\n\(formatter.string(from: Date())): попытка уменьшить значение счётчика ниже 0")
        }
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
    }
    
    /// Обработка нажатия кнопки "Сброс"
    /// - Parameter sender: Объект, у которого возникло событие (кнопка "Сброс")
    ///
    /// Когда нажимается данная кнопка, происходит обнуление счётчика (переменной count присваивается значение 0), в лейбе отображается соответствующее значение счётчика, а в журнале истории появляется соответствующая информация о сбросе
    @IBAction private func resetCounter(_ sender: Any) {
        count = 0
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение сброшено")
    }
    
}
