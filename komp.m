function z=komp(S,K,N,r,s,t)
	% S Aktien-Preis zum Zeitpunkt 0, K Strike-Preis, N Anzahl der Zwischenschritte/ Sprünge der Aktie in dem Zeitintervall t, r risikoloser Zinssatz, s Volatilität, t Zeit bis zur Ausübung bzw. zum Verfall der Option
	X=zeros(1,N);
	Y=zeros(1,N);
	for k=1:N
		delta=1/k;
		U=exp(-(s^2)*delta/2+s*sqrt(delta));
		D=exp(-(s^2)*delta/2-s*sqrt(delta));
		X(k)=euro(U,D,S,K,k,r);
		p=(exp(r*delta)-D)/(U-D);
		
	end%Folge einer Optionsbestimmung, die immer mehr Sprünge zulässt, dadurch wird die Endausgabe "fairer"
	plot(1:N,X);% Plot der "Black-Scholes-Folge"
	hold on;
	w=blackscholes(S,K,r,s,t);%Black-Scholes-Wert
	plot(1:N,zeros(1,N)+w,'r');
	
	hold off;
	
end
	
