 
function [minRet, minFit] = Compare(Pop, minFit, minRet, A)

    Fit=fitness(Pop, A); % znovu vyhodnotenie fitness funkcie 
    [minFitnew,indx]=min(Fit); % najdenie najlepsieho (minimalneho) retazca
    
    if minFitnew<minFit % porovnanie min. a v pripade potreby zmena min. hodnoty
        minFit=minFitnew;
        minRet=Pop(indx,:);
    end

end