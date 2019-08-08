<?xml version="1.0" encoding="UTF-8"?>

<!-- На основании формы из приказа ФТС № 1940 от 15.10.2013 Приложение №1 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dcg="urn:customs.ru:Information:CustomsDocuments:DecisionClassGood:5.14.3">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="TNVEDCode">
		<xsl:param name="str"/>
		<xsl:choose>
			<xsl:when test="string-length($str)=10">
				<xsl:value-of select="substring($str, 1, 4)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 5, 2)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 7, 3)"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="substring($str, 10, 1)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$str"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="ddmmyy">
		<xsl:param name="reg"/>
		<xsl:choose>
			<xsl:when test="substring($reg,5,1)='-' ">
				<xsl:value-of select="substring($reg,9,2)"/>
				<xsl:value-of select="substring($reg,6,2)"/>
				<xsl:value-of select="substring($reg,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$reg"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:value-of select="substring (., 9, 2)"/>&#160;
					<xsl:variable name="month" select="substring(., 6, 2)"/>
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose>&#160;					
					<xsl:value-of select="substring(., 1, 4)"/>&#160;г.
	</xsl:template>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="dcg:DecisionClassGood">
		<html>
			<head>
				<title>Решение по классификации товара по ТН ВЭД ЕАЭС</title>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<style type="text/css">
						body {
							text-align: center;
							background: #cccccc;
							}
						
						.page {
							width: 210mm;
							height: 297mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding: 10mm;
							padding-left: 20mm;
							background: #ffffff;
							border: solid 1pt #000000;
						}
						
						.page1 {
							width: 297mm;
							/*height: 297mm;*/
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding: 10mm;
							background: #ffffff;
							border: solid 1pt #000000;
						}
						
						.space {
							width: 30px;
						}

					.marg-top
						{
						margin-top:3mm;
						font-weight: bold;
						}
						
						.spec_column {
							border-bottom: 0px; 
							border-left:0px; 
							border-right:0px; 
							font-size: 10pt;
						}
						
						.header {
							font-weight: bold;
						}
						
						.docs td {
							padding:5px
						}
						
						.goods tr td {
							vertical-align: top;
							padding: 5px;
						}
						
						.main tr td {
							vertical-align: top;
						}
						.content {
							margin-top:10px; 
							margin-left:15px;
							margin-bottom:15px;
						}
						.bordered {
							border-bottom: 1px solid;
						}
						.border{
							border: 1px solid;
						}
                   </style>
			</head>
			<body>
				<div class="page">
					<h2 align="center">Решение по классификации товара по ТН ВЭД ЕАЭС</h2>
					<table class="main" border="1" style="border:0; border-collapse:collapse; margin: -5px; width:100%">
						<tr>
							<td width="50%">
								1. Наименование таможенного органа <br/>
								<div class="content">
									<xsl:value-of select="dcg:Customs/cat_ru:Code"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:value-of select="dcg:Customs/cat_ru:OfficeName"/>
								</div>
							</td>
							<td width="50%">2. Декларант
								<div class="content">
									<xsl:if test="dcg:Declarant/cat_ru:OrganizationName">
										<xsl:value-of select="dcg:Declarant/cat_ru:OrganizationName"/>
										<br/>
									</xsl:if>
									<xsl:if test="dcg:Declarant/cat_ru:ShortName and not(dcg:Declarant/cat_ru:OrganizationName)">
										<xsl:value-of select="dcg:Declarant/cat_ru:ShortName"/>
										<br/>
									</xsl:if>
									<xsl:if test="dcg:Declarant/RUScat_ru:SubjectAddressDetails">
										<xsl:for-each select="dcg:Declarant/RUScat_ru:SubjectAddressDetails">
											<table>
												<tbody>
													<xsl:if test="RUScat_ru:PostalCode">
														<tr>
															<td>Почтовый индекс</td>
															<td>
																<xsl:value-of select="RUScat_ru:PostalCode"/>
															</td>
														</tr>
													</xsl:if>
													<tr>
														<td>Адрес</td>
														<td>
															<xsl:choose>
																<xsl:when test="RUScat_ru:AddressText">
																	<xsl:value-of select="RUScat_ru:AddressText"/>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:if test="RUScat_ru:CounryName">
																		<xsl:value-of select="RUScat_ru:CounryName"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																	<xsl:if test="RUScat_ru:Region">
																		<xsl:value-of select="RUScat_ru:Region"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																	<xsl:if test="RUScat_ru:District">
																		<xsl:value-of select="RUScat_ru:District"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																	<xsl:if test="RUScat_ru:Town">
																		<xsl:value-of select="RUScat_ru:Town"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																	<xsl:if test="RUScat_ru:City">
																		<xsl:value-of select="RUScat_ru:City"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																	<xsl:if test="RUScat_ru:StreetHouse">
																		<xsl:value-of select="RUScat_ru:StreetHouse"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																	<xsl:if test="RUScat_ru:House">
																		<xsl:value-of select="RUScat_ru:House"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																	<xsl:if test="RUScat_ru:Room">
																		<xsl:value-of select="RUScat_ru:Room"/>
																		<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
																	</xsl:if>
																</xsl:otherwise>
															</xsl:choose>
														</td>
													</tr>
												</tbody>
											</table>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="dcg:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
										ИНН <xsl:value-of select="dcg:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
									</xsl:if>
									<!--xsl:for-each select="dcg:Declarant/dcg:BranchDescription">
										<br/>
										<span class="graph">Сведения об обособленном подразделении:</span>&#160;<xsl:if test="cat_ru:OrganizationName">
											<xsl:value-of select="cat_ru:OrganizationName"/>
											<br/>
										</xsl:if>
										<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
											<xsl:value-of select="cat_ru:ShortName"/>
											<br/>
										</xsl:if>
										<xsl:if test="cat_ru:Address">
											<xsl:apply-templates select="cat_ru:Address"/>
										</xsl:if>
									</xsl:for-each-->
									<xsl:if test="dcg:Declarant/RUScat_ru:IdentityCard">
										<br/>
										<xsl:apply-templates select="dcg:Declarant/RUScat_ru:IdentityCard"/>
									</xsl:if>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								3. Регистрационный номер
								<div class="content">
									РКТ-<xsl:value-of select="dcg:RegistrationNumber/dcg:CustomsCode"/>-<xsl:value-of select="substring(dcg:RegistrationNumber/dcg:Date,3,2)"/>/<xsl:value-of select="dcg:RegistrationNumber/dcg:SerialNumber"/>
									<!--	<xsl:value-of select="dcg:RegistrationNumber/dcg:CaseNomenclatureNumber"/>/-->
								</div>
							</td>
							<td>
								4. Дата регистрации
								<div align="center" class="content">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
									<xsl:for-each select="dcg:RegistrationNumber/dcg:Date">
										<xsl:call-template name="Date"/>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;</xsl:text>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-bottom:0">5. Наименование товара</td>
							<td style="border-bottom:0">6. Код товара по ТН ВЭД ЕАЭС</td>
						</tr>
						<xsl:for-each select="dcg:Goods">
							<tr>
								<td style="padding-left:15px; padding-top:5px; border-top:0; border-bottom:0;">
									<xsl:for-each select="dcg:GoodDescription">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</td>
								<td style="padding-left:15px; padding-top:5px; border-top:0; border-bottom:0">
									<xsl:call-template name="TNVEDCode">
										<xsl:with-param name="str" select="../dcg:TNVEDCode"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td colspan="2">
								7. Сведения о товаре, необходимые для классификации 
								<div class="content">
									<table border="0">
										<tbody>
											<xsl:for-each select="dcg:Goods">
												<xsl:if test="dcg:AdditionalInformation">
													<tr>
														<td colspan="2">
															<xsl:for-each select="dcg:AdditionalInformation">
																<xsl:value-of select="."/>
															</xsl:for-each>
														</td>
													</tr>
												</xsl:if>
											</xsl:for-each>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								8. Обоснование принятия решения по классификации товара по ТН ВЭД ЕАЭС                                      
								<!--<div class="content">
									<xsl:for-each select="dcg:RationaleDecision">
										<xsl:value-of select="."/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:for-each>
									
									<xsl:if test="dcg:ClassDecisionChanges">
										<br/>В соответствии со ст. 412 Таможенного кодекса Российской Федерации
									</xsl:if>
								</div>-->
								<div class="content">
								8.1.&#160;Решение принято в соответствии с ОПИ <u>
										<xsl:choose>
											<xsl:when test="dcg:InterpretationRules">
												<xsl:value-of select="dcg:InterpretationRules"/>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									</u>
								</div>
								<div class="content">
								8.2.&#160;Заключение <u>
										<xsl:choose>
											<xsl:when test="dcg:ExpertDecision/dcg:ExpertOrganization">
												<xsl:value-of select="dcg:ExpertDecision/dcg:ExpertOrganization"/>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									</u> от <u>
										<xsl:choose>
											<xsl:when test="dcg:ExpertDecision/cat_ru:PrDocumentDate">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="dcg:ExpertDecision/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									</u>&#160;№
								<u>
										<xsl:choose>
											<xsl:when test="dcg:ExpertDecision/cat_ru:PrDocumentNumber">
												<xsl:value-of select="dcg:ExpertDecision/cat_ru:PrDocumentNumber"/>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									</u>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								9. Для служебных отметок 
								<div class="content">
								9.1.&#160;Товар №&#160;<u>
										<xsl:choose>
											<xsl:when test="dcg:Goods/dcg:Numeric_TNVEDCode/dcg:GoodsNumeric">
												<xsl:choose>
													<xsl:when test="dcg:DecisionType=3">
														<xsl:value-of select="dcg:Goods/dcg:Numeric_TNVEDCode/dcg:GoodsNumeric"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select="dcg:Goods/dcg:Numeric_TNVEDCode">
															<xsl:value-of select="dcg:GoodsNumeric"/>
															<xsl:if test="position()!=last()">, </xsl:if>
														</xsl:for-each>
													</xsl:otherwise>	
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="dcg:Goods/dcg:IsPartialGood='true' or dcg:Goods/dcg:IsPartialGood='1' or dcg:Goods/dcg:IsPartialGood='t'">
											&#160;часть товара&#160;
										</xsl:if>
										<xsl:if test="dcg:Goods/dcg:GoodsClassificationCode='true' or dcg:Goods/dcg:GoodsClassificationCode='1' or dcg:Goods/dcg:GoodsClassificationCode='t'">
											&#160;товар списка&#160;
										</xsl:if>
									</u>&#160;по ДТ №&#160;<u>
										<xsl:choose>
											<xsl:when test="dcg:RegNumberDT">
												<xsl:apply-templates select="dcg:RegNumberDT"/>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									</u>
								</div>
								<div class="content">
								9.2.&#160;Заявленный код товара <u>
										<xsl:choose>
											<xsl:when test="dcg:Goods/dcg:Numeric_TNVEDCode/dcg:TNVEDCode">
											<xsl:for-each select="dcg:Goods/dcg:Numeric_TNVEDCode">
												<xsl:value-of select="dcg:TNVEDCode"/>
												<xsl:if test="position()!=last()">, </xsl:if>
											</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</xsl:otherwise>
										</xsl:choose>
									</u> по ТН ВЭД ЕАЭС
								</div>
								<div class="content">
								9.3.&#160;Количество дополнительных листов <u>&#160;&#160;0&#160;&#160;</u>
								</div>
								<div class="content">
								9.4.&#160;Количество приложений <u>&#160;&#160;0&#160;&#160;</u>
								</div>
								<div class="content">
									<xsl:choose>
										<xsl:when test="dcg:ProcState='1'">
											9.5.&#160;Сведения по ведомственному контролю <br/>
											<xsl:for-each select="dcg:DepartmentalControl">
												<xsl:value-of select="."/>&#160;
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											9.5.&#160;______________&#160;
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="content">
									<xsl:choose>
										<xsl:when test="dcg:ProcState='2'">
											9.6.&#160;Решение принято на основании проверки, проведенной в соответствии со статьей 331 ТК ЕАЭС
										</xsl:when>
										<xsl:otherwise>
											9.6.&#160;______________&#160;
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="content">
								9.7.&#160;Прочие отметки <br/>
									<xsl:if test="dcg:DecisionType=3">
											<xsl:if test="dcg:Goods/dcg:Numeric_TNVEDCode">
												номера товаров:&#160;
												<xsl:for-each select="dcg:Goods/dcg:Numeric_TNVEDCode">
													<xsl:if test="dcg:GoodsNumeric">
														<xsl:value-of select="dcg:GoodsNumeric"/>
													</xsl:if>
													<xsl:if test="dcg:TNVEDCode">
														<xsl:if test="dcg:GoodsNumeric">
															,&#160;
														</xsl:if>	
														<xsl:value-of select="dcg:TNVEDCode"/>,&#160;
													</xsl:if>
													<xsl:if test="position()!=last()">
														;&#160;
													</xsl:if>
												</xsl:for-each>
												<br/>
											</xsl:if>	
											<xsl:if test="dcg:Goods/dcg:GoodsInformation">
												описание товаров:<br/>
												<xsl:for-each select="dcg:Goods/dcg:GoodsInformation">
													<xsl:for-each select="*[local-name()='Manufacturer' or local-name()='TradeMark' or local-name()='GoodsMark' or local-name()='GoodsModel' or local-name()='GoodsMarking' or local-name()='GoodsStandard' or local-name()='GoodsSort' or local-name()='WoodDescriptionDetails' or local-name()='Dimensions' or local-name()='DateIssue' or local-name()='SerialNumber']">
														<xsl:if test="local-name()='Manufacturer'">
															производитель:&#160;
														</xsl:if>
														<xsl:if test="local-name()='GoodsMark'">
															марка:&#160;
														</xsl:if>
														<xsl:if test="local-name()='GoodsModel'">
															модель:&#160;
														</xsl:if>
														<xsl:if test="local-name()='GoodsSort'">
															сорт:&#160;
														</xsl:if>
														<xsl:if test="position()!=1 and local-name()!='SerialNumber'"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
														<xsl:choose>
															<xsl:when test="local-name()='WoodDescriptionDetails'">
																<xsl:apply-templates mode="WoodDescriptionDetails" select="."/>
															</xsl:when>
															<xsl:when test="local-name()='DateIssue'">
																дата выпуска:&#160;
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="."/>
																</xsl:call-template> 
															</xsl:when>
															<xsl:when test="local-name()='Dimensions'">
																размеры:&#160;
																<xsl:apply-templates mode="Dimensions" select="."/>
															</xsl:when>
															<xsl:when test="local-name()='SerialNumber' and not(preceding-sibling::*[local-name()='SerialNumber'])">
																<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
																<!--для unbounted элемента SerialNumber выведем сразу все, как только всетретили первый (это надо, чтобы не делать лишних пробелов между ними)-->
																<xsl:apply-templates select="../*[local-name()='SerialNumber']"/>
																<!--xsl:for-each select="../*[local-name()='SerialNumber']">
																	<xsl:value-of select="."/>
																</xsl:for-each-->
															</xsl:when>
															<xsl:otherwise>
																<xsl:if test="local-name()!='SerialNumber'">
																	<xsl:apply-templates select="."/>
																</xsl:if>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
													<br/>
												</xsl:for-each>
											</xsl:if>	
									</xsl:if>
									<xsl:for-each select="dcg:Mark">
										<xsl:value-of select="."/>
										<xsl:text> </xsl:text>
									</xsl:for-each>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								10. Подпись должностного лица таможенного органа                         
								<div class="content">
									<table class="person" border="1" style="border:0; margin-top:20px;" width="100%">
										<tbody>
											<tr>
												<!--<xsl:if test="dcg:PersonSignature/cat_ru:PersonPost">-->
												<td align="center" style="border:0px">
													<xsl:value-of select="dcg:PersonSignature/cat_ru:PersonPost"/>
												</td>
												<td style="border:0px; width:40px"/>
												<!--</xsl:if>-->
												<td align="center" style="border:0px" width="40px"/>
												<td style="border:0px; width:40px"/>
												<td align="center" style="border:0px;">
													<xsl:value-of select="dcg:PersonSignature/cat_ru:PersonSurname"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="dcg:PersonSignature/cat_ru:PersonName"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:if test="dcg:PersonSignature/cat_ru:PersonMiddleName">
														<xsl:value-of select="dcg:PersonSignature/cat_ru:PersonMiddleName"/>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<!--<xsl:if test="dcg:PersonSignature/cat_ru:PersonPost">-->
												<td class="spec_column" style="min-width: 40px" align="center">(Должность)</td>
												<td style="border:0px;"/>
												<!--</xsl:if>-->
												<xsl:if test="dcg:PersonSignature/cat_ru:IssueDate">
													<td class="spec_column" style="min-width: 40px" align="center">(Подпись)</td>
													<td style="border:0px;"/>
												</xsl:if>
												<td class="spec_column" align="center">(Ф.И.О.)</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="page1">
					<h3 align="center">ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</h3>
					<br/>
						<table width="100%">
							<tbody>
								<tr>
									<td width="50%">Тип решения</td>
									<td width="50%" class="bordered">
										<xsl:choose>
											<xsl:when test="dcg:DecisionType=1">принято решение по классификации, в результате которого код ТН ВЭД ЕАЭС, первоначально заявленный в графе 33 ДТ, заменен одним кодом ТН ВЭД ЕАЭС</xsl:when>
											<xsl:when test="dcg:DecisionType=2">принято решение по классификации, в результате которого код ТН ВЭД ЕАЭС, первоначально заявленный в графе 33 ДТ, заменен (разбит) на несколько кодов ТН ВЭД ЕАЭС</xsl:when>
											<xsl:when test="dcg:DecisionType=3">принято решение по классификации, в результате которого коды ТН ВЭД ЕАЭС, первоначально заявленные в графе 33 ДТ, заменены на один код ТН ВЭД ЕАЭС</xsl:when>
											<xsl:otherwise><xsl:value-of select="dcg:DecisionType"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td>Код товара в соответствии с классификатором дополнительной таможенной информации</td>
									<td class="bordered"><xsl:value-of select="dcg:GoodsAddTNVEDCode"/></td>
								</tr>
								<tr>
									<td>Этап, на котором принято решение</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="dcg:ProcState=0">до выпуска ДТ (в том числе при проведении доп. проверки)</xsl:when>
											<xsl:when test="dcg:ProcState=1">после выпуска в порядке ведомственного контроля</xsl:when>
											<xsl:when test="dcg:ProcState=2">в случае проведения проверки в соответствии со статьей 122 ТК ТС</xsl:when>
											<xsl:otherwise><xsl:value-of select="dcg:ProcState"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td>Код основания для принятия решения</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="dcg:ReasonCode=1">в порядке ведомственного контроля</xsl:when>
											<xsl:when test="dcg:ReasonCode=2">в результате применения профиля риска (на основании полученного экспертного заключения)</xsl:when>
											<xsl:when test="dcg:ReasonCode=3">на основании поручения вышестоящих таможенных органов</xsl:when>
											<xsl:when test="dcg:ReasonCode=4">в связи с отсутствием при выпуске товара документов, выданных ФОИВ</xsl:when>
											<xsl:when test="dcg:ReasonCode=5">в связи с представлением декларантом после выпуска товаров документов, выданных ФОИВ, либо обращением декларанта о смене кода товаров (ТН&#160;ВЭД ЕАЭС 8701-8705)</xsl:when>
											<xsl:when test="dcg:ReasonCode=6">на основании дополнительно запрошенных товаросопроводительных, коммерческих, технических документов </xsl:when>
											<xsl:when test="dcg:ReasonCode=7">в результате применения профиля риска (за исключением экспертного заключения)</xsl:when>
											<xsl:when test="dcg:ReasonCode=8">прочие основания</xsl:when>
											<xsl:otherwise><xsl:value-of select="dcg:ReasonCode"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<xsl:if test="dcg:ReasonDesc">
									<tr>
										<td>Описание основания для принятия решения</td>
										<td class="bordered">
											<xsl:value-of select="dcg:ReasonDesc"/>
										</td>
									</tr>
								</xsl:if>
								<!--tr>
									<td>Код основания для признания неправомерным (отмены) решения</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="dcg:ReasonRejectCode=1">по решению суда, вступившему в законную силу</xsl:when>
											<xsl:when test="dcg:ReasonRejectCode=2">по обжалованию</xsl:when>
											<xsl:when test="dcg:ReasonRejectCode=3">в порядке ведомственного контроля</xsl:when>
											<xsl:when test="dcg:ReasonRejectCode=4">прочие основания</xsl:when>
											<xsl:when test="dcg:ReasonRejectCode=5">в результате проведения проверки в соответствии со статьей 122 ТК ТС</xsl:when>
											<xsl:otherwise><xsl:value-of select="dcg:ReasonRejectCode"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr-->
ReasonDesc
								<tr>
									<td>Ответственное лицо</td>
									<td class="bordered">
										<xsl:for-each select="dcg:Person/*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>Идентификатор процедуры декларирования</td>
									<td class="bordered">
										<xsl:value-of select="dcg:ProcedureID"/>
									</td>
								</tr>
								<tr>
									<td>Код таможенной процедуры</td>
									<td class="bordered">
										<xsl:value-of select="dcg:CustomsModeCode"/>
									</td>
								</tr>
								<tr>
									<td>Сведения о предварительном решении по классификации товара по ТН ВЭД ЕАЭС</td>
									<td class="bordered">
										<xsl:for-each select="dcg:PreliminaryTNVED/*">
											<xsl:choose>
												<xsl:when test="contains(local-name(.),'Date')">
													<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>Информационно-аналитическая справка</td>
									<td class="bordered">
										<xsl:for-each select="dcg:AnalyticRef/*">
											<xsl:choose>
												<xsl:when test="contains(local-name(.),'Date')">
													<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
												</xsl:when>
												<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
											</xsl:choose>
											<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>Признак использования информации из КПС «Тарифы-Библиотека»</td>
									<td class="bordered">
										<xsl:choose>
											<xsl:when test="dcg:libraryUse='true' or dcg:libraryUse=1">Да</xsl:when>
											<xsl:when test="dcg:libraryUse='false' or dcg:libraryUse=0">Нет</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td colspan="2"><div class="marg-top">Номер профиля риска</div></td>
								</tr>
								<tr>
									<td colspan="2">
										<table class="border" width="100%" style="border-collapse:collapse;">
											<tr align="center">
												<td class="border">Код вида ПР</td>
												<td class="border">Код ТО</td>
												<td class="border">Дата регистрации ПР</td>
												<td class="border">Порядковый номер ПР</td>
												<td class="border">Порядковый номе версии ПР</td>
											</tr>
											<xsl:for-each select="dcg:RiskProfile">
												<tr align="center">
													<td class="border"><xsl:value-of select="dcg:RiskProfileKind"/></td>
													<td class="border"><xsl:value-of select="dcg:CustomsCode"/></td>
													<td class="border">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="dcg:RegistryDate"/>
														</xsl:call-template>
													</td>
													<td class="border"><xsl:value-of select="dcg:SequenceNumber"/></td>
													<td class="border"><xsl:value-of select="dcg:RiskProfileNumberVersion"/></td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="2"><div class="marg-top">Подробное описание товара</div></td>
								</tr>
								<xsl:for-each select="dcg:Goods">
									<tr>
										<td>Наименование товара</td>
										<td class="bordered">
											<xsl:for-each select="dcg:GoodDescription"><xsl:value-of select="."/></xsl:for-each>
										</td>
									</tr>
									<tr>
										<td>Признак принятия решения в отношении части товара</td>
										<td class="bordered">
											<xsl:choose>
												<xsl:when test="dcg:IsPartialGood=1 or dcg:IsPartialGood='true'">есть</xsl:when>
												<xsl:otherwise>нет</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td>Признак принадлежности к товарам списка</td>
										<td class="bordered">
											<xsl:choose>
												<xsl:when test="dcg:GoodsClassificationCode=1 or dcg:GoodsClassificationCode='true'">есть</xsl:when>
												<xsl:when test="dcg:GoodsClassificationCode=0 or dcg:GoodsClassificationCode='false'">нет</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td>Дополнительная информация для идентификации товара</td>
										<td class="bordered">
											<xsl:for-each select="dcg:AdditionalInformation"><xsl:value-of select="."/></xsl:for-each>
										</td>
									</tr>
									<xsl:if test="dcg:GoodsInformation">
										<tr>
											<td colspan="2"><br/>Характеристика товара</td>
										</tr>
										<tr>
											<td colspan="2">
												<table class="border" width="100%" style="border-collapse:collapse;">
													<tr align="center">
														<td class="graphMain bordered">№ п/п записи в группе</td>
														<td class="border">Сведения о производителе</td>
														<td class="border">Тов. знак, место происхождения, объект авторского права, смежных прав, патент и т.д.</td>
														<td class="border">Марка товара</td>
														<td class="border">Модель товара</td>
														<td class="border">Артикул товара</td>
														<td class="border">Стандарт (ГОСТ, ОСТ, СПП, СТО, ТУ)</td>
														<td class="border">Сорт / Сорт или группа сортов (для лесо- и пиломатериалов)</td>
														<td class="border">Сведения о лесоматериалах</td>
														<td class="border">Размеры</td>
														<td class="border">Дата выпуска</td>
														<td class="border">Серийный номер</td>
														<td class="border">Количество товаров. Гр.31 первый подраздел</td>
														<td class="bordered">Цена/стоимость товарной позиции</td>
														<td class="border">Разрешительный документ</td>
													</tr>
													<xsl:for-each select="dcg:GoodsInformation">
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</table>	
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="dcg:Numeric_TNVEDCode">
										<tr>
											<td colspan="2"><br/>Сведения о номере товара по ДТ и заявленном коде товара по ТН ВЭД ЕАЭС</td>
										</tr>
										<tr>
											<td colspan="2">
												<table class="border" width="100%" style="border-collapse:collapse;">
													<tr align="center">
														<td class="border">Номер товара по ДТ</td>
														<td class="border">Код товара по ТН ВЭД ЕАЭС, заявленный в ДТ</td>
														<td class="border">Код товара в соответствии с классификатором дополнительной таможенной информации</td>
													</tr>
													<xsl:for-each select="dcg:Numeric_TNVEDCode">
														<tr align="center">
															<td class="border"><xsl:value-of select="dcg:GoodsNumeric"/></td>
															<td class="border"><xsl:value-of select="dcg:TNVEDCode"/></td>
															<td class="border"><xsl:value-of select="dcg:GoodsAddTNVEDCode"/></td>
														</tr>
													</xsl:for-each>
												</table>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:GoodsGroupInformationType -->
	<xsl:template match="dcg:GoodsInformation">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:LineNum"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:Manufacturer"/>
				<xsl:if test="catESAD_cu:ProductionPlaceName and catESAD_cu:Manufacturer">
					<xsl:text>; </xsl:text>
				</xsl:if>
				<xsl:if test="catESAD_cu:ProductionPlaceName">
					<xsl:text>место происхождения: </xsl:text>
					<xsl:value-of select="catESAD_cu:ProductionPlaceName"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:TradeMark"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsMark"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsModel"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsMarking"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsStandard"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="catESAD_cu:GoodsSort"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates mode="WoodDescriptionDetails" select="catESAD_cu:WoodDescriptionDetails"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates mode="Dimensions" select="catESAD_cu:Dimensions"/>
			</td>
			<td class="graphMain bordered">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="catESAD_cu:DateIssue"/>
				</xsl:call-template>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="catESAD_cu:SerialNumber">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()"> </xsl:if>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="catESAD_cu:GoodsGroupQuantity">
					<xsl:apply-templates select="catESAD_cu:GoodsGroupQuantity"/>
				</xsl:if>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(catESAD_cu:InvoicedCost, '.', ',')"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="catESAD_cu:LicenseGroup">
					<xsl:apply-templates select="."/>
					<xsl:if test="position()!=last()">; </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="catESAD_cu:LicDocument">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="catESAD_cu:GoodsGroupQuantity">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:Address">
		<span class="graph">Адрес:</span>
		<xsl:if test="cat_ru:PostalCode">
			<br/>
			<xsl:value-of select="cat_ru:PostalCode"/>
		</xsl:if>
	&#160;
	<xsl:if test="cat_ru:CounryName">
			<xsl:value-of select="cat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="cat_ru:Region">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="cat_ru:Region"/>
		</xsl:if>
		<xsl:if test="cat_ru:City">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
			<xsl:value-of select="cat_ru:City"/>
		</xsl:if>
		<xsl:if test="cat_ru:StreetHouse">
			<xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
			<xsl:value-of select="cat_ru:StreetHouse"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="graph">Документ, удостоверяющий личность:</span>
		<br/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
			Серия номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:WoodDescriptionDetailsType -->
	<xsl:template  mode="WoodDescriptionDetails" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
				<xsl:if test="local-name()='WoodSortiment'">
					<xsl:text>Наим.сортимента: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='WoodKind'">
					<xsl:text>Порода древесины: </xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='ProductSortName'">
					<xsl:text>Наименование сорта:</xsl:text>
					<xsl:value-of select="."/>
				</xsl:if>
				<xsl:if test="local-name()='AllowanceDetails'">
					<xsl:text>Припуск по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='DeviationDetails'">
					<xsl:text>Отклонения по длине, ширине, высоте: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='catESAD_cu:DiameterRangeDetails'">
					<xsl:text>Диапазон диаметров: </xsl:text>
					<xsl:apply-templates mode="Dimensions" select=".">
						<xsl:with-param name="separator" select="'-'"/>
					</xsl:apply-templates>
				</xsl:if>
				<xsl:if test="local-name()='ContractVolumeMeasure'">
					<xsl:text> Объем товара в соответствии с контрактом: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
				<xsl:if test="local-name()='FactVolumeMeasure'">
					<xsl:text> Фактический объем товара: </xsl:text>
					<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
				</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:DimensionType и catESAD_cu:RangeMeasureType-->
	<xsl:template mode="Dimensions" match="*">
		<xsl:param name="separator" select="'x'"/>
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="$separator"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			</xsl:if>
			<xsl:apply-templates mode="SupplementaryQuantity" select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа cat_cu:SupplementaryQuantityType и catESAD_cu:UnifiedPhysicalMeasureType-->
	<xsl:template mode="SupplementaryQuantity" match="*">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></xsl:if>
			<xsl:choose>
				<xsl:when test="local-name()='MeasureUnitQualifierCode'">
					<xsl:text>(</xsl:text><xsl:value-of select="."/><xsl:text>)</xsl:text>
				</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="dcg:RegNumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
