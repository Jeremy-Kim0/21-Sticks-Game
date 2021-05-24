function winner = stratWinner(A,B,sticks)
while sticks > 0
	sticks = sticks - A(sticks);
	if sticks <= 0
    	winner = B;
    	break
	end
	sticks = sticks - B(sticks);
	if sticks <= 0
    	winner = A;
	end
end
end
