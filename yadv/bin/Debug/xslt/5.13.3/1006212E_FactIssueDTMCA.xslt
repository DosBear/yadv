<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fidt="urn:customs.ru:Information:CustomsDocuments:FactIssueDTMCA:5.10.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="fidt:FactIssueDTMCA">
		<html>
			<head>
			<title>Сообщение о факте выпуска ДТ</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
			<style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
			</head>
			<body>
			<div class="page">
			    <table>
					<tr>
						<td align="center" style="border:solid 0pt" class="graph"><font face="Times new roman" size="4"><b>Сообщение о факте выпуска ДТ</b></font></td>
					</tr>
			</table>
			<table>
					<tr>
						<td align="center" style="border:solid 0pt" class="graph">&#160;</td>
					</tr>
					<tr>
						<td style="border:solid 0pt" class="graph">Код решения о выпуске ДТ: <xsl:value-of select="fidt:IssueDecisionCode"/></td>
					</tr>
					<tr>
						<td style="border:solid 0pt" class="graph">Дата выпуска ДТ: 
						    <xsl:call-template name="russian_date">
						        <xsl:with-param name="dateIn" select="fidt:IssueDecisionDate"/>
						    </xsl:call-template><xsl:text> </xsl:text> <xsl:value-of select="substring(fidt:IssueDecisionTime, 1, 8)"/>
						</td>
					</tr>
					<tr>
						<td style="border:solid 0pt" class="graph">Регистрационные номер ДТ: <xsl:apply-templates select="fidt:DTRegNumber"/></td>
					</tr>
			</table>
			</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="russian_date">
	<xsl:param name="dateIn"/>
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of
				select="substring($dateIn,1,4)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
   <xsl:template match="fidt:DTRegNumber"><!--код/дата/номер-->
	<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
	<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
</xsl:template>
</xsl:stylesheet>
