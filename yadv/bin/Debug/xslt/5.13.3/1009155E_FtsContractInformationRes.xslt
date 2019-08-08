<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fcires="urn:customs.ru:Information:SQDocuments:FtsContractInformationRes:5.13.1">
	<!-- Шаблон для типа FtsContractInformationResType -->
	<xsl:template match="fcires:FtsContractInformationRes">
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
										<b>Ответ на запрос сведений о контрактах</b>
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
					<xsl:if test="fcires:Importer">
						<div class="title marg-top">Организация-импортер</div>
						<xsl:apply-templates select="fcires:Importer"/>
					</xsl:if>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">ИНН получателя</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="fcires:RecipientINN"/></td>
						</tr>
					</table>
					<xsl:if test="fcires:ContractsInfo">
						<div class="title marg-top">Сведения о выданных контрактах</div>
						<xsl:apply-templates select="fcires:ContractsInfo"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="fcires:Contract">
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
	<!-- Шаблон для типа fcires:ContractInfoType -->
	<xsl:template match="fcires:ContractInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="fcires:Contract"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="fcires:ProductInfo">
					<xsl:apply-templates select="."/><br/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="fcires:CounterpartyInfo">
					<xsl:apply-templates select="."/><br/>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа fcires:ContractsInfoType -->
	<xsl:template match="fcires:ContractsInfo">
		<table class="bordered w190">
			<tr class="title">
				<td class="graphMain bordered">Номер и дата контракта</td>
				<td class="graphMain bordered">Продукция в контракте (код ТН ВЭД ЕАЭС, описание товара)</td>
				<td class="graphMain bordered">Информация о контрагентах</td>
			</tr>
			<xsl:for-each select="fcires:ContractInfo">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fcires:CounterpartyInfoType -->
	<xsl:template match="fcires:CounterpartyInfo">
		<xsl:value-of select="fcires:CounterpartyName"/>
		<xsl:text> Адрес: </xsl:text>
		<xsl:value-of select="fcires:CounterpartyAddress"/>
	</xsl:template>
	<!-- Шаблон для типа fcires:ImporterType -->
	<xsl:template match="fcires:Importer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование организации-импортера</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fcires:OrganizationName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Адрес местонахождения и осуществления деятельности организации-импортера</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="fcires:OrganizationAddress"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа fcires:ProductInfoType -->
	<xsl:template match="fcires:ProductInfo">
		<xsl:value-of select="fcires:TNVEDCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="fcires:ContractDeclaredGood"/>
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
