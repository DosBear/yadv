<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:debt_inq="urn:customs.ru:Information:GuaranteeDocuments:DebtCalculationInquiry:5.13.3">
	<!-- Шаблон для типа DebtCalculationInquiryType -->
	<xsl:template match="debt_inq:DebtCalculationInquiry">
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
					margin-bottom:2mm;
					font-family: Verdana;
					font-size: 10pt;
					}

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-family: Verdana;
					font-size: 10pt;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Verdana;
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
					font-size: 9pt;
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
						<tr>
							<td align="center" class="graphMain">
								<font size="3">
									<b>
										<xsl:choose>
											<xsl:when test="debt_inq:DocType=0">Запрос на расчет задолженности</xsl:when>
											<xsl:when test="debt_inq:DocType=1">Запрос на расчет обеспечения<br/>по заявлению о выпуске до подачи</xsl:when>
										</xsl:choose>
									</b>
								</font>
							</td>
						</tr>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID"/></td>
						</tr>
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID"/></td>
							</tr>
						</xsl:if>
					</table-->
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время формирования электронного документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="debt_inq:DocumentDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(debt_inq:DocumentDateTime,12,8)"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Регистрационный номер исходного документа для расчета</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="debt_inq:DocNumber"/>
							</td>
						</tr>
						<xsl:if test="debt_inq:CustomsOffice">
							<tr>
								<td class="annot graphMain" style="width:50%">Таможенный орган, сформировавшего запрос</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="debt_inq:CustomsOffice"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="debt_inq:CustomsOfficial">
							<tr>
								<td class="annot graphMain" style="width:50%">Должностное лицо ТО, сформировавшее запрос</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="debt_inq:CustomsOfficial"/></td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Направление перемещения товаров</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="debt_inq:GoodsDirection"/></td>
						</tr>
						<xsl:if test="debt_inq:CalcSign">
							<tr>
								<td class="annot graphMain" style="width:50%">Признак расчета</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="debt_inq:CalcSign=0">без особенностей</xsl:when>
										<xsl:when test="debt_inq:CalcSign=1">физ. лица</xsl:when>
										<xsl:otherwise><xsl:value-of select="debt_inq:CalcSign"/></xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>	
						<xsl:if test="debt_inq:CheckDate">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата, на которую в расчете производится выбор ставок и курсов валют</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="debt_inq:CheckDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
					</table>
					<div class="title marg-top">Информация по товарам</div>
					<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered" rowspan="2" style="vertical-align:middle; width:5%">Номер товара по порядку</td>
								<td class="graphMain bordered" rowspan="2" style="vertical-align:middle; width:8%">Код товара по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered" rowspan="2" style="vertical-align:middle; width:22%">Описание товара</td>
								<td class="graphMain bordered" rowspan="2" style="vertical-align:middle; width:5%">Код страны происх-ния</td>
								<td class="graphMain bordered" colspan="3" style="vertical-align:middle; width:15%" align="center">Вес товара, (кг)</td>
								<td class="graphMain bordered" colspan="2" style="vertical-align:middle; width:10%" align="center">Количество товара</td>
								<td class="graphMain bordered" rowspan="2" style="vertical-align:middle; width:10%">Таможенная стоимость товара (руб)</td>
								<xsl:if test="//debt_inq:TobaccoCost"><td class="graphMain bordered" rowspan="2" style="vertical-align:middle; width:10%">
									Максимальная розничная цена табачных изделий
								</td></xsl:if>
								<td class="graphMain bordered" rowspan="2" style="vertical-align:middle; width:15%">Дата, на которую производится выбор ставок и курсов валют</td>
							</tr>
							<tr class="title">

								<td class="graphMain bordered" align="center" style="vertical-align:middle; width:5%">нетто</td>
								<td class="graphMain bordered" align="center" style="vertical-align:middle; width:5%">нетто без учета упаковки</td>
								<td class="graphMain bordered" align="center" style="vertical-align:middle; width:5%">брутто</td>
								<td class="graphMain bordered" align="center" style="vertical-align:middle; width:5%">ДЕИ</td>
								<td class="graphMain bordered" align="center" style="vertical-align:middle; width:5%">ДЕИ 2</td>
							</tr>
							<xsl:for-each select="debt_inq:GoodsInfo">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="debt_inq:AddSupplementaryQuantity| debt_inq:SupplementaryQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode and not(cat_ru:MeasureUnitQualifierName)">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="debt_inq:CustomsOffice">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="debt_inq:CustomsOfficial">
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:LNP">
			<xsl:text> ЛНП </xsl:text>
			<xsl:value-of select="cat_ru:LNP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа debt_inq:GoodsInfoType -->
	<xsl:template match="debt_inq:GoodsInfo">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="debt_inq:Numeric"/></td>
			<td class="graphMain bordered"><xsl:value-of select="debt_inq:TNVEDCode"/></td>
			<td class="graphMain bordered"><xsl:value-of select="debt_inq:GoodsDescription"/></td>
			<td class="graphMain bordered"><xsl:value-of select="debt_inq:OriginCountry"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(debt_inq:WeightQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(debt_inq:NetWeightQuantity2, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:value-of select="translate(debt_inq:GrossWeightQuantity, '.', ',')"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="debt_inq:SupplementaryQuantity"/></td>
			<td class="graphMain bordered">
				<xsl:for-each select="debt_inq:AddSupplementaryQuantity">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered" style="word-break: break-all"><xsl:value-of select="translate(debt_inq:CustomsCost, '.', ',')"/></td>
			<xsl:if test="//debt_inq:TobaccoCost">
				<td class="graphMain bordered" style="word-break: break-all"><xsl:value-of select="translate(debt_inq:TobaccoCost, '.', ',')"/></td>
			</xsl:if>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="debt_inq:CheckDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="debt_inq:DocNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="num_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="debt_inq:AddNumber"/>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

	<xsl:template name="num_date">
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
