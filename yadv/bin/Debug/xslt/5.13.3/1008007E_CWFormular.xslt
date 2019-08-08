<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.13.1" xmlns:cwf="urn:customs.ru:Information:WarehouseDocuments:CWFormular:5.13.1">
	<!-- Шаблон для типа CWFormularType -->
	<xsl:template match="cwf:CWFormular">
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
									/*width: 190mm;*/
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
										<b>Формуляр контроля товаров </b>
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
					<xsl:if test="cwf:Document">
						<div class="title marg-top">Информация о представленных документах</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование документа</td>
									<td class="graphMain bordered">Номер документа</td>
									<td class="graphMain bordered">Дата документа</td>
									<td class="graphMain bordered">Порядковый номер документа</td>
									<td class="graphMain bordered">Тип документа</td>
								</tr>
								<xsl:for-each select="cwf:Document">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<div class="title marg-top">Информация о товаре</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" bgcolor="#bbbbbb">№ п/п</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Код по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Описание</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Вес брутто (кг)</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Вес нетто (кг)</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">№ п/п в складской квитанции</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">№ п/п в ДТ</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Код страны</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Наименование страны</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Срок хранения</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Примечание</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Кол-во товара в ДЕИ</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Кол-во товара в физ.ЕИ 1</td>
								<td class="graphMain bordered" bgcolor="#bbbbbb">Кол-во товара в физ.ЕИ 2</td>
								<!--td class="graphMain bordered">Информация о выпуске</td-->
							</tr>
							<xsl:for-each select="cwf:Commodity">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="cwf:Header">
						<div class="title marg-top">Информация о реквизитах документа</div>
					</xsl:if>
					<xsl:apply-templates select="cwf:Header"/>
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
	<!-- Шаблон для типа cwf:CommodityType -->
	<xsl:template match="cwf:Commodity">
		<tr align="center">
			<td class="bordered" bgcolor="#cccccc">1</td>
			<td class="bordered" bgcolor="#cccccc">2</td>
			<td class="bordered" bgcolor="#cccccc">3</td>
			<td class="bordered" bgcolor="#cccccc">4</td>
			<td class="bordered" bgcolor="#cccccc">5</td>
			<td class="bordered" bgcolor="#cccccc">6</td>
			<td class="bordered" bgcolor="#cccccc">7</td>
			<td class="bordered" bgcolor="#cccccc">8</td>
			<td class="bordered" bgcolor="#cccccc">9</td>
			<td class="bordered" bgcolor="#cccccc">10</td>
			<td class="bordered" bgcolor="#cccccc">11</td>
			<td class="bordered" bgcolor="#cccccc">12</td>
			<td class="bordered" bgcolor="#cccccc">13</td>
			<td class="bordered" bgcolor="#cccccc">14</td>
		</tr>
		<tr>
			<td class="graphMain bordered" rowspan="2">
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
				<xsl:value-of select="cwf:GoodsNumberInStorageQuitance"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:GoodsNumberInGTD"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:CountryCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:CountryName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cwf:GoodsShellLife"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:Notes"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cwf:GoodsValue">
					<xsl:apply-templates select="cwf:GoodsValue"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cwf:GoodsValue1">
					<xsl:apply-templates select="cwf:GoodsValue1"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cwf:GoodsValue2">
					<xsl:apply-templates select="cwf:GoodsValue2"/>
				</xsl:if>
			</td>
		</tr>
		<tr>
			<td class="graphMain bordered" colspan="13">
				<xsl:if test="cwf:CommodityOut">
					<div class="title">Информация о выпуске товара</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<tr>
									<td class="graphMain bordered" bgcolor="#eeeeee">№ п/п</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">№ п/п товара в ДТ</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">Таможенный режим</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">Вес товара, кг</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">Примечание</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">№ п/п товара в формуляре.</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">Кол-во товара в ДЕИ</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">Кол-во товара в физ.ЕИ 1</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">Кол-во товара в физ.ЕИ 2</td>
									<td class="graphMain bordered" bgcolor="#eeeeee">Номер ДТ, по которому выпускается товар</td>
								</tr>
							</tr>
							<xsl:for-each select="cwf:CommodityOut">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cwf:CommodityOutType -->
	<xsl:template match="cwf:CommodityOut">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:GoodsNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:GoodsNumberInGTD"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:CustomsModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(cwf:GoodsWeight, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:Notes"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:GoodsNumberMain"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cwf:GoodsValue">
					<xsl:apply-templates select="cwf:GoodsValue"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cwf:GoodsValue1">
					<xsl:apply-templates select="cwf:GoodsValue1"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cwf:GoodsValue2">
					<xsl:apply-templates select="cwf:GoodsValue2"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cwf:GTDNumber">
					<xsl:apply-templates select="cwf:GTDNumber"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cwf:DocumentType -->
	<xsl:template match="cwf:Document">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:DocNN"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwf:DocType"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:AISTSDocumentIDType -->
	<xsl:template match="cwf:FormularNumber">
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
	<!-- Шаблон для типа catWH_ru:WHSuppQuantityType -->
	<xsl:template match="cwf:GoodsValue|cwf:GoodsValue1|cwf:GoodsValue2">
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
	<xsl:template match="cwf:GTDNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="GTDdate">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cwf:FormularHeadType -->
	<xsl:template match="cwf:Header">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер редакции электронного документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cwf:OrderNumberOfEdition"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата помещения товаров на склад</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cwf:GoodsSetDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Основание для допуска к проведению операций над товарами</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cwf:ReasonToAccess"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Тип цели проведения операции над товарами</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cwf:ObjectID"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cwf:ObjectName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование цели проведения операции над товарами</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwf:ObjectName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:WarehouseLicenceID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер лицензии склада, на который перемещаются товары</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwf:WarehouseLicenceID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:ObjectCustomsCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа, на который перемещаются товары</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwf:ObjectCustomsCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:DelivererName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Лицо, которому передаются права владения товарами</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwf:DelivererName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:FullPart">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Флаг проведения операции над всей партией товаров</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="cwf:FullPart='true'">
								<xsl:text>есть</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:Marks">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Отметки контролирующего органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwf:Marks"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:ControlDateOn">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата принятия товаров на контроль</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cwf:ControlDateOn"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:ControlDateOff">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата снятия товаров с контроля</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="cwf:ControlDateOff"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование лица, обладающего правами в отношении товара</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cwf:OwnerName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cwf:FormularNumber">
			<div class="title marg-top">Номер формуляра</div>
		</xsl:if>
		<xsl:apply-templates select="cwf:FormularNumber"/>
		<xsl:if test="cwf:StorageQuitanceNumber"/>
		<xsl:if test="cwf:StorageQuitanceNumber">
			<div class="title marg-top">Номер складской квитанции, оформленной при принятии товаров на таможенный склад</div>
		</xsl:if>
		<xsl:apply-templates select="cwf:StorageQuitanceNumber"/>
		<xsl:if test="cwf:Inspector"/>
		<xsl:if test="cwf:Inspector">
			<div class="title marg-top">Должностное лицо таможенного органа</div>
		</xsl:if>
		<xsl:apply-templates select="cwf:Inspector"/>
		<xsl:if test="cwf:GTDNumber"/>
		<xsl:if test="cwf:GTDNumber">
			<div class="title marg-top">Номер ДТ, по которой товары помещены под таможенный режим таможенного склада</div>
		</xsl:if>
		<xsl:apply-templates select="cwf:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cwf:InspectorType -->
	<xsl:template match="cwf:Inspector">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:LNP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:LNP"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwf:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность.</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwf:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catWH_ru:AISTSDocumentIDType -->
	<xsl:template match="cwf:StorageQuitanceNumber">
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
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
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
