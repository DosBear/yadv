<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_ccd="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CarnetHolderCoverDraft:5.12.1">
	<!-- Шаблон для типа ATA_CarnetHolderCoverDraftType -->
	<xsl:template match="ata_ccd:ATA_CarnetHolderCoverDraft">
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
									font-family: Arial;
									font-size: 8pt;
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
									border-bottom: dotted 1px black;
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
										<b>Сведения из обложки карнета АТА, предоставленные держателем карнета</b>
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
							<td class="graphMain bordered" style="width:4mm; font-size: 10pt; vertical-align: middle" rowspan="4">
								<b>A T A<br/><br/>C A R N E T</b>
							</td>
							<td class="graphMain bordered" style="width:4mm; font-size: 10pt; vertical-align: middle" rowspan="4">
								<b>К А Р Н Е Т<br/><br/>А Т А</b>
							</td>
							<td class="graphMain bordered" style="width:82mm" rowspan="2">
								<b>A. HOLDER AND ADDRESS / Владелец и адрес</b><br/>
								<xsl:value-of select="ata_ccd:Holder"/>
								<xsl:if test="ata_ccd:RussianHolderAddress">
									<br/><xsl:apply-templates select="ata_ccd:RussianHolderAddress"/>
								</xsl:if>
								<xsl:if test="ata_ccd:ForeignHolderAddress">
									<br/><xsl:value-of select="ata_ccd:ForeignHolderAddress/ata_ccd:Address"/>
								</xsl:if>
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<b>G. FOR ISSUING ASSOCIATION USE / Заполняется ассоциацией, выдающей</b><br/>
								<b> FRONT COVER / Обложка</b>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<b>a) CARNET No. / Карнет №</b><br/>
								<xsl:value-of select="ata_ccd:IssuingCountry"/>
								<xsl:text>/</xsl:text>
								<xsl:value-of select="ata_ccd:CarnetNumber"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:82mm">
								<b>B. REPRESENTED BY / Кем представлен</b><br/>
								<xsl:value-of select="ata_ccd:RepresentedBy"/>
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<b>b) ISSUED BY / Кем выдано</b><br/>
								<xsl:value-of select="ata_ccd:IssuedBy"/>
								<xsl:if test="ata_ccd:GuaranteedBy">
									<xsl:text> / </xsl:text>
									<xsl:value-of select="ata_ccd:GuaranteedBy"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:82mm">
								<b>C. INTENDED USE OF GOODS / Предполагаемое использование товаров</b><br/>
								<xsl:value-of select="ata_ccd:IntendedUse"/>
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<b>c) VALID UNTIL / Действительно до</b><br/>
								<table style="width:70mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:15mm" align="center">
											<xsl:value-of select="substring(ata_ccd:ValidUntil,1,4)"/>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:10mm" align="center">
											<xsl:value-of select="substring(ata_ccd:ValidUntil,6,2)"/>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:10mm" align="center">
											<xsl:value-of select="substring(ata_ccd:ValidUntil,9,2)"/>
										</td>
										<td class="annot graphMain" style="width:29mm"/>
									</tr>
									<tr>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:15mm" align="center">
											<b>year<br/>год</b>
										</td>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:10mm" align="center">
											<b>month<br/>месяц</b>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center"/>
										<td class="annot graphMain" style="width:39mm" colspan="2">
											<b>day (inclusive)<br/>день (включительно)</b>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:8mm" colspan="2"/>
							<td class="graphMain bordered" style="width:182mm" colspan="3">
								<b>I. Signature of authorised official and Issuing Association stamp / Подпись уполномоченного должностного лица и печать ассоциации, выдавшей документ</b><br/><br/>
								<table style="width:82mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:58mm" align="center"/>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:10mm" align="center">
											<xsl:value-of select="substring(ata_ccd:IssueDate,1,4)"/>
										</td>
										<td class="annot graphMain" style="width:1mm">/</td>
										<td class="value graphMain" style="width:5mm" align="center">
											<xsl:value-of select="substring(ata_ccd:IssueDate,6,2)"/>
										</td>
										<td class="annot graphMain" style="width:1mm">/</td>
										<td class="value graphMain" style="width:5mm" align="center">
											<xsl:value-of select="substring(ata_ccd:IssueDate,9,2)"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="annot graphMain" style="width:60mm" colspan="2">
											<b>Place and Date of Issue (year/month/day)<br/>Место и дата выдачи (год/ месяц/ день)</b>
										</td>
										<td class="annot graphMain"/><td class="annot graphMain"/><td class="annot graphMain"/>
										<td class="annot graphMain"/><td class="annot graphMain"/>
									</tr>	
								</table>
							</td>
						</tr>	
					</table>
				</div>
				<xsl:if test="ata_ccd:GeneralList">
					<div class="page">
						<table class="w190">
							<tr>
								<td align="left" class="graphMain" style="width:20%"/>
								<td align="center" class="graphMain" style="width:60%">
									<font size="3">
										<b>ОБЩИЙ СПИСОК</b>
									</font>
								</td>
								<td align="right" class="graphMain" style="width:20%"/>
							</tr>
						</table>
						<br/>
						<xsl:apply-templates select="ata_ccd:GeneralList"/>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ata_ccd:GeneralListType -->
	<xsl:template match="ata_ccd:GeneralList">
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Item No. /<br/>№<br/>п/п</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Trade description of goods and marks and number, if any /<br/>Торговое название товаров и в случае необходимости торговые марки и номера</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Number of pieces /<br/>Количество, штук</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Weight or volume /<br/>Вес или объем</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Value /<br/>Стоимость</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle">Country of origin /<br/>Страна происхождения</td>
					<td class="graphMain bordered" align="center" style="vertical-align:middle" bgcolor="#e3e3e3">For Customs Use /<br/>Заполняется таможней</td>
				</tr>
				<tr class="title">
					<td class="graphMain bordered" align="center">1</td>
					<td class="graphMain bordered" align="center">2</td>
					<td class="graphMain bordered" align="center">3</td>
					<td class="graphMain bordered" align="center">4</td>
					<td class="graphMain bordered" align="center">5</td>
					<td class="graphMain bordered" align="center">6</td>
					<td class="graphMain bordered" align="center" bgcolor="#e3e3e3">7</td>
				</tr>
				<xsl:for-each select="ata_ccd:Good">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<tr>
					<td class="graphMain bordered" colspan="2">
						<b>TOTAL / ИТОГО</b>
					</td>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered">
						<xsl:value-of select="ata_ccd:CurrencyCode"/>
					</td>
					<td class="graphMain bordered"/>
					<td class="graphMain bordered" bgcolor="#e3e3e3"/>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ata_ccd:GoodType -->
	<xsl:template match="ata_ccd:Good">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_ccd:ListNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_ccd:GoodDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_ccd:PcsQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(ata_ccd:AddQuantity, '.', ',')"/>
				<xsl:if test="ata_ccd:AddQuantityUnit">
					<xsl:choose>
						<xsl:when test="ata_ccd:AddQuantityUnit='112'"> м3</xsl:when>
						<xsl:when test="ata_ccd:AddQuantityUnit='166'"> кг</xsl:when>
						<xsl:otherwise> (код: <xsl:value-of select="ata_ccd:AddQuantityUnit"/>)</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(ata_ccd:Cost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="ata_ccd:OriginCountry"/>
			</td>
			<td class="graphMain bordered" bgcolor="#e3e3e3">
				<xsl:value-of select="ata_ccd:TNVEDCode"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа ata_ccd:RussianHolderAddressType -->
	<xsl:template match="ata_ccd:RussianHolderAddress">
		<xsl:value-of select="ata_ccd:Index"/>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="ata_ccd:Region"/>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="ata_ccd:City"/>
		<xsl:text>, </xsl:text>
		<xsl:value-of select="ata_ccd:Address"/>
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
