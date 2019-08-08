<?xml version="1.0" encoding="utf-8"?>
<!-- Бланк 1, 2 определяется Решением Коллегии Евразийской экономической комиссии от 16.05.2012 № 45 «О единой форме заключения (разрешительного документа) на ввоз, вывоз и транзит отдельных товаров....» -->
<!-- Бланк 3, 4 определяется Постановлением Правительства Российской Федерации от 15.08.2005 № 517 "О порядке получения разрешения Комиссии по экспортному контролю Российской Федерации на осуществление внешнеэкономических операций с товарами, информацией, работами, услугами, результатами интеллектуальной деятельности..."-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.0" xmlns:fscnpr="urn:customs.ru:Information:SQDocuments:FsTekConclPermit:5.13.2">
	<!-- Шаблон для типа FsTekConclPermitType -->
	<xsl:template match="fscnpr:FsTekConclPermit">
		<html>
			<head>
				<meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
				<title>
					<xsl:choose>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=1">Заключение, выдаваемое центрами независимой идентификационной экспертизы</xsl:when>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=2">Заключение, выдаваемое ФСТЭК России</xsl:when>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=3">Разрешение КЭК РФ на экспорт</xsl:when>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=4">Разрешение КЭК РФ на временный вывоз</xsl:when>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=5">Идентификационное заключение, выдаваемое экспертными организациями</xsl:when>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=6">Идентификационное заключение, выдаваемое ФСТЭК России</xsl:when>
						<xsl:otherwise>Заключение (разрешительный документ) на ввоз, вывоз и транзит отдельных товаров</xsl:otherwise>
					</xsl:choose>
				</title>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}
					
					div.page {
					width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}
					
					div.page_album {
					width: 297mm;
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

					@media print {
						div.page {
							border: none;
							padding: 0;
						}
					}
					 .graph12 {
						font-family: Arial, serif, bold;
						font-size: 12pt;}
						
					.graph10 {
						font-family: Arial, serif;
						font-size: 10pt;}

					.graph8 {
						font-family: Arial, serif;
						font-size: 7pt;
						border-top:1px solid;}
		
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
					td.annot{
						font-size:8pt;
						text-align:center;
					}
					.notExport td{
						border:1px solid;
					}
					.underlined {
						border-bottom: solid 1pt #000000;
					}
				</style>
			</head>
			<body>
				<xsl:variable name="attach1_1">
					<xsl:choose>
						<xsl:when test="//fscnpr:GoodsDescription/fscnpr:GoodsCategoryCode or //fscnpr:GoodsDescription/fscnpr:ActEconomicSteps or //fscnpr:GoodsDescription/fscnpr:ConslusionsListItems or //fscnpr:GoodsDescription/fscnpr:Conslusions or //fscnpr:GoodsDescription/fscnpr:ConslusionsDocument 
												or //fscnpr:GoodsDescription/fscnpr:FlagEconomicSteps=1 or //fscnpr:GoodsDescription/fscnpr:FlagEconomicSteps='true'">
							<xsl:value-of select="1"/>
						</xsl:when>
						<xsl:when test="count(fscnpr:GoodsDescription) &gt; 1 and (fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4)">
							<xsl:value-of select="1"/>
						</xsl:when>
						<xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="attach1_2">
					<xsl:choose>
						<xsl:when test="fscnpr:ObjectsOfExpertExamination"><xsl:value-of select="1"/></xsl:when>
						<xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="attach2_1">
					<xsl:choose>
						<xsl:when test="fscnpr:CheckList_Items or fscnpr:CheckList_Codes or fscnpr:ImpExp or fscnpr:EndUser">
							<xsl:value-of select="1"/>
						</xsl:when>
						<xsl:when test="fscnpr:Expertise and not(fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4)">
							<xsl:value-of select="1"/>
						</xsl:when>
						<xsl:when test="(fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4) and (fscnpr:FlagWeapon!=2 or fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true')">
							<xsl:value-of select="1"/>
						</xsl:when>
						<xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="attach1">
					<xsl:choose>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=5 or fscnpr:Authorization/fscnpr:DocType=6">0</xsl:when>
						<xsl:when test="$attach1_1=1 or $attach1_2=1"><xsl:value-of select="1"/></xsl:when>
						<xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="attach2">
					<xsl:choose>
						<xsl:when test="fscnpr:Authorization/fscnpr:DocType=5 or fscnpr:Authorization/fscnpr:DocType=6">0</xsl:when>
						<xsl:when test="fscnpr:ReleaseOrg/RUScat_ru:Address or //fscnpr:Contact or //fscnpr:IdentityCard or fscnpr:NoticeOfCancellation or fscnpr:NoticeOfSuspension  or fscnpr:NoticeOfResume"><xsl:value-of select="1"/></xsl:when>
						<xsl:when test="$attach2_1+$attach1=1"><xsl:value-of select="1"/></xsl:when>
						<xsl:otherwise><xsl:value-of select="0"/></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="fscnpr:Authorization/fscnpr:DocType=5 or fscnpr:Authorization/fscnpr:DocType=6">
						<div class="page">
							<table width="100%">
								<tbody>
									<tr>
										<td align="center" class="graph12">ИДЕНТИФИКАЦИОННОЕ ЗАКЛЮЧЕНИЕ<br/>№ <span style="border-bottom:1px solid;"><xsl:value-of select="fscnpr:Authorization/cat_ru:PrDocumentNumber"/></span></td>
									</tr>
								</tbody>
							</table>
							<br/>
							<table width="100%">
								<tbody>
									<tr>
										<td>
											1. Составитель заключения
											<span class="underlined">
												<xsl:choose>
													<xsl:when test="fscnpr:ReleaseOrg/RUScat_ru:OrganizationName">
														<xsl:apply-templates select="fscnpr:ReleaseOrg/RUScat_ru:OrganizationName"/>
													</xsl:when>
													<xsl:when test="fscnpr:ReleaseOrg/RUScat_ru:ShortName">
														<xsl:value-of select="fscnpr:ReleaseOrg/RUScat_ru:ShortName"/>
													</xsl:when>
													<xsl:when test="fscnpr:Authorization/fscnpr:DocType='6'">ФСТЭК России</xsl:when>
													<xsl:when test="fscnpr:Authorization/fscnpr:DocType='5'">Экспертная организация</xsl:when>
													<xsl:otherwise>---</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</tr>
									<tr>
										<td><br/>
											2. Сведения о внешнеэкономической операции 
											<span class="underlined">
												<xsl:choose>
													<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod='0'">на вывоз из РФ</xsl:when>
													<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod='1'">на временный вывоз из РФ</xsl:when>
													<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod='2'">на ввоз в РФ</xsl:when>
													<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod='3'">на временный ввоз в РФ</xsl:when>
													<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod='4'">на вывоз из РФ - ввоз в РФ</xsl:when>
													<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod='5'">на передачу технических данных</xsl:when>
													<xsl:otherwise>на временный вывоз из РФ</xsl:otherwise>
												</xsl:choose>
												<xsl:text> </xsl:text>
												<xsl:value-of select="fscnpr:Authorization/fscnpr:Opt_Note"/>
											</span>
										</td>
									</tr>
									<tr>
										<td>
											2.1. Документ, на основании которого осуществляется внешнеэкономическая операция 
											<span class="underlined">
												<xsl:for-each select="fscnpr:Contract">
													<xsl:apply-templates select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</span>
										</td>
									</tr>
									<tr>
										<td>
											2.2. Страна 
											<xsl:text> </xsl:text>
											<xsl:choose>
												<xsl:when test="fscnpr:DestinationCountryType=1 or fscnpr:DestinationCountryType='true'">отправления</xsl:when>
												<xsl:otherwise>назначения</xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<span class="underlined">
												<!--xsl:if test="fscnpr:CountryListPriznak='0'"> на территории всех стран</xsl:if>
												<xsl:if test="fscnpr:CountryListPriznak='1'"> на территории всех стран, кроме санкционных</xsl:if>
												<xsl:if test="(fscnpr:CountryListPriznak='2' or not(fscnpr:CountryListPriznak)) and fscnpr:DestinationCountry"
													<xsl:text> на территории </xsl:text>--><xsl:apply-templates select="fscnpr:DestinationCountry"/>
												<!--/xsl:if>
												<xsl:if test="fscnpr:CountryListPriznak='3'">
													<xsl:text> на территории стран, кроме </xsl:text><xsl:apply-templates select="fscnpr:DestinationCountry"/>
												</xsl:if>
												<xsl:if test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
													<xsl:text> (применяются специальные экономические меры, установленные нормативным правовым актом</xsl:text>
													<xsl:apply-templates select="fscnpr:ActEconomicSteps"/>
													<xsl:text>)</xsl:text>
												</xsl:if-->
											</span>
										</td>
									</tr>
									<tr>
										<td>
											2.3. Российский участник внешнеэкономической операции
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:apply-templates select="fscnpr:Applicant" mode="shortReq"/>
											</span>
										</td>
									</tr>
									<tr>
										<td>
											2.4 Иностранные участники внешнеэкономической операции
										</td>
									</tr>
									<tr>
										<td>
											2.4.1. Покупатель (продавец)
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:apply-templates select="fscnpr:Consignee" mode="shortReq"/>
											</span>
										</td>
									</tr>
									<tr>
										<td>
											2.4.2. Потребитель (конечный потребитель)
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:apply-templates select="fscnpr:EndUser" mode="shortReq"/>
											</span>
										</td>
									</tr>
									<tr>
										<td><br/>
											3. Сведения об идентифицируемых товарах и идентифицируемых продуктах научно-технической деятельности
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" class="bordered">
												<tbody>
													<tr align="center">
														<td class="bordered">№ объекта</td>
														<td class="bordered">Наименование</td>
														<td class="bordered">Код ТН ВЭД ЕАЭС</td>
														<td class="bordered">Описание</td>
													</tr>
<!--
													<xsl:for-each select="fscnpr:ObjectsOfExpertExamination">
														<tr valign="top">
															<td class="bordered" align="center"><xsl:value-of select="fscnpr:ProdObjectNumeric"/></td>
															<td class="bordered" align="left"><xsl:apply-templates select="fscnpr:ProdDescription"/></td>
															<td class="bordered" align="center"><xsl:value-of select="fscnpr:GoodsNomenclatureCode"/></td>
															<td class="bordered" align="left"><xsl:apply-templates select="fscnpr:BriefSpecifications"/></td>
														</tr>
													</xsl:for-each>
-->
													<xsl:for-each select="fscnpr:GoodsDescription">
														<tr valign="top">
															<td class="bordered" align="center"><xsl:value-of select="fscnpr:Number"/></td>
															<td class="bordered" align="left"><xsl:apply-templates select="fscnpr:GoodsDescription"/></td>
															<td class="bordered" align="center"><xsl:value-of select="fscnpr:GoodsNomenclatureCode"/></td>
															<td class="bordered" align="left"><xsl:apply-templates select="fscnpr:GoodsDescription"/></td>
														</tr>
													</xsl:for-each>

												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td><br/>
											4. Установление соответствия идентифицируемых товаров и идентифицируемых продуктов научно-технической деятельности товарам и технологиям, включенным в контрольные списки
										</td>
									</tr>
									<tr>
										<td>
											4.1. Позиции (пункты) контрольных списков, выбранные для сравнительного анализа
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" class="bordered">
												<tbody>
													<tr align="center">
														<td class="bordered">№ объекта</td>
														<td class="bordered">Номер позиции (пункта)</td>
														<td class="bordered">Номер раздела</td>
														<td class="bordered">Наименование списка</td>
													</tr>
													<xsl:for-each select="fscnpr:GoodsDescription">
														<xsl:variable name="rowspan" select="count(fscnpr:ConslusionsListItems)"/>
														<tr valign="top">
															<td rowspan="{$rowspan}" class="bordered" align="center">
																<xsl:value-of select="fscnpr:Number"/>
															</td>
															<xsl:choose>
																<xsl:when test="$rowspan = 0">
																	<td class="bordered"/>
																	<td class="bordered"/>
																	<td class="bordered"/>
																</xsl:when>
																<xsl:otherwise>
																	<td class="bordered"><xsl:value-of select="fscnpr:ConslusionsListItems[1]/fscnpr:NumberItem"/></td>
																	<td class="bordered"><xsl:value-of select="fscnpr:ConslusionsListItems[1]/fscnpr:NumberSection"/></td>
																	<td class="bordered"><xsl:value-of select="fscnpr:ConslusionsListItems[1]/fscnpr:CodeConslusionsList"/></td>
																</xsl:otherwise>
															</xsl:choose>
														</tr>
														<xsl:for-each select="fscnpr:ConslusionsListItems[position() &gt; 1]">
															<tr valign="top">
																<td class="bordered"><xsl:value-of select="fscnpr:NumberItem"/></td>
																<td class="bordered"><xsl:value-of select="fscnpr:NumberSection"/></td>
																<td class="bordered"><xsl:value-of select="fscnpr:CodeConslusionsList"/></td>
															</tr>
														</xsl:for-each>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											4.2. Результаты сравнительного анализа
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" class="bordered">
												<tbody>
													<tr align="center">
														<td class="bordered">№ объекта</td>
														<td class="bordered">Характеристики объекта</td>
														<td class="bordered">Описание позиции (пункта)</td>
														<td class="bordered">Выводы</td>
													</tr>
													<xsl:for-each select="fscnpr:GoodsDescription">
														<tr valign="top">
															<td class="bordered" align="center"><xsl:value-of select="fscnpr:Number"/></td>
															<td class="bordered"><xsl:apply-templates select="fscnpr:Conslusions/fscnpr:ProductDetail"/></td>
															<td class="bordered"><xsl:apply-templates select="fscnpr:Conslusions/fscnpr:ConslusionsDescription"/></td>
															<td class="bordered">
																<xsl:choose>
																	<xsl:when test="fscnpr:Conslusions/fscnpr:Decision=0 or fscnpr:Conslusions/fscnpr:Decision='false'">не соответствует контролируемым товарам<br/></xsl:when>
																	<xsl:when test="fscnpr:Conslusions/fscnpr:Decision=1 or fscnpr:Conslusions/fscnpr:Decision='true'">соответствует контролируемым товарам<br/></xsl:when>
																</xsl:choose>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td><br/>
											5. Определение действующих в отношении идентифицируемых товаров и идентифицируемых продуктов научно-технической деятельности запретов и ограничений внешнеэкономической деятельности.
										</td>
									</tr>
									<tr>
										<td>
											5.1. Применение специальных экономических мер:
										</td>
									</tr>
									<tr>
										<td>
											а) в отношении страны
											<xsl:choose>
												<xsl:when test="fscnpr:DestinationCountryType=1 or fscnpr:DestinationCountryType='true'"> отправления</xsl:when>
												<xsl:otherwise> назначения</xsl:otherwise>
											</xsl:choose>
											<xsl:text> </xsl:text>
											<span class="underlined">
												<!--xsl:if test="fscnpr:CountryListPriznak='0'"> на территории всех стран</xsl:if>
												<xsl:if test="fscnpr:CountryListPriznak='1'"> на территории всех стран, кроме санкционных</xsl:if>
												<xsl:if test="(fscnpr:CountryListPriznak='2' or not(fscnpr:CountryListPriznak)) and fscnpr:DestinationCountry">
													<xsl:text> на территории </xsl:text><xsl:apply-templates select="fscnpr:DestinationCountry"/>
												</xsl:if>
												<xsl:if test="fscnpr:CountryListPriznak='3'">
													<xsl:text> на территории стран, кроме </xsl:text><xsl:apply-templates select="fscnpr:DestinationCountry"/>
												</xsl:if-->
												<xsl:choose>
													<xsl:when test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
														<xsl:text> применяются специальные экономические меры, установленные нормативным правовым актом </xsl:text>
														<xsl:apply-templates select="fscnpr:ActEconomicSteps"/>
														<!--xsl:text>)</xsl:text-->
													</xsl:when>
													<xsl:otherwise>
														<xsl:text> не применяются</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</span>
											;
										</td>
									</tr>
									<tr>
										<td>
											б) в отношении иностранного участника внешнеэкономической операции
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:choose>
													<xsl:when test="fscnpr:FlagEconomicStepsIn=1 or fscnpr:FlagEconomicStepsIn='true'">
														<xsl:text> применяются специальные экономические меры, установленные нормативным правовым актом</xsl:text>
														<xsl:apply-templates select="fscnpr:ActEconomicStepsIn"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:text> не применяются</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</span>
											;
										</td>
									</tr>
									<tr>
										<td>
											в) в отношении идентифицируемых товаров и идентифицируемых продуктов научно-технической деятельности
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" class="bordered">
												<tbody>
													<tr align="center">
														<td class="bordered">№ объекта</td>
														<td class="bordered">Результаты проверки</td>
													</tr>
													<xsl:for-each select="fscnpr:GoodsDescription">
														<tr valign="top">
															<td class="bordered" align="center">
																<xsl:value-of select="fscnpr:Number"/>
															</td>
															<td class="bordered">
																<xsl:if test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
																	<xsl:text> применяются специальные экономические меры, установленные нормативным правовым актом</xsl:text>
																	<xsl:apply-templates select="fscnpr:ActEconomicSteps"/>
																</xsl:if>
																<xsl:if test="not(fscnpr:FlagEconomicSteps) or fscnpr:FlagEconomicSteps=0 or fscnpr:FlagEconomicSteps='false'">
																	<xsl:text> специальные экономические меры не применяются</xsl:text>
																</xsl:if>
															</td>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											5.2. Наличие признаков, дающих основания полагать, что идентифициуремые товары и идентифицируемые продукты научно-технической деятельности могут быть использованы в целях создания оружи массового поражения и средств его доставки, иных видов вооружения и военной техники либо приобретаются в интересах организаций или физических лиц, причастных к террористической деятельности:
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:choose>
													<xsl:when test="fscnpr:FlagWeapon=0">не выявлено</xsl:when>
													<xsl:when test="fscnpr:FlagWeapon=1">имеется</xsl:when>
													<xsl:when test="fscnpr:FlagWeapon=2">проведение анализа не требуется</xsl:when>
												</xsl:choose>
											</span>
										</td>
									</tr>
									<tr>
										<td><br/>
											6. Общие выводы по результатам идентификации
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:value-of select="fscnpr:IdentifResult"/>
											</span>
										</td>
									</tr>
									<tr>
										<td><br/>
											7. Дополнительная информация
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:value-of select="fscnpr:InfoForExportControl"/>
											</span>
										</td>
									</tr>
									<tr>
										<td><br/>
											8. Уполномоченное лицо
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:for-each select="fscnpr:AuthorizedPerson/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</span>
										</td>
									</tr>
									<tr>
										<td><br/>
											9. Дата составления
											<xsl:text> </xsl:text>
											<span class="underlined">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="fscnpr:Authorization/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:when>
					<xsl:when test="fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4">
						<div class="page">
							<table width="100%">
								<tr>
									<td align="center" class="graph12">КОМИССИЯ ПО ЭКСПОРТНОМУ КОНТРОЛЮ РОССИЙСКОЙ ФЕДЕРАЦИИ</td>
								</tr>
								<tr>
									<td align="center" class="graph12">
										<xsl:for-each select="fscnpr:Authorization">
											<xsl:choose>
												<xsl:when test="cat_ru:PrDocumentName"><xsl:value-of select="cat_ru:PrDocumentName"/></xsl:when>
												<xsl:otherwise>РАЗРЕШЕНИЕ</xsl:otherwise>
											</xsl:choose>
											<br/>№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
											<xsl:text> </xsl:text>
											<xsl:choose>
												<xsl:when test="fscnpr:Status='2'"><span style="color:red">(действие приостановлено)</span></xsl:when>
												<xsl:when test="fscnpr:Status='4'"><span style="color:red">(действие прекращено)</span></xsl:when>
											</xsl:choose>
											<xsl:if test="fscnpr:DocType=4">
												<xsl:if test="not(cat_ru:PrDocumentName)">
													<xsl:choose>
														<xsl:when test="fscnpr:Opt_Cod='0'">на вывоз из РФ</xsl:when>
														<xsl:when test="fscnpr:Opt_Cod='1'">на временный вывоз из РФ</xsl:when>
														<xsl:when test="fscnpr:Opt_Cod='2'">на ввоз в РФ</xsl:when>
														<xsl:when test="fscnpr:Opt_Cod='3'">на временный ввоз в РФ</xsl:when>
														<xsl:when test="fscnpr:Opt_Cod='4'">на вывоз из РФ - ввоз в РФ</xsl:when>
														<xsl:when test="fscnpr:Opt_Cod='5'">на передачу технических данных</xsl:when>
														<xsl:otherwise>на временный вывоз из РФ</xsl:otherwise>
													</xsl:choose>
												</xsl:if>
												<br/><xsl:value-of select="fscnpr:Opt_Note"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td>
										<br/><br/>
										<table width="100%">
											<tr>
												<td style="width:20mm">Выдано:</td>
												<td style="border-bottom:1px solid;"><xsl:apply-templates select="fscnpr:Applicant" mode="shortReq"/></td>
											</tr>
											<tr>
												<td/>
												<td class="annot">(наименование и адрес юридического лица / Ф.И.О. физического лица, данные документа, удостоверяющего личность, место жительства)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table width="100%">
											<tr>
												<td style="width:36mm">по заявлению от</td>
												<td style="border-bottom:1px solid;"></td>
												<td style="width:10mm" align="center">№</td>
												<td style="border-bottom:1px solid;"></td>
											</tr>
											<tr>
												<td/>
												<td class="annot">(число, месяц, год)</td>
												<td/>
												<td class="annot">(номер заявления)</td>
											</tr>
										</table>		
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;" align="center">
										<br/>
										<xsl:for-each select="fscnpr:Authorization">
											<xsl:choose>
												<xsl:when test="fscnpr:Opt_Cod='0'">на вывоз из РФ</xsl:when>
												<xsl:when test="fscnpr:Opt_Cod='1'">на временный вывоз из РФ</xsl:when>
												<xsl:when test="fscnpr:Opt_Cod='2'">на ввоз в РФ</xsl:when>
												<xsl:when test="fscnpr:Opt_Cod='3'">на временный ввоз в РФ</xsl:when>
												<xsl:when test="fscnpr:Opt_Cod='4'">на вывоз из РФ - ввоз в РФ</xsl:when>
												<xsl:when test="fscnpr:Opt_Cod='5'">на передачу технических данных</xsl:when>
												<xsl:when test="fscnpr:DocType=3">на экспорт</xsl:when>
												<xsl:otherwise>на временный вывоз из РФ</xsl:otherwise>
											</xsl:choose>
											&#160;<xsl:value-of select="fscnpr:Opt_Note"/>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="annot">(экспорт, временный вывоз, выполнение работ, оказание услуг)</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;" align="center">
										<br/>
										<xsl:apply-templates select="fscnpr:BriefSpecifications"/>
										<xsl:if test="$attach1=1">, согласно приложению №1 к разрешению</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="annot">(наименование и характеристика научно-технической продукции, являющейся предметом внешнеэкономической операции)</td>
								</tr>
								<tr>
									<td>
										<br/>
										<table width="100%">
											<tr>
												<td style="width:58mm">в соответствии с контрактом</td>
												<td style="border-bottom:1px solid;">
													<xsl:for-each select="fscnpr:Contract">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</td>	
											</tr>
											<tr>
												<td/>
												<td class="annot">(контракт, номер, дата и т.д.)</td>
											</tr>
										</table>	
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;" align="center"><br/>
										<xsl:if test="fscnpr:CountryListPriznak='0'"> на территории всех стран</xsl:if>
										<xsl:if test="fscnpr:CountryListPriznak='1'"> на территории всех стран, кроме санкционных</xsl:if>
										<xsl:if test="(fscnpr:CountryListPriznak='2' or not(fscnpr:CountryListPriznak)) and fscnpr:DestinationCountry">
											<xsl:text> на территории </xsl:text><xsl:apply-templates select="fscnpr:DestinationCountry"/>
										</xsl:if>
										<xsl:if test="fscnpr:CountryListPriznak='3'">
											<xsl:text> на территории стран, кроме </xsl:text><xsl:apply-templates select="fscnpr:DestinationCountry"/>
										</xsl:if>
										<xsl:if test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
											<xsl:text> (применяются специальные экономические меры, установленные нормативным правовым актом</xsl:text>
											<xsl:apply-templates select="fscnpr:ActEconomicSteps"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td class="annot">
										<xsl:choose>
											<xsl:when test="fscnpr:DestinationCountryType=1 or fscnpr:DestinationCountryType='true'">(страны отправления)</xsl:when>
											<xsl:otherwise>(страны назначения)</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<xsl:if test="fscnpr:TermReturns">
									<tr>
										<td><br/>
											<table width="100%">
												<tr>
													<td style="width:40mm">Обратный ввоз до</td>
													<td style="border-bottom:1px solid;">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="fscnpr:TermReturns"/>
														</xsl:call-template>
													</td>
												</tr>
												<tr>
													<td/>
													<td class="annot">(иные условия, выполнение которых является обязательным при осуществлении вывоза)</td>
												</tr>
											</table>			
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="fscnpr:Authorization/fscnpr:Zkl_srokp">
									<tr>
										<td><br/>
											<table width="100%">
												<tr>
													<td style="width:33mm">Действительно</td>
													<td style="border-bottom:1px solid;">
														<xsl:if test="fscnpr:Authorization/fscnpr:Zkl_srokp='1'">
															<xsl:text> в течение срока выполнения обязательств </xsl:text>
															<xsl:if test="fscnpr:TermReturns">
																<xsl:text> (до </xsl:text>
																<xsl:call-template name="russian_date">
																	<xsl:with-param name="dateIn" select="fscnpr:TermReturns"/>
																</xsl:call-template>
																<xsl:text>)</xsl:text>
															</xsl:if>
														</xsl:if>
														<xsl:if test="fscnpr:Authorization/fscnpr:Zkl_srokp='0'">бессрочно</xsl:if>
													</td>
												</tr>
												<tr>
													<td/>
													<td class="annot">(число, месяц, год)</td>
												</tr>
											</table>			
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td><br/>
										<table width="100%">
											<tr>
												<td style="width:46mm">Выдано на основании:</td>
												<td style="border-bottom:1px solid;">
													<xsl:if test="fscnpr:Expertise">заключения госэкспертизы <xsl:apply-templates select="fscnpr:Expertise"/></xsl:if>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="annot">(дата и номер заключения государственной экспертизы внешнеэкономической сделки)</td>
											</tr>
										</table>			
									</td>
								</tr>
								<xsl:if test="fscnpr:InfoForExportControl">
									<tr>
										<td><br/>Дополнительная информация для целей экспортного контроля:</td>
									</tr>
									<tr>
										<td style="border-bottom:1px solid;"><xsl:value-of select="fscnpr:InfoForExportControl"/></td>
									</tr>
									<tr>
										<td class="annot">(указываются условия действия разрешения)</td>
									</tr>
								</xsl:if>
							</table>
							<br/><br/><br/>
							<table width="100%">
								<tr>
									<td align="center" class="graph12">
										<xsl:value-of select="fscnpr:AuthorizedPerson/fscnpr:PersonPost"/>
									</td>
									<td align="center" class="graph12"></td>
									<td align="center" class="graph12">
										<xsl:value-of select="fscnpr:AuthorizedPerson/fscnpr:FIO"/>
									</td>
								</tr>
								<tr>
									<td align="center" class="graph8">(должность)</td>
									<td align="center" class="graph8">(подпись)</td>
									<td align="center" class="graph8">(Ф.И.О.)</td>
								</tr>
								<tr>
									<td align="center" class="graph10"><br/><br/>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="fscnpr:Authorization/cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</td>
									<td align="center" class="graph10"><br/>М.П.</td>
									<td></td>
								</tr>
							</table>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="page">
							<table width="100%">
								<tr>
									<td align="center">
										<xsl:choose>
											<xsl:when test="fscnpr:Authorization/cat_ru:PrDocumentName">
												<xsl:value-of select="fscnpr:Authorization/cat_ru:PrDocumentName"/>
											</xsl:when>
											<xsl:otherwise>ЗАКЛЮЧЕНИЕ</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td align="center">
										<xsl:choose>
											<xsl:when test="fscnpr:Authorization/fscnpr:Status=2">
												<span style="color:red">приостановлено</span>
											</xsl:when>
											<xsl:when test="fscnpr:Authorization/fscnpr:Status=4">
												<span style="color:red">действие прекращено</span>
											</xsl:when>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td align="right">
										<br/>
										<xsl:text>№ </xsl:text>
										<xsl:value-of select="fscnpr:Authorization/cat_ru:PrDocumentNumber"/>
										<br/><br/>
									</td>
								</tr>
								<tr>
									<td style="border-bottom:1px solid;" align="center">
										<xsl:choose>
											<xsl:when test="fscnpr:ReleaseOrg/RUScat_ru:OrganizationName">
												<xsl:apply-templates select="fscnpr:ReleaseOrg/RUScat_ru:OrganizationName"/>
											</xsl:when>
											<xsl:when test="fscnpr:ReleaseOrg/RUScat_ru:ShortName">
												<xsl:value-of select="fscnpr:ReleaseOrg/RUScat_ru:ShortName"/>
											</xsl:when>
											<xsl:when test="fscnpr:Authorization/fscnpr:DocType='2'">ФСТЭК России</xsl:when>
											<xsl:when test="fscnpr:Authorization/fscnpr:DocType='1'">Центр независимой идентификационной экспертизы</xsl:when>
											<xsl:otherwise>---</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="annot">(Наименование органа государственной власти государства - члена Евразийского экономического союза, выдавшего заключение)</td>
								</tr>
								<tr>
									<td><br/>
										<table width="100%">
											<tr>
												<td style="width:20mm">Выдано:</td>
												<td style="border-bottom:1px solid;">
													<xsl:apply-templates select="fscnpr:Applicant" mode="shortReq"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="annot">(Название организации, юридический адрес, страна / для физических лиц Ф.И.О.,  данные документа, удостоверяющего личность)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><br/>
										<table width="100%">
											<tr>
												<td style="width:40mm">Вид перемещения:</td>
												<td style="border-bottom:1px solid;">
													<xsl:choose>
														<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod=0">вывоз из РФ</xsl:when>
														<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod=1">временный вывоз из РФ</xsl:when>
														<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod=2">ввоз в РФ</xsl:when>
														<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod=3">временный ввоз в РФ</xsl:when>
														<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod=4">вывоз из РФ – ввоз в РФ</xsl:when>
														<xsl:when test="fscnpr:Authorization/fscnpr:Opt_Cod=5">передача технических данных</xsl:when>
													</xsl:choose>
													<xsl:text> </xsl:text>
													<xsl:value-of select="fscnpr:Authorization/fscnpr:Opt_Note"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="annot">(Вид перемещения)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><br/>
										<table>
											<tr>
												<td width="45%" style="border-bottom:1px solid;border-right:1px solid;" align="center">
													<xsl:for-each select="fscnpr:GoodsDescription[fscnpr:GoodsCategoryCode]">
														<xsl:value-of select="fscnpr:GoodsCategoryCode"/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
												</td>
												<td><br/></td>
												<td width="45%" style="border-bottom:1px solid;border-left:1px solid;" align="center">
													<xsl:for-each select="fscnpr:GoodsDescription[fscnpr:GoodsNomenclatureCode]">
														<xsl:value-of select="fscnpr:GoodsNomenclatureCode"/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="annot">(Раздел единого перечня)</td>
												<td></td>
												<td class="annot">(Код ТН ВЭД ЕАЭС)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><br/>
										<table class="notExport" width="100%">
											<tr valign="top">
												<td align="center" width="5%">№ п\п</td>
												<td align="center" width="65%">Наименование</td>
												<td align="center" width="15%">Количество</td>
												<td align="center" width="15%">Единица измерения</td>
											</tr>
											<xsl:for-each select="fscnpr:GoodsDescription">
												<tr valign="top">
													<td align="center">
														<xsl:value-of select="fscnpr:Number"/>
													</td>
													<td>
														<xsl:for-each select="fscnpr:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
														<xsl:if test="$attach1=1">
															<br/><span style="font-size:10pt"><i>Подробнее в приложении №1</i></span>
														</xsl:if>
													</td>
													<td align="center">
														<xsl:value-of select="fscnpr:GoodsQuantity/cat_ru:GoodsQuantity"/>
													</td>
													<td align="center">
														<xsl:value-of select="fscnpr:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
														<xsl:if test="fscnpr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
															<xsl:text> (</xsl:text>
															<xsl:value-of select="fscnpr:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>
															<xsl:text>)</xsl:text>
														</xsl:if>
													</td>
												</tr>
											</xsl:for-each>
										</table>
										<br/>
										<xsl:if test="fscnpr:CheckList_Items or fscnpr:CheckList_Codes">
											<table width="100%">
												<tr>
													<td style="width:28mm">Примечание:</td>
													<td style="border-bottom:1px solid;">
														<xsl:if test="fscnpr:CheckList_Items">
															<xsl:text> Объекты экспертизы включены в контрольные списки </xsl:text>
															<xsl:apply-templates select="fscnpr:CheckList_Items"/>
															<xsl:text>. </xsl:text>
														</xsl:if>
														<xsl:if test="fscnpr:CheckList_Codes">
															<xsl:text>Коды списков: </xsl:text>
															<xsl:value-of select="fscnpr:CheckList_Codes"/>
															<xsl:text>.</xsl:text>
														</xsl:if>
													</td>
												</tr>
											</table>
											<br/>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:52mm">Получатель/отправитель:</td>
												<td style="border-bottom:1px solid;">
													<xsl:apply-templates select="fscnpr:Consignee" mode="shortReq"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="annot">(Название организации, юридический адрес, страна)</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td style="width:46mm">
													<xsl:choose>
														<xsl:when test="fscnpr:DestinationCountryType=1 or fscnpr:DestinationCountryType='true'">Страны отправления:</xsl:when>
														<xsl:when test="fscnpr:DestinationCountryType=0 or fscnpr:DestinationCountryType='false'">Страны назначения:</xsl:when>
														<xsl:otherwise>Страны назначения / отправления:</xsl:otherwise>
													</xsl:choose>
												</td>
												<td style="border-bottom:1px solid;">
													<xsl:if test="fscnpr:CountryListPriznak='0'">все страны</xsl:if>
													<xsl:if test="fscnpr:CountryListPriznak='1'">все страны, кроме санкционных</xsl:if>
													<xsl:if test="(fscnpr:CountryListPriznak='2' or not(fscnpr:CountryListPriznak)) and fscnpr:DestinationCountry">
														<xsl:apply-templates select="fscnpr:DestinationCountry"/>
													</xsl:if>
													<xsl:if test="fscnpr:CountryListPriznak='3'">
														<xsl:text>кроме </xsl:text><xsl:apply-templates select="fscnpr:DestinationCountry"/>
													</xsl:if>
													<xsl:if test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
														<xsl:text> (применяются специальные экономические меры, установленные нормативным правовым актом</xsl:text>
														<xsl:apply-templates select="fscnpr:ActEconomicSteps"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%"><br/>
											<tr>
												<td style="width:14mm">Цель:</td>
												<td style="border-bottom:1px solid;">
													<xsl:if test="fscnpr:Authorization/fscnpr:Opt_Cod=0">вывоз из РФ</xsl:if>
													<xsl:if test="fscnpr:Authorization/fscnpr:Opt_Cod=1">временный вывоз из РФ</xsl:if>
													<xsl:if test="fscnpr:Authorization/fscnpr:Opt_Cod=2">ввоз в РФ</xsl:if>
													<xsl:if test="fscnpr:Authorization/fscnpr:Opt_Cod=3">временный ввоз в РФ</xsl:if>
													<xsl:if test="fscnpr:Authorization/fscnpr:Opt_Cod=4">вывоз из РФ - ввоз в РФ</xsl:if>
													<xsl:if test="fscnpr:Authorization/fscnpr:Opt_Cod=5">передача технической информации</xsl:if>
													<xsl:text> </xsl:text>
													<xsl:apply-templates select="fscnpr:BriefSpecifications"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<xsl:if test="fscnpr:TermReturns">
									<tr>
										<td><br/>
											<table width="100%">
												<tr>
													<td style="width:68mm">Срок временного ввоза (вывоза):</td>
													<td style="border-bottom:1px solid;">
														<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscnpr:TermReturns"/></xsl:call-template>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td><br/>
										<table width="100%">
											<tr>
												<td style="width:58mm">На основании контракта(ов):</td>
												<td style="border-bottom:1px solid;">
													<xsl:for-each select="fscnpr:Contract">
														<xsl:apply-templates select="."/>
														<xsl:if test="position()!=last()">; </xsl:if>
													</xsl:for-each>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td><br/>
										<table width="100%">
											<tr>
												<td style="width:64mm">Дополнительная информация:</td>
												<td style="border-bottom:1px solid;">
													<xsl:value-of select="fscnpr:InfoForExportControl"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<xsl:if test="fscnpr:FlagWeapon!=2">
									<tr>
										<td style="border-bottom:1px solid;">
											<xsl:if test="fscnpr:FlagWeapon=1">имеется признак </xsl:if>
											<xsl:text>отношения объектов экспертизы к элементам оружия массового поражения и средствам его доставки, иным видам вооружения и военной техники, либо приобретения их в интересах организаций или физических лиц, причастных к террористической деятельности</xsl:text>
											<xsl:if test="fscnpr:FlagWeapon=0">, не выявлено</xsl:if>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
									<tr>
										<td style="border-bottom:1px solid;">
											<xsl:text>имеется признак применения специальных экономических мер в отношении стран назначения (отправления), установленные нормативным правовым актом</xsl:text>
											<xsl:apply-templates select="fscnpr:ActEconomicStepsIn"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td><br/><br/>
										<xsl:text>Заключение действительно </xsl:text>
										<xsl:if test="fscnpr:Authorization/fscnpr:Zkl_srokp='1'">
											<xsl:text>в течение срока выполнения обязательств</xsl:text>
											<xsl:if test="fscnpr:TermReturns">
												<xsl:text> (до </xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="fscnpr:TermReturns"/>
												</xsl:call-template>
												<xsl:text>)</xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="fscnpr:Authorization/fscnpr:Zkl_srokp='0'">
											<xsl:text>бессрочно</xsl:text>
										</xsl:if>
										<xsl:if test="not(fscnpr:Authorization/fscnpr:Zkl_srokp)">
											<xsl:text> до: </xsl:text>
											<xsl:if test="fscnpr:TermReturns">
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="fscnpr:TermReturns"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
									</td>
								</tr>
								<tr>
									<td align="right">
										<br/><br/>Подпись: ___________________&#160;&#160;&#160;&#160;Дата:&#160; 
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="fscnpr:Authorization/cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td>
										<table width="100%">
											<tr>
												<td rowspan="4" width="30%"></td>
												<td rowspan="4" width="30%" align="center" valign="middle">МП</td>
												<td style="border-bottom:1px solid;" align="center" valign="top">
													<br/><xsl:value-of select="fscnpr:AuthorizedPerson/fscnpr:FIO"/>
												</td>
											</tr>
											<tr>
												<td class="annot">(Ф.И.О.)</td>
											</tr>
											<tr>
												<td style="border-bottom:1px solid;" align="center" valign="top">
													<br/><xsl:value-of select="fscnpr:AuthorizedPerson/fscnpr:PersonPost"/>
												</td>
											</tr>
											<tr>
												<td class="annot">(Должность)</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="$attach1=1">
					<div class="page_album">
						<table width="100%">
							<tr>
								<td class="graph10" align="right">
									ПРИЛОЖЕНИЕ №1<br/>
									<xsl:if test="fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4">
										к разрешению Комиссии<br/>по экспортному контролю<br/>Российской Федерации
									</xsl:if>
									<xsl:if test="fscnpr:Authorization/fscnpr:DocType=2">к заключению ФСТЭК России</xsl:if>
									<xsl:if test="fscnpr:Authorization/fscnpr:DocType=1">к заключению Центра независимой<br/>идентификационной экспертизы</xsl:if>
									<br/>
									<xsl:text>от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="fscnpr:Authorization/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
									<xsl:text> № </xsl:text>
									<xsl:value-of select="fscnpr:Authorization/cat_ru:PrDocumentNumber"/>
								</td>
							</tr>
						</table>
						<br/>
						<xsl:if test="$attach1_1=1">
							<table width="100%">
								<tr>
									<td class="graph12" align="center">ПЕРЕЧЕНЬ ТОВАРОВ</td>
								</tr>
							</table>
							<br/>
							<xsl:variable name="row3" select="count(//fscnpr:GoodsDescription/fscnpr:GoodsNomenclatureCode)"/>
							<xsl:variable name="row5" select="count(//fscnpr:GoodsDescription/fscnpr:GoodsCategoryCode)"/>
							<xsl:variable name="row6" select="count(//fscnpr:GoodsDescription[fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'])"/>
							<xsl:variable name="row7" select="count(//fscnpr:GoodsDescription/fscnpr:ConslusionsListItems) + count(//fscnpr:GoodsDescription/fscnpr:Conslusions) + count(//fscnpr:GoodsDescription/fscnpr:ConslusionsDocument)"/>
							<table class="notExport" width="100%">
								<tr valign="middle">
									<td align="center" width="3%" rowspan="2" style="font-size:10pt">№ объекта</td>
									<td align="center" rowspan="2" style="font-size:10pt">Описание товара</td>
									<xsl:if test="$row3 &gt; 0"><td align="center" rowspan="2" style="font-size:10pt">Код ТН ВЭД ЕАЭС</td></xsl:if>
									<td align="center" width="5%" rowspan="2" style="font-size:10pt">Кол-во</td>
									<xsl:if test="$row5 &gt; 0"><td align="center" rowspan="2" style="font-size:10pt">Категория продукции</td></xsl:if>
									<xsl:if test="$row6 &gt; 0"><td align="center" rowspan="2" style="font-size:10pt">Применение спец. эконом. мер</td></xsl:if>
									<xsl:if test="$row7 &gt; 0"><td align="center" colspan="3" style="font-size:10pt">Сравнительный анализ</td></xsl:if>
								</tr>
								<tr valign="middle">
									<xsl:if test="$row7 &gt; 0">
										<td align="center" style="font-size:10pt">Пункты контрольных списков</td>
										<td align="center" style="font-size:10pt">Результаты анализа</td>
										<td align="center" style="font-size:10pt">Эл. документы, прикрепленные к заключению</td>
									</xsl:if>
								</tr>
								<xsl:for-each select="fscnpr:GoodsDescription">
									<tr valign="top">
										<td align="center" style="font-size:9pt"><xsl:value-of select="fscnpr:Number"/></td>
										<td style="font-size:9pt"><xsl:apply-templates select="fscnpr:GoodsDescription"/></td>
										<xsl:if test="$row3 &gt; 0"><td style="font-size:9pt"><xsl:value-of select="fscnpr:GoodsNomenclatureCode"/></td></xsl:if>
										<td align="center" style="font-size:9pt"><xsl:apply-templates select="fscnpr:GoodsQuantity"/></td>
										<xsl:if test="$row5 &gt; 0">
											<td style="font-size:9pt">
												<xsl:choose>
													<xsl:when test="fscnpr:GoodsCategoryCode=0">Программное обеспечение</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=1">Конструкционные и иные материалы, за исключением ядерных и радиоактивных материалов</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=2">Ядерные и радиоактивные материалы, а также изделия их содержащие</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=3">Химические вещества и соединения, за исключением ядерных и радиоактивных материалов</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=4">Биологические агенты и субстанции</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=5">Оборудование (приборы, устройства) серийного производства</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=6">Оборудование (приборы, устройства), изготовленное по индивидуальным заказам</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=7">Технологии в форме технических данных</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=8">Технологии в форме технической помощи, за исключением услуг по обучению</xsl:when>
													<xsl:when test="fscnpr:GoodsCategoryCode=9">Услуги по обучению</xsl:when>
												</xsl:choose>
											</td>
										</xsl:if>
										<xsl:if test="$row6 &gt; 0">
											<td style="font-size:9pt">
												<xsl:choose>
													<xsl:when test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
														применяются в соответствии с актом <xsl:apply-templates select="fscnpr:ActEconomicSteps"/>
													</xsl:when>
													<xsl:otherwise>нет</xsl:otherwise>
												</xsl:choose>
											</td>
										</xsl:if>
										<xsl:if test="$row7 &gt; 0">
											<td style="font-size:9pt">
												<xsl:for-each select="fscnpr:ConslusionsListItems">
													пункт <xsl:value-of select="fscnpr:NumberItem"/>&#160;
													раздела <xsl:value-of select="fscnpr:NumberSection"/>&#160;
													код списка <xsl:value-of select="fscnpr:CodeConslusionsList"/>
													<xsl:if test="position()!=last()"><br/></xsl:if>
												</xsl:for-each>
											</td>
											<td style="font-size:9pt">
												<xsl:for-each select="fscnpr:Conslusions">
													<xsl:choose>
														<xsl:when test="fscnpr:Decision=0 or fscnpr:Decision='false'">не соответствует контролируемым товарам<br/></xsl:when>
														<xsl:when test="fscnpr:Decision=1 or fscnpr:Decision='true'">соответствует контролируемым товарам<br/></xsl:when>
													</xsl:choose>
													<xsl:if test="fscnpr:ConslusionsDescription">
														описание пункта: <xsl:apply-templates select="fscnpr:ConslusionsDescription"/><br/>
													</xsl:if>
													<xsl:if test="fscnpr:ProductDetail">
														характеристики объекта: <xsl:apply-templates select="fscnpr:ProductDetail"/><br/>
													</xsl:if>
												</xsl:for-each>
											</td>
											<td style="font-size:9pt">
												<xsl:for-each select="fscnpr:ConslusionsDocument">
													<xsl:value-of select="fscnpr:DocumentName"/>&#160;
													добавлен <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscnpr:DocumentDate"/></xsl:call-template>
													<br/>файл в БД: <xsl:value-of select="fscnpr:DocumentNameBD"/>
													<br/>файл в выгрузке: <xsl:value-of select="fscnpr:FileName"/>
												</xsl:for-each>
											</td>
										</xsl:if>
									</tr>
								</xsl:for-each>
							</table>
							<br/>
						</xsl:if>
						<xsl:if test="$attach2_1=1">
							<xsl:call-template name="goods_post"/><br/>
							<xsl:call-template name="expert_before"/><br/>
						</xsl:if>
						<xsl:if test="$attach1_2=1">
							<table width="100%">
								<tr>
									<td class="graph12" align="center">СВЕДЕНИЯ ОБ ОБЪЕКТАХ ЭКСПЕРТИЗЫ<br/></td>
								</tr>
							</table>
							<br/>
							<table class="notExport" width="100%">
								<tr valign="middle">
									<td align="center" width="3%" style="font-size:10pt">№ объекта</td>
									<td align="center" style="font-size:10pt">Наименование продукции</td>
									<td align="center" style="font-size:10pt">Категория продукции</td>
									<td align="center" width="5%" style="font-size:10pt">Кол-во</td>
									<td align="center" style="font-size:10pt">Код ТН ВЭД ЕАЭС</td>
									<td align="center" style="font-size:10pt">Технические характеристики</td>
								</tr>
								<xsl:for-each select="fscnpr:ObjectsOfExpertExamination">
									<tr valign="top">
										<td align="center" style="font-size:9pt"><xsl:value-of select="fscnpr:ProdObjectNumeric"/></td>
										<td style="font-size:9pt"><xsl:apply-templates select="fscnpr:ProdDescription"/></td>
										<td style="font-size:9pt">
											<xsl:choose>
												<xsl:when test="fscnpr:ProdCategoryCode=0">Программное обеспечение</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=1">Конструкционные и иные материалы, за исключением ядерных и радиоактивных материалов</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=2">Ядерные и радиоактивные материалы, а также изделия их содержащие</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=3">Химические вещества и соединения, за исключением ядерных и радиоактивных материалов</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=4">Биологические агенты и субстанции</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=5">Оборудование (приборы, устройства) серийного производства</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=6">Оборудование (приборы, устройства), изготовленное по индивидуальным заказам</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=7">Технологии в форме технических данных</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=8">Технологии в форме технической помощи, за исключением услуг по обучению</xsl:when>
												<xsl:when test="fscnpr:ProdCategoryCode=9">Услуги по обучению</xsl:when>
											</xsl:choose>
										</td>
										<td align="center" style="font-size:9pt"><xsl:apply-templates select="fscnpr:ProdQuantity"/></td>
										<td style="font-size:9pt"><xsl:value-of select="fscnpr:GoodsNomenclatureCode"/></td>
										<td style="font-size:9pt"><xsl:apply-templates select="fscnpr:BriefSpecifications"/></td>
									</tr>
								</xsl:for-each>
							</table>		
							<br/>
						</xsl:if>
						<xsl:if test="$attach2_1=1"><xsl:call-template name="expert_post"/><br/></xsl:if>
						<br/><br/>
						<table width="100%">
							<tr>
								<td align="center" class="graph10">
									<xsl:value-of select="fscnpr:AuthorizedPerson/fscnpr:PersonPost"/>
								</td>
								<td align="center" class="graph10"></td>
								<td align="center" class="graph10">
									<xsl:value-of select="fscnpr:AuthorizedPerson/fscnpr:FIO"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graph8">(должность)</td>
								<td align="center" class="graph8">(подпись)</td>
								<td align="center" class="graph8">(Ф.И.О.)</td>
							</tr>
							<tr>
								<td align="center" class="graph10">
									<br/>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="fscnpr:Authorization/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</td>
								<td align="center" class="graph10">М.П.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</xsl:if>
				<xsl:if test="$attach2=1">
					<div class="page">
						<table width="100%">
							<tr>
								<td class="graph10" align="right">
									ПРИЛОЖЕНИЕ №<xsl:value-of select="$attach1+$attach2"/><br/>
									<xsl:if test="fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4">
										к разрешению Комиссии<br/>по экспортному контролю<br/>Российской Федерации
									</xsl:if>
									<xsl:if test="fscnpr:Authorization/fscnpr:DocType=2">к заключению ФСТЭК России</xsl:if>
									<xsl:if test="fscnpr:Authorization/fscnpr:DocType=1">к заключению Центра независимой<br/>идентификационной экспертизы</xsl:if>
									<br/>
									<xsl:text>от </xsl:text>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="fscnpr:Authorization/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
									<xsl:text> № </xsl:text>
									<xsl:value-of select="fscnpr:Authorization/cat_ru:PrDocumentNumber"/>
								</td>
							</tr>
						</table>
						<br/><br/>
						<xsl:if test="$attach1+$attach2_1=1">
							<xsl:call-template name="goods_post"/><br/>
						</xsl:if>
						<xsl:if test="$attach1+$attach2_1=1">
							<xsl:call-template name="expert_before"/><br/>
							<xsl:call-template name="expert_post"/><br/>
						</xsl:if>
						<table width="100%">
							<tr>
								<td class="graph12" align="center">ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</td>
							</tr>
						</table>
						<br/>
						<table class="notExport" width="100%">
							<xsl:if test="fscnpr:BDRDID">
								<tr valign="top">
									<td width="30%">Идентификатор документа по БД РД</td>
									<td><xsl:value-of select="fscnpr:BDRDID"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="fscnpr:Authorization/fscnpr:Status">
								<tr valign="top">
									<td width="30%">Статус разрешения/заключения</td>
									<td>
										<xsl:choose>
											<xsl:when test="fscnpr:Authorization/fscnpr:Status=1">действует</xsl:when>
											<xsl:when test="fscnpr:Authorization/fscnpr:Status=2">приостановлено</xsl:when>
											<xsl:when test="fscnpr:Authorization/fscnpr:Status=3">возобновлено действие</xsl:when>
											<xsl:when test="fscnpr:Authorization/fscnpr:Status=4">действие прекращено</xsl:when>
											<xsl:otherwise><xsl:value-of select="fscnpr:Authorization/fscnpr:Status"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="fscnpr:ReleaseOrg">
								<xsl:if test="fscnpr:IdentityCard or fscnpr:Contact or RUScat_ru:Address">
									<tr valign="top">
										<td width="30%">Сведения об организации, выдавшей заключение</td>
										<td><xsl:apply-templates select="."/></td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="fscnpr:Consignee">
								<xsl:if test="fscnpr:IdentityCard or fscnpr:Contact or RUScat_ru:Address">
									<tr valign="top">
										<td width="30%">Сведения об иностранном получателе товара</td>
										<td><xsl:apply-templates select="."/></td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="fscnpr:NoticeOfCancellation">
								<tr valign="top">
									<td width="30%">Уведомление об аннулировании</td>
									<td><xsl:apply-templates select="fscnpr:NoticeOfCancellation"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="fscnpr:NoticeOfSuspension">
								<tr valign="top">
									<td width="30%">Уведомление о приостановлении</td>
									<td><xsl:apply-templates select="fscnpr:NoticeOfSuspension"/></td>
								</tr>
							</xsl:if>
							<xsl:if test="fscnpr:NoticeOfResume">
								<tr valign="top">
									<td width="30%">Уведомление о возобновлении</td>
									<td><xsl:apply-templates select="fscnpr:NoticeOfResume"/></td>
								</tr>
							</xsl:if>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="goods_post">
		<xsl:if test="(fscnpr:CheckList_Items or fscnpr:CheckList_Codes) and (fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4) and not(fscnpr:ObjectsOfExpertExamination)">
			<xsl:if test="fscnpr:CheckList_Items">
				<xsl:text>Объекты экспертизы включены в контрольные списки </xsl:text>
				<xsl:apply-templates select="fscnpr:CheckList_Items"/>.
			</xsl:if>
			<xsl:if test="fscnpr:CheckList_Codes">
				<xsl:text> Коды списков: </xsl:text>
				<xsl:value-of select="fscnpr:CheckList_Codes"/>.
			</xsl:if>
			<br/><br/>
		</xsl:if>
		<table width="100%">
			<xsl:if test="fscnpr:ImpExp">
				<tr>
					<td style="width:50mm">Продавец / Покупатель:</td>
					<td style="border-bottom:1px solid;" valign="top"><xsl:apply-templates select="fscnpr:ImpExp" mode="shortReq"/></td>
				</tr>
				<tr>
					<td/><td class="annot">(название организации, юридический адрес, страна)</td>
				</tr>
			</xsl:if>
			<xsl:for-each select="fscnpr:EndUser">
				<tr>
					<td><xsl:if test="position()=1">Конечный пользователь:</xsl:if></td>
					<td style="border-bottom:1px solid;" valign="top"><xsl:apply-templates select="." mode="shortReq"/></td>
				</tr>
				<tr>
					<td/><td class="annot">(название организации, юридический адрес, страна)</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
	<xsl:template name="expert_before">
		<xsl:if test="(fscnpr:CheckList_Items or fscnpr:CheckList_Codes) and (fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4) and fscnpr:ObjectsOfExpertExamination">
			<xsl:if test="fscnpr:CheckList_Items">
				<xsl:text>Объекты экспертизы включены в контрольные списки </xsl:text>
				<xsl:apply-templates select="fscnpr:CheckList_Items"/>.
			</xsl:if>
			<xsl:if test="fscnpr:CheckList_Codes">
				<xsl:text> Коды списков: </xsl:text>
				<xsl:value-of select="fscnpr:CheckList_Codes"/>.
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="fscnpr:Expertise and not(fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4)">
			<br/>
			<xsl:text>Государственная экспертиза: </xsl:text>
			<xsl:apply-templates select="fscnpr:Expertise"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="expert_post">
		<xsl:if test="fscnpr:Authorization/fscnpr:DocType=3 or fscnpr:Authorization/fscnpr:DocType=4">
			<xsl:if test="fscnpr:FlagWeapon!=2">
				<br/>
				<xsl:if test="fscnpr:FlagWeapon=1">Имеется признак о</xsl:if>
				<xsl:if test="fscnpr:FlagWeapon=0">О</xsl:if>
				<xsl:text>тношения объектов экспертизы к элементам оружия массового поражения и средствам его доставки, иным видам вооружения и военной техники, либо приобретения их в интересах организаций или физических лиц, причастных к террористической деятельности</xsl:text>
				<xsl:if test="fscnpr:FlagWeapon=0">, не выявлено</xsl:if>.<br/>
			</xsl:if>
			<xsl:if test="fscnpr:FlagEconomicSteps=1 or fscnpr:FlagEconomicSteps='true'">
				<br/>
				<xsl:text>Имеется признак применения специальных экономических мер в отношении стран назначения (отправления), установленные нормативным правовым актом</xsl:text>
				<xsl:apply-templates select="fscnpr:ActEconomicStepsIn"/>.<br/>
			</xsl:if>
		</xsl:if>
 	</xsl:template>
	<xsl:template match="fscnpr:GoodsQuantity| fscnpr:ProdQuantity">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="fscnpr:Expertise| fscnpr:Contract| fscnpr:ActEconomicSteps| fscnpr:ActEconomicStepsIn| fscnpr:NoticeOfCancellation| fscnpr:NoticeOfSuspension| fscnpr:NoticeOfResume">
		<xsl:if test="fscnpr:Name"><xsl:value-of select="fscnpr:Name"/></xsl:if>
		<xsl:if test="fscnpr:Date">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscnpr:Date"/></xsl:call-template>
		</xsl:if>
		<xsl:text> № </xsl:text>
		<xsl:value-of select="fscnpr:Number"/>
		<xsl:choose>
			<xsl:when test="fscnpr:ExpirationCode=0 or fscnpr:ExpirationCode='false'">, без ограничения срока действия</xsl:when>
			<xsl:when test="fscnpr:ExpirationCode=1 or fscnpr:ExpirationCode='true'">
				<xsl:text>, действует в течение срока выполнения обязательств</xsl:text>
				<xsl:if test="fscnpr:ExpirationDate">
					<xsl:text> (до </xsl:text>
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscnpr:ExpirationDate"/></xsl:call-template>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:when>
			<xsl:when test="fscnpr:ExpirationDate">
				<xsl:text>, действует до </xsl:text>
				<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscnpr:ExpirationDate"/></xsl:call-template>
			</xsl:when>				
		</xsl:choose>
		<xsl:if test="fscnpr:Note">, <xsl:value-of select="fscnpr:Note"/></xsl:if>
	</xsl:template>
	<xsl:template mode="shortReq" match="*">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="not(RUScat_ru:OrganizationName)"><xsl:value-of select="RUScat_ru:ShortName"/></xsl:if>
		<xsl:if test="fscnpr:IdentityCard">
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName">, </xsl:if>
			<xsl:apply-templates select="fscnpr:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Address">
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName or fscnpr:IdentityCard">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Address"/>
		</xsl:if>
		<xsl:if test="fscnpr:CountryEndUse">
			<xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName or RUScat_ru:Address">, </xsl:if>
			<xsl:value-of select="fscnpr:CountryEndUse"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="RUScat_ru:RFOrganizationFeatures">
				<xsl:if test="RUScat_ru:RFOrganizationFeatures/cat_ru:INN">
					<xsl:text>, ИНН: </xsl:text>
					<xsl:value-of select="RUScat_ru:RFOrganizationFeatures/cat_ru:INN"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="RUScat_ru:RKOrganizationFeatures">
				<xsl:if test="RUScat_ru:RKOrganizationFeatures/cat_ru:BIN">
					<xsl:text>, БИН: </xsl:text>
					<xsl:value-of select="RUScat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="RUScat_ru:RBOrganizationFeatures">
				<xsl:if test="RUScat_ru:RBOrganizationFeatures/cat_ru:UNP">
					<xsl:text>, УНП: </xsl:text>
					<xsl:value-of select="RUScat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="RUScat_ru:RAOrganizationFeatures">
				<xsl:if test="RUScat_ru:RAOrganizationFeatures/cat_ru:UNN">
					<xsl:text>, УНН: </xsl:text>
					<xsl:value-of select="RUScat_ru:RAOrganizationFeatures/cat_ru:UNN"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="RUScat_ru:KGOrganizationFeatures">
				<xsl:if test="RUScat_ru:KGOrganizationFeatures/cat_ru:KGINN">
					<xsl:text>, ИНН/ПИН: </xsl:text>
					<xsl:value-of select="RUScat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
				</xsl:if>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="fscnpr:IdentityCard">
		<xsl:choose>
			<xsl:when test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/>&#160;</xsl:when>
			<xsl:when test="cat_ru:IdentityCardCode">(<xsl:value-of select="cat_ru:IdentityCardCode"/>)&#160;</xsl:when>
		</xsl:choose>
		<xsl:if test="cat_ru:IdentityCardSeries">серия: <xsl:value-of select="cat_ru:IdentityCardSeries"/>&#160;</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">№ <xsl:value-of select="cat_ru:IdentityCardSeries"/>&#160;</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
			выдан:&#32;
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/></xsl:call-template>
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="fscnpr:DestinationCountry">
		<xsl:value-of select="."/>
		<xsl:if test="position()!=last()">, </xsl:if>
	</xsl:template>
	<xsl:template match="fscnpr:NoticeOfCancellation|fscnpr:NoticeOfSuspension|fscnpr:NoticeOfResume">
		<xsl:text>№ </xsl:text>
		<xsl:value-of select="fscnpr:Number"/>
		<xsl:if test="fscnpr:Date">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscnpr:Date"/></xsl:call-template>
		</xsl:if>
		<xsl:if test="fscnpr:ExpirationDate">
			<xsl:text>, срок действия: </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="fscnpr:ExpirationDate"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="fscnpr:ReleaseOrg| fscnpr:Consignee| fscnpr:EndUser| fscnpr:ImpExp">
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="RUScat_ru:ShortName">
			<xsl:if test="RUScat_ru:OrganizationName"> (</xsl:if>
			<xsl:value-of select="RUScat_ru:ShortName"/>
			<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="RUScat_ru:RFOrganizationFeatures">
				<xsl:for-each select="RUScat_ru:RFOrganizationFeatures">
					<xsl:if test="cat_ru:OGRN">, ОГРН: <xsl:value-of select="cat_ru:OGRN"/></xsl:if>
					<xsl:if test="cat_ru:INN">, ИНН: <xsl:value-of select="cat_ru:INN"/></xsl:if>
					<xsl:if test="cat_ru:KPP">, КПП: <xsl:value-of select="cat_ru:KPP"/></xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="RUScat_ru:RKOrganizationFeatures">
				<xsl:for-each select="RUScat_ru:RKOrganizationFeatures">
					<xsl:if test="cat_ru:BIN">, БИН: <xsl:value-of select="cat_ru:BIN"/></xsl:if>
					<xsl:if test="cat_ru:IIN">, ИИН: <xsl:value-of select="cat_ru:IIN"/></xsl:if>
					<xsl:if test="cat_ru:ITN">, ИТН: 
						<xsl:for-each select="cat_ru:ITN">
							<xsl:value-of select="cat_ru:CategoryCode"/>-<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="RUScat_ru:RBOrganizationFeatures">
				<xsl:for-each select="RUScat_ru:RBOrganizationFeatures">
					<xsl:if test="cat_ru:UNP">, УНП: <xsl:value-of select="cat_ru:UNP"/></xsl:if>
					<xsl:if test="cat_ru:RBIdentificationNumber">, Идент.номер физ.лица: <xsl:value-of select="cat_ru:RBIdentificationNumber"/></xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="RUScat_ru:RAOrganizationFeatures">
				<xsl:for-each select="RUScat_ru:RAOrganizationFeatures">
					<xsl:if test="cat_ru:UNN">, УНН: <xsl:value-of select="cat_ru:UNN"/></xsl:if>
					<xsl:if test="cat_ru:SocialServiceNumber">, НЗОУ: <xsl:value-of select="cat_ru:SocialServiceNumber"/></xsl:if>
					<xsl:if test="cat_ru:SocialServiceCertificate">, Справка об отсутствии НЗОУ № <xsl:value-of select="cat_ru:SocialServiceCertificate"/></xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="RUScat_ru:KGOrganizationFeatures">
				<xsl:for-each select="RUScat_ru:KGOrganizationFeatures">
					<xsl:if test="cat_ru:KGINN">, ИНН/ПИН: <xsl:value-of select="cat_ru:KGINN"/></xsl:if>
					<xsl:if test="cat_ru:KGOKPO">, ОКПО: <xsl:value-of select="cat_ru:KGOKPO"/></xsl:if>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="fscnpr:IdentityCard">, документ, удостоверяющий личность: <xsl:apply-templates select="fscnpr:IdentityCard"/></xsl:if>
		<xsl:if test="RUScat_ru:Address">, адрес: <xsl:value-of select="RUScat_ru:Address"/></xsl:if>
		<xsl:if test="fscnpr:CountryEndUse">, страна конечного использования: <xsl:value-of select="fscnpr:CountryEndUse"/></xsl:if>
		<xsl:if test="fscnpr:Contact">, контактные данные: <xsl:apply-templates select="fscnpr:Contact"/></xsl:if>
	</xsl:template>
	<xsl:template match="fscnpr:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>адрес эл.почты: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
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