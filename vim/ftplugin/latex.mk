# Taken from
# http://vim.wikia.com/wiki/Compiling_LaTeX_from_Vim#Rubber_plus_Make

.PHONY: clean

%.pdf: %.tex $(DEPENDS)
	rubber -f --pdf -s $<
	rubber-info --check $<

clean:
	rm -rf *.aux *.bbl *.blg *.log *.pdf *.toc *.snm *.out *.nav tags
