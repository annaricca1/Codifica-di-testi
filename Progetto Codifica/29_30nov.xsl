<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="html"/>

	<xsl:template match="/tei:TEI">
		<html lang="it">
			<head>
				<link rel="stylesheet" href="29_30nov.css"/>
				<meta charset="UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<title>Diari di Emanuele Artom - 29 e 30 novembre</title>
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
					<div id="contenutoimage">
						<!--contieni e mostra riga di testo -->
						<div id="contienitesto"></div>
						<!--immagini interattive -->
						<div id="risorse">					
							<div id="immagine1" class="contieniimg">
								<img src="img/pag22.png" usemap="#imm_int1" id="img1" class="immagini"/>
								<map name="imm_int1">
									<xsl:apply-templates select="tei:facsimile/tei:surface[@n='3']"/>
								</map>
							</div>
							<div id="immagine2" class="contieniimg">
								<img src="img/pag23.png" usemap="#imm_int2" id="img2" class="immagini"/>
								<map name="imm_int2">
									<xsl:apply-templates select="tei:facsimile/tei:surface[@n='4']"/>
								</map>
							</div>	
						</div>
						<!-- memorizza testo diario -->
						<div id="mostratesto">
							<div id="frasi">
							    <xsl:apply-templates select="tei:text/tei:body/tei:ab[@type='day' and @xml:id='d29_11']" />
                                <xsl:apply-templates select="tei:text/tei:body/tei:ab[@type='day' and @xml:id='d30_11']" />
							</div>
						</div>
					</div>
					<!--link per spostarsi alle pagine precedenti del diario-->
					<div>
                    	<a href="28nov.html"><img src="img/1.jpg" alt="back" id="back"/></a>     
                    </div>
					<!--footer-->
					<div class="footer">
					<div> 
                        <label><xsl:text>Informazioni sulla risorsa originale</xsl:text></label><br/>
								<xsl:apply-templates select="//tei:msDesc/tei:msContents/tei:msItem"/><br/>
								<xsl:apply-templates select="//tei:msDesc/tei:msIdentifier"/><br/>
								<xsl:apply-templates select="//tei:physDesc"/><br/>	
					</div> 	
					</div>
				</div>
				
				<!-- collegamenti script -->
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script src="29_30nov.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/maphilight/1.4.0/jquery.maphilight.min.js"></script>				

			</body>
		</html>
	</xsl:template>

<!-- estraggo informazioni per la navbar -->
	<xsl:template name="int1">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>

<!-- estraggo cordinate ottenute tramite TEI ZONER delle aree delle immagini -->
	
<xsl:template match="tei:surface[@n='3']">
		<xsl:for-each select="tei:zone">
			<area shape="rect" class="classearea1">
				<xsl:attribute name="id">
					<xsl:value-of select="./@n"/>
				</xsl:attribute>
				<xsl:attribute name="coords">
					<xsl:value-of select="./@ulx"/>, 
					<xsl:value-of select="./@uly"/>,
					<xsl:value-of select="./@lrx"/>, 
					<xsl:value-of select="./@lry"/> 
				</xsl:attribute>
			</area>		
		</xsl:for-each>
	</xsl:template> 
<xsl:template match="tei:surface[@n='4']">
		<xsl:for-each select="tei:zone">
			<area shape="rect" class="classearea2">
				<xsl:attribute name="id">
					<xsl:value-of select="./@n"/>
				</xsl:attribute>
				<xsl:attribute name="coords">
					<xsl:value-of select="./@ulx"/>, 
					<xsl:value-of select="./@uly"/>,
					<xsl:value-of select="./@lrx"/>, 
					<xsl:value-of select="./@lry"/> 
				</xsl:attribute>
			</area>		
		</xsl:for-each>
	</xsl:template> 


<!-- estraggo il testo della diario e di formattazione-->

<xsl:template match="tei:div[@type='day' and @xml:id='d29_11']">
		<xsl:apply-templates/>
	</xsl:template>

<xsl:template match="tei:div[@type='day' and @xml:id='d30_11']">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="tei:lb[not(@break)]">
		<br/><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:lb[@break='no']">
		<sub> _</sub><br/><xsl:apply-templates/>
	</xsl:template>

<xsl:template match="tei:corr">
		<a class="nascosto"><xsl:apply-templates/></a>
	</xsl:template>
	
	<xsl:template match="tei:expan">
		<a class="nascosto"><xsl:apply-templates/></a>
	</xsl:template>
	
	<xsl:template match="tei:del">
		<span class="overstrike"> <xsl:apply-templates/> </span>
	</xsl:template>

	<xsl:template match="tei:add">
		<span><sup> <xsl:apply-templates/> </sup></span>
	</xsl:template>


<!-- estraggo informazioni sulla risorsa originale -->

	<xsl:template match="tei:author">
		<span><xsl:text>Autore: </xsl:text></span> <xsl:apply-templates/><br/>
	</xsl:template>

	
	<xsl:template match="tei:respStmt">
		<span><xsl:text>Con una </xsl:text></span> <xsl:apply-templates/><br/>
	</xsl:template>
	

	<xsl:template match="tei:title">
		<span><xsl:text>Titolo: </xsl:text></span> <xsl:apply-templates/> <br/>
	</xsl:template>

    <xsl:template match="tei:docDate">
		<span><xsl:text>Data: </xsl:text></span> <xsl:apply-templates/> <br/>
	</xsl:template>

	<xsl:template match="tei:textLang">
		<span><xsl:text>Lingua: </xsl:text></span> <xsl:apply-templates/><br/>
	</xsl:template>


	<xsl:template match="tei:msIdentifier">
		<span><xsl:text>Collocazione: </xsl:text></span> <xsl:apply-templates/><br/>
	</xsl:template>

    <xsl:template match="tei:repository">
		<span></span><xsl:apply-templates/> <xsl:text>, </xsl:text>
	</xsl:template>

	<xsl:template match="tei:settlement">
		<span><xsl:apply-templates/><xsl:text>, </xsl:text></span>
	</xsl:template>

	<xsl:template match="tei:country">
		<xsl:apply-templates/><xsl:text>, </xsl:text>
	</xsl:template>

	<xsl:template match="tei:idno">
		<xsl:apply-templates/>
	</xsl:template>

    <xsl:template match="tei:collection">
        <xsl:apply-templates/><xsl:text>, </xsl:text>
    </xsl:template>

	<xsl:template match="tei:support">
		<span><xsl:text>Supporto: </xsl:text></span><xsl:apply-templates/><br/>
	</xsl:template>

	<xsl:template match="tei:extent">
		<span><xsl:text>Manoscritto: </xsl:text></span><xsl:apply-templates/><br/>
	</xsl:template>


		<xsl:template match="tei:condition">
		<span><xsl:text>Condizioni fisiche: </xsl:text></span><xsl:apply-templates/><br/>
	</xsl:template>

	<xsl:template match="tei:handDesc">
		<span><xsl:text>Forma: </xsl:text></span><xsl:apply-templates/>
	</xsl:template>

	
</xsl:stylesheet>