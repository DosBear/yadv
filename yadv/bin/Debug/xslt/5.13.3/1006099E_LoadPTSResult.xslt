<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:upts="urn:customs.ru:Information:CustomsDocuments:LoadPTSResult:5.10.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа LoadPTSResultType -->
	<xsl:template match="upts:LoadPTSResult">
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
										<b>Пакет с протоколом обработки </b>
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
					<xsl:if test="upts:ProtocolProcessingPacket">
						<div class="title marg-top">Результат загрузки / обработки пакета </div>
					</xsl:if>
					<xsl:apply-templates select="upts:ProtocolProcessingPacket"/>
					<xsl:if test="upts:ProtocolProcessingForm">
						<div class="title marg-top">Сведения о результатах проведения форматного и структурного контроля бланка</div>
						<table class="bordered w190">
							<tbody>
								<tr class="title">
									<td class="graphMain bordered">Код сообщения (ошибки)</td>
									<td class="graphMain bordered">Уникальный идентификатор бланка</td>
									<td class="graphMain bordered">Дополнительная информация об ошибке (COMMENT)</td>
								</tr>
								<xsl:for-each select="upts:ProtocolProcessingForm">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа upts:ProtocolProcessingFormType -->
	<xsl:template match="upts:ProtocolProcessingForm">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="upts:MSG_Code"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="upts:GUID"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="upts:AddInformation"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа upts:ProtocolProcessingPacketType -->
	<xsl:template match="upts:ProtocolProcessingPacket">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код сообщения (ошибки)</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="upts:MSG_Code"/>
				</td>
			</tr>
		</table>
		<xsl:if test="upts:AddInformation">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Дополнительная информация об ошибке (COMMENT)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="upts:AddInformation"/>
					</td>
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
