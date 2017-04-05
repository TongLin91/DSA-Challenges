import Foundation

//Quick sort
func quickSort(_ arr: [Int]) -> [Int]{
    guard arr.count > 1 else { return arr }
    //determine pivot and break array to two base on pivot
    let pivot = arr[0]
    var low: [Int] = []
    var high: [Int] = []
    
    for index in 1..<arr.count{
        if arr[index] <= pivot{
            low.append(arr[index])
        }else{
            high.append(arr[index])
        }
    }
    let mid = [pivot]
    return quickSort(low) + mid + quickSort(high)
}


//Merge sort
func mergeSort(_ arr: [Int]) -> [Int]{
    guard arr.count > 1 else { return arr }
    var baseArr: [[Int]] = []
    for element in arr{
        baseArr.append([element])
    }
    
    while baseArr.count != 1 {
        while baseArr.count > 1 {
            let first = baseArr.removeLast()
            var second = baseArr.removeLast()
            var sorted: [Int] = []
            //merge two arrays to single sorted array
            for num in first{
                while second.count > 0 && second.first! < num {
                    sorted.append(second.removeFirst())
                }
                sorted.append(num)
            }
            baseArr += [sorted + second]
        }
    }
    return baseArr.removeLast()
}


//Insertion sort
func insertionSort(_ arr: [Int]) -> [Int]{
    guard arr.count > 1 else { return arr }
    var newArr: [Int] = []
    //insert number one by one to new array
    for num in arr{
        var temp: [Int] = []
        
        if newArr.count == 0{
            temp.append(num)
        }else if newArr.first! > num{
            temp = [num] + newArr
        }else if newArr.last! < num{
            temp = newArr + [num]
        }else{
            for index in 0..<newArr.count-1{
                temp.append(newArr[index])
                if newArr[index] <= num && newArr[index+1] >= num{
                    temp.append(num)
                }
            }
            temp.append(newArr.last!)
        }
        newArr = temp
    }
    return newArr
}


//Bubble sort
func bubbleSort(_ arr: [Int]) -> [Int]{
    var returnArr = arr
    var index = returnArr.count-1
    while index > 0 {
        for curr in 0..<index{
            //compare and swap
            if returnArr[curr] > returnArr[curr+1]{
                let temp = returnArr[curr]
                returnArr[curr] = returnArr[curr+1]
                returnArr[curr+1] = temp
            }
        }
        index -= 1
    }
    return returnArr
}


//



