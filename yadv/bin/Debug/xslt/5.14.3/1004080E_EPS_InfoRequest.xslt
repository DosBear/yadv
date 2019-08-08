<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cltExch_ru="urn:customs.ru:Information:ExchangeDocuments:ExchangeCommonLeafTypes:5.0.8" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:eir="urn:customs.ru:Information:ExchangeDocuments:EPS_InfoRequest:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа EPS_InfoRequestType -->
	<xsl:template match="eir:EPS_InfoRequest">
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

									.marg-t1
									{
									margin-top:10mm;
									font-family: Arial;
									font-size: 12pt;
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
										<b>Запрос информации об электронном документе, процедуре/процессе.</b>
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
					<xsl:if test="eir:ArchRequest">
						<div class="title marg-t1">Запрос к архиву декларанта</div>
						<xsl:apply-templates select="eir:ArchRequest"/>
					</xsl:if>
					<xsl:if test="eir:ProcessRequest">
						<div class="title marg-t1">Запрос к процедуре / процессу</div>
						<xsl:apply-templates select="eir:ProcessRequest"/>
					</xsl:if>
					<xsl:if test="eir:EnvRequest">
						<div class="title marg-t1">Запрос на передачу сообщения</div>
						<xsl:apply-templates select="eir:EnvRequest"/>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа eir:ArchRequestType -->
	<xsl:template match="eir:ArchRequest">
		<xsl:if test="eir:ArchDeclID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор декларанта в архиве</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="eir:ArchDeclID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="eir:ArchID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор архива декларанта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="eir:ArchID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="eir:ArchDocID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Архивный идентификатор документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="eir:ArchDocID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="eir:ArchDocumentID">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="eir:ArchDocumentID"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа eir:EnvRequestType -->
	<xsl:template match="eir:EnvRequest">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор сообщения</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="eir:EnvelopeID"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа eir:ProcessRequestType -->
	<xsl:template match="eir:ProcessRequest">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Идентификатор процесса</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="eir:ProcessID"/>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
