BUILD_DIR=_book

html: check-ipynb
	quarto render --to html

check-ipynb:
	# Check for ipynb files in source (should all be .Rmd).
	if compgen -G "*/*.ipynb" 2> /dev/null; then (echo "ipynb files" && exit 1); fi


github: html
	ghp-import -n $(BUILD_DIR) -p -f

clean:
	rm -rf $(BUILD_DIR)

rm-ipynb:
	rm -rf */*.ipynb
