CV_DIR := cv
CV_TEX := lukasz-piotr-luczak-cv.tex

.PHONY: all cv lint clean distclean

all: cv

cv:
	cd $(CV_DIR) && latexmk -xelatex -interaction=nonstopmode -file-line-error -halt-on-error $(CV_TEX)

lint:
	cd $(CV_DIR) && chktex -q $(CV_TEX)

clean:
	cd $(CV_DIR) && latexmk -c $(CV_TEX)

distclean:
	cd $(CV_DIR) && latexmk -C $(CV_TEX)
