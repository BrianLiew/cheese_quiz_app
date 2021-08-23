//
//  quiz_view_controller.swift
//  person quiz
//
//  Created by Brian Liew on 8/4/21.
//

import UIKit

class quiz_view_controller: UIViewController {

    // outlets
    @IBOutlet var question_label: UILabel!
    @IBOutlet var progress: UIProgressView!
    
    // multiple choice
    @IBOutlet var multiple_choice_stack: UIStackView!
    @IBOutlet var choice_1: UIButton!
    @IBOutlet var choice_2: UIButton!
    @IBOutlet var choice_3: UIButton!
    
    // multiple answer
    @IBOutlet var multiple_answer_horizontal_stack: UIStackView!
    @IBOutlet var label_vertical_stack: UIStackView!
    @IBOutlet var switch_label_1: UILabel!
    @IBOutlet var switch_label_2: UILabel!
    @IBOutlet var switch_label_3: UILabel!
    @IBOutlet var switch_label_4: UILabel!
    @IBOutlet var switch_vertical_stack: UIStackView!
    @IBOutlet var switch_1: UISwitch!
    @IBOutlet var switch_2: UISwitch!
    @IBOutlet var switch_3: UISwitch!
    
    @IBOutlet var multiple_answer_submit_button: UIButton!
    
    // slider answer
    @IBOutlet var slider_stack: UIStackView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var slider_label_1: UILabel!
    @IBOutlet var slider_label_2: UILabel!
    @IBOutlet var slider_label_3: UILabel!
    @IBOutlet var slider_submit_button: UIButton!
    
    //============================================================================================================================================
    
    // variable declaration & instantiation
    var question_index: Int = 0
    
    var questions: [question] = [
        question (
            text: "milk from?",
            type: .multiple_choice
        ),
        question (
            text: "from where?",
            type: .multiple_answer
        ),
        question (
            text: "hardness?",
            type: .slider
        )
    ]
    
    var selected_answers: [String] = []
    
    //============================================================================================================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        update_UI()
    }
    

    //============================================================================================================================================
    
    // custom functions
    func update_UI() { // updates user interface for each question
        multiple_choice_stack.isHidden = true
        multiple_answer_horizontal_stack.isHidden = true
        slider_stack.isHidden = true
        
        multiple_answer_submit_button.isHidden = true
        slider_submit_button.isHidden = true
        
        navigationItem.title = "question \(question_index + 1)"
        
        let current_question: question = questions[question_index]
        
        question_label.text = current_question.text
        
        switch current_question.type {
        case .multiple_choice:
            update_multiple_choice()
        case .multiple_answer:
            update_multiple_answer()
        case .slider:
            update_slider()
        }
    }
    
    func update_multiple_choice() {
        multiple_choice_stack.isHidden = false
        choice_1.setTitle("🐮 MOO MOO", for: .normal)
        choice_2.setTitle("🐐 *goat noises*", for: .normal)
        choice_3.setTitle("🐑 BAAA BAAA", for: .normal)
        progress.setProgress(0.33, animated: true)
    }
    
    func update_multiple_answer() {
        multiple_answer_horizontal_stack.isHidden = false
        multiple_answer_submit_button.isHidden = false
        switch_label_1.text = "'MURICA 🇺🇸🇺🇸🇺🇸"
        switch_label_2.text = region.mediterranean.rawValue
        switch_label_3.text = "northern & western european"
        switch_1.isOn = false
        switch_2.isOn = false
        switch_3.isOn = false
        progress.setProgress(0.66, animated: true)
    }
    
    func update_slider() {
        slider_stack.isHidden = false
        slider_submit_button.isHidden = false
        slider_label_1.text = hardness.soft.rawValue
        slider_label_2.text = hardness.medium.rawValue
        slider_label_3.text = hardness.hard.rawValue
        slider.setValue(0.5, animated: false)
        progress.setProgress(1, animated: true)
    }
    
    func next_question() {
        question_index += 1
        if question_index < questions.count {
            update_UI()
        } else {
            performSegue(withIdentifier: "show_results", sender: nil)
        }
    }
    
    //============================================================================================================================================

    // actions
    @IBAction func multiple_choice_selected(_ sender: UIButton) {
        switch sender {
        case choice_1:
            selected_answers.append(animal.cow.rawValue)
        case choice_2:
            selected_answers.append(animal.goat.rawValue)
        case choice_3:
            selected_answers.append(animal.sheep.rawValue)
        default:
            break
        }
        next_question()
    }
    
    @IBAction func multiple_answer_submit_button_triggered(_ sender: UIButton) {
        if switch_1.isOn {
            selected_answers.append(region.american.rawValue)
        }
        if switch_2.isOn {
            selected_answers.append(region.mediterranean.rawValue)
        }
        if switch_3.isOn {
            selected_answers.append(region.northern_western_european.rawValue)
        }
        next_question()
    }
    
    @IBAction func slider_submit_button_triggered(_ sender: UIButton) {
        switch slider.value {
        case 0...0.33:
            selected_answers.append(hardness.soft.rawValue)
        case 0.34...0.66:
            selected_answers.append(hardness.medium.rawValue)
        case 0.67...1:
            selected_answers.append(hardness.hard.rawValue)
        default:
            break
        }
        next_question()
    }
    
    @IBSegueAction func show_results(_ coder: NSCoder) -> results_view_controller? {
        return results_view_controller(coder: coder, selected_answers: selected_answers)
    }
}

