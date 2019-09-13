note
	description: "popl1_inv application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
inverse_matrix : INVERSE_MATRIX
	make
			-- Run application.
		do
			--| Add your code here
			--print ("Hello Eiffel World!%N")
			create inverse_matrix.make_matrix
		end

end
