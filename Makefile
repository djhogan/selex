README.pdf: README.md
	pandoc -t latex -o README.pdf <README.md
