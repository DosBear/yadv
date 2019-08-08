<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.13.2" xmlns:els_leaf="urn:customs.ru:Information:ELSDocuments:ELSLeafTypes:5.13.2" xmlns:elsprs="urn:customs.ru:Informational:ELSDocuments:ELSPaymentRequest:5.13.2">
	<!-- Шаблон для типа ELSPaymentRequestType -->
	<xsl:template match="elsprs:ELSPaymentRequest">
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
										<b>Запрос состояния расчетов по ДН</b>
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
					<xsl:if test="elsprs:RegistrationNumber">
						<div class="title marg-top">Регистрационный номер ДТ</div>
					</xsl:if>
					<xsl:apply-templates select="elsprs:RegistrationNumber"/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Тип документа начислений</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="elsprs:DocChargeType=0">
										<xsl:text>ДТ</xsl:text>
									</xsl:when>
									<xsl:when test="elsprs:DocChargeType=1">
										<xsl:text>ТПО</xsl:text>
									</xsl:when>
									<xsl:when test="elsprs:DocChargeType=2">
										<xsl:text>ТР</xsl:text>
									</xsl:when>
									<xsl:when test="elsprs:DocChargeType=3">
										<xsl:text>Постановление об АП</xsl:text>
									</xsl:when>
									<xsl:when test="elsprs:DocChargeType=4">
										<xsl:text>МПО</xsl:text>
									</xsl:when>
									<xsl:when test="elsprs:DocChargeType=5">
										<xsl:text>Уголовное дело</xsl:text>
									</xsl:when>
									<xsl:when test="elsprs:DocChargeType=6">
										<xsl:text>Уголовное дело (штраф)</xsl:text>
									</xsl:when>
									<xsl:when test="elsprs:DocChargeType=7">
										<xsl:text>Постановление о распоряжении изъятым ищуществом</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="elsprs:DocChargeType"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа els_agr:RegistrationNumberType -->
	<xsl:template match="elsprs:RegistrationNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Рег. номер</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="els_agr:CustomsCode"/>
					<xsl:text>/</xsl:text>
				<!--/td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа.</td>
				<td class="value graphMain" style="width:50%"-->
					<xsl:call-template name="num_date">
						<xsl:with-param name="dateIn" select="els_agr:RegistrationDate"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
				<!--/td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый (регистрационный) номер ДТ/ регистрационный номер (серия, типографский номер) ТПО/ типографский номер ТР / номер МПО</td>
				<td class="value graphMain" style="width:50%"-->
					<xsl:value-of select="els_agr:DocNumber"/>
				</td>
			</tr>
		</table>
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
