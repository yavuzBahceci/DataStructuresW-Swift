//
//  main.swift
//  Recursion
//
//  Created by Vivoo Mobile on 14.02.2020.
//  Copyright © 2020 MYB. All rights reserved.
//

import Foundation

func factorial(number : Int) -> Int{
    if(number > 1){
        return factorial(number: number - 1) * number
    }else{
        return 1
    }
}

print(factorial(number: 5))

