<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exr="urn:customs.ru:Information:CustomsDocuments:ExpertiseResult:5.13.1" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpertiseResultType -->
	<xsl:template match="exr:ExpertiseResult">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									/*font-family: Courier New;*/
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
									
									.underlined {
									border-bottom: solid 1px;
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
									div.page {
										border: solid 1pt #ffffff;
									}
								</style>
			</head>
			<body>
				<xsl:if test="exr:SolutionInfo/exr:ExpertisePostControl">
					<div class="page">
						<table class="w190">
							<tbody>
								<tr>
									<th>
										<font size="4">СВЕДЕНИЯ</font>
										<br/>по результатам проведенной экспертизы<br/>
										<br/>
									</th>
								</tr>
							</tbody>
						</table>
						<table class="w190">
							<tbody>
								<tr>
									<td width="49%" align="left" valign="top" class="underlined">Таможенный орган<br/></td>
									<td width="2%"/>
									<td width="49%" align="left" valign="top" class="underlined">Наименование таможенного органа или иной уполномоченной организации, проводившего(ей) таможенную экспертизу<br/></td>
								</tr>
								<tr>
									<td class="underlined" width="49%" align="left" valign="bottom">
										<xsl:value-of select="exr:InitiatorDecision/cat_ru:OfficeName"/>
									</td>
									<td width="2%"/>
									<td class="underlined" width="49%" align="left" valign="bottom">
										<xsl:value-of select="exr:CEKTUDivision/cat_ru:OfficeName"/>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										<br/>
										<br/>По результатам таможенной экспертизы от 					
									<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="exr:ExpertiseDate"/>
										</xsl:call-template> г., № <xsl:apply-templates select="exr:ExpertiseNumber"/>,
								</td>
								</tr>
								<tr>
									<td>проведенной при таможенном контроле № <xsl:value-of select="exr:SolutionInfo/exr:ExpertisePostControl/exr:TKNumber"/> ДТ <xsl:apply-templates select="exr:SolutionInfo/exr:ExpertisePostControl/exr:GTDNumber"/>,
									<xsl:if test="exr:SolutionInfo/exr:ExpertisePostControl/exr:CriminalCaseAPNumber">
											<br/>
										дела об административном правонарушении <xsl:apply-templates select="exr:SolutionInfo/exr:ExpertisePostControl/exr:CriminalCaseAPNumber/exr:DeloNumber"/>,
									</xsl:if>
										<xsl:if test="exr:SolutionInfo/exr:ExpertisePostControl/exr:CriminalCaseNumber">
											<br/>
										дела об уголовном правонарушении <xsl:apply-templates select="exr:SolutionInfo/exr:ExpertisePostControl/exr:CriminalCaseNumber/exr:DeloNumber"/>,
									</xsl:if>
										<xsl:if test="exr:SolutionInfo/exr:ExpertisePostControl/exr:Other">
											<br/>
										другие случаи <xsl:apply-templates select="exr:SolutionInfo/exr:ExpertisePostControl/exr:Other/exr:DeloNumber"/>
										</xsl:if>
										<br/>
									в отношении товара принято решение <xsl:value-of select="exr:SolutionInfo/exr:ExpertisePostControl/exr:Decision/exr:DeloNumber"/>
									</td>
								</tr>
								<!--xsl:for-each select="exr:Decision">
								<xsl:apply-templates select="."/>
							</xsl:for-each-->
							</tbody>
						</table>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										<br/>1. Полученный экономический эффект составил:</td>
								</tr>
								<tr>
									<td>1.1. Дополнительно начислено:</td>
								</tr>
								<tr>
									<xsl:apply-templates select="exr:SolutionInfo/exr:ExpertisePostControl/exr:ReceivedEconomicEffect"/>
								</tr>
								<tr>
									<td> 
										<table class="w190">
											<tr>
												<td class="annot graphMain" style="width:50%">1.2. Конфисковано товаров на сумму:</td>
												<td class="value graphMain" style="width:50%">
													<xsl:value-of select="exr:SolutionInfo/exr:ExpertisePostControl/exr:ReceivedEconomicEffect/exr:ConfiscatedGoods"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="w190">
							<tbody>
								<tr>
									<td>
										<br/>2. Условный экономический эффект составил:</td>
								</tr>
								<tr>
									<xsl:apply-templates select="exr:SolutionInfo/exr:ExpertisePostControl/exr:ConditionalEconomicEffect"/>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td>
										<br/>
										<br/>
										<xsl:apply-templates select="exr:InspectorInfo"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO">
					<div class="page">
						<table class="w190">
							<tbody>
								<tr>
									<td colspan="2" style="border:1px solid;" align="center">
										<b>Сведения по результатам проведенной(ого) таможенной экспертизы (исследования)</b>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid; width:50%">Наименование таможенного органа, назначившего таможенную экспертизу (направившего запрос о проведении исследования)</td>
									<td style="border:1px solid; width:50%">Наименование таможенного органа, проводившего таможенную экспертизу (исследование) (его регионального филиала)</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid; width:50%">
										<xsl:value-of select="exr:InitiatorDecision/cat_ru:OfficeName"/>
									</td>
									<td style="border:1px solid; width:50%">
										<xsl:value-of select="exr:CEKTUDivision/cat_ru:OfficeName"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid; width:50%">По результатам таможенной экспертизы (исследования)</td>
									<td style="border:1px solid; width:50%">
										<xsl:text>от </xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="exr:ExpertiseDate"/>
										</xsl:call-template>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="exr:ExpertiseNumber"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid; width:50%">Проведенной(ого) при таможенном контроле № ДТ</td>
									<td style="border:1px solid; width:50%">
										<xsl:apply-templates select="exr:SolutionInfo/exr:ExpertiseSTO/exr:PresentedDocuments/exr:GTDNumber"/>
										<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:PresentedDocuments/exr:Document">
											<br/>
											<xsl:for-each select="exr:SolutionInfo/exr:ExpertiseSTO/exr:PresentedDocuments/exr:Document">
												<xsl:for-each select="./*">
													<xsl:choose>
														<xsl:when test="local-name(.)='PrDocumentDate'">
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="."/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="."/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:if test="position()!=last()">
														<xsl:text> </xsl:text>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</xsl:if>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;font-size:9pt;" colspan="2" align="center">(и/или указывается наименование иного документа и его реквизиты (книжка МДП, транспортные (перевозочные) документы), коммерческие документы и прочие документы таможенного контроля)</td>
								</tr>
								<tr>
									<td style="border:1px solid;" colspan="2">
										<table width="100%">
											<tbody>
												<tr valign="top">
													<td style="border-right:1px solid;" width="20%" align="center">В отношении товара (объекта)</td>
													<td>
														<xsl:apply-templates select="exr:SolutionInfo/exr:ExpertiseSTO/exr:GoodsDescription"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td style="border:1px solid;" colspan="2">
										<table width="100%">
											<tbody>
												<tr valign="top">
													<td style="border-right:1px solid;" width="80%">Дата принятия решения должностным лицом таможенного органа на основании заключения таможенного эксперта (заключения по результатам исследования)</td>
													<td>
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="exr:SolutionInfo/exr:ExpertiseSTO/exr:DecisionDate"/>
														</xsl:call-template>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td style="border:1px solid;" colspan="2">
										<table width="100%">
											<tbody>
												<tr>
													<td style="border-right:1px solid;" width="80%">Решение принято с использованием результатов проведенной(ого) таможенной экспертизы (исследования) (нужное отметить)</td>
													<td style="border-right:1px solid;" width="5%" align="center">да</td>
													<td style="border-right:1px solid;" width="5%" align="center">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:UseExpertSummarry='1' or exr:SolutionInfo/exr:ExpertiseSTO/exr:UseExpertSummarry='true' or exr:SolutionInfo/exr:ExpertiseSTO/exr:UseExpertSummarry='t'">X</xsl:if>
													</td>
													<td style="border-right:1px solid;" width="5%" align="center">нет</td>
													<td width="5%" align="center">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:UseExpertSummarry='0' or exr:SolutionInfo/exr:ExpertiseSTO/exr:UseExpertSummarry='false' or exr:SolutionInfo/exr:ExpertiseSTO/exr:UseExpertSummarry='f'">X</xsl:if>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td style="border:1px solid;" colspan="2">
										<table width="100%">
											<tbody>
												<tr valign="top">
													<td style="border-right:1px solid;" width="25%" rowspan="8" align="center">Принято решение<br/>(нужное отметить)</td>
													<td style="border-right:1px solid;border-bottom:1px solid;" width="5%" align="center">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:GoodsClassification">x</xsl:if>
													</td>
													<td style="border-bottom:1px solid;">Классификация товара по коду ТН ВЭД ЕАЭС:</td>
												</tr>
												<tr>
													<td colspan="2" style="border-bottom:1px solid;">
														<xsl:text>присвоенный код товара </xsl:text>
														<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:GoodsClassification/exr:RatedTNVED"/>
														<xsl:text> № РКТ </xsl:text>
														<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:GoodsClassification/exr:RKTNumber"/>
													</td>
												</tr>
												<tr>
													<td style="border-right:1px solid;border-bottom:1px solid;" align="center">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:RefusalTariffPreferences='1' or exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:RefusalTariffPreferences='true'">x</xsl:if>
													</td>
													<td style="border-bottom:1px solid;">Отказ в предоставлении тарифных преференций
													</td>
												</tr>
												<tr>
													<td style="border-right:1px solid;border-bottom:1px solid;" align="center">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:CompletionCustomsProcedure='1' or exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:CompletionCustomsProcedure='true'">x</xsl:if>
													</td>
													<td style="border-bottom:1px solid;">Завершить таможенную процедуру
													</td>
												</tr>
												<tr>
													<td style="border-right:1px solid;border-bottom:1px solid;" align="center">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:RefusalGoodsRelease='1' or exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:RefusalGoodsRelease='true'">x</xsl:if>
													</td>
													<td style="border-bottom:1px solid;">Отказ в выпуске товаров
													</td>
												</tr>
												<tr>
													<td style="border-right:1px solid;border-bottom:1px solid;" align="center">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:CriminalCaseAP">x</xsl:if>
													</td>
													<td style="border-bottom:1px solid;">Возбуждено дело об АП: 
														<xsl:apply-templates select="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:CriminalCaseAP"/>
													</td>
												</tr>
												<tr>
													<td style="border-right:1px solid;border-bottom:1px solid;" align="center" valign="middle">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:CriminalCase">x</xsl:if>
													</td>
													<td style="border-bottom:1px solid;">Возбуждено УД: 
														<xsl:apply-templates select="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:CriminalCase"/>
													</td>
												</tr>
												<tr>
													<td style="border-right:1px solid;" align="center" valign="middle">
														<xsl:if test="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:Solution">x</xsl:if>
													</td>
													<td>Иное решение (указать): 
														<xsl:apply-templates select="exr:SolutionInfo/exr:ExpertiseSTO/exr:Decision/exr:Solution"/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										1. Полученный экономический эффект составил:
									</td>
									<td style="border:1px solid;"/>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										таможенных пошлин
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ReceivedEconomicEffect/exr:CustomsDuty"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										налога на добавленную стоимость
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ReceivedEconomicEffect/exr:NDS"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										акцизов
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ReceivedEconomicEffect/exr:Excise"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										штрафов
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ReceivedEconomicEffect/exr:Fines"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										2. Условный экономический эффект
									</td>
									<td style="border:1px solid;"></td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										2.1. Вес наркотических средств (по каждому виду)
									</td>
									<td style="border:1px solid;">
										<xsl:for-each select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ConditionalEconomicEffect/exr:Drugs">
											<xsl:value-of select="exr:DrugsName"/>, <xsl:value-of select="exr:DrugWeight"/>
											<xsl:if test="position()!=last()">; </xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										2.2. Стоимость не допущенных к вывозу товаров с таможенной территории ЕАЭС
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ConditionalEconomicEffect/exr:NotAllowedExportGoods"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										2.3. Стоимость незадекларированных товаров
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ConditionalEconomicEffect/exr:UndeclaredGoods"/>
									</td>
								</tr>
								<tr valign="top">
									<td style="border:1px solid;">
										2.4. Стоимость задержанного товара при пересечении таможенной границы ЕАЭС
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="exr:SolutionInfo/exr:ExpertiseSTO/exr:ConditionalEconomicEffect/exr:SuspendedGoods"/>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="border:1px solid;">
										<table width="100%">
											<tbody>
												<tr valign="top">
													<td style="border-right:1px solid;" rowspan="2" align="center" width="25%">Уполномоченное должностное лицо таможенного органа</td>
													<td style="border-right:1px solid;border-bottom:1px solid;" align="center" width="25%">
														<xsl:value-of select="exr:InspectorInfo/cat_ru:PersonPost"/>
													</td>
													<td style="border-right:1px solid;border-bottom:1px solid;" align="center" width="25%">
														<xsl:value-of select="substring(exr:InspectorInfo/cat_ru:PersonName,1,1)"/>
														<xsl:text>.</xsl:text>
														<xsl:if test="exr:InspectorInfo/cat_ru:PersonMiddleName">
															<xsl:value-of select="substring(exr:InspectorInfo/cat_ru:PersonMiddleName,1,1)"/>
															<xsl:text>.</xsl:text>
														</xsl:if>
														<xsl:text> </xsl:text>
														<xsl:value-of select="exr:InspectorInfo/cat_ru:PersonSurname"/>
													</td>
													<td style="border-bottom:1px solid;" align="center" width="25%"/>
												</tr>
												<tr align="center">
													<td style="border-right:1px solid;">(должность)</td>
													<td style="border-right:1px solid;">(инициалы, фамилия)</td>
													<td>(подпись)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа exr:ConditionalEconomicEffectType -->
	<xsl:template match="exr:ConditionalEconomicEffect">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">2.1. Стоимость изъятых товаров, оборот которых запрещен:</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(exr:WithdrawnGoods, '.', ',')"/>
				</td>
			</tr>
		</table>
		<div class="marg-top">2.2. Вес наркотических средств (по каждому виду)</div>
		<table class="bordered w190">
			<tbody>
				<tr>
					<td class="graphMain bordered">Вид наркотика</td>
					<td class="graphMain bordered">Вес наркотика</td>
				</tr>
				<xsl:for-each select="exr:Drugs">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</tbody>
		</table>
		<div class="marg-top"></div>
		<table class="bordered w190" width="100%">
			<tbody>
				<tr>
					<td class="annot graphMain" width="50%">2.3. Стоимость некачественных и фальсифицированных товаров (по каждому<br/>виду), ввоз (вывоз) которых в (из) Россию запрещен:</td>
					<td class="value graphMain" width="50%">
					<xsl:for-each select="exr:DefectiveGoods">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">; </xsl:if>
					</xsl:for-each>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="w190" width="100%">
			<tr>
				<td class="annot graphMain" style="width:50%">2.4. Стоимость запрещенных (ограниченных) к ввозу/вывозу товаров</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="translate(exr:ProhibitedGoods, '.', ',')"/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- Шаблон для типа exr:DecisionType -->
	<xsl:template match="exr:Decision">
		<tr>
			<td>
				<br/>в отношении товара (объекта) 
				<xsl:for-each select="exr:GoodsDescription">
					<xsl:value-of select="normalize-space(.)"/>
					<xsl:if test="position()!=last()"> </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
		<tr>
			<td>принято решение
				<xsl:value-of select="exr:DecisionNote"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа dce:DecisionNumberType -->
	<xsl:template match="exr:DecisionNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="number_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:choose>
			<xsl:when test="exr:ExpertisePoint=ДВ">
				<xsl:text>до выпуска ДТ</xsl:text>
			</xsl:when>
			<xsl:when test="exr:ExpertisePoint=ПВ">
				<xsl:text>после выпуска ДТ</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="exr:ExpertisePoint"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:SerialNumber"/>
	</xsl:template>
	<!-- Шаблон для типа exr:DefectiveProductType -->
	<xsl:template match="exr:DefectiveProduct">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="exr:DefectiveProductName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(exr:DefectiveProductQuantity, '.', ',')"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа exr:DrugsType -->
	<xsl:template match="exr:Drugs">
		<tr>
			<td class="graphMain bordered">
				<xsl:value-of select="exr:DrugsName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:value-of select="translate(exr:DrugWeight, '.', ',')"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="exr:GTDNumber">
		<xsl:variable name="CustCode" select="cat_ru:CustomsCode"/>
		<xsl:variable name="date">
			<xsl:call-template name="number_date">
				<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="gdtNum" select="cat_ru:GTDNumber"/>
		<xsl:value-of select="concat($CustCode,'/',$date,'/',$gdtNum)"/>
	</xsl:template>
	<!-- Шаблон для типа exr:InitiatorDecisionType -->
	<xsl:template match="exr:InitiatorDecision">
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Код таможенного органа инициатора таможенной экспертизы</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exr:CustomsCode"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Наименование таможенного органа инициатора таможенной экспертизы</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exr:Name"/>
				</td>
			</tr>
		</table>
		<xsl:if test="exr:Address">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес таможенного органа инициатора таможенной экспертизы</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="exr:Address"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа exr:PersonType -->
	<xsl:template match="exr:InspectorInfo">
		<table class="w190">
			<tbody>
				<tr>
					<td width="40%">
						Должностное лицо таможенного органа
						<!--xsl:value-of select="exr:PersonPost"/-->
					</td>
					<td width="29%" class="underlined" align="center">
						<xsl:value-of select="concat(substring(cat_ru:PersonName,1,1),'.',substring(cat_ru:PersonMiddleName,1,1),'. ',cat_ru:PersonSurname)"/>
					</td>
					<td width="2%">
					</td>
					<td width="29%" class="underlined"/>
				</tr>
				<tr>
					<td/>
					<td align="center">(инициалы, фамилия)</td>
					<td/>
					<td align="center">(подпись)</td>
				</tr>
			</tbody>
		</table>
		<!--table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Фамилия</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exr:PersonSurname"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Имя</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exr:PersonName"/>
				</td>
			</tr>
		</table>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">Отчество</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exr:PersonMiddleName"/>
				</td>
			</tr>
		</table>
		<xsl:if test="exr:PersonPost">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="exr:PersonPost"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:50%">ЛНП инспектора</td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="exr:LNP"/>
				</td>
			</tr>
		</table>
		<xsl:if test="exr:Phone">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Номер служебного телефона</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="exr:Phone"/>
					</td>
				</tr>
			</table>
		</xsl:if-->
	</xsl:template>
	<!-- Шаблон для типа exr:PresentedDocumentsType -->
	<xsl:template match="exr:PresentedDocuments">
		<xsl:if test="exr:GTDNumber">
			<div class="title marg-top">Регистрационный номер ДТ.</div>
		</xsl:if>
		<xsl:apply-templates select="exr:GTDNumber"/>
		<xsl:if test="exr:DocumentName">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование документа</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="exr:DocumentName">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа exr:ReceivedEconomicEffectType -->
	<xsl:template match="exr:ReceivedEconomicEffect">
		<xsl:if test="exr:CustomsDuty">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">таможенных пошлин</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(exr:CustomsDuty, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="exr:NDS">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">НДС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(exr:NDS, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="exr:Excise">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">акцизов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(exr:Excise, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="exr:Fines">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">штрафов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(exr:Fines, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="exr:ProceedSum">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">сумм денежных средств, вырученных от реализации товаров, обращенных в федеральную собственность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:value-of select="translate(exr:ProceedSum, '.', ',')"/>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template name="number_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
