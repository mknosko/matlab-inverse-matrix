% Generic algortihm of matrix inversion

function [newPop] = Swap(Pop, minRet)

    m = (50-1)*rand()+1;
    m = round(m);
    
    newPop = Pop;
    newPop(m,:) = minRet;
    
end