//
//  ImageLiterals.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/22/24.
//

import UIKit

enum ImageLiterals {
    
    enum Profile {
        static var person: UIImage { .load(name: "person") }
    }
    
    enum Item {
        static var rabbit: UIImage { .load(name: "rabbit") }
        static var iceGreenTeaLatte: UIImage { .load(name: "iceGreenTeaLatte") }
        static var animalCrossing: UIImage { .load(name: "animalCrossing") }
        static var macbook: UIImage { .load(name: "macbook") }
    }
}
