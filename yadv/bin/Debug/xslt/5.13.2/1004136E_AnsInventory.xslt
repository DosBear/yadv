<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ani="urn:customs.ru:Information:ExchangeDocuments:AnsInventory:5.13.2" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AnsInventoryType -->
	<xsl:template match="ani:AnsInventory">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 190mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>ОТВЕТ НА ЗАПРОС ДОКУМЕНТОВ И (ИЛИ) СВЕДЕНИЙ</b><br/>
										<xsl:text> от </xsl:text>
										<xsl:apply-templates mode="russian_date" select="ani:ResolDate"/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:text>Направленный в соответсвии с п.4. статьи 325 ТКЕАЭС,  от </xsl:text>
									<xsl:apply-templates mode="russian_date" select="ani:ResolDate"/>
									<xsl:text> по ДТ </xsl:text>
									<xsl:apply-templates select="ani:GTDID"/>
									<xsl:if test="ani:Declarant">
										<xsl:text>, отправленной </xsl:text>
										<xsl:apply-templates select="ani:Declarant"/>
									</xsl:if>
									<xsl:text>.</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:text>Данные, подтверждающие сведения, заявленные в таможенной декларации</xsl:text>
					<table width="100%">
						<tbody>
							<tr valign="top" align="center">
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered">Перечень заявленных сведений, требующих подтверждения/уточнения</td>
								<td class="bordered">Перечень запрашиваемых документов и (или) сведений</td>
								<td class="bordered">Примечание</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
							</tr>
							<xsl:for-each select="ani:CustomsCostInf">
								<tr valign="top">
									<td class="bordered">
										<xsl:value-of select="ani:Position"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="ani:CustCostInf"/>
									</td>
									<td class="bordered">
										<xsl:for-each select="ani:ReqDocuments">
											<xsl:value-of select="ani:PrDocumentName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ani:PrDocumentNumber"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="russian_date" select="ani:PrDocumentDate"/>
											<xsl:text> </xsl:text>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</td>
									<td class="bordered">4</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<xsl:if test="ani:Documents">
						<xsl:text>Дополнительные не запрошенные документы</xsl:text>
						<table width="100%">
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="5%">№ п/п</td>
									<td class="bordered">Наименование</td>
									<td class="bordered">Код вида</td>
									<td class="bordered">Инф. о документе в архиве</td>
									<td class="bordered">Примечание</td>
								</tr>
								<tr align="center">
									<td class="bordered">1</td>
									<td class="bordered">2</td>
									<td class="bordered">3</td>
									<td class="bordered">4</td>
									<td class="bordered">5</td>
								</tr>
								<xsl:for-each select="ani:Documents">
									<tr valign="top">
										<td class="bordered" align="center">
											<xsl:value-of select="ani:PositionDoc"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="ani:PrDocumentName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="ani:PrDocumentNumber"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="russian_date" select="ani:PrDocumentDate"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="ani:DocCode"/>
										</td>
										<td class="bordered">
											<xsl:for-each select="ani:ArchDocInfo/*">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="ani:Comment"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<xsl:apply-templates select="ani:ResponcePerson"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="ani:ResponcePerson">
		<table>
			<tbody>
				<tr valign="top">
					<td width="33%">
						<xsl:value-of select="cat_ru:PersonPost"/>
					</td>
					<td width="34%" style="border-bottom: 1px solid black;"></td>
					<td width="33%">
						<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text> </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="ani:Declarant">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
	</xsl:template>
	
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="ani:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template mode="num_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring(.,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template mode="russian_date" match="*">
		<xsl:choose>
			<xsl:when test="substring(.,5,1)='-' and substring(.,8,1)='-'">
				<xsl:value-of select="substring(.,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring(.,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
