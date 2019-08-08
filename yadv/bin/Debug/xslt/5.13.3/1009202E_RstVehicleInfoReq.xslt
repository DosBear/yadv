<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rstviReq="urn:customs.ru:Information:SQDocuments:RstVehicleInfoReq:5.13.2">
 <!-- Шаблон для типа RstVehicleInfoReqType -->
<xsl:template match="rstviReq:RstVehicleInfoReq">
<html><head><style>
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Запрос копий документов, которые были выданы таможенными органами Российской Федерации при таможенном оформлении транспортных средств, номерных агрегатов</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><xsl:if test="rstviReq:Mark"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Марка</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rstviReq:Mark" /></td></tr></table></xsl:if><xsl:if test="rstviReq:Model"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Модель</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rstviReq:Model" /></td></tr></table></xsl:if><xsl:if test="rstviReq:ProductYear"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Год изготовления</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rstviReq:ProductYear" /></td></tr></table></xsl:if><xsl:if test="rstviReq:VIN"><table class="w190"><tr><td class="annot graphMain" style="width:50%">VIN-код</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rstviReq:VIN" /></td></tr></table></xsl:if><xsl:if test="rstviReq:EngineModel"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Модель двигателя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rstviReq:EngineModel" /></td></tr></table></xsl:if><xsl:if test="rstviReq:EngineNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер двигателя</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rstviReq:EngineNumber" /></td></tr></table></xsl:if><xsl:if test="rstviReq:EcoClass"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Экологический класс</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rstviReq:EcoClass" /></td></tr></table></xsl:if></div></body></html></xsl:template>

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