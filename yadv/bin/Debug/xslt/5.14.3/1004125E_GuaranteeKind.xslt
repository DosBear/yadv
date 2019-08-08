<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:grnk="urn:customs.ru:Information:ExchangeDocuments:GuaranteeKind:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа GuaranteeKindType -->
	<xsl:template match="grnk:GuaranteeKind">
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
										<b>Уведомление о выбранном способе обеспечения</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата формирования уведомления</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="grnk:RegDate"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<xsl:if test="grnk:AdditionalRegistration">
						<div class="title marg-top">Дополнение к договору поручительства </div>
					</xsl:if>
					<xsl:apply-templates select="grnk:AdditionalRegistration"/>
					<xsl:if test="grnk:GuaranteeCustomsReceiptNum">
						<div class="title marg-top">Номер таможенной расписки</div>
					</xsl:if>
					<xsl:apply-templates select="grnk:GuaranteeCustomsReceiptNum"/>
					<xsl:if test="grnk:GuaranteeComment">
						<table class="w190">
							<tr>
								<td class="annot graphMain" style="width:50%">Пояснения к запросу об оформлении новой таможенной расписки</td>
								<td class="value graphMain" style="width:50%">
									<xsl:value-of select="grnk:GuaranteeComment"/>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="grnk:AdditionalNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа grnk:AdditionalRegistrationType -->
	<xsl:template match="grnk:AdditionalRegistration">
		<xsl:if test="grnk:GRN">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Cсылочный номер гарантии в транзите </td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="grnk:GRN"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="grnk:AdditionalID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор, присваиваемый дополнению к договору поручительства при регистрации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="grnk:AdditionalID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="grnk:AdditionalNumber">
			<div class="title marg-top">Присвоенный номер дополнения к договору поручительства</div>
		</xsl:if>
		<xsl:apply-templates select="grnk:AdditionalNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="grnk:GuaranteeCustomsReceiptNum">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:CustomsCode"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:GTDNumber"/>
				</td>
			</tr>
			<tr>
				<td class="annot graphMain" style="width:50%">Префикс порядкового номера таможенной расписки</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="grnk:DocNumberPrefix"/>
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
