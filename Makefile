
RESUME_FILE=resume.tex
RESUME_BUILD=resume
DEFAULT_READER=Preview.app

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: resume

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

resume: $(RESUME_FILE)
	if [ ! -d build ] ; then mkdir build ; fi;
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -jobname=doc/$(RESUME_BUILD) $(RESUME_FILE)
	# Clean build files
	find ./doc -type f ! -name '$(RESUME_BUILD).pdf' -delete

read: resume
	# Only for macOS
	open -a $(DEFAULT_READER) doc/$(RESUME_BUILD).pdf

clean:
	find ./doc -type f ! -name '$(RESUME_BUILD).pdf' -delete
