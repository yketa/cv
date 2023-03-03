all: dir
	@xelatex cv_en
	@biber cv_en
	@xelatex cv_en
	@xelatex cv_en
	@mv `ls cv_en.* | grep -v tex | grep -v pdf` aux

dir:
	@mkdir -p aux

clean:
	@rm -f `ls cv* | grep -v tex | grep -v cls`
	@rm -rf aux
