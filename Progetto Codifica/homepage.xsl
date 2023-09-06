<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">
	
	<xsl:output method="html"/>

	<xsl:template match="/tei:TEI">
		<html lang="it">
			<head>
				<link rel="stylesheet" href="homepage.css"/>
				<meta charset="UTF-8"/>
				<title>Diari di Emanuele Artom - Homepage</title>
			</head>

			<body>

			<div id="top">
				<!-- navbar-->
				<div id="navbar">
					<a href="homepage.html"><xsl:text>Homepage</xsl:text></a>
                    <a href="28nov.html"><xsl:text>28 novembre</xsl:text></a>
                    <a href="29_30nov.html"><xsl:text>29 e 30 novembre</xsl:text></a>
					<a href="r_digitale.html"><xsl:text>Risorsa digitale</xsl:text></a>
					<a href="biblio.html"><xsl:text>Bibliografia</xsl:text></a>	
				</div>
			</div>

			<div id="contenuto">
				<div id="titolo">
					<xsl:call-template name="int1" />
				</div>
				
      			<img src="img/im1.jpg" alt="Immagine 2"/>
    				
			</div>
				
			</body>
		</html>

	</xsl:template>

<!-- estraggo titoli per intestazione -->

	<xsl:template name="int1">
		<p id="titolo"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>




</xsl:stylesheet>