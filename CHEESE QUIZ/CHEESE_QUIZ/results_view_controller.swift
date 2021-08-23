//
//  results_view_controller.swift
//  person quiz
//
//  Created by Brian Liew on 8/4/21.
//

import UIKit

class results_view_controller: UIViewController {

    @IBOutlet var results_label: UILabel!
    @IBOutlet var results_description_label: UILabel!
    @IBOutlet var first_view: UIView!
    @IBOutlet var second_view: UIView!
    @IBOutlet var third_view: UIView!
    @IBOutlet var first_view_label: UILabel!
    @IBOutlet var second_view_label: UILabel!
    @IBOutlet var third_view_label: UILabel!
    @IBOutlet var first_view_location: UILabel!
    @IBOutlet var second_view_location: UILabel!
    @IBOutlet var third_view_location: UILabel!
    @IBOutlet var first_view_description: UILabel!
    @IBOutlet var second_view_description: UILabel!
    @IBOutlet var third_view_description: UILabel!
    
    var selected_answers: [String]
    var final_results: [cheese] = []
    
    var american_cheeses: [cheese] = [
        cheese (name: "Provel", codename: .provel, description: " ", animal: .cow, region: .american, hardness: .soft),
        cheese (name: "Pepperjack", codename: .pepperjack, description: " ", animal: .cow, region: .american, hardness: .medium),
        cheese (name: "Cheddar", codename: .cheddar, description: " ", animal: .cow, region: .american, hardness: .hard),
        cheese (name: "Bonne Bouche", codename: .bonne_bouche, description: " ", animal: .goat, region: .american, hardness: .soft),
        cheese (name: "Humbolt Fog", codename: .humbolt_fog, description: " ", animal: .goat, region: .american, hardness: .medium),
        cheese (
            name: "Idaho Goatster",
            codename: .idaho_goatster,
            description: "you'll be surprised to know that this cheese isn't made of potatoes",
            animal: .goat,
            region: .american,
            hardness: .hard),
        cheese (
            name: "Morcella",
            codename: .morcella,
            description: " ",
            animal: .sheep,
            region: .american,
            hardness: .soft),
        cheese (name: "Bohemian Blue", codename: .bohemian_blue, description: " ", animal: .sheep, region: .american, hardness: .hard)
    ]
    
    var mediterranean_cheeses: [cheese] = [
        cheese (name: "Gorgonzola", codename: .gorgonzola, description: " ", animal: .cow, region: .mediterranean, hardness: .soft),
        cheese (name: "Provolone", codename: .provolone, description: " ", animal: .cow, region: .mediterranean, hardness: .medium),
        cheese (
            name: "Parmesan",
            codename: .parmesan,
            description: "meatball subs or bust",
            animal: .cow,
            region: .mediterranean,
            hardness: .hard),
        cheese (name: "Katiki", codename: .katiki, description: " ", animal: .goat, region: .mediterranean, hardness: .soft),
        cheese (name: "Anthotyros", codename: .anthotyros, description: " ", animal: .goat, region: .mediterranean, hardness: .medium),
        cheese (name: "Fleur De Marquis", codename: .fluer_de_marquis, description: " ", animal: .sheep, region: .mediterranean, hardness: .soft),
        cheese (
            name: "Feta",
            codename: .feta,
            description: "perfect for bread-less sandwiches called greek salads",
            animal: .sheep,
            region: .mediterranean,
            hardness: .medium
        ),
        cheese (name: "Pecorino Sardo", codename: .pecorino_sardo, description: " ", animal: .sheep, region: .mediterranean, hardness: .hard)
    ]
    
    var northern_western_european_cheeses: [cheese] = [
        cheese (name: "Limburger", codename: .limburger, description: " ", animal: .cow, region: .northern_western_european, hardness: .soft),
        cheese (name: "Gouda", codename: .gouda, description: " ", animal: .cow, region: .northern_western_european, hardness: .medium),
        cheese (name: "Emmental", codename: .emmental, description: " ", animal: .cow, region: .northern_western_european, hardness: .hard),
        cheese (name: "Golden Cross", codename: .golden_cross, description: " ", animal: .goat, region: .northern_western_european, hardness: .soft),
        cheese (name: "Clochette", codename: .clochette, description: " ", animal: .goat, region: .northern_western_european, hardness: .medium),
        cheese (name: "Garrotxa", codename: .garrotxa, description: " ", animal: .goat, region: .northern_western_european, hardness: .hard),
        cheese (name: "Yorkshire Blue", codename: .yorkshire_blue, description: " ", animal: .sheep, region: .northern_western_european, hardness: .medium),
        cheese (name: "Roncal", codename: .roncal, description: " ", animal: .sheep, region: .northern_western_european, hardness: .hard)
    ]
    
    init?(coder: NSCoder, selected_answers: [String]) {
        self.selected_answers = selected_answers
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculate_result()
        update_UI()
    }

    func calculate_result() {
        if selected_answers.contains(region.american.rawValue) {
            for entry in american_cheeses {
                if entry.animal.rawValue == selected_answers.first && entry.hardness.rawValue == selected_answers.last {
                    final_results.append(entry)
                }
            }
        }
        if selected_answers.contains(region.mediterranean.rawValue) {
            for entry in mediterranean_cheeses {
                if entry.animal.rawValue == selected_answers.first && entry.hardness.rawValue == selected_answers.last {
                    final_results.append(entry)
                }
            }
        }
        if selected_answers.contains(region.northern_western_european.rawValue) {
            for entry in northern_western_european_cheeses {
                if entry.animal.rawValue == selected_answers.first && entry.hardness.rawValue == selected_answers.last {
                    final_results.append(entry)
                }
            }
        }
        
        if final_results.count != 0 {
            results_label.text = final_results[0].name
        }
        
    }
    
    func update_UI() {
        first_view.isHidden = true
        second_view.isHidden = true
        third_view.isHidden = true
        switch final_results.count {
        case 1:
            first_view.isHidden = false
            first_view_label.text = final_results[0].name
            let location_str = final_results[0].region.rawValue.replacingOccurrences(of: "_", with: " ")
            first_view_location.text = location_str
            first_view_description.text = final_results[0].description
        case 2:
            first_view.isHidden = false
            second_view.isHidden = false
            first_view_label.text = final_results[0].name
            second_view_label.text = final_results[1].name
            let location_str = final_results[0].region.rawValue.replacingOccurrences(of: "_", with: " ")
            first_view_location.text = location_str
            first_view_description.text = final_results[0].description
            let location_str_2 = final_results[1].region.rawValue.replacingOccurrences(of: "_", with: " ")
            second_view_location.text = location_str_2
            second_view_description.text = final_results[1].description
        case 3:
            first_view.isHidden = false
            second_view.isHidden = false
            third_view.isHidden = false
            first_view_label.text = final_results[0].name
            second_view_label.text = final_results[1].name
            third_view_label.text = final_results[2].name
            let location_str = final_results[0].region.rawValue.replacingOccurrences(of: "_", with: " ")
            first_view_location.text = location_str
            first_view_description.text = final_results[0].description
            let location_str_2 = final_results[1].region.rawValue.replacingOccurrences(of: "_", with: " ")
            second_view_location.text = location_str_2
            second_view_description.text = final_results[1].description
            let location_str_3 = final_results[2].region.rawValue.replacingOccurrences(of: "_", with: " ")
            third_view_location.text = location_str_3
            third_view_description.text = final_results[2].description
        default:
            first_view.isHidden = false
            first_view_label.text = ":("
            first_view_description.text = "Try to be less picky about your criteria"
        }
    }

}

