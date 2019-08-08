<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cspnlt="urn:customs.ru:Information:SQDocuments:CustomsPenalties:5.13.1">
	<!-- Шаблон для типа CustomsPenaltiesType -->
	<xsl:template match="cspnlt:CustomsPenalties">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 270mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
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
									/*font-family: Arial;*/
									font-size: 11pt;
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
										<b>Сведения о штрафе, наложенном на нарушителя инспектором ФТС в ходе контроля в ПП</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Сведения о штрафе, наложенном на нарушителя инспектором ФТС в ходе контроля в ПП</div-->
					<br/>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">ИД записи в реестре нарушителей</td>
								<td class="graphMain bordered">ИД инспекции (контроля ФТС)</td>
								<td class="graphMain bordered">Регистрационные данные ТС</td>
								<td class="graphMain bordered">Сведения о нарушителе</td>
								<td class="graphMain bordered">Статья нарушения</td>
								<td class="graphMain bordered">Описание нарушения</td>
								<td class="graphMain bordered">Постановление</td>
								<td class="graphMain bordered">Сумма штрафа в рублях</td>
								<td class="graphMain bordered">УИН</td>
								<td class="graphMain bordered">Информация об постановлении в ФТС</td>
							</tr>
							<xsl:for-each select="cspnlt:Penalty">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="cspnlt:CustomsOffice">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cspnlt:CustomsPenaltyInfo -->
	<xsl:template match="cspnlt:CustomsPenaltyInfo">
		<xsl:if test="cspnlt:CustomsPerson">
			<xsl:text>ФИО инспектора: </xsl:text>
			<xsl:apply-templates select="cspnlt:CustomsPerson"/><br/>
		</xsl:if>
		<xsl:if test="cspnlt:CustomsOffice">
			<xsl:text>Код поста ФТС: </xsl:text>
			<xsl:apply-templates select="cspnlt:CustomsOffice"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="cspnlt:CustomsPerson">
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:LNP">
			<xsl:text> ЛНП </xsl:text>
			<xsl:value-of select="cat_ru:LNP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cspnlt:PenaltyType -->
	<xsl:template match="cspnlt:Penalty">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="cspnlt:ViolatorID"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cspnlt:InspectionID"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cspnlt:TSInfo"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cspnlt:Violator"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cspnlt:AutoLawName"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cspnlt:Violation"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cspnlt:Resolution"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(cspnlt:PenaltySum, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cspnlt:UIN"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cspnlt:CustomsPenaltyInfo"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="cspnlt:Resolution">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:TransportMeansBaseType -->
	<xsl:template match="cspnlt:TSInfo">
		<xsl:if test="cat_ru:VIN">
			<xsl:text>Номер шасси (VIN): </xsl:text>
			<xsl:value-of select="cat_ru:VIN"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:TransportKindCode">
			<xsl:text>Код типа ТС: </xsl:text>
			<xsl:value-of select="cat_ru:TransportKindCode"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMarkCode">
			<xsl:text>Код марки ТС: </xsl:text>
			<xsl:value-of select="cat_ru:TransportMarkCode"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:TransportIdentifier">
			<xsl:text>Идентификатор ТС: </xsl:text>
			<xsl:value-of select="cat_ru:TransportIdentifier"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMeansNationalityCode">
			<xsl:text>Код страны принадлежности ТС: </xsl:text>
			<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:ActiveTransportIdentifier">
			<xsl:text>Идентификатор активного ТС для прицепов, полуприцепов и др.: </xsl:text>
			<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:TransportRegNumber">
			<xsl:text>Номер свидетельства о регистрации ТС: </xsl:text>
			<xsl:value-of select="cat_ru:TransportRegNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cspnlt:ViolatorType -->
	<xsl:template match="cspnlt:Violator">
		<xsl:value-of select="cspnlt:Form"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cspnlt:Name"/>
		<xsl:if test="cspnlt:BirthDate">
			<br/><xsl:text> Дата рождения нарушителя: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cspnlt:BirthDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
