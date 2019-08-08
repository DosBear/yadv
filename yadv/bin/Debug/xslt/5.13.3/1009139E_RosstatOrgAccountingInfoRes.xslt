<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:roai_res="urn:customs.ru:Information:SQDocuments:RosstatOrgAccountingInfoRes:5.13.1">
	<!-- Шаблон для типа RosstatOrgAccountingInfoResType -->
	<xsl:template match="roai_res:RosstatOrgAccountingInfoRes">
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
										<b>Предоставление данных бухгалтерской (финансовой) отчетности ЮЛ, осуществляющих свою деятельность на территории РФ</b>
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
							<td class="annot graphMain" style="width:50%">Код статуса обработки запроса</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="roai_res:ResponseCode"/></td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Описание статуса обработки запроса</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="roai_res:ResponseDesc"/></td>
						</tr>
					</table>
					<xsl:if test="roai_res:BalanceReport">
						<div class="title marg-top">Данные бухгалтерской отчетности</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Наименование параметра</td>
									<td class="graphMain bordered">Значение параметра</td>
								</tr>
								<xsl:for-each select="roai_res:BalanceReport">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="roai_res:BalanceReportInFile">
						<div class="title marg-top">Данные бухгалтерской отчетности в виде файла в Base64</div>
						<xsl:apply-templates select="roai_res:BalanceReportInFile"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа roai_res:BalanceReportType -->
	<xsl:template match="roai_res:BalanceReport">
		<tr>
			<td class="graphMain bordered"><xsl:value-of select="roai_res:NameParam"/></td>
			<td class="graphMain bordered"><xsl:value-of select="roai_res:ValueParam"/></td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа roai_res:BalanceReportInFileType -->
	<xsl:template match="roai_res:BalanceReportInFile">
		<xsl:if test="roai_res:FileName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование файла</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="roai_res:FileName"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="roai_res:FileType">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Тип файла</td>
					<td class="value graphMain" style="width:50%"><xsl:value-of select="roai_res:FileType"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="roai_res:FileContent">
			<br/>
			<table class="w190">
				<tr>
					<td class="annot graphMain">Содержание файла Word или Excel с данными бухгалтерской отчетности в Base64</td>
				</tr>
				<tr>
					<td class="value graphMain"><xsl:value-of select="roai_res:FileContent"/></td>
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
