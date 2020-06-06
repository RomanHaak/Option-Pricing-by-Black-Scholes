function z=euro(U,D,S,K,n,r)
	% U ist der Faktor des Aktienpreises nach einer Zeiteinheit bei Erhöhung des Aktienkurses (up), D der Faktor bei einem AKtienfall (down)
	% S ist der Aktienkurs zum Zeitpunkt 0, K der Strike-Preis
	% n ist die Anzahl der Zeiteinheiten bis zur Ausübung der Option (diese ist bei einer europäischen Option festgesetzt), r ist der risikolose Zins
	q=(exp(r/n)-D)/(U-D);%Definition Wahrscheinlichkeit
	X=zeros(n+1,n+1);%stellt die Matrix dar, die alle möglichen Werte der Aktie enthällt: die Zeilen geben die Zeiteinheiten an, die Spalten die ups und downs (je linker die Spalte, desto höher der Aktienpreis, siehe for-schleife)
	Y=zeros(n+1,n+1);%stellt die Matrix dar, die die Optionspreise für jedes Szenario festlegt, siehe zweite und dritte for-schleife
	for l=0:n
	for k=0:l
		X(l+1,k+1)=S*D^k*U^(l-k);
	end
	end
	for k=1:n+1
		Y(n+1,k)=max(X(n+1,k)-K,0);
	end
	for l=n:-1:1
	for k=1:l
		Y(l,k)=exp(-(r*(l-1))/n)*(q*Y(l+1,k)+(1-q)*Y(l+1,k+1));
	end
	end
	
	
	z=Y(1,1);%entgültiger fairer Options-Preis
end
	
