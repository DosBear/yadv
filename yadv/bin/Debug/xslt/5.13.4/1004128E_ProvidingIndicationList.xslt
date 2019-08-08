<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:pil="urn:customs.ru:Information:CustomsDocuments:ProvidingIndicationList:5.11.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ProvidingIndicationListType -->
	<xsl:template match="pil:ProvidingIndicationList">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									/*width: 190mm;*/
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
										<b>Лист контроля однократности предоставления документов при декларировании</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="title marg-top">Документ при декларировании</div>
					<table class="bordered w190">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Наименование документа</td>
								<td class="graphMain bordered">Номер документа</td>
								<td class="graphMain bordered">Дата документа</td>
								<td class="graphMain bordered">Код вида</td>
								<td class="graphMain bordered">Ид. архива</td>
								<td class="graphMain bordered">Ид. документа</td>
								<td class="graphMain bordered">Ид. записи</td>
								<td class="graphMain bordered">Идентификатор исполнительного органа</td>
								<td class="graphMain bordered">Код вида представленного документа</td>
								<td class="graphMain bordered">Декларируемый признак представления документа</td>
								<td class="graphMain bordered">Регистрационный номер первой ДТ</td>
								<td class="graphMain bordered">Код ошибки</td>
								<td class="graphMain bordered">Описание ошибки</td>
							</tr>
							<xsl:for-each select="pil:DocList">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа pil:DocListType -->
	<xsl:template match="pil:DocList">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:DocCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:ArchID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:ArchDocID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:RecordID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:ExecutiveBodyID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:DocumentModeID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:choose>
					<xsl:when test="pil:ProvidingIndicationMark=0">
						<xsl:text>документ не представлен при подаче ДТ</xsl:text>
					</xsl:when>
					<xsl:when test="pil:ProvidingIndicationMark=1">
						<xsl:text>документ представлен при подаче ДТ</xsl:text>
					</xsl:when>
					<xsl:when test="pil:ProvidingIndicationMark=2">
						<xsl:text>документ не  представлен  в соответствии с частью 2 п.4 ст. 183 ТК ТС</xsl:text>
					</xsl:when>
					<xsl:when test="pil:ProvidingIndicationMark=3">
						<xsl:text>документ представлен (будет представлен) после выпуска товаров</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="pil:ProvidingIndicationMark"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="pil:FirstDT">
					<xsl:apply-templates select="pil:FirstDT"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:ResultCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="pil:ResultDescription"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="pil:FirstDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gdt_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="gdt_date">
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
