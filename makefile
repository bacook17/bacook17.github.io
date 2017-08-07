pages = index.html research.html projects.html professional.html pcmd_demo.html pcmd_game.html

utils = style.css src/header.html src/navbar.html src/footer.html src/demo.script src/demo.div src/game.script src/game.div

default: $(pages)

%.html : src/%.html $(utils)
	cp $< $@
	sed -e '/INSERT_DEMO_SCRIPT_HERE/ {' -e 'r src/demo.script' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_DEMO_DIV_HERE/ {' -e 'r src/demo.div' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_GAME_SCRIPT_HERE/ {' -e 'r src/game.script' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_GAME_DIV_HERE/ {' -e 'r src/game.div' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
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
	scp -r *.html *.css files/ images/ bcook@mars.cfa.harvard.edu:/data/wdocs/bcook/www-docs/.
