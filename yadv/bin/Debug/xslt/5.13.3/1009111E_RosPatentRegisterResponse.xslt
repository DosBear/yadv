<?xml version="1.0" encoding="utf-8" ?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rprr="urn:customs.ru:Information:SQDocuments:RosPatentRegisterResponse:5.12.0">
 <!-- Шаблон для типа RosPatentRegisterResponseType -->
<xsl:template match="rprr:RosPatentRegisterResponse">
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
								</style></head><body><div class="page"><table class="w190"><tbody><tr><td align="center" class="graphMain"><font size="4"><b>О предоставлении сведений из Государственного реестра товарных знаков и знаков обслуживания</b></font></td></tr></tbody></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID" /></td></tr></table><xsl:if test="cat_ru:RefDocumentID"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td><td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID" /></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Номер письма</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:Number" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Воспроизведение товарного знака</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:TrademarkReproduction" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата государственной регистрации</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rprr:RegDate" /></xsl:call-template></td></tr></table><xsl:if test="rprr:PriorityDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата приоритета</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rprr:PriorityDate" /></xsl:call-template></td></tr></table></xsl:if><xsl:if test="rprr:RightExpirationDate"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Дата истечения срока действия исключительного права на товарный знак</td><td class="value graphMain" style="width:50%"><xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="rprr:RightExpirationDate" /></xsl:call-template></td></tr></table></xsl:if><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о правообладателе</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:OwnerInfo" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Указание на то, что товарный знак является коллективным</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:CollectiveTrademark" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о лицах, имеющих право использования коллективного знака</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:UsersOfCollectiveMark" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Перечень товаров и услуг, в отношении которых зарегистрирован товарный знак</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:ListOfGoods" /></td></tr></table><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации предоставления права использования товарного знака по лицензионному договору, договору коммерческой концессии, сублицензионному договору, договору коммерческой субконцессии</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:RegistrationOfUsageRights" /></td></tr></table><xsl:if test="rprr:PledgeRegistrationInfo"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации залога (последующего залога) товарного знака по договору</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:PledgeRegistrationInfo" /></td></tr></table></xsl:if><xsl:if test="rprr:GrantingRightChangesReg"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации изменений, касающихся предоставления права использования товарного знака по лицензионному договору, сублицензионному договору</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:GrantingRightChangesReg" /></td></tr></table></xsl:if><xsl:if test="rprr:TerminationOfGrantingRight"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации досрочного прекращения предоставления права использования товарного знака по лицензионному договору, сублицензионному договору</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:TerminationOfGrantingRight" /></td></tr></table></xsl:if><xsl:if test="rprr:TerminationOfLegalProtection"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о досрочном прекращении правовой охраны товарного знака полностью, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:TerminationOfLegalProtection" /></td></tr></table></xsl:if><xsl:if test="rprr:RecognitionOfLegalProtectionInvalid"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о признании предоставления правовой охраны товарному знаку не действительной полностью, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:RecognitionOfLegalProtectionInvalid" /></td></tr></table></xsl:if><xsl:if test="rprr:RecognitionOfLegalProtectionInvalidPartly"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о признании предоставления правовой охраны товарному знаку не действительной частично, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:RecognitionOfLegalProtectionInvalidPartly" /></td></tr></table></xsl:if><xsl:if test="rprr:TrademarkRecordCancellation"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения об аннулировании записи в Государственном реестре товарных знаков и знаков обслуживания Российской Федерации, в том числе на основании судебных актов или постановлений судебных приставов</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:TrademarkRecordCancellation" /></td></tr></table></xsl:if><xsl:if test="rprr:TerminationOfLegalProtectionCollectiveMark"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о досрочном прекращении правовой охраны коллективного знака</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:TerminationOfLegalProtectionCollectiveMark" /></td></tr></table></xsl:if><xsl:if test="rprr:TerminationOfCommercialConcessionContract"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации прекращения договора коммерческой концессии, договора коммерческой субконцессии</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:TerminationOfCommercialConcessionContract" /></td></tr></table></xsl:if><xsl:if test="rprr:ChangesOfCommercialConcessionContract"><table class="w190"><tr><td class="annot graphMain" style="width:50%">Сведения о государственной регистрации изменения договора коммерческой концессии, договора коммерческой субконцессии</td><td class="value graphMain" style="width:50%"><xsl:value-of select="rprr:ChangesOfCommercialConcessionContract" /></td></tr></table></xsl:if></div></body></html></xsl:template>

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