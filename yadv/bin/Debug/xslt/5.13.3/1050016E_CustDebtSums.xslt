<?xml version="1.0" encoding="utf-8"?>

<!-- Свободный бланк-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:CDSums="urn:customs.ru:Information:GuaranteeDocuments:CustDebtSums:5.13.1">
	<!-- Шаблон для типа CustDebtSumsType -->
	<xsl:template match="CDSums:CustDebtSums">
		<html>
			<head>
				<title>Запрос / Сведения о суммах платежей и пеней по фактам задолженности</title>
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
					font-size: 10pt;
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
										<b>Запрос / Сведения о суммах платежей и пеней по фактам задолженности</b>
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
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Код таможенного органа, в котором зарегистрирован факт задолженности</td>
							<td class="value graphMain" style="width:50%">
								<xsl:value-of select="CDSums:CustCode"/>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Отчетная дата</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="CDSums:ReportDate"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:50%">Реквизиты документа, на основании которого выявлен факт задолженности</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="CDSums:ValidDocReqs"/>
							</td>
						</tr>
					</table>
					<xsl:if test="CDSums:DebtFinOpers">
						<div class="title marg-top">Суммы таможенных платежей и пени</div>
						<table class="bordered w190">
							<tr class="title">
								<td class="graphMain bordered">Тип операции</td>
								<td class="graphMain bordered">Код вида платежа,<br/>по которому выявлен факт неуплаты / неполной уплаты</td>
								<td class="graphMain bordered">Сумма по виду платежа</td>
								<td class="graphMain bordered">Дата операции</td>
								<td class="graphMain bordered">Реквизиты документа, на основании которого произведена операция</td>
							</tr>
							<xsl:for-each select="CDSums:DebtFinOpers">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа CDSums:DebtFinOpersType -->
	<xsl:template match="CDSums:DebtFinOpers">
		<tr>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="CDSums:FinOperType=1">начислено</xsl:when>
					<xsl:when test="CDSums:FinOperType=2">уплачено</xsl:when>
					<xsl:when test="CDSums:FinOperType=3">исключено</xsl:when>
					<xsl:when test="CDSums:FinOperType=9">возвращено</xsl:when>
					<xsl:otherwise><xsl:value-of select="CDSums:FinOperType"/></xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="CDSums:PaymentModeCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(CDSums:FinOperSum, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="CDSums:FinOperDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="CDSums:PaymentDocReqs"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="CDSums:ValidDocReqs| CDSums:PaymentDocReqs">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
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
