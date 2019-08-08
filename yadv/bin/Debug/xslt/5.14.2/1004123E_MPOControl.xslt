<?xml version="1.0" encoding="utf-8"?>

<!-- Бланк в свободной форме -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:mpoc="urn:customs.ru:Information:ExchangeDocuments:MPOControl:5.13.1" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа MPOControlType -->
	<xsl:template match="mpoc:MPOControl">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;
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
										<xsl:choose>
											<xsl:when test="mpoc:DocSign=0">
												Уведомление<br/>о необходимости предъявления МПО в таможенный орган
											</xsl:when>
											<!--xsl:when test="mpoc:DocSign=1">
												Запрос<br/>на предоставление сканированных документов
											</xsl:when>
											<xsl:when test="mpoc:DocSign=2">
												Запрос<br/>на предоставление рентгеновских снимков
											</xsl:when-->
											<xsl:when test="mpoc:DocSign=3">
												Требование<br/>предъявления товаров для таможенного осмотра
											</xsl:when>
											<xsl:when test="mpoc:DocSign=4">
												Уведомление<br/>о проведении таможенного досмотра
											</xsl:when>
											<xsl:when test="mpoc:DocSign=5">
												Уведомление<br/>о переносе сроков досмотра
											</xsl:when>
											<xsl:when test="mpoc:DocSign=6">
												Уведомление<br/>о проведении таможенной экспертизы по МПО
											</xsl:when>
											<xsl:otherwise>
												Уведомление
											</xsl:otherwise>
										</xsl:choose>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:if test="mpoc:Customs">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Таможенный орган</td>
								<td class="value graphMain" style="width:50%">
									<xsl:for-each select="mpoc:Customs/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
						<br/>
					</xsl:if>
					<xsl:if test="mpoc:MPORegNum">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mpoc:MPORegNum"/>
								</td>
							</tr>
						</table>
						<br/>
					</xsl:if>
					<xsl:if test="mpoc:Presence">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Присутствие при таможенном досмотре / осмотре</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="mpoc:Presence='true' or mpoc:Presence='t' or mpoc:Presence='1'">
											<xsl:text>требуется</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text>не требуется</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoc:InspDate">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Дата проведения досмотра /  осмотра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="mpoc:InspDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoc:InspTime">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Время проведения досмотра / осмотра</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="substring(mpoc:InspTime, 1,8)"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата формирования запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="mpoc:ControlStartDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Время формирования запроса</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="substring(mpoc:ControlStartTime, 1,8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mpoc:WorkPlace">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Код рабочего места ММПО</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpoc:WorkPlace"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoc:Comments">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Комментарий</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpoc:Comments"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mpoc:CustomsPerson">
						<br/>
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Должностное лицо таможенного органа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="mpoc:CustomsPerson/cat_ru:PersonName"/>
									<xsl:if test="mpoc:CustomsPerson/cat_ru:LNP">
										<xsl:text> ЛНП </xsl:text>
										<xsl:value-of select="mpoc:CustomsPerson/cat_ru:LNP"/>
									</xsl:if>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="mpoc:MPORegNum">
		<xsl:if test="mpoc:CustomsCode">
			<xsl:value-of select="mpoc:CustomsCode"/><xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:if test="mpoc:RegistrationDate">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="mpoc:RegistrationDate"/>
			</xsl:call-template>
			<xsl:text>/</xsl:text>
		</xsl:if>
		<xsl:value-of select="mpoc:MPO_Number"/>
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
	<xsl:template name="russian_date_gtd">
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
