@for /f "usebackq delims=|" %%f in (`dir /b "..\resources\examplescenario*.xml"`) do (

copy ..\resources\%%f .

java -jar saxon9he.jar -s:%%f -xsl:diagram.xslt -o:diagram.txt 

java -jar plantuml.jar diagram.txt
move diagram.png ..\images\%%~nf-diagram.png

java -jar saxon9he.jar -s:diagram.cmapx -xsl:cmap.xslt -o:diagram.cmapx2
del diagram.cmapx
ren diagram.cmapx2 diagram.cmapx

java -jar saxon9he.jar -s:%%f -xsl:full_template.xslt -o:%%~nf-scenario.xml pref="%%~nf-"
move %%~nf-scenario.xml ..\pagecontent


java -jar saxon9he.jar -s:%%f -xsl:exampleTOC.xslt -o:toc.xhtml
move toc.xhtml ..\pagecontent\examples.xml


del %%f
del diagram.txt
del diagram.cmapx

)

java -jar saxon9he.jar -s:..\resources\glossary.xml -xsl:glossary.xslt -o:..\pagecontent\mma_4.glossary.xml


