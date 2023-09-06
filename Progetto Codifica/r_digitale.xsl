<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<xsl:output method="html"/>

	<xsl:template match="/tei:TEI">
		<!-- albero DOM html-->
		<html lang="it">
			<head>
				<link rel="stylesheet" href="r_digitale.css"/>
				<meta charset="UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<title>Diari di Emanuele Artom - Risorsa digitale</title>	
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

				<!--inizio corpo RISORSA DIGITALE -->
				<div id="corpodiario">
                    <div id="contienitesto"></div>

					<!-- estreggo testo del diario -->
					<div id="testodiario">
						<label><xsl:text>Testo del diario</xsl:text></label><br/>
						<xsl:apply-templates select="tei:text/tei:body"/>
					</div>
					<!--legenda-->
					<div id="leg">
						<span class="line" id="L_person">
							<svg width="10" height="10">
  								<circle cx="5" cy="5" r="5" style="fill:#00008b	; stroke-width:1" />
							</svg>

							<xsl:text> Persone </xsl:text>
						</span>
						<span class="line" id="L_place">
							<svg width="10" height="10">
	  							<circle cx="5" cy="5" r="5"  style="fill:#da70d6	; stroke-width:1" />
							</svg>
							<xsl:text> Città </xsl:text>
						</span>
						<span class="line" id="L_org">
							<svg width="10" height="10">
	  							<circle cx="5" cy="5" r="5"  style="fill:#228b22	; stroke-width:1" />
							</svg>
							<xsl:text> Organizzazioni </xsl:text>
						</span>
						<span class="line" id="L_org">
							<svg width="10" height="10">
	  							<circle cx="5" cy="5" r="5"  style="fill:#ff0000	; stroke-width:1" />
							</svg>
							<xsl:text> Abbreviazioni estese </xsl:text>
						</span>
						
					</div>
					<!--footer-->
					<div class="footer">
						<div id="infodigitali" class="infodiario">
							<label> <xsl:text>Informazioni sull'edizione digitale</xsl:text></label><br/>
							<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:editionStmt"/>
							<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:publicationStmt"/><br/>
							<xsl:value-of select="tei:teiHeader/tei:encodingDesc"/><br/>
						</div>	
					</div>
				</div>

				<!-- script collegamenti -->
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script src="r_digitale.js"></script>

			</body>
		</html>
	</xsl:template>

<!-- estraggo testo per navbbar -->
	<xsl:template name="int1">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>

<!--- estraggo testo della diario e formattazione-->
	<xsl:template match="tei:date[@xml:id='d28']">
		<p class="dx"><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:date[@xml:id='d29']">
		<p class="dx"><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:date[@xml:id='d30']">
		<p class="dx"><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:del">
		<span class="overstrike"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:add">
		<sup> <xsl:apply-templates/> </sup>
	</xsl:template>

	<xsl:template match="tei:sic">
		<a class="nascosto"><xsl:apply-templates/></a>
	</xsl:template>

	<xsl:template match="tei:expan">
		<span class="expan"> [<xsl:apply-templates/>]</span>
	</xsl:template>


<!-- estraggo informazioni sulla risorsa digitale -->	

	<xsl:template match="tei:edition">
		<p><span class="infospan">Diari di Emanuele Artom: </span><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:publisher">
		<p><span class="infospan">Pubblicazione: </span><xsl:apply-templates/></p>
	</xsl:template>
    <xsl:template match="tei:availability">
		<xsl:apply-templates/> <xsl:text>, </xsl:text>
	</xsl:template>
    <xsl:template match="tei:pubPlace">
		<xsl:apply-templates/> 
	</xsl:template>

<!-- estraggo informazioni da riportare in #contienitesto -->
	<xsl:template match="tei:orgName">
		<xsl:variable name="REForg">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoOrg"><xsl:apply-templates />
		<span class="descOrg "> <xsl:value-of select="//tei:org[@xml:id=$REForg]/tei:desc"/></span></span>
	</xsl:template>

	<xsl:template match="tei:placeName">
		<xsl:variable name="REFplace">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoPlace"><xsl:apply-templates />
		<span class="descPlace"> <xsl:value-of select="//tei:place[@xml:id=$REFplace]/tei:placeName"/><xsl:text> </xsl:text> <xsl:value-of select="//tei:place[@xml:id=$REFplace]/tei:note/tei:p"/></span></span>
	</xsl:template>

<xsl:template match="tei:persName">
		<xsl:variable name="REFperson">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoPerson"><xsl:apply-templates />
		<span class="descPerson"> <xsl:value-of select="//tei:person[@xml:id=$REFperson]/tei:note/tei:p"/><br/>
		<a><xsl:value-of select="//tei:person[@xml:id=$REFperson]/@sameAs"/></a></span></span>
	</xsl:template>


</xsl:stylesheet>