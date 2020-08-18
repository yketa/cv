all: en fr

en: dir
	@xelatex cv_en
	@biber cv_en
	@xelatex cv_en
	@xelatex cv_en
	@mv `ls cv_en.* | grep -v tex | grep -v pdf` aux

fr: dir
	@xelatex cv_fr
	@biber cv_fr
	@xelatex cv_fr
	@xelatex cv_fr
	@mv `ls cv_fr.* | grep -v tex | grep -v pdf` aux

dir:
	@mkdir -p aux

clean:
	@rm -f `ls cv* | grep -v tex | grep -v cls`
	@rm -rf aux
