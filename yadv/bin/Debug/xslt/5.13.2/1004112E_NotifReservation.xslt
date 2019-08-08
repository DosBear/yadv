<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nr="urn:customs.ru:Information:ExchangeDocuments:NotifReservation:5.10.0">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="nr:NotifReservation">
		<html>
			<head>
			<title>Уведомление о резервировании/о невозможности резервирования суммы обеспечения</title>
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
					<td align="center" style="border:solid 0pt" class="graph"><font face="Times new roman" size="4"><b> 
					<xsl:choose>
						<xsl:when test="nr:DocSign='0'">Уведомление об успешном резервировании суммы обеспечения</xsl:when>
						<xsl:when test="nr:DocSign='1'">Уведомление о частичном резервировании суммы обеспечения</xsl:when>
						<xsl:when test="nr:DocSign='2'">Уведомление о невозможности резервирования суммы обеспечения</xsl:when>
					</xsl:choose>
					</b></font></td>
				</tr>
				<tr>
					<td style="border:solid 0pt" class="graph">&#160;</td>
				</tr>
				<tr>
					<td align="right" style="border:solid 0pt" class="graph"><font face="Times new roman" size="3"><b><u>
					    <xsl:call-template name="date_time">
					        <xsl:with-param name="dateTimeIn" select="nr:DocumentDateTime"/>
					    </xsl:call-template></u>
					</b></font></td>
				</tr>
				<!--<tr>
					<td style="border:solid 0pt" class="graph">&#160;</td>
				</tr>-->
			</table>
			<table>
			        <tr>
						<td style="border:solid 0pt" class="graph" colspan="2"><b>Регистрационный номер таможенной декларации&#160;
						<xsl:apply-templates select="nr:DeclRegNumber"/></b></td>
					</tr>
					<tr>
						<td style="border:solid 0pt" class="graph" width="50%">Зарезервированная сумма обеспечения уплаты таможенных пошлин, налогов</td>
						<td style="border:solid 0pt" class="graph"><u><xsl:value-of select="nr:ReservedAmount"/>
						<xsl:if test="nr:CurrencyCode">
						    <xsl:text> </xsl:text><xsl:value-of select="nr:CurrencyCode"/>
						</xsl:if>
						</u></td>
					</tr>
					<xsl:if test="nr:RequiredAmount">
					<tr>
						<td style="border:solid 0pt" class="graph">Сумма обеспечения, которая не может быть зарезервирована из-за отсутствия неиспользованного (свободного) остатка</td>
						<td style="border:solid 0pt" class="graph"><u><xsl:value-of select="nr:RequiredAmount"/>
						<xsl:if test="nr:CurrencyCode">
						    <xsl:text> </xsl:text><xsl:value-of select="nr:CurrencyCode"/>
						</xsl:if>
						</u></td>
					</tr></xsl:if>
					<xsl:if test="nr:Reasons">
					<tr>
						<td style="border:solid 0pt" class="graph">Описание обстоятельств, послуживших причиной невозможности резервирования суммы обеспечения</td>
						<td style="border:solid 0pt" class="graph">
						<xsl:for-each select="nr:Reasons">
						<u><xsl:value-of select="nr:ReasonCode"/><xsl:text> </xsl:text> 
						<xsl:for-each select="nr:ReasonDescription">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
						</xsl:for-each>
						</u>
						<xsl:if test="position()!=last()"><br/></xsl:if>
						</xsl:for-each>
						</td>
					</tr></xsl:if>
					<xsl:if test="nr:Comment">
					<tr>
					    <td style="border:solid 0pt" class="graph" colspan="2">&#160;</td>
				    </tr>
				    <tr>
					    <td style="border:solid 0pt" class="graph" colspan="2">Примечание: 
					    <xsl:for-each select="nr:Comment">
					        <xsl:value-of select="."/>
					        <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
					    </xsl:for-each>
					    </td>
				    </tr></xsl:if>
			</table>
			<table>
			        <tr>
					    <td style="border:solid 0pt" class="graph" colspan="2">&#160;</td>
				    </tr>
				    <xsl:if test="nr:Customs">
			        <tr>
						<td style="border:solid 0pt" class="graph"><b>Код и наименование таможенного органа</b>&#160;
						<u><xsl:value-of select="nr:Customs/cat_ru:Code"/>
						<xsl:if test="nr:Customs/cat_ru:OfficeName"><xsl:text> </xsl:text><xsl:value-of select="nr:Customs/cat_ru:OfficeName"/></xsl:if></u>
						</td>
					</tr></xsl:if>
					<xsl:if test="nr:CustomsPerson">
					<tr>
						<td style="border:solid 0pt" class="graph"><b>Должностное лицо таможенного органа</b>&#160;
						<u><xsl:value-of select="nr:CustomsPerson/cat_ru:PersonName"/>
						<xsl:if test="nr:CustomsPerson/cat_ru:LNP"><xsl:text> </xsl:text><xsl:value-of select="nr:CustomsPerson/cat_ru:LNP"/></xsl:if></u>
						</td>
					</tr></xsl:if>
			</table>
			</div>
			</body>
	    </html>
	</xsl:template>
	<xsl:template name="date_time">
	<xsl:param name="dateTimeIn"/>
	<xsl:call-template name="russian_date">
		<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
	</xsl:call-template>
	<xsl:text> </xsl:text>
	<xsl:value-of select="substring($dateTimeIn,12,5)"/>
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
<xsl:template match="nr:DeclRegNumber"><!--код/дата/номер-->
	<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
	<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
</xsl:template>
</xsl:stylesheet>
