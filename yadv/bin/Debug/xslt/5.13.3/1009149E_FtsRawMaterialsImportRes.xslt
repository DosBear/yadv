<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:frmireq="urn:customs.ru:Information:SQDocuments:FtsRawMaterialsImportRes:5.13.1">
	<!-- Шаблон для типа FtsRawMaterialsImportResType -->
	<xsl:template match="frmireq:FtsRawMaterialsImportRes">
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
										<b>Предоставление сведений о ввозе сырья, этилового спирта, алкогольной и спиртосодержащей продукции</b>
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
					<xsl:if test="frmireq:Importer">
						<div class="title marg-top">Организация-импортер</div>
						<xsl:apply-templates select="frmireq:Importer"/>
					</xsl:if>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">ИНН получателя</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="frmireq:RecipientINN"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:40%">Код ТН ВЭД ЕАЭС</td>
							<td class="value graphMain" style="width:60%"><xsl:value-of select="frmireq:TNVEDCode"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:40%">Таможенная процедура</td>
							<td class="value graphMain" style="width:60%"><xsl:apply-templates select="frmireq:CustomsProcedure"/></td>
						</tr>
					</table>
					<div class="title marg-top">Сведения из декларации</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" rowspan="2" style="vertical-align: middle">Номер таможенной декларации</td>
								<td class="graphMain bordered" colspan="6">Информация о товаре</td>
							</tr>
							<tr class="title">
								<td class="graphMain bordered">Наименование сырья, этилового спирта, алкогольной и спиртосодержащей продукции</td>
								<td class="graphMain bordered">Дата выпуска товара</td>
								<td class="graphMain bordered">Кол-во товара в ДЕИ</td>
								<td class="graphMain bordered">Сведения о ЕИ отличной от основной и дополнительной</td>
								<td class="graphMain bordered">Страна происхождения товара</td>
								<td class="graphMain bordered">Внешнеторговый контракт</td>
							</tr>
							<xsl:for-each select="frmireq:DeclarationInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа frmireq:CountryOriginType -->
	<xsl:template match="frmireq:CountryOrigin">
		<xsl:if test="frmireq:CountryCode">
			<xsl:if test="frmireq:CountryName">(</xsl:if>						
			<xsl:value-of select="frmireq:CountryCode"/>
			<xsl:if test="frmireq:CountryName">) </xsl:if>
		</xsl:if>
		<xsl:value-of select="frmireq:CountryName"/>
	</xsl:template>
	<!-- Шаблон для типа frmireq:CustomsProcedureType -->
	<xsl:template match="frmireq:CustomsProcedure">
		<xsl:if test="frmireq:CustomsProcedureName">(</xsl:if>
		<xsl:value-of select="frmireq:CustomsModeCode"/>
		<xsl:if test="frmireq:CustomsProcedureName">) </xsl:if>
		<xsl:value-of select="frmireq:CustomsProcedureName"/>
	</xsl:template>
	<!-- Шаблон для типа frmireq:DeclarationInfoType -->
	<xsl:template match="frmireq:DeclarationInfo">
		<tr>
			<td class="graphMain bordered" rowspan="{count(frmireq:ProductInfo)}"><xsl:apply-templates select="frmireq:DeclarationNumber"/></td>
			<xsl:apply-templates select="frmireq:ProductInfo[1]"/>
		</tr>
		<xsl:for-each select="frmireq:ProductInfo[position() &gt; 1]">
			<tr>	
				<xsl:apply-templates select="."/>
			</tr>
		</xsl:for-each>	
			<!--td class="graphMain bordered">
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered">Наименование сырья, этилового спирта, алкогольной и спиртосодержащей продукции</td>
								<td class="graphMain bordered">Дата выпуска товара</td>
								<td class="graphMain bordered">Количество товара (в дополнительной единице измерения)</td>
								<td class="graphMain bordered">Сведения о единицах измерения отличной от основной и дополнительной</td>
								<td class="graphMain bordered">Страна происхождения товара</td>
								<td class="graphMain bordered">Внешнеторговый контракт</td>
							</tr>
						</tr>
						<xsl:for-each select="frmireq:ProductInfo">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
			</td>
		</tr-->
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="frmireq:DeclarationNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="frmireq:ExternalContract">
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
	<!-- Шаблон для типа frmireq:ImporterType -->
	<xsl:template match="frmireq:Importer">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:40%">Наименование</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="frmireq:OrganizationName"/></td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:40%">Адрес местонахождения и осуществления деятельности</td>
				<td class="value graphMain" style="width:60%"><xsl:value-of select="frmireq:OrganizationAddress"/></td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="frmireq:ProductCount| frmireq:OtherMeasureUnitInfo">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text>(код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа frmireq:ProductInfoType -->
	<xsl:template match="frmireq:ProductInfo">
		<td class="graphMain bordered"><xsl:value-of select="frmireq:ProductName"/></td>
		<td class="graphMain bordered">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="frmireq:ProductIssueDate"/>
			</xsl:call-template>
		</td>
		<td class="graphMain bordered"><xsl:apply-templates select="frmireq:ProductCount"/></td>
		<td class="graphMain bordered">
			<xsl:for-each select="frmireq:OtherMeasureUnitInfo">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">,<br/></xsl:if>
			</xsl:for-each>
		</td>
		<td class="graphMain bordered"><xsl:apply-templates select="frmireq:CountryOrigin"/></td>
		<td class="graphMain bordered"><xsl:apply-templates select="frmireq:ExternalContract"/></td>
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
