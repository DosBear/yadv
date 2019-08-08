<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.14.3" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.14.3" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.14.3" xmlns:nfdp="urn:customs.ru:Information:TransportDocuments:NotifFactDeparture:5.14.3">
	<!-- Шаблон для типа NotifFactDepartureType -->
	<xsl:template match="nfdp:NotifFactDeparture">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
										<b>Уведомление о фактическом убытии железнодорожного состава</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<xsl:if test="nfdp:PI_URN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор товарной партии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="nfdp:PI_URN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата фактического убытия</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="nfdp:DepartureDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="nfdp:CustomsOperationPlace">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Место убытия</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="nfdp:CustomsOperationPlace"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код таможенного поста</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="nfdp:CustomsCode"/>
							</td>
						</tr>
					</table>
					<xsl:if test="nfdp:CustomsPerson"/>
					<xsl:if test="nfdp:CustomsPerson">
						<div class="title marg-top">Должностное лицо, принявшее решение</div>
					</xsl:if>
					<xsl:apply-templates select="nfdp:CustomsPerson"/>
					<xsl:if test="nfdp:TDNumber">
						<div class="title marg-top">Номера</div>
						<!--xsl:for-each select=""-->
							<xsl:apply-templates select="nfdp:TDNumber"/>
						<!--/xsl:for-each-->
					</xsl:if>
					<xsl:if test="nfdp:Consignments">
						<div class="title marg-top">Сведения о товарных партиях</div>
						<xsl:for-each select="nfdp:Consignments">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="nfdp:Railway">
						<div class="title marg-top">Сведения о железной дороге</div>
					</xsl:if>
					<xsl:apply-templates select="nfdp:Railway"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа nfdp:ConsignmentsType -->
	<xsl:template match="nfdp:Consignments">
		<br/>
		<b>Номер товарной партии: <xsl:value-of select="nfdp:ConsignmentNum"/></b>
		<br/>
		Номер накладной: <xsl:value-of select="nfdp:BillSerialNumber"/>
		<br/>
		Код таможенной процедуры: <xsl:value-of select="nfdp:CustomsModeCode"/>
		<br/>
		Код предшествующей таможенной процедуры: <xsl:value-of select="nfdp:PrecedingCustomsModeCode"/>
		<br/>
		<div class="title marg-top">Сведения о товарах</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<tr>
						<td class="graphMain bordered">Номер товара по порядку</td>
						<td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
						<td class="graphMain bordered">Описание товара</td>
						<td class="graphMain bordered">Вес товара брутто (кг)</td>
						<td class="graphMain bordered">Вес товара нетто (кг)</td>
						<td class="graphMain bordered">Номера вагонов</td>
						<td class="graphMain bordered">Номера контейнеров</td>
						<td class="graphMain bordered">Количество товаров в ДЕИ</td>
						<td class="graphMain bordered">Транспортные документы</td>
					</tr>
				</tr>
				<xsl:for-each select="nfdp:Goods">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="nfdp:CustomsPerson">
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
	</xsl:template>
	<!-- Шаблон для типа nfdp:GoodsType -->
	<xsl:template match="nfdp:Goods">
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
				<xsl:for-each select="nfdp:Wagon">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="nfdp:ContainerNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="nfdp:GoodsQuantity">
					<xsl:apply-templates select="nfdp:GoodsQuantity"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="nfdp:TransportDoc"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="nfdp:GoodsQuantity">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа nfdp:RailwayType -->
	<xsl:template match="nfdp:Railway">
		<xsl:if test="nfdp:RailwayCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код железнодорожной дороги </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="nfdp:RailwayCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="nfdp:StationCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код железнодорожной станции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="nfdp:StationCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование дороги и станции назначения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="nfdp:RailwayAndStationName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="nfdp:TrainIndex">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Индекс поезда</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="nfdp:TrainIndex"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="nfdp:TrainNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер поезда</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="nfdp:TrainNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа nfdp:TDNumberType -->
	<xsl:template match="nfdp:TDNumber">
		<xsl:value-of select="nfdp:DocumentNumber"/>
		<xsl:text>. </xsl:text>
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gdt">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="nfdp:DocumentCode='1'">
				<xsl:text>декларация на товары</xsl:text>
			</xsl:when>
			<xsl:when test="nfdp:DocumentCode='2'">
				<xsl:text>транзитная декларация</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="nfdp:DocumentCode"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="position()!=last()"><br/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catTrans_ru:DocumentType -->
	<xsl:template match="nfdp:TransportDoc">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:text> </xsl:text>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="catTrans_ru:ModeCode"/>
		<xsl:if test="position()!=last()"><br/></xsl:if>
	</xsl:template>
	<xsl:template name="russian_date_gdt">
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
