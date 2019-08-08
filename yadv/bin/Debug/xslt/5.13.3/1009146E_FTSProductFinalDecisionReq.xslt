<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:pfsreq="urn:customs.ru:Information:SQDocuments:FTSProductFinalDecisionReq:5.13.1">
	<!-- Шаблон для типа FTSProductFinalDecisionReqType -->
	<xsl:template match="pfsreq:FTSProductFinalDecisionReq">
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
									width: 190mm;
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
										<b>Запрос об окончательном решении по товару</b>
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
					</xsl:if-->
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Идентификатор процесса</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:GUID"/></td>
						</tr>
					</table>
					<xsl:if test="pfsreq:ProductPIId">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор ПИ товара</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ProductPIId"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pfsreq:IncidentId">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Идентификатор инцидента</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:IncidentId"/></td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Окончательное решение по товару</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="pfsreq:FinalDecision=1">ВВОЗ РАЗРЕШЕН</xsl:when>
									<xsl:when test="pfsreq:FinalDecision=2">ВВОЗ ЗАПРЕЩЕН</xsl:when>
									<xsl:when test="pfsreq:FinalDecision=3">ВВОЗ РАЗРЕШЕН. ТРЕБУЕТСЯ СКК ПО МЕСТУ ПРИБЫТИЯ</xsl:when>
									<xsl:otherwise><xsl:value-of select="pfsreq:FinalDecision"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата/время принятия решения представителем ФТС России</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="pfsreq:DecisionDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(pfsreq:DecisionDateTime, 12,8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="pfsreq:DecisionMaker">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">ФИО должностного лица ФТС России</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="pfsreq:DecisionMaker"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pfsreq:ArrivalSubject">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Субъект прибытия</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ArrivalSubject"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pfsreq:ArrivalPlace">
						<div class="title marg-top">Адрес места прибытия</div>
						<xsl:apply-templates select="pfsreq:ArrivalPlace"/>
					</xsl:if>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Номер сообщения о прибытии (идентифицирующем партию или товар)</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ArrivalMessageNumber"/></td>
						</tr>
					</table>
					<xsl:if test="pfsreq:DeclarationNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер декларации</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:DeclarationNumber"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="pfsreq:ProductNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер товара в декларации</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="pfsreq:ProductNumber"/></td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="pfsreq:ArrivalPlace">
		<xsl:if test="cat_ru:PostalCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:PostalCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:CounryName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CounryName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:Region">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:Region"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Населенный пункт</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:City"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:StreetHouse"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:TerritoryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:PersonBaseType -->
	<xsl:template match="pfsreq:DecisionMaker">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:PersonMiddleName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:PersonMiddleName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="cat_ru:PersonPost"/>
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
