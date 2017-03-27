import Foundation

//Quick sort
func quickSort(_ arr: [Int]) -> [Int]{
    guard arr.count > 1 else { return arr }
    
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

