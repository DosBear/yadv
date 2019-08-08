<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:griq="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeInquiry:5.13.3">
	<!-- Шаблон для типа GuaranteeInquiryType -->
	<xsl:template match="griq:GuaranteeInquiry">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: normal;
									}

									div.page {
									width: 210mm;
									max-width: 210mm;
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
									max-width: 100%;
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
										<b>Запрос сведений о принятом  обеспечении</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
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
					</xsl:if>
					<xsl:if test="griq:TPOID">
						<div class="title marg-top">Идентифицирующие параметры документа ТПО/ТР</div>
					</xsl:if>
					<xsl:apply-templates select="griq:TPOID"/>
					<xsl:if test="griq:ExciseApplication">
						<div class="title marg-top">Идентифицирующие параметры заявления на выдачу акцизных марок</div>
					</xsl:if>
					<xsl:apply-templates select="griq:ExciseApplication"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа griq:ExciseApplicationType -->
	<xsl:template match="griq:ExciseApplication">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер заявления </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="griq:ExciseApplicationNumber"/>
				</td>
			</tr>
		</table>
		<xsl:if test="griq:ExciseApplicationDate">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дата регистрации заявления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="griq:ExciseApplicationDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Сумма обеспечения по заявлению</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(griq:ExcisePaymentAmount, '.', ',')"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Цифровой код валюты </td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="griq:PaymentCurrencyCode"/>
				</td>
			</tr>
		</table>
		<xsl:if test="griq:DateObligationEnd">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Предельный срок выполнения обязательства импортёра</td>
					<td class="value graphMain" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="griq:DateObligationEnd"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа griq:TPOIDType -->
	<xsl:template match="griq:TPOID">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Индикатор типа документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:choose>
						<xsl:when test="griq:TPOIndicator=0">
							<xsl:text>ТПО</xsl:text>
						</xsl:when>
						<xsl:when test="griq:TPOIndicator=1">
							<xsl:text>ТР</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="griq:TPOIndicator"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="griq:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="griq:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Типографский номер бланка ТПО/ТР</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="griq:OrderNumber"/>
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
