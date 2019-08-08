<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.13.1" xmlns:ckv="urn:customs.ru:Information:WarehouseDocuments:CWStorageQuitance:5.13.1">
	<!-- Шаблон для типа CWStorageQuitanceType -->
	<xsl:template match="ckv:CWStorageQuitance">
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
									/*width: 277mm;*/
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
										<b>Складская квитанция</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время создания электронного документа.</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catWH_ru:DocumentDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(catWH_ru:DocumentDateTime, 12, 8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="catWH_ru:CustomsProperties">
						<div class="title marg-top">Реквизиты таможенного органа</div>
					</xsl:if>
					<xsl:apply-templates select="catWH_ru:CustomsProperties"/>
					<xsl:if test="ckv:Header">
						<div class="title marg-top">Заголовок документа</div>
					</xsl:if>
					<xsl:apply-templates select="ckv:Header"/>
					<div class="title marg-top">Информация о товаре</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">№ п/п</td>
								<td class="graphMain bordered">Код по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Описание</td>
								<td class="graphMain bordered">Вес брутто (кг)</td>
								<td class="graphMain bordered">Вес нетто (кг)</td>
								<td class="graphMain bordered">№ п/п в предыдущей квитанции</td>
								<td class="graphMain bordered">№ п/п в ДТ, по которой принят груз</td>
								<td class="graphMain bordered">Кол-во принятых грузовых мест</td>
								<td class="graphMain bordered">Оценочная стоимость</td>
								<td class="graphMain bordered">Кол-во остатка мест</td>
								<td class="graphMain bordered">Оценочная стоимость остатка</td>
								<td class="graphMain bordered">Вес брутто остатков</td>
								<td class="graphMain bordered">Вес брутто принятого груза в ДЕИ</td>
								<td class="graphMain bordered">Номер ДТ</td>
							</tr>
							<xsl:for-each select="ckv:Commodity">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="catWH_ru:CustomsProperties">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа ckv:CommodityType -->
	<xsl:template match="ckv:Commodity">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:GoodsTNVEDCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:GoodsDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cat_ru:GrossWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cat_ru:NetWeightQuantity, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ckv:GoodsNumericPred"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ckv:GoodsNumberInGTD"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ckv:GoodsPlacesIn"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(ckv:RatableValueIn, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ckv:GoodsPlacesRest"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(ckv:RatableValueRest, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(ckv:GrossWeightQuantityRest, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="ckv:GrossWeightSuppQuantityIn">
					<xsl:apply-templates select="ckv:GrossWeightSuppQuantityIn"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="ckv:GTDOutNumber">
					<xsl:apply-templates select="ckv:GTDOutNumber"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:WHSuppQuantityType -->
	<xsl:template match="ckv:GrossWeightSuppQuantityIn">
		<xsl:value-of select="translate(catWH_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="catWH_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="catWH_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="catWH_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="catWH_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ckv:GTDNumber|ckv:GTDOutNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTDdate">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа ckv:StorageQuitanceHeadType -->
	<xsl:template match="ckv:Header">
		<xsl:if test="ckv:CustomsModeCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного режима</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="ckv:CustomsModeCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер редакции электронного документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="ckv:OrderNumberOfEdition"/>
				</td>
			</tr>
		</table>
		<xsl:if test="ckv:StorageQuitanceNumber">
			<div class="title marg-top">Номер складской квитанции</div>
		</xsl:if>
		<xsl:apply-templates select="ckv:StorageQuitanceNumber"/>
		<xsl:if test="ckv:PriorStorageQuitanceNumber"/>
		<xsl:if test="ckv:PriorStorageQuitanceNumber">
			<div class="title marg-top">Номер предыдущей складской квитанции</div>
		</xsl:if>
		<xsl:apply-templates select="ckv:PriorStorageQuitanceNumber"/>
		<xsl:if test="ckv:NextStorageQuitanceNumber"/>
		<xsl:if test="ckv:NextStorageQuitanceNumber">
			<div class="title marg-top">Номер следующей складской квитанции</div>
		</xsl:if>
		<xsl:apply-templates select="ckv:NextStorageQuitanceNumber"/>
		<xsl:if test="ckv:GTDNumber"/>
		<xsl:if test="ckv:GTDNumber">
			<div class="title marg-top">Номер ДТ</div>
		</xsl:if>
		<xsl:apply-templates select="ckv:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:AISTSDocumentIDType -->
	<xsl:template match="ckv:NextStorageQuitanceNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catWH_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата оформления документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="catWH_ru:IssueDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catWH_ru:DocNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:AISTSDocumentIDType -->
	<xsl:template match="ckv:PriorStorageQuitanceNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catWH_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата оформления документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="catWH_ru:IssueDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catWH_ru:DocNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:AISTSDocumentIDType -->
	<xsl:template match="ckv:StorageQuitanceNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catWH_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата оформления документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="catWH_ru:IssueDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="catWH_ru:DocNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="GTDdate">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
