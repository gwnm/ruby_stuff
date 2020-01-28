def fibs(n)

	fib = [1,2]

	if n == 2

		p fib

		return

	elsif n == 1

		p fib = [1]

		return

	end

	until fib[-1] >= n do

		x = fib[-1]

		y = fib[-2]

		fib << x + y

	end

	p fib

end



fibs(1) #=> [1]

fibs(2) #=> [1,2]

fibs(3) #=> [1,2,3]

fibs(4) #=> [1,2,3,5]



def fibs_rec(n, x = 1, y = 2, fib = [1])

	return fib if fib.size >= n

	fib << y

	fibs_rec(n, fib[-1], (fib[-1] + x), fib)

end



p fibs_rec(5)

p fibs_rec(10)