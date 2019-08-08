<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:rcs="urn:customs.ru:Information:TransportDocuments:Sea:ReqCorrectedShipment:5.13.1">
	<!-- Шаблон для типа ReqCorrectedShipmentType -->
	<xsl:template match="rcs:ReqCorrectedShipment">
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
						<tr>
							<td align="center" class="graphMain">
								<h3>
									Запрос на внесение изменений в поручение на погрузку № <xsl:value-of select="rcs:DocumentNumber"/>
									&#160;от&#32;
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rcs:DocumentDate"/>
									</xsl:call-template>
								</h3>
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
						<xsl:if test="rcs:CSHBorderCustoms">
							<tr>
								<td class="annot graphMain" style="width:50%">Таможенный орган (пограничный пункт пропуска), оформляющий разрешение на погрузку товаров</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rcs:CSHBorderCustoms"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="rcs:GoodsDescription">
							<tr>
								<td class="annot graphMain" style="width:50%">Общее описание товаров, подлежащих погрузке</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rcs:GoodsDescription"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="rcs:CorrectedDescription">
							<tr>
								<td class="annot graphMain" style="width:50%">Описание запрашиваемых изменений в поручение на погрузку</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rcs:CorrectedDescription"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="rcs:AdministrationInfo/rcs:SignatureAdministration">
							<tr>
								<td class="annot graphMain" style="width:50%">Подпись администратора</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="rcs:AdministrationInfo/rcs:SignatureAdministration"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="rcs:AdministrationInfo/rcs:Note">
							<tr>
								<td class="annot graphMain" style="width:50%">Примечания администратора</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="rcs:AdministrationInfo/rcs:Note"/></td>
							</tr>
						</xsl:if>
					</table>
					<xsl:if test="rcs:Vessel">
						<div class="title marg-top">Реквизиты судна</div>
						<xsl:apply-templates select="rcs:Vessel"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="rcs:CSHBorderCustoms">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">&#160;<xsl:value-of select="cat_ru:OfficeName"/></xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">&#160;код государства-члена ЕАЭС: <xsl:value-of select="cat_ru:CustomsCountryCode"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catTrans_ru:VesselType -->
	<xsl:template match="rcs:Vessel">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование судна</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="catTrans_ru:Name"/></td>
			</tr>
			<xsl:if test="catTrans_ru:Shipmaster">
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия капитана судна</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="catTrans_ru:Shipmaster"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="catTrans_ru:NationalityCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Код страны принадлежности судна</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="catTrans_ru:NationalityCode"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="catTrans_ru:NationalityVessel or catTrans_ru:NationalityVesselCode">
				<tr>
					<td class="annot graphMain" style="width:50%">Национальная принадлежность судна</td>
					<td class="value graphMain" style="width:50%">
						<xsl:if test="catTrans_ru:NationalityVesselCode">(<xsl:value-of select="catTrans_ru:NationalityVesselCode"/>)&#160;</xsl:if>
						<xsl:value-of select="catTrans_ru:NationalityVessel"/>
					</td>
				</tr>
			</xsl:if>
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
