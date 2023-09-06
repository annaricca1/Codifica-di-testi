<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="html"/>

	<xsl:template match="/tei:TEI">
		<html lang="it">
			<head>
				<link rel="stylesheet" href="biblio.css"/>
				<meta charset="UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<title>Diari di Emanuele Artom - Bibliografia</title>
			</head>

			<body>
			<div id="top">
				<!-- navbar-->
				<div id="titolo">
					<xsl:call-template name="int1" />
				</div>
				<div id="navbar">
					<a href="homepage.html"><xsl:text>Homepage</xsl:text></a>
                    <a href="28nov.html"><xsl:text>28 novembre</xsl:text></a>
                    <a href="29_30nov.html"><xsl:text>29 e 30 novembre</xsl:text></a>
					<a href="r_digitale.html"><xsl:text>Risorsa digitale</xsl:text></a>
					<a href="biblio.html"><xsl:text>Bibliografia</xsl:text></a>	
				</div>
			</div>
				<!--inizio contenuto pagina -->
				<div id="contenuto">

                        <div id="biblio">
                            <h2 class="tbib">Bibliografia</h2>
                            <xsl:apply-templates select=".//tei:bibl"/>
                        </div>         
                            
                </div>				

			</body>
		</html>
	</xsl:template>

<!-- estraggo informazioni per la navbar -->
	<xsl:template name="int1">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>
<!-- estraggo informazioni per la bibliografia -->
  
  <xsl:template match="tei:bibl">
    <div class="bibl">
      <p class="tit"><xsl:value-of select="tei:title[@type='full']"/><xsl:text>, </xsl:text><xsl:value-of select="tei:title[@type='sub']"/></p>
      <p><xsl:text>Autore: </xsl:text><xsl:value-of select="tei:author"/> <xsl:value-of select="author/surname"/></p>
      <p><xsl:text>Editore: </xsl:text><xsl:value-of select="tei:editor"/> <xsl:value-of select="editor/surname"/></p>
      <p><xsl:text>Pubblicato a: </xsl:text><xsl:value-of select="tei:pubPlace"/></p>
      <p><xsl:text>Data di pubblicazione: </xsl:text><xsl:value-of select="tei:date"/></p>
      <p><xsl:text>Editore: </xsl:text><xsl:value-of select="tei:publisher"/></p><br/>
    </div>
  </xsl:template>

	
</xsl:stylesheet>