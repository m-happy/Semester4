note
	description: "Summary description for {STABLE_MARRIGE}."
	author: "Happy Mahto"
	date: "$Date$"
	revision: "$Revision$"

class
	STABLE_MARRIGE
create
	make_marrige
feature
	pref : ARRAY2[INTEGER]
	make_marrige
			--main function to do the computation of the stable marrige
		local
			n : INTEGER
		do
			print("hello")
			io.read_integer
			n := io.last_integer
			create_pref(n)
			print_pref(n)
		end
	create_pref(n : INTEGER)
			--function for creating the preference matrix
		local
			i, j : INTEGER
		do
			create pref.make_filled(0, 2*n, n+1)
			from
				i := 1
			until
				i > 2 * n
			loop
				from
					j := 1
				until
					j > n + 1
				loop
					io.read_integer
					pref[i, j] := io.last_integer
				end
			end
		end
	print_pref(n : INTEGER)
			--function for printing the preference
		local
			i, j : INTEGER
		do
			from
				i := 1
			until
				i > 2 * n
			loop
				from
					j := 1
				until
					j > n +1
				loop
					print(pref[i,j])
				end
			end
		end
end
