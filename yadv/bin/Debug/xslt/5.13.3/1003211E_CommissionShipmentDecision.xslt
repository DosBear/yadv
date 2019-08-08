<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonAgregateTypesCust:5.12.0" xmlns:cltTrans_ru="urn:customs.ru:Information:TransportDocuments:TransportCommonLeafTypesCust:5.12.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:cshd="urn:customs.ru:Information:TransportDocuments:Sea:CommissionShipmentDecision:5.13.1">
	<!-- Шаблон для типа CommissionShipmentDecisionType -->
	<xsl:template match="cshd:CommissionShipmentDecision">
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
									Решение по товарам поручения на погрузку № <xsl:value-of select="cshd:DocumentNumber"/>
									&#160;от&#32;
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="cshd:DocumentDate"/>
									</xsl:call-template>
								</h3>
							</td>
						</tr>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="cat_ru:DocumentID"/>
							</td>
						</tr>
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</xsl:if>
					</table-->
					<table class="w190">
						<xsl:if test="cshd:CSHBorderCustoms">
							<tr>
								<td class="annot graphMain" style="width:50%">Таможенный орган (пограничный пункт пропуска), оформляющий разрешение на погрузку товаров</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cshd:CSHBorderCustoms"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cshd:GoodsDescription">
							<tr>
								<td class="annot graphMain" style="width:50%">Общее описание товаров, подлежащих погрузке</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cshd:GoodsDescription"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cshd:LoadingPort">
							<tr>
								<td class="annot graphMain" style="width:50%">Порт погрузки</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cshd:LoadingPort"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cshd:UnloadingPort">
							<tr>
								<td class="annot graphMain" style="width:50%">Порт разгрузки</td>
								<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cshd:UnloadingPort"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cshd:RegNumBook">
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер бронирования</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="cshd:RegNumBook"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="cshd:CustomsMark">
							<tr>
								<td class="annot graphMain" style="width:50%">Таможенные отметки</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="cshd:CustomsMark">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="cshd:BorderServiceMark">
							<tr>
								<td class="annot graphMain" style="width:50%">Отметки пограничной службы</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="cshd:BorderServiceMark">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="annot graphMain" style="width:50%">Должностное лицо, принимающее решение</td>
							<td class="value graphMain" style="width:50%"><xsl:apply-templates select="cshd:CustomsPerson"/></td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Принятое решение</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="cshd:ControlDecision=0">погрузка запрещена</xsl:when>
									<xsl:when test="cshd:ControlDecision=1">погрузка разрешена</xsl:when>
									<xsl:when test="cshd:ControlDecision=2">погрузка разрешена, требуются дополнительные меры контроля</xsl:when>
									<xsl:when test="cshd:ControlDecision=3">решения различны по товарам</xsl:when>
									<xsl:otherwise><xsl:value-of select="cshd:ControlDecision"/></xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="cshd:Vessel">
						<div class="title marg-top">Реквизиты судна</div>
						<xsl:apply-templates select="cshd:Vessel"/>
					</xsl:if>
					<xsl:if test="cshd:CommissionShipmentGoods">
						<div class="title marg-top">Товары</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Номер товара по ДТ</td>
									<td class="graphMain bordered">Номер товара по порядку</td>
									<td class="graphMain bordered">Код ТН ВЭД ЕАЭС</td>
									<td class="graphMain bordered">Номер таможенной декларации</td>
									<td class="graphMain bordered">Таможенная процедура</td>
									<td class="graphMain bordered">Код таможенной процедуры</td>
									<td class="graphMain bordered">Наименования товара</td>
									<td class="graphMain bordered">Принятое решение</td>
								</tr>
								<xsl:for-each select="cshd:CommissionShipmentGoods">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="cshd:CSHBorderCustoms">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">&#160;<xsl:value-of select="cat_ru:OfficeName"/></xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">&#160;код государства-члена ЕАЭС: <xsl:value-of select="cat_ru:CustomsCountryCode"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cshd:CommissionShipmentGoodsType -->
	<xsl:template match="cshd:CommissionShipmentGoods">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="cshd:GoodsNumericDT"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshd:GoodsNumeric"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshd:GoodsTNVEDCode"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cshd:DTNumber"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshd:CustomsProcedure"/></td>
			<td class="graphMain bordered"><xsl:value-of select="cshd:CustomsModeCode"/></td>
			<td class="graphMain bordered"><xsl:apply-templates select="cshd:GoodsDescription"/></td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="cshd:ControlDecision=0">погрузка запрещена</xsl:when>
					<xsl:when test="cshd:ControlDecision=1">погрузка разрешена</xsl:when>
					<xsl:when test="cshd:ControlDecision=2">погрузка разрешена, требуются дополнительные меры контроля</xsl:when>
					<xsl:otherwise><xsl:value-of select="cshd:ControlDecision"/></xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="cshd:CustomsPerson">
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:LNP"> ЛНП: <xsl:value-of select="cat_ru:LNP"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="cshd:DTNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cshd:PortType -->
	<xsl:template match="cshd:LoadingPort | cshd:UnloadingPort">
		<xsl:value-of select="cshd:PortName"/>&#160;
		<xsl:if test="cshd:PortCode">(код: <xsl:value-of select="cshd:PortCode"/>)</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catTrans_ru:VesselType -->
	<xsl:template match="cshd:Vessel">
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
			<xsl:if test="catTrans_ru:NationalityVesselCode or catTrans_ru:NationalityVessel">
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
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
