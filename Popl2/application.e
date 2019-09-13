note
	description: "Popl2 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
marrige : STABLE_MARRIGE
	make
			-- Run application.
		do
			--| Add your code here
			print ("Hello Eiffel World!%N")
			create marrige.make_marrige
		end

end
