A=[-1 2 0; 4 -3 1; 1 4 2]; % matica 3x3
invA=inv(A); % invezna matica pre porovnanie inverznich matic

numcykle=1000;	% pocet generacii
lpop=50; % velkost populacie
range = 9; % pocet prvkov v jednom jedincovi
Space=[ones(1,range)*(-5);ones(1,range)*5]; % rozsah hodnot urceny od -5 do 5
popNum = 5; % pocet ostrovov
genr = zeros((lpop/popNum),range,popNum); % vygenerovanie trojrozmernej matice
Fit = zeros(popNum, (lpop/popNum)); % vygenerovanie matice s Fit hodnotami pre jednotlive ostrovy

for i = 1:popNum
    genr(:,:,i) = genrpop((lpop/popNum),Space); % generovanie populacie pre jeden ostrov
    Fit(i,:) = fitness(genr(:,:,i), A); % vyhodnotenie fitness funkcie pre dany ostrov
end

mainPop = [genr(:,:,1);genr(:,:,2);genr(:,:,3);genr(:,:,4);genr(:,:,5)]; % vytvorenie hlavneho ostrova (stredneho) do ktoreho budeme spajat vsetky ostatne ostrovy
mainFit = fitness(mainPop, A); % vyhodnotenie hlavneho ostrova
[minFit, indx] = min(mainFit);  % najdenie najmensieho Fit a jeho indexu
grafFit = zeros(1,numcykle);    % vytvorenie grafu pre vykreslenie postupu GA
minRet = mainPop(indx,:);   % retazec s najmensim Fit

for i=1:numcykle
    
    parfor j = 1:popNum
        [genr(:,:,j), Fit(j,:)]=GenericAlgorithm(genr(:,:,j),Fit(j,:), Space, A); % Spojenie najlepsich a zmutovanych jedincov
    end
    
    if(mod(i,50) == 0)
       
       mainPop = [genr(:,:,1);genr(:,:,2);genr(:,:,3);genr(:,:,4);genr(:,:,5)];
       [minRet, minFit] = Compare(mainPop, minFit, minRet, A);
        
    end
    
    grafFit(1,i) = minFit; % ulozenie minimalnej hodnoty po kazdej generacii (iteracii)

end

matrix = reshape(minRet, [3 3])
invA
minFit

plot(grafFit, 'r');
% xlabel('generacie (x)');
% ylabel('minimalna fitness (y)');
% legend('difference');