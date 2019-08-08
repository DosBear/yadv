<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:rusrd="urn:customs.ru:Information:ExchangeDocuments:ResultRD:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ResultRDType -->
	<xsl:template match="rusrd:ResultRD">
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
										<b>Уведомление о результате проверки / обработке сообщения БД РД</b>
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
					<div class="title marg-top">Результат выполнения операции</div>
					<table class="bordered w190">
							<!--tr class="title">
								<td class="graphMain bordered">Идентификатор документа, в котором была допущена ошибка.</td>
								<td class="graphMain bordered">Код возврата при обработке сообщения, результат выполнения операции</td>
							</tr-->
						<xsl:for-each select="rusrd:Response">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа rusrd:ItemInfoType -->
	<xsl:template match="rusrd:ItemInfo">
		<xsl:value-of select="rusrd:RefItem"/>
		<xsl:if test="rusrd:RecommendValue">
			<br/>
			<xsl:text>Рекомендуемое значение: </xsl:text>
			<xsl:value-of select="rusrd:RecommendValue"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rusrd:ResponseType -->
	<xsl:template match="rusrd:Response">
		<tr bgcolor="#e3e3e3">
			<td class="annot graphMain" style="width:50%; border-top: 1px solid grey">Идентификатор документа, в котором была допущена ошибка</td>
			<td class="value graphMain" style="width:50%; border-top: 1px solid grey"><xsl:value-of select="rusrd:RefDocumentID"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="title marg-top">Код возврата при обработке сообщения, результат выполнения операции</div>
				<table class="bordered w190">
					<tbody>
						<tr class="title">
							<tr>
								<td class="graphMain bordered">Источник ошибки. Код подсистемы, вернувшей ошибку</td>
								<td class="graphMain bordered">Код ошибки</td>
								<td class="graphMain bordered">Текстовое описание ошибки</td>
								<td class="graphMain bordered">Степень критичности ошибки. Код или мнемоническое описание</td>
								<td class="graphMain bordered">Ссылка на элемент с ошибкой</td>
							</tr>
						</tr>
						<xsl:for-each select="rusrd:ResultInformation">
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</tbody>
				</table>
				<br/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа rusrd:ResultInformationType -->
	<xsl:template match="rusrd:ResultInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="rusrd:ResultSource"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rusrd:ResultCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="rusrd:ResultDescription"><xsl:value-of select="."/></xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="rusrd:ResultCategory"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="rusrd:ItemInfo">
					<xsl:apply-templates select="rusrd:ItemInfo"/>
				</xsl:if>
			</td>
		</tr>
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
