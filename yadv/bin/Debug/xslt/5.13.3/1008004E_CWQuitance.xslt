<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.13.1" xmlns:cwq="urn:customs.ru:Information:WarehouseDocuments:CWQuitance:5.13.1">
	<!-- Шаблон для типа CWQuitanceType -->
	<xsl:template match="cwq:CWQuitance">
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
										<b>Квитанция об успешном получении информации</b>
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
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время создания электронного документа.</td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="catWH_ru:DocumentDateTime"/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
								<xsl:value-of select="substring(catWH_ru:DocumentDateTime, 12, 8)"/>
							</td>
						</tr>
					</table>
					<xsl:if test="catWH_ru:CustomsProperties">
						<div class="title marg-top">Реквизиты таможенного органа</div>
					</xsl:if>
					<xsl:apply-templates select="catWH_ru:CustomsProperties"/>
					<xsl:if test="cwq:Quitance">
						<div class="title marg-top">Квитанция</div>
					</xsl:if>
					<xsl:apply-templates select="cwq:Quitance"/>
					<xsl:if test="cwq:DocumentWithErrors">
						<div class="title marg-top">Документ,содержащий ошибки</div>
					</xsl:if>
					<xsl:apply-templates select="cwq:DocumentWithErrors"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="catWH_ru:CustomsProperties">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="cat_ru:OfficeName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cat_ru:OfficeName"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cwq:CorrectDocumentType -->
	<xsl:template match="cwq:CorrectDocument">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cwq:DocumentNumber"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwq:OrderNumberOfEdition"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cwq:DocumentWithErrorsType -->
	<xsl:template match="cwq:DocumentWithErrors">
		<xsl:if test="cwq:DocumentNumber">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер подтверждаемого/ошибочного документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwq:DocumentNumber"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cwq:OrderNumberOfEdition">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер версии подтверждаемого/ошибочного документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="cwq:OrderNumberOfEdition"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<div class="title marg-top">Ошибки</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Общее описание возникшей ошибки</td>
					<td class="graphMain bordered">Код ошибки</td>
					<td class="graphMain bordered">Текст ошибки</td>
				</tr>
				<xsl:for-each select="cwq:Errors">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа cwq:ErrorsType -->
	<xsl:template match="cwq:Errors">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="cwq:CommandErrorText"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwq:CommandErrorCode"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="cwq:ErrorText"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cwq:QuitanceType -->
	<xsl:template match="cwq:Quitance">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор вида документа</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="cwq:DocumentModeID"/>
				</td>
			</tr>
		</table>
		<div class="title marg-top">Подтверждаемый документ</div>
		<table class="bordered w190">
			<tbody>
				<tr class="title">
					<td class="graphMain bordered">Номер подтверждаемого/ошибочного документа</td>
					<td class="graphMain bordered">Номер версии подтверждаемого/ошибочного документа</td>
				</tr>
				<xsl:for-each select="cwq:CorrectDocument">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
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
