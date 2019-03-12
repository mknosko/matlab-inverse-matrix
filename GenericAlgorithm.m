% Generic algortihm of matrix inversion

function [Pop, Fit] = GenericAlgorithm(Pop, Fit, Space, A)
        
    newPop1 = selbest(Pop, Fit, [1 0]);

    newPop2 = seltourn(Pop, Fit, 6);
    CrossedPop1 = crossov(newPop2, 2, 0);
    MutedPopX1 = mutx(CrossedPop1, 0.1, Space);
    MutedPopA1 = muta(MutedPopX1, 0.02, [5 5 5 5 5 5 5 5 5]*0.02, Space);

    newPop3 = selrand(Pop, Fit, 3);
    CrossedPop2 = crossov(newPop3, 2, 0);
    MutedPopX2 = mutx(CrossedPop2, 0.1, Space);
    MutedPopA2 = muta(MutedPopX2, 0.05, [5 5 5 5 5 5 5 5 5]*0.05, Space);

    Pop = [newPop1; MutedPopA1; MutedPopA2];
    
    Fit=fitness(Pop, A); % znovu vyhodnotenie fitness funkcie
end