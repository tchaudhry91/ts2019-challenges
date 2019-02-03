doc-deploy:
#	cd docs && hugo server --gc --disableFastRender > /dev/null 2>&1 &
	sudo hugo -s docs -d /var/www/html -b "http://localhost:1313"

challenge-reset:
	vagrant destroy -f
	git reset --hard
	git clean -f -d
	vagrant up

challenge-reset-quick:
	git reset --hard
	git clean -f -d
