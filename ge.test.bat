uplatex	test
ptex2pdf -l -u test
del *.aux /s
del *.bak /s
del *.log /s
del *.bbl /s
del *.dvi /s
del *.blg /s
del *.thm /s
#del *.toc /s
del *.out /s
del *.lof /s
del *.lol /s
del *.lot /s
del *.fdb_latexmk /s
del *.synctex.gz /s
exit