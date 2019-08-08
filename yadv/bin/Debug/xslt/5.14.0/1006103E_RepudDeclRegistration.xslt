<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru rdr" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rdr="urn:customs.ru:Information:CustomsDocuments:RepudDeclRegistration:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/>.
		<xsl:value-of select="substring(., 6, 2)"/>.
		<xsl:value-of select="substring(., 1, 4)"/>
	</xsl:template>
	<xsl:template name="MonthRus">
		<xsl:choose>
			<xsl:when test="substring(., 6, 2)='01'">января</xsl:when>
			<xsl:when test="substring(., 6, 2)='02'">февраля</xsl:when>
			<xsl:when test="substring(., 6, 2)='03'">марта</xsl:when>
			<xsl:when test="substring(., 6, 2)='04'">апреля</xsl:when>
			<xsl:when test="substring(., 6, 2)='05'">мая</xsl:when>
			<xsl:when test="substring(., 6, 2)='06'">июня</xsl:when>
			<xsl:when test="substring(., 6, 2)='07'">июля</xsl:when>
			<xsl:when test="substring(., 6, 2)='08'">августа</xsl:when>
			<xsl:when test="substring(., 6, 2)='09'">сентября</xsl:when>
			<xsl:when test="substring(., 6, 2)='10'">октября</xsl:when>
			<xsl:when test="substring(., 6, 2)='11'">ноября</xsl:when>
			<xsl:when test="substring(., 6, 2)='12'">декабря</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="rdr:RepudDeclRegistration">
		<html>
			<META CONTENT="text/html; charset=UTF-8" HTTP-EQUIV="Content-Type"/>
			<style type="text/css">
                    body {}
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

                    @media print {
                        div.page {
                            border: none;
                            padding: 0;
                        }
                    }
                     .graph12 {
                        font-family: Arial, serif, bold;
                        font-size: 12pt;}
                        
                    .graph10 {
                        font-family: Arial, serif;
                        font-size: 10pt;}

                    .graph8 {
                        font-family: Arial, serif;
                        font-size: 8pt;}

                       td {border: 0px solid gray;
                        font-family: Arial, serif;
                    }
                     .underlined {
                        border-bottom: solid 1pt #000000;
                    }
                    
                    .graph {
							font-family: Arial;
							font-size: 10pt;
							}
							
                     table.items {border-collapse: collapse;}
                    table.items td, table.items th {border: 1px solid black; padding: 2px;}
                    table.items th {background-color: WhiteSmoke;}
                    </style>
			<body>
				<xsl:if test="rdr:DocumentSign='1'">
					<div class="page">
						<table style="width:170mm">
							<xsl:if test="rdr:RegNumber">
								<tr>
									<td align="center" class="graph12">Решение об отказе в регистрации ДТ № 
				<xsl:value-of select="rdr:RegNumber"/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graph12">к декларации на товары, поданной</td>
								</tr>
							</xsl:if>
							<xsl:if test="not(rdr:RegNumber)">
								<tr>
									<td align="center" class="graph12">Решение об отказе в регистрации таможенного документа, </td>
								</tr>
								<tr>
									<td align="center" class="graph12">поданного</td>
								</tr>
							</xsl:if>
							<tr>
								<td align="center" class="graph12">
									<xsl:value-of select="rdr:Organization/cat_ru:OrganizationName"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph8">(наименование декларанта или таможенного представителя)</td>
							</tr>
							<xsl:if test="rdr:DecisionDate">
								<tr>
									<td align="left" class="graph12">
										<xsl:text>Дата и время решения: </xsl:text>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rdr:DecisionDate"/></xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(rdr:DecisionDate, 12, 5)"/>
									</td>
								</tr>
							</xsl:if>
						</table>
						<table class="items" style="width:170mm">
							<tr>
								<td align="center" class="graph10">№ п/п</td>
								<td align="center" class="graph10">Причины отказа в регистрации 
				<xsl:choose>
										<xsl:when test="rdr:RegNumber">ДТ в соответствии со статьей 111 ТК ЕАЭС</xsl:when>
										<xsl:otherwise>таможенного документа</xsl:otherwise>
									</xsl:choose>
								</td>
								<td align="center" class="graph10">Примечание</td>
							</tr>
							<xsl:for-each select="rdr:DescriptionReasons">
								<tr>
									<td class="graph10" style="width:20mm" width="25">
										<xsl:number count="rdr:DescriptionReasons" format="1"/>
									</td>
									<td class="graph10" style="width:115mm">
										<xsl:apply-templates select="rdr:ReasonRefusal"/>
										<xsl:if test="rdr:ReasonRefusal and rdr:Comment">
											<xsl:text> - </xsl:text>
										</xsl:if>
										<xsl:apply-templates select="rdr:Comment"/>
									</td>
									<td class="graph10" style="width:45mm">
										<xsl:for-each select="rdr:Comment">
											<xsl:value-of select="."/> 
				</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<table style="width:170mm">
							<tr>
								<td style="border:solid 0pt" class="graph" colspan="5">&#160;</td>
							</tr>
							<tr>
								<td style="border:solid 0pt" class="graph" align="center">
									<xsl:value-of select="rdr:CustomsPersonSignature/cat_ru:PersonName"/>
								</td>
								<td style="border:solid 0pt" class="graph">&#160;</td>
								<td style="border:solid 0pt" class="graph">&#160;</td>
								<td style="border:solid 0pt" class="graph">&#160;</td>
								<td style="border:solid 1pt #000000" class="graph" rowspan="2" align="center">
									<xsl:if test="rdr:CustomsPersonSignature/cat_ru:LNP">
										<xsl:value-of select="rdr:CustomsPersonSignature/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="border-top:solid 1pt #000000" class="graph8" width="40%" align="center">(Ф.И.О должностного лица)</td>
								<td style="border:solid 0pt" class="graph8" width="5%">&#160;</td>
								<td style="border-top:solid 1pt #000000" class="graph8" width="35%" align="center">(подпись)</td>
								<td style="border:solid 0pt" class="graph8" width="5%">&#160;</td>
							</tr>
							<td style="border:solid 0pt" class="graph" colspan="5">&#160;</td>
							<tr>
								<td class="graph10">Дата "<xsl:value-of select="substring(rdr:CustomsPersonSignature/rdr:IssueDate, 9, 2)"/>"
					<xsl:for-each select="rdr:CustomsPersonSignature/rdr:IssueDate">
						<xsl:call-template name="MonthRus"/>
					</xsl:for-each>&#160;<xsl:value-of select="substring(rdr:CustomsPersonSignature/rdr:IssueDate, 1, 4)"/> г.
								</td>
							</tr>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="rdr:DocumentSign='0'">
					<div class="page">
						<table style="width:170mm">
							<tr>
								<td align="center" style="border:solid 0pt" class="graph">
									<b>Решение об отказе<br/>в регистрации корректировки декларации на товары</b>
								</td>
							</tr>
						</table>
						<table style="width:170mm">
							<tr>
								<td style="border:solid 0pt" class="graph">&#160;</td>
							</tr>
							<tr>
								<td style="border:solid 0pt" class="graph">к декларации на товары № <u>
										<xsl:apply-templates select="rdr:DeclRegNumber"/>
									</u>,<br/>
								</td>
							</tr>
							<tr>
								<td style="border:solid 0pt" class="graph">поданной <u>
										<xsl:value-of select="rdr:Organization/cat_ru:OrganizationName"/>
									</u>.</td>
							</tr>
							<tr>
								<td style="border:solid 0pt" class="graph8" align="center">(наименование декларанта или таможенного представителя)</td>
							</tr>
							<xsl:if test="rdr:DecisionDate">
								<tr>
									<td align="left" class="graph">
										<xsl:text>Дата и время решения: </xsl:text>
										<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rdr:DecisionDate"/></xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="substring(rdr:DecisionDate, 12, 5)"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td style="border:solid 0pt" class="graph">&#160;</td>
							</tr>
							<tr>
								<td style="border:solid 0pt" class="graph" align="center">обращение декларанта (таможенного представителя)<br/>
					от "<xsl:value-of select="substring(rdr:DeclarantRequest/cat_ru:PrDocumentDate, 9, 2)"/>"
					<xsl:for-each select="rdr:DeclarantRequest/cat_ru:PrDocumentDate">
						<xsl:call-template name="MonthRus"/>
					</xsl:for-each>&#160;<xsl:value-of select="substring(rdr:DeclarantRequest/cat_ru:PrDocumentDate, 1, 4)"/> г. №<xsl:value-of select="rdr:DeclarantRequest/cat_ru:PrDocumentNumber"/>
								</td>
							</tr>
						</table>
						<table class="items" style="width:170mm">
							<tr>
								<td align="center" class="graph10">№ п/п</td>
								<td align="center" class="graph10">Причины  отказа  в  регистрации  корректировки  декларации на товары в соответствии с правом ЕАЭС</td>
								<td align="center" class="graph10">Примечание</td>
							</tr>
							<xsl:for-each select="rdr:DescriptionReasons">
								<tr>
									<td class="graph10" style="width:20mm" width="25" align="center">
										<xsl:number count="rdr:DescriptionReasons" format="1"/>
									</td>
									<td class="graph10" style="width:115mm">
										<xsl:for-each select="rdr:ReasonRefusal">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()">&#160;</xsl:if>
										</xsl:for-each>
									</td>
									<td class="graph10" style="width:45mm">
										<xsl:for-each select="rdr:Comment">
											<xsl:value-of select="."/> 
                        <xsl:if test="position()!=last()">&#160;</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<table style="width:170mm">
							<tr>
								<td style="border:solid 0pt" class="graph" colspan="5">&#160;</td>
							</tr>
							<tr>
								<td style="border:solid 0pt" class="graph" align="center">
									<xsl:value-of select="rdr:CustomsPersonSignature/cat_ru:PersonName"/>
								</td>
								<td style="border:solid 0pt" class="graph">&#160;</td>
								<td style="border:solid 0pt" class="graph">&#160;</td>
								<td style="border:solid 0pt" class="graph">&#160;</td>
								<td style="border:solid 1pt #000000" class="graph" rowspan="2" align="center">
									<xsl:if test="rdr:CustomsPersonSignature/cat_ru:LNP">
										<xsl:value-of select="rdr:CustomsPersonSignature/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td style="border-top:solid 1pt #000000" class="graph8" width="40%" align="center">(Ф.И.О должностного лица)</td>
								<td style="border:solid 0pt" class="graph8" width="5%">&#160;</td>
								<td style="border-top:solid 1pt #000000" class="graph8" width="35%" align="center">(подпись)</td>
								<td style="border:solid 0pt" class="graph8" width="5%">&#160;</td>
							</tr>
							<td style="border:solid 0pt" class="graph" colspan="5">&#160;</td>
						</table>
						<table>
							<tr>
								<td style="border:solid 0pt" class="graph">
					"<xsl:value-of select="substring(rdr:CustomsPersonSignature/rdr:IssueDate, 9, 2)"/>"
					<xsl:for-each select="rdr:CustomsPersonSignature/rdr:IssueDate">
						<xsl:call-template name="MonthRus"/>
					</xsl:for-each>&#160;<xsl:value-of select="substring(rdr:CustomsPersonSignature/rdr:IssueDate, 1, 4)"/> г.
					</td>
							</tr>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="rdr:DeclRegNumber">
		<!--код/дата/номер-->
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
