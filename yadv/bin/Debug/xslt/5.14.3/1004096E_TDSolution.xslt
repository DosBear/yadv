<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:tdsol="urn:customs.ru:Information:ExchangeDocuments:TDSolution:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа TDSolutionType -->
	<xsl:template match="tdsol:TDSolution">
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
										<b>Решение по транзитной декларации </b>
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
							<td class="annot graphMain" style="width:50%">Статус транзитной перевозки</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="tdsol:TDStatus='TR_ALLOWED'">
										<xsl:text>выпущена</xsl:text>
									</xsl:when>
									<xsl:when test="tdsol:TDStatus='TR_ISSUE_DENIED'">
										<xsl:text>отказано в выпуске</xsl:text>
									</xsl:when>
									<xsl:when test="tdsol:TDStatus='TD_REVOKED'">
										<xsl:text>отзыв ТД</xsl:text>
									</xsl:when>
									<xsl:when test="tdsol:TDStatus='TR_CANCELLED'">
										<xsl:text>аннулирована ТД (техническое аннулирование)</xsl:text>
									</xsl:when>
									<xsl:when test="tdsol:TDStatus='TR_COMPLETED'">
										<xsl:text>процедура завершена</xsl:text>
									</xsl:when>
									<xsl:when test="tdsol:TDStatus='TR_COMPLETED_W_RESERVATION'">
										<xsl:text>процедура завершена с оговорками</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="tdsol:TDStatus"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="tdsol:Comments">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="tdsol:Comments"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tdsol:TransitOpenDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата выпуска товаров в соответствии с процедурой таможенного транзита</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tdsol:TransitOpenDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Срок таможенного транзита</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="tdsol:TransitDateLimit"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="tdsol:GRN">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Cсылочный номер гарантии в транзите</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="tdsol:GRN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор, присваиваемый дополнению к договору поручительства при регистрации</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="tdsol:AdditionalID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="tdsol:TransitFactEndDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Фактический срок завершения процедуры транзита</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="tdsol:TransitFactEndDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tdsol:ReservationComplete">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Оговорки</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="tdsol:ReservationComplete">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tdsol:TDNumber">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Номер ТД</td>
								<td class="graphMain value" style="width:50%"><xsl:apply-templates select="tdsol:TDNumber"/></td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tdsol:DestinationCustoms">
						<div class="title marg-top">Таможенный орган назначения</div>
						<xsl:apply-templates select="tdsol:DestinationCustoms"/>
					</xsl:if>
					<xsl:if test="tdsol:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<xsl:apply-templates select="tdsol:CustomsPerson"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="tdsol:CustomsPerson">
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
	<!-- Шаблон для типа cat_ru:CUCustomsType -->
	<xsl:template match="tdsol:DestinationCustoms">
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
		<xsl:if test="cat_ru:CustomsCountryCode">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Код государства - члена Евразийского экономического союза. Трехзначный цифровой код</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:CustomsCountryCode"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="tdsol:TDNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
