clean:
	rm -f *~

copy: 
	cp ~/CV/Cook_CV.pdf files/
	cp ~/CV/Cook_resume.pdf files/
	echo "Should be connected to VPN"
	scp -r *.html *.css files/ images/ assets/ bcook@mars.cfa.harvard.edu:/data/wdocs/bcook/www-docs/.
