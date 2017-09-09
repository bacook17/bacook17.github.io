default: outreach.html

demos = demos/demo_SSP.script demos/demo_SSP.div demos/demo_fullSFH.script demos/demo_fullSFH.div demos/game.script demos/game.div

clean:
	rm -f *~
	rm -f files/*~ images/*~ assets/*/*~

clobber: clean
	rm outreach.html


outreach.html: demos/outreach.html $(demos)
	cp $< $@
	sed -e '/INSERT_DEMO_SCRIPT_1_HERE/ {' -e 'r demos/demo_SSP.script' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_DEMO_DIV_1_HERE/ {' -e 'r demos/demo_SSP.div' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_DEMO_SCRIPT_2_HERE/ {' -e 'r demos/demo_fullSFH.script' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_DEMO_DIV_2_HERE/ {' -e 'r demos/demo_fullSFH.div' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_DEMO_SCRIPT_3_HERE/ {' -e 'r demos/game.script' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	sed -e '/INSERT_DEMO_DIV_3_HERE/ {' -e 'r demos/game.div' -e 'd' -e '}' $@ > $@_temp
	mv $@_temp $@
	echo "<!-- DO NOT EDIT THIS AUTOMATICALLY GENERATED FILE\n EDIT THE FILE UNDER THE demos DIRECTORY -->\n" | cat - $@ > temp && mv temp $@


copy: clean outreach.html
	cp ~/CV/Cook_CV.pdf files/
	cp ~/CV/Cook_resume_2pg.pdf files/Cook_resume.pdf
	echo "Should be connected to VPN"
	scp -r *.html files/ images/ assets/ bcook@mars.cfa.harvard.edu:/data/wdocs/bcook/www-docs/.
