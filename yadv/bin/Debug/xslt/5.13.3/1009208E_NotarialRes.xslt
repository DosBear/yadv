<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ndres="urn:customs.ru:Information:SQDocuments:NotarialRes:5.13.2">
 <!-- Шаблон для типа NotarialResType -->
<xsl:template match="ndres:NotarialRes">
<html><head><style>
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
									width: 180mm;
									max-width: 180mm;
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
							<td align="center" class="graphMain"><font size="4"><b>Ответ на представление сведений ЕИС нотариата</b></font></td>
						</tr>
					</tbody>
				</table>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td>
					</tr>
				</table>
				<xsl:if test="cat_ru:RefDocumentID">
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td>
						</tr>
					</table>
				</xsl:if>
				<table class="w190">
					<tr>
						<td class="annot graphMain" style="width:50%">ФИО нотариуса</td>
						<td class="value graphMain" style="width:50%"><xsl:value-of select="ndres:NotaryName" /></td>
					</tr>
				</table>
				<xsl:if test="ndres:Document">
					<div class="title marg-top">Сведения о документе из реестра ЕИС</div>
				</xsl:if>
				<xsl:apply-templates select="ndres:Document" />
				<xsl:if test="ndres:Attach"></xsl:if>
				<xsl:if test="ndres:Attach">
					<div class="title marg-top">Приложенный файла с отчетом и подписью</div>
				</xsl:if>
				<xsl:apply-templates select="ndres:Attach" />
			</div>
		</body>
	</html>
</xsl:template>

<!-- Шаблон для типа ndres:AttachType -->
<xsl:template match="ndres:Attach">
	<table class="w190">
		<tr>
			<td class="annot graphMain" style="width:50%">Имя файла документа с расширением</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="ndres:Name" /></td>
		</tr>
	</table>
	<!--table class="w190">
		<tr>
			<td class="annot graphMain" style="width:50%">Файл в формате base64</td>
			<td class="value graphMain" style="width:50%"><xsl:value-of select="ndres:Base" /></td>
		</tr>
	</table-->
</xsl:template>

<!-- Шаблон для типа cat_ru:DocumentBaseType -->
<xsl:template match="ndres:Document">
	<xsl:if test="cat_ru:PrDocumentName">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование документа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentName" /></td>
			</tr>
		</table>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentNumber">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Номер документа</td>
				<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentNumber" /></td>
			</tr>
		</table>
	</xsl:if>
	<xsl:if test="cat_ru:PrDocumentDate">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Дата документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" />
					</xsl:call-template>
				</td>
			</tr>
		</table>
	</xsl:if>
</xsl:template>

<xsl:template name="russian_date">
	<xsl:param name="dateIn" />
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,6,2)" />
			<xsl:text>.</xsl:text>
			<xsl:value-of select="substring($dateIn,1,4)" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>