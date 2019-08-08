<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rpgres="urn:customs.ru:Information:SQDocuments:RosPatentGoodsResponse:5.12.0">
 <!-- Шаблон для типа RosPatentGoodsResponseType -->
<xsl:template match="rpgres:RosPatentGoodsResponse">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>Ответ на запрос сведений из Государственного реестра наименований мест происхождения товаров Российской Федерации</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер свидетельства</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rpgres:CertificateNumber" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование места происхождения товара</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rpgres:GoodsOriginPlace" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Указание товара</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rpgres:GoodsInfo" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата истечения срока действия свидетельства</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rpgres:CertExpirationDate" /></xsl:call-template></td></tr></table><xsl:if test="rpgres:Request"><div class="title marg-top">Заявка</div></xsl:if><xsl:apply-templates select="rpgres:Request" /><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения об обладателе(ях) свидетельства</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rpgres:CertificateOwner" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата публикации</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rpgres:PublicationDate" /></xsl:call-template></td></tr></table><xsl:if test="rpgres:SpecialPropertiesOfGoods"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Описание особых свойств товара</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rpgres:SpecialPropertiesOfGoods" /></td></tr></table></xsl:if></div></body></html></xsl:template>

<!-- Шаблон для типа cat_ru:DocumentBaseType -->
<xsl:template match="rpgres:Request">
<xsl:if test="cat_ru:PrDocumentName"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Наименование документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentName" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentNumber"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:PrDocumentNumber" /></td></tr></table></xsl:if><xsl:if test="cat_ru:PrDocumentDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата документа</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate" /></xsl:call-template></td></tr></table></xsl:if></xsl:template>

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