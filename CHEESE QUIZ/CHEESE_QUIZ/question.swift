//
//  question.swift
//  person quiz
//
//  Created by Brian Liew on 8/9/21.
//

import Foundation
import UIKit

// milk: cow, goat, sheep                               multiple-choice
// hardness: soft, medium, hard                         slider
// region: american, mediterranean, non-mediterranean   multiple answer


/*
// combos:
 cow, soft, american:               provel
 cow, soft, mediterranean:          gorgonzola
 cow, soft, non-mediterranean:      limburger
 cow, medium, american:             pepperjack
 cow, medium, mediterranean:        provolone
 cow, medium, non-mediterranean:    gouda
 cow, hard, american:               cheddar
 cow, hard, mediterranean:          parmesan
 cow, hard, non-mediterranean:      emmental
 
 goat, soft, american:              bonne bouche
 goat, soft, mediterranean:         katiki
 goat, soft, non-mediterranean:     golden cross
 goat, medium, american:            humbolt fog
 goat, medium, mediterranean:       anthotyros
 goat, medium, non-mediterranean:   clochette
 goat, hard, american:              idaho goatster
 goat, hard, mediterranean:         none
 goat, hard, non-mediterranean:     garrotxa
 
 sheep, soft, american:             morcella
 sheep, soft, mediterranean:        fleur de marquis
 sheep, soft, non-mediterranean:    none
 sheep, medium, american:           none
 sheep, medium, mediterranean:      feta
 sheep, medium, non-mediterranean:  yorkshire blue
 sheep, hard, american:             bohemian blue
 sheep, hard, mediterranean:        pecorino sardo
 sheep, hard, non-mediterranean:    roncal
*/

struct question {
    var text: String
    var type: question_type
}

struct cheese {
    var name: String
    var codename: all_cheese_names
    var description: String
    var animal: animal
    var region: region
    var hardness: hardness
}

enum question_type {
    case multiple_choice, multiple_answer, slider
}

enum animal: String {
    case cow, goat, sheep
}

enum hardness: String {
    case soft, medium, hard
}

enum region: String {
    case american, mediterranean, northern_western_european
}

enum all_cheese_names: String {
    case provel, gorgonzola, limburger, pepperjack, provolone, gouda, cheddar, parmesan, emmental, bonne_bouche, katiki, golden_cross, humbolt_fog, anthotyros, clochette, idaho_goatster, garrotxa, morcella, fluer_de_marquis, feta, yorkshire_blue, bohemian_blue, pecorino_sardo, roncal
}
