all:
	@xelatex cv
	@mkdir -p aux
	@mv `ls cv.* | grep -v tex | grep -v pdf` aux

clean:
	@rm -f `ls cv.* | grep -v tex | grep -v pdf`
	@rm -rf aux
