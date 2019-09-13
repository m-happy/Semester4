note
    description: "Summary description for {INVERSE_MATRIX}."
    author: "Happy Mahto"
    date: "$Date$"
    revision: "$Revision$"

class
    INVERSE_MATRIX
create
    make_matrix
feature
    array, inverse_matrix: ARRAY2[DOUBLE]
    no_of_rows: INTEGER
    ao:REAL
    check_mat : BOOLEAN
    make_matrix
    	require
    		condition : true
            --function for creating the matrix
        do
        	input_n
            create_matrix(no_of_rows)
            --int("%N%Nfrom here%N%N")
            --print(array.upper)
            --print(array.lower)
            check_mat := inverse(array,no_of_rows)
            if
                check_mat = true
            then
                print_matrix(inverse_matrix, no_of_rows)
            else
                print("INVALID")
            end

            rescue
            	--function to call if there are any exception raised in the program
        	print("INVALID%N")
        	retry

        end
     input_n
     	--functiont to take the input no of rows
     	require
     		condition : true
     	do
     		io.read_real
            ao:= io.last_real
            no_of_rows:=ao.truncated_to_integer
        ensure
        	this: ao > 0 and ao = no_of_rows
     	end
    create_matrix(n : INTEGER)
            --function for making the matrix from the STDIN
        require
      	 condition: true and n > 0
        local
            i,j : INTEGER

        do
            create array.make_filled(0.0, n,n)
            from
                i := 1
            invariant
            	i <= n + 1
            until
                i > n
            loop
                from
                    j := 1
                invariant
                	j <= n + 1
                until
                    j > n
                loop
                    io.read_double;
                    array.put (io.last_double,i, j)
                    j := j + 1
                end
                i := i+1
            end

		ensure
			non_negative : n >= 0 and array.height = n and array.width = n
        end
    swap_row(row : INTEGER; col : INTEGER; arr : ARRAY2[DOUBLE]; inverse_mat : ARRAY2[DOUBLE] ; n : INTEGER)
        --function to swap rows
       	require
       		condition : true and n > 0 and arr.height = n and arr.width = n
       		inverse_mat.width = n and inverse_mat.height = n
        local
            i, j, m : INTEGER
            swap, temp, min : DOUBLE
        do
            m := row
            min := arr[row, col]
            from
                i := row + 1
            invariant
            	i <= n + 1
            until
                i > n
            loop
                if
                    min > arr[i, col] or min = 0
                then
                	if
                		arr[i,col] /= 0
                	then
                		m := i
                    	min := arr[i,col]
                	end
                end
                i := i + 1
            end
            min := arr[m, col]
            if
                min /= arr[row, col] and min /= 0
            then
                from
                    j := 1
                invariant
                	j <= n + 1
                until
                    j > n
                loop
                    swap := arr[m, j]
                    arr[m, j] := arr[row, j]
                    arr[row, j] := swap
                    temp := inverse_mat[m,j]
                    inverse_mat[m, j] := inverse_mat[row, j]
                    inverse_mat[row, j] := temp
                    j := j + 1
                end

            end
            ensure
            	arr[row,col] /= 0
--            rescue
----        	print("INVALID1%N")

        end
    inverse(arr : ARRAY2[DOUBLE]; n : INTEGER) : BOOLEAN
        --function to check if the inverser exist or not
        require
        	condition : true and arr.height = n and arr.width = n and n > 0
        local
            i, j , row, col, a, b, c,p : INTEGER
            d : DOUBLE
        do
            create inverse_matrix.make_filled(0, n, n)
            from
                i := 1
            invariant
            	i <= n + 1
            until
                i > n
            loop
                from
                    j := 1
                invariant
                	j <= n + 1
                until
                    j > n
                loop
                    if
                        i = j
                    then
                        inverse_matrix[i,j] := 1
                    else
                        inverse_matrix[i,j] := 0
                    end
                    j := j + 1
                end
                i := i + 1
            end
            col := 1
            from
                row := 1
            until
                row > n
            loop
                swap_row(row, col, arr,inverse_matrix,n)
                if
                	inverse_matrix[row,col] = 0
                then
                	Result := false
                	row := row + n
                else
                	from
                    a := 1
                until
                    a > n
                loop
                    if
                        a /= row
                    then
                        d := arr[a,col]/arr[row, col]
                        from
                            b := 1
                        invariant
                        	b <= n + 1
                        until
                            b > n
                        loop
                            arr[a, b] := arr[a,b] - d*arr[row, b]
                            inverse_matrix[a,b] := inverse_matrix[a,b] - d*inverse_matrix[row, b]
                            b := b + 1
                        end
                    end
                    a := a + 1
                end
                row := row + 1
                col := col + 1
                 Result := true
            end
            from
                c := 1
            invariant
            	c <= n + 1
            until
                c > n
            loop
                from
                    p := 1
                invariant
                	p <= n + 1
                until
                    p > n
                loop
                    inverse_matrix[c,p] := inverse_matrix[c,p]/arr[c,c]
                    p := p + 1
                end
                c := c + 1
            end

                end
			ensure
				trivial : inverse_matrix.height = n and inverse_matrix.width = n
--			rescue
--				print("INVALID2%N")
        end
    print_matrix(arr: ARRAY2[DOUBLE] ;n : INTEGER)
            --function for printing matrix
        local
            i, j : INTEGER
        do
            --print(n)
            --print("matrix given is%N")
            from
                i := 1
            invariant
            	i <= n + 1
            until
                i > n
            loop
                from
                    j := 1
                invariant
                	j <= n + 1
                until
                    j > n
                loop
                    io.put_DOUBLE (arr.item(i, j))
                    print(" ")
                    j := j + 1
                end
                print("%N")
                i := i + 1

            end
		ensure
			n >= 0

        end


end

