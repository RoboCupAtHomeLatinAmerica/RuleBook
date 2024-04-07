# === Install dependencies ===
# SHELL := /bin/bash

# install texlive in a first place
.PHONY: install_texlive
install_texlive:

	@echo "Installing texlive ..."
	@apt update -qq
	@apt install -qq -y texlive*
	@echo "Done."

.PHONY: rulebook
rulebook: file=Rulebook
rulebook:
	@pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build ${file}.tex
	@makeglossaries -d build ${file}
	@biber build/${file}
	@makeindex build/${file}.idx
	@pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build ${file}.tex

.PHONY: instructions
instructions: file=Local_chair_instructions
instructions:
	pdflatex -shell-escape -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build ${file}.tex
	
.PHONY: all
all: rulebook instructions

