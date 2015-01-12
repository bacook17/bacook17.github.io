clean:
	rm -f *~

copy: *.html *.css
	scp -r *.html *.css files/ images/ bcook@cfa0.cfa.harvard.edu:/data/wdocs/bcook/www-docs/.
