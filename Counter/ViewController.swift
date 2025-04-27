//
//  ViewController.swift
//  Counter
//
//  Created by Алексей Петров on 27.04.2025.
//

import UIKit

class ViewController: UIViewController {
    var count: Int = 0
    let formatter = DateFormatter()
    
    @IBOutlet weak var historyOfChanges: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var pushButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // настройка формата даты и времени
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // настройка журнала изменений
        historyOfChanges.text = "ИСТОРИЯ ИЗМЕНЕНИЙ:"
        historyOfChanges.isEditable = false
        historyOfChanges.layer.borderWidth = 1
        historyOfChanges.layer.borderColor = UIColor.gray.cgColor
        // настройка лейбла с показанием счетчика
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        countLabel.textAlignment = .center
        // настройка цветов кнопок
        pushButton.tintColor = .gray
        pushButton.titleLabel?.textAlignment = .center
        incrementButton.tintColor = .red
        decrementButton.tintColor = .blue
    }

    // обработка нажатия кнопки из базового задания
    @IBAction func buttonDidTapped(_ sender: Any) {
        count += 1
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение изменено на +1")
    }
    
    // обработка нажатия кнопки "+"
    @IBAction func incrementCounter(_ sender: Any) {
        count += 1
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение изменено на +1")
    }
    
    // обработка нажатия кнопки "-"
    @IBAction func decrementCounter(_ sender: Any) {
        if count > 0 {
            count -= 1
            historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение изменено на -1")
        } else {
            count = 0
            historyOfChanges.insertText("\n\(formatter.string(from: Date())): попытка уменьшить значение счётчика ниже 0")
        }
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
    }
    
    // обработка нажатия кнопки "Сброс"
    @IBAction func resetCounter(_ sender: Any) {
        count = 0
        countLabel.text = "ЗНАЧЕНИЕ СЧЁТЧИКА:\n\(count)"
        historyOfChanges.insertText("\n\(formatter.string(from: Date())): значение сброшено")
    }
    
}
