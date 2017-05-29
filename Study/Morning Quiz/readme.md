    var fibonacci:[Int] = []
    
    func getFibonacci(fromNumber num:Int) -> Int {
        
        if num == 0 {
            return 0
        }else if num == 1{
            return 1
        }else{
            return getFibonacci(fromNumber:num - 1) + getFibonacci(fromNumber:num - 2)
        }
    }
    
}
////////////////////////////////////////////////////////////////////////
//선생님이 만든 피보나치수열

func fibo(n:Int) -> Int
{
    if n == 0{
        return 0
    }else if n == 1{
        return 1
    }else{
        return fibo(n: n-1) + fibo(n: n-2)
    }
}

/////////////////////////////////////////////////////////
