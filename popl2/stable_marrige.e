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
	no_of_rows : REAL
	a : INTEGER
	make_marrige
			--main function to do the computation of the stable marrige
		require
			condition : true
		local
			n : INTEGER
		do
			--print("hello")
			input
			create_pref(a)
			matching(a)
			--print_pref(n)
		rescue
			print("INVALID")
			retry
		end
	input
		--function to take the input no of men
		require
			condition : true
		do
			io.read_real
			no_of_rows := io.last_real
			a := no_of_rows.truncated_to_integer
		ensure
			this : no_of_rows > 0 and a = no_of_rows
		end
	check_real(m : REAL; n : INTEGER)
		--function to check if the given no is
		require
			condition : true
		do
			if
				m /= n
			then
				print("INVALID")
			end
		ensure
			this : m > 0 and n > 0
		end
	create_pref(n : INTEGER)
			--function for creating the preference matrix
		require
			condtion : true and n > 0
		local
			i, j,k : INTEGER
			m : REAL
		do
			create pref.make_filled(0,2*n, n+1)
			from
				i := 1
			invariant
				i <= 2*n + 1
			until
				i > 2*n
			loop
				from
					j := 1
				invariant
					j <= n + 2
				until
					j > n + 1
				loop
					--print(j)
					io.read_real
					m := io.last_real
					k := m.truncated_to_integer
					check_real(m,k)
					pref.put (k,i, j)
					j := j + 1
				end
				i := i + 1
			end
			--print("matrix created")
			ensure
				pref.height = 2*n and pref.width = n + 1
		end
	women_prefers_other_man(n: INTEGER; w : INTEGER; m : INTEGER; m_f : INTEGER): BOOLEAN
			--function for checking the preferences of woman
		local
			i,j : INTEGER
		do
			j := 1
			from
				i := 1
			until
				i > n or j > n
			loop
				if
					pref[w,i+1] = m_f
				then
					Result := true
					i := n
				end
				if
					pref[w,j+1] = m
				then
					Result := false
					j := n
				end
				i := i + 1
				j := j + 1
			end
		end
	matching(n : INTEGER)
		--function for creating the matching process
		require
			condition : true and n > 0
		local
			i, j,m,w,m_f,z, t : INTEGER
			women_pref : ARRAY[INTEGER]
			men_free : ARRAY[BOOLEAN]

		do
			create women_pref.make_filled (-1, 1, n)
			create men_free.make_filled (false, 1, n)
			from
				i := n
			until
				i < 1
			loop
				--print(i)
				from
					m := 1
				until
					m > n
				loop
					if
						men_free[m] = false
					then
						t := m
						m := n + 1
					end
					m := m + 1
				end
				--second for loop
				from
					j := 1
				until
					 (j > n or men_free[t] /= false)
				loop
					w := pref[t,j+1]
					--print(w)
					--print(pref[t,j])
					if
						women_pref[w] = -1
					then
						women_pref[w] := t
						men_free[t] := true
						i := i - 1
					else
						m_f := women_pref[w]
						if
							women_prefers_other_man(n,w,t,m_f) = false
						then
							--print("l")
							women_pref[w] := t
							men_free[t] := true
							men_free[m_f] := false
						end
					end
					j := j + 1
				end
			end
			from
				z := 1
			invariant
				z <= n + 1
			until
				z > n
			loop
				print(women_pref[z])
				print("%N")
				z := z + 1
			end
			ensure
				--women_pref.height = n and women_pref.width = n
		end
	print_pref(n : INTEGER)
			--function for printing the preference
		require
			condition : true and n > 0
		local
			i, j : INTEGER
		do
			from
				i := 1
			invariant
				i <= 2*n + 1
			until
				i > 2 * n
			loop
				from
					j := 1
				invariant
					j <= n + 2
				until
					j > n +1
				loop
					print(pref[i,j])
					print(" ")
					j := j + 1
				end
				print("%N")
				i := i + 1
			end
		end
end
