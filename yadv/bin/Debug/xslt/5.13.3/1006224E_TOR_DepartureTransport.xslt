<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tor_dt="urn:customs.ru:Information:CustomsDocuments:TOR_DepartureTransport:5.12.0">
	<!-- Шаблон для типа TOR_DepartureTransportType -->
	<xsl:template match="tor_dt:TOR_DepartureTransport">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
										<b>Сведения о транспортном средстве с КПП ТОСЭР</b>
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
					<xsl:if test="tor_dt:BorderPoint">
						<div class="title marg-top">Данные контрольно пропускного пункта (КПП)</div>
					</xsl:if>
					<xsl:apply-templates select="tor_dt:BorderPoint"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Направление перемещения :</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="tor_dt:DirectSign=0">
										<xsl:text>ввоз на территорию зоны</xsl:text>
									</xsl:when>
									<xsl:when test="tor_dt:DirectSign=1">
										<xsl:text>вывоз с территории зоны</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="tor_dt:DirectSign"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата прибытия транспортного средства на КПП </td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="tor_dt:Date"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="tor_dt:Time">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Время прибытия транспортного средства на КПП  </td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="substring(tor_dt:Time, 1,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tor_dt:TransportMeans">
						<div class="title marg-top">Сведения о транспортном средстве</div>
					</xsl:if>
					<xsl:apply-templates select="tor_dt:TransportMeans"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:AddressType -->
	<xsl:template match="tor_dt:Address">
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
					<td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления (для Кыргызской Республики)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:TerritoryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tor_dt:BorderPointType -->
	<xsl:template match="tor_dt:BorderPoint">
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
		<xsl:if test="tor_dt:Address"/>
		<xsl:if test="tor_dt:Address">
			<div class="title marg-top">Адрес КПП</div>
		</xsl:if>
		<xsl:apply-templates select="tor_dt:Address"/>
		<xsl:if test="tor_dt:BorderPointCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код пункта пропуска</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="tor_dt:BorderPointCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа tor_dt:TransportMeansType -->
	<xsl:template match="tor_dt:TransportMeans">
		<xsl:if test="tor_dt:TransportKind">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип транспортного средства:</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="tor_dt:TransportKind=1">
								<xsl:text>а/м</xsl:text>
							</xsl:when>
							<xsl:when test="tor_dt:TransportKind=2">
								<xsl:text>ж/д</xsl:text>
							</xsl:when>
							<xsl:when test="tor_dt:TransportKind=3">
								<xsl:text>авиа</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="tor_dt:TransportKind"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="tor_dt:TransportRegNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер прицепа/полуприцепа </td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="tor_dt:TransportRegNumber">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор активного транспортного средства для прицепов, полуприцепов и др,</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="tor_dt:ActiveTransportIdentifier"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Вес транспортного средства по результатам взвешивания на КПП, кг</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(tor_dt:TransportWeight, '.', ',')"/>
				</td>
			</tr>
		</table>
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
