pages = index.html research.html projects.html professional.html

utils = style.css src/header.html src/navbar.html src/footer.html

default: $(pages)

%.html : src/%.html $(utils)
	cp $< $@
	sed -e '/INSERT_HEADER_HERE/ {' -e 'r src/header.html' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_NAVBAR_HERE/ {' -e 'r src/navbar.html' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_FOOTER_HERE/ {' -e 'r src/footer.html' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	echo "<!-- DO NOT EDIT THIS AUTOMATICALLY GENERATED FILE\n EDIT THE FILE UNDER THE src DIRECTORY -->\n" | cat - $@ > temp && mv temp $@

clean:
	rm -f *~ *.html src/*~

copy: *.html *.css
	cp ~/CV/Cook_CV.pdf files/
	cp ~/CV/Cook_resume.pdf files/
	echo "Should be connected to VPN"
	scp -r *.html *.css files/ images/ bcook@cfa0.cfa.harvard.edu:/data/wdocs/bcook/www-docs/.
