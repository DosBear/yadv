<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_crd="urn:customs.ru:CardCommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:trreq="urn:customs.ru:CustomsCardDoc:TransInfoReq:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">

	<!-- Шаблон для типа TransInfoReqType -->
	<xsl:template match="trreq:TransInfoReq">
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
										<b>Запрос о движении денежных средств<br/>на лицевом счете владельца таможенной карты</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:100%" align="center">
								<xsl:if test="trreq:TYPEDOC='ПУ'">подтверждение уплаты таможенных пошлин, налогов</xsl:if>
								<xsl:if test="trreq:TYPEDOC='АО'">отчет о расходовании денежных средств, внесенных в качестве авансовых платежей</xsl:if>
								<br/><br/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">Флаг повторной отправки</td>
							<td class="value graphMain" style="width:60%">
								<xsl:choose>
									<xsl:when test="trreq:ResendingFlag='0'">
										<xsl:text>документ отправляется впервые</xsl:text>
									</xsl:when>
									<xsl:when test="trreq:ResendingFlag='1'">
										<xsl:text>документ уже отправлялся</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="trreq:ResendingFlag"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">Флаг состояния документа</td>
							<td class="value graphMain" style="width:60%">
								<xsl:choose>
									<xsl:when test="trreq:DocumentStatusFlag='1'">
										<xsl:text>новый документ</xsl:text>
									</xsl:when>
									<xsl:when test="trreq:DocumentStatusFlag='2'">
										<xsl:text>исправление документа</xsl:text>
									</xsl:when>
									<xsl:when test="trreq:DocumentStatusFlag='3'">
										<xsl:text>удаление ошибочно посланного документа</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="trreq:DocumentStatusFlag"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">Код таможенного органа</td>
							<td class="value graphMain" style="width:60%">
								<xsl:value-of select="trreq:CustomsOffice"/>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">Начало запрашиваемого периода</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="trreq:PeroidBegin"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:40%">Конец запрашиваемого периода</td>
							<td class="value graphMain" style="width:60%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="trreq:PeroidEnd"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="trreq:Payer">
						<div class="title marg-top">Информация о плательщике</div>
					</xsl:if>
					<xsl:apply-templates select="trreq:Payer"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_crd:OrganizationBaseType -->
	<xsl:template match="trreq:Payer">
		<xsl:if test="cat_crd:OrganizationName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">Наименование организации</td>
					<td class="value graphMain" style="width:60%">
						<xsl:value-of select="cat_crd:OrganizationName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_crd:INN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">ИНН</td>
					<td class="value graphMain" style="width:60%">
						<xsl:choose>
							<xsl:when test="cat_crd:INN='ИНН'">
								<xsl:text>Индивидуальный номер налогоплательщика</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_crd:INN"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_crd:KPP">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:40%">КПП</td>
					<td class="value graphMain" style="width:60%">
						<xsl:choose>
							<xsl:when test="cat_crd:KPP='КПП'">
								<xsl:text>Код причины постановки на учет</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="cat_crd:KPP"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</xsl:if>
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
