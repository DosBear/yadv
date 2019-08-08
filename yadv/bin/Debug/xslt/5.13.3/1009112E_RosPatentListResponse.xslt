<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rplr="urn:customs.ru:Information:SQDocuments:RosPatentListResponse:5.12.0">
 <!-- Шаблон для типа RosPatentListResponseType -->
<xsl:template match="rplr:RosPatentListResponse">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>О представлении сведений из Перечня общеизвестных в Российской Федерации товарных знаков</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер общеизвестного товарного знака</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:Number" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата вступления в силу решения</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rplr:EntryDate" /></xsl:call-template></td></tr></table><xsl:if test="rplr:KnownDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата, с которой товарный знак признан общеизвестным</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rplr:KnownDate" /></xsl:call-template></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Воспроизведение общеизвестного товарного знака</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:TrademarkReproduction" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о правообладателе</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:OwnerInfo" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Перечень товаров и услуг, в отношении которых товарный знак признан общеизвестным</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:ListOfGoods" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о предоставлении права использования общеизвестного товарного знака по лицензионному договору (сублицензионному) договору или договору коммерческой концессии (субконцесси)</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:RightGrantingInfo" /></td></tr></table><xsl:if test="rplr:PledgeRegistrationInfo"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации залога (последующего залога) исключительного права на общеизвестный товарный знак по договору</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:PledgeRegistrationInfo" /></td></tr></table></xsl:if><xsl:if test="rplr:GrantingRightChangesReg"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации изменений, касающихся предоставления права использования общеизвестного товарного знака по лицензионному договору, сублицензионному договору</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:GrantingRightChangesReg" /></td></tr></table></xsl:if><xsl:if test="rplr:TerminationOfGrantingRight"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации досрочного прекращения предоставления права использования общеизвестного товарного знака по лицензионному договору, сублицензионному договору</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:TerminationOfGrantingRight" /></td></tr></table></xsl:if><xsl:if test="rplr:TerminationOfLegalProtection"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о досрочном прекращении правовой охраны общеизвестного товарного знака полностью, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:TerminationOfLegalProtection" /></td></tr></table></xsl:if><xsl:if test="rplr:TerminationOfLegalProtectionPartly"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о досрочном прекращении правовой охраны общеизвестного товарного знака частично, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:TerminationOfLegalProtectionPartly" /></td></tr></table></xsl:if><xsl:if test="rplr:RecognitionOfLegalProtectionInvalid"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о признании предоставления правовой охраны общеизвестному товарному знаку недействительным полностью, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:RecognitionOfLegalProtectionInvalid" /></td></tr></table></xsl:if><xsl:if test="rplr:RecognitionOfLegalProtectionInvalidPartly"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о признании предоставления правовой охраны общеизвестному товарному знаку недействительным частично, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:RecognitionOfLegalProtectionInvalidPartly" /></td></tr></table></xsl:if><xsl:if test="rplr:RegistrationOfChangesInContract"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации изменения договора коммерческой концессии, договора коммерческой субконцессии</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:RegistrationOfChangesInContract" /></td></tr></table></xsl:if><xsl:if test="rplr:RegistrationOfTerminationContract"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации прекращения договора коммерческой концессии, договора коммерческой субконцессии</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rplr:RegistrationOfTerminationContract" /></td></tr></table></xsl:if></div></body></html></xsl:template>

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