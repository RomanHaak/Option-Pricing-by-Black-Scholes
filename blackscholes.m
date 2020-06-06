function z=blackscholes(S,K,r,s,t)
	% S Aktien-Preis zum Zeitpunkt 0, K Strike-Preis, r risikoloser Zinssatz, s Volatilität, t Zeit bis zur Ausübung bzw. zum Verfall der Option
	d1=(log(S./K) .+(r+(s.^2)/2).*t)./(s.*sqrt(t));
	d2=d1-(s.*sqrt(t));
	z=S.*normcdf(d1)-K*exp(-r.*t).*normcdf(d2);
end
