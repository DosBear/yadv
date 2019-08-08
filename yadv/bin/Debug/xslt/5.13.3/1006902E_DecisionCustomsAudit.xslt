<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.13.3" xmlns:dca="urn:customs.ru:Information:CustomsAuditDocuments:DecisionCustomsAudit:5.13.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3">
	<!-- Шаблон для типа DecisionCustomsAuditType -->
	<xsl:template match="dca:DecisionCustomsAudit">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
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
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
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
					.descr{
						font-size: 8pt;
						text-align: center;
					}
					.indent{
						text-indent: 1.5em;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<xsl:choose>
						<xsl:when test="not(dca:PrevDecisionNumber)">
							<xsl:apply-templates select="." mode="decision"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:apply-templates select="." mode="decisionChange"/>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="dca:DecisionCustomsAudit" mode="decision">
		<table>
			<tbody>
				<tr>
					<td align="center">
						МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>
						(МИНФИН РОССИИ)
						<br/>
						<br/>
						ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
					</td>
				</tr>
				<tr>
					<td class="value" align="center">
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:OfficeName"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text> (</xsl:text>
						</xsl:if>
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:Code"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="descr">(наименование таможенного органа)</td>
				</tr>
				<tr>
					<td align="center">
						<br/>
						<br/>
						РЕШЕНИЕ
						<br/>
						по результатам таможенного контроля
						<br/>
						№ <span style="border-bottom:1px solid black; width:50mm;">
							<xsl:value-of select="dca:DecisionNumber/adt_cat:Number"/>
						</span>
						<br/>
						<xsl:call-template name="russian_date_month">
							<xsl:with-param name="dateIn" select="dca:DecisionNumber/adt_cat:Date"/>
						</xsl:call-template> г.
					</td>
				</tr>
				<xsl:if test="dca:DecisionNumber/adt_cat:Date">
					<tr>
						<td class="descr">
							(дата)
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td>
						<br/>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>1. Вводная часть.</xsl:text>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>1.1. Должностное лицо таможенного органа, принявшее решение:</xsl:text>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:CustomsAuthorizingOrder/adt_cat:CustomsIssuedOrder"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:CustomsAuthorizingOrder/adt_cat:Order" mode="document"/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>1.2. Лицо, в отношении товаров, документов, сооружений, помещений (частей помещений), открытых площадок (частей открытых площадок) и (или) деятельности которого проведена </xsl:text>
						<xsl:choose>
							<xsl:when test="dca:IdentKindAudit=1"><u>таможенная проверка</u> / <!--s-->проверка таможенных, иных документов и (или) сведений<!--/s--></xsl:when>
							<xsl:when test="dca:IdentKindAudit=2"><!--s-->таможенная проверка<!--/s--> / <u>проверка таможенных, иных документов и (или) сведений</u></xsl:when>
							<xsl:otherwise><xsl:text>таможенная проверка / проверка таможенных, иных документов и (или) сведений</xsl:text></xsl:otherwise>
						</xsl:choose>
						<xsl:text>:</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates select="dca:AuditOrganization" mode="organization"/>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>2. Описательная часть.</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>2.1. На основании акта </xsl:text>
						<xsl:choose>
							<xsl:when test="dca:IdentKindAudit=1"><u>таможенной проверки</u> / <!--s-->проверки таможенных, иных документов и (или) сведений<!--/s--></xsl:when>
							<xsl:when test="dca:IdentKindAudit=2"><!--s-->таможенной проверки<!--/s--> / <u>проверки таможенных, иных документов и (или) сведений</u></xsl:when>
							<xsl:otherwise><xsl:text>таможенной проверки / проверки таможенных, иных документов и (или) сведений</xsl:text></xsl:otherwise>
						</xsl:choose>
						<xsl:text> от </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="dca:ActNumber/adt_cat:Date"/>
								</xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="description">(дата)</xsl:with-param>
							<xsl:with-param name="width">20%</xsl:with-param>
						</xsl:call-template>
						<xsl:text> № </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:value-of select="dca:ActNumber/adt_cat:Number"/>
							</xsl:with-param>
							<xsl:with-param name="description">(номер)</xsl:with-param>
							<xsl:with-param name="width">20%</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td class="indent">2.2. УСТАНОВЛЕНО следующее:</td>
				</tr>
				<tr>
					<td>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:for-each select="dca:AuditDisorders">
									<xsl:value-of select="position()"/>
									<xsl:text>) </xsl:text>
									<xsl:apply-templates select="."/>
									<xsl:if test="position() != last()">; </xsl:if>
								</xsl:for-each>	
							</xsl:with-param>
							<xsl:with-param name="description">(выявленные нарушения регулирующих таможенные правоотношения актов, составляющих право Евразийского экономического союза, и законодательства Российской Федерации о таможенном деле со ссылкой на положения нормативных правовых актов, требования которых нарушены)</xsl:with-param>
							<xsl:with-param name="width">100%</xsl:with-param>
							<xsl:with-param name="data_align" select="'left'"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>3. Резолютивная часть.</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>3.1. На основании изложенного, руководствуясь статьей 218 и </xsl:text>
						<xsl:choose>
							<xsl:when test="dca:IdentKindAudit=1"><u>частью 2 статьи 226</u> / <!--s-->частью 6 статьи 237<!--/s--></xsl:when>
							<xsl:when test="dca:IdentKindAudit=2"><!--s-->частью 2 статьи 226<!--/s--> / <u>частью 6 статьи 237</u></xsl:when>
							<xsl:otherwise><xsl:text>частью 2 статьи 226 / частью 6 статьи 237</xsl:text></xsl:otherwise>
						</xsl:choose>
						<xsl:text> Федерального закона от ___________ № _____  «О таможенном регулировании», РЕШЕНО:</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>3.2.</xsl:text>
						<table width="100%">
							<tbody>
								<tr align="center">
									<td class="bordered" style="text-indent:0;">№ п/п</td>
									<td class="bordered" style="text-indent:0;">Решение в области таможенного дела,<br/>принимаемое в целях устранения выявленных нарушений</td>
								</tr>
								<xsl:for-each select="dca:Decisions">
									<tr valign="top">
										<td class="bordered" style="text-indent:0;">
											<xsl:value-of select="dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:choose>
												<xsl:when test="dca:Decision_Variant_0='true'">Решения в сфере таможенного дела, принимаемые по результатам таможенного контроля в форме таможенной проверки или проверки таможенных, иных документов и (или) сведений</xsl:when>
												<xsl:when test="dca:Decision_Variant_1='true'">Решение о выявлении нарушения регулирующих таможенные правоотношения актов, составляющих право Евразийского экономического союза, и законодательства РФ о таможенном деле</xsl:when>
												<xsl:when test="dca:Decision_Variant_2='true'">Решение о признании товаров незаконно перемещенными через таможенную границу Евразийского экономического союза</xsl:when>
												<xsl:when test="dca:Decision_Variant_3='true'">Решение о признании товаров товарами, на оборот которых в РФ введен запрет в соответствии со статьей 212 ФЗ «О таможенном регулировании»</xsl:when>
												<xsl:when test="dca:Decision_Variant_4='true'">Решение о признании товаров товарами, подлежащими изъятию в соответствии с федеральными законами, актами Президента Российской Федерации, актами Правительства Российской Федерации, указанными в статье 254 Федерального закона от _______________ № _______ "О таможенном регулировании", в рамках осуществления иных функций, возложенных на таможенные органы в соответствии с частью 4 статьи 254 Федерального закона от _______________ № _______ "О таможенном регулировании":_______________________________________________________.</xsl:when>
												<xsl:when test="dca:Decision_Variant_5='true'">
													Решение о признании лица, участвовавшего в незаконном перемещении товаров через таможенную границу Евразийского экономического союза, -
													<br/>
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates mode="organization" select="dca:DisorderPerson"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'left'"/>
														<xsl:with-param name="description" select="'(указываются сведения о лице в порядке, аналогичном порядку, установленному пунктами 33 – 41 Порядка)'"/>
														<xsl:with-param name="width" select="'100%'"/>
													</xsl:call-template>
													 - несущим солидарную с  лицом, незаконно перемещающим товары через таможенную границу Евразийского экономического союза, обязанность по уплате таможенных платежей, специальных антидемпинговых, компенсационных пошлин, процентов и пени, -
													<br/>
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates mode="organization" select="dca:JointlyLiablePerson"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'left'"/>
														<xsl:with-param name="description" select="'(указываются сведения о лице в порядке, аналогичном порядку, установленному пунктами 26 – 34 Порядка)'"/>
														<xsl:with-param name="width" select="'100%'"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="dca:Decision_Variant_6='true'">
													Решение о признании лица, которое приобрело в собственность или во владение незаконно ввезенные товары - 
													<br/>
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates mode="organization" select="dca:DisorderPerson"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'left'"/>
														<xsl:with-param name="description" select="'(указываются сведения о лице в порядке, аналогичном порядку, установленному пунктами 33 – 41 Порядка)'"/>
														<xsl:with-param name="width" select="'100%'"/>
													</xsl:call-template>
													 - несущим солидарную с  лицом, незаконно перемещающим товары через таможенную границу Евразийского экономического союза, обязанность по уплате таможенных платежей, специальных антидемпинговых, компенсационных пошлин, процентов и пени, -
													<br/>
													<xsl:call-template name="inlinetable">
														<xsl:with-param name="data">
															<xsl:apply-templates mode="organization" select="dca:JointlyLiablePerson"/>
														</xsl:with-param>
														<xsl:with-param name="data_align" select="'left'"/>
														<xsl:with-param name="description" select="'(указываются сведения о лице в порядке, аналогичном порядку, установленному пунктами 26 – 34 Порядка)'"/>
														<xsl:with-param name="width" select="'100%'"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<xsl:text>: </xsl:text>
											<br/>
											<xsl:apply-templates select="dca:Text"/>
											<br/>
											<xsl:if test="dca:PaymentsInfo">
												<xsl:text> сведения о случаях исчисления платежей: </xsl:text>
												<xsl:for-each select="dca:PaymentsInfo">
													<xsl:value-of select="dca:PaymentCode"/>
													<xsl:text>/</xsl:text>
													<xsl:call-template name="number_date">
														<xsl:with-param name="dateIn" select="dca:PaymentTermDate"/>
													</xsl:call-template>
													<xsl:text>/</xsl:text>
													<xsl:call-template name="number_date">
														<xsl:with-param name="dateIn" select="dca:CalculationRatesDate"/>
													</xsl:call-template>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="dca:JointlyLiablePerson">
												<xsl:text>; лица, несущие солидарную ответственность: </xsl:text>
												<xsl:for-each select="dca:JointlyLiablePerson">
													<xsl:apply-templates mode="organization" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="dca:DisorderPerson">
												<xsl:text>; лицо, незаконно переместившее товары через таможенную границу: </xsl:text>
												<xsl:for-each select="dca:DisorderPerson">
													<xsl:apply-templates mode="organization" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>3.3. В отношении следующих товаров:</xsl:text>
					</td>
				</tr>
				<xsl:for-each select="dca:GoodsInfo">
					<tr>
						<td>
							<table width="100%">
								<!--3 x 13-->
								<tbody>
									<tr valign="top">
										<td class="bordered" style="width:55%;">1. Плательщик
											<br/>
											<xsl:apply-templates mode="organization" select="dca:PayerDetails"/>
										</td>
										<td class="bordered" colspan="2">2. Лица, несущие солидарную (субсидиарную) обязанность
											<br/>
											<xsl:for-each select="dca:JointlyLiablePersonDetails">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">
													<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="bordered">3. Страна происхождения
											<xsl:value-of select="dca:OriginCountryName"/>
										</td>
										<td class="bordered" colspan="2">4. Общая таможенная стоимость
											<br/>
											<xsl:value-of select="dca:TotalCustCost"/>
										</td>
									</tr>
									<xsl:for-each select="dca:Goods">
										<tr valign="top">
											<td class="bordered" rowspan="4">
												<table width="100%">
													<tbody>
														<tr valign="top">
															<td style="width:25%;border-right:1px solid black;border-bottom:1px solid black;margin:0;" colspan="2">
																5. Товар №
															</td>
															<td rowspan="2">
																6. Описание товара
															</td>
														</tr>
														<tr>
															<td style="width:150px;border-right:1px solid black;border-bottom:1px solid black;margin:0;">
																<xsl:value-of select="dca:GoodsNumeric"/>
															</td>
															<td style="width:150px;border-right:1px solid black;border-bottom:1px solid black;margin:0;">
																<xsl:value-of select="dca:GoodFeatures"/>
															</td>
														</tr>
													</tbody>
												</table>
												<xsl:apply-templates select="dca:GoodsDescription"/>
												<br/>
												<xsl:apply-templates mode="quantity" select="dca:SupplementaryGoodsQuantity"/>
												<br/>
												<xsl:value-of select="dca:OilField"/>
												<br/>
												<xsl:for-each select="dca:Excise">
													<xsl:for-each select="*">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text> </xsl:text>
														</xsl:if>
													</xsl:for-each>
													<xsl:if test="position()!=last()">;</xsl:if>
												</xsl:for-each>
												<br/>
												<xsl:for-each select="dca:CIMIdDetails">
													<xsl:value-of select="catESAD_cu:CIMMarkingFlag"/>
													<xsl:text>; </xsl:text>
													<xsl:value-of select="catESAD_cu:CIMQuantity"/>
													<xsl:text>; </xsl:text>
													<xsl:for-each select="catESAD_cu:CIMList/catESAD_cu:CIMID">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()">, </xsl:if>
													</xsl:for-each>
													<xsl:text>; </xsl:text>
												</xsl:for-each>
												<br/>
												<xsl:for-each select="catESAD_cu:CIMRange">
													<xsl:value-of select="catESAD_cu:FirstCIMID"/>
													<xsl:text> - </xsl:text>
													<xsl:value-of select="catESAD_cu:LastCIMID"/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
											<td class="bordered">7. Код товара
												<br/>
												<xsl:value-of select="dca:GoodsTNVEDCode"/>
											</td>
											<td class="bordered">8. Вес брутто(кг)
												<br/>
												<xsl:value-of select="dca:GrossWeightQuantity"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												9. Код страны происхождения
												<br/>
												<table>
													<tbody>
														<tr>
															<td style="width:10%;border-right:1px solid black;">a</td>
															<td style="width:50%;border-right:1px solid black;">
																<xsl:value-of select="dca:OriginCountryCode"/>
															</td>
															<td style="width:10%;border-right:1px solid black;">b</td>
															<td style="width:50%;"/>
														</tr>
													</tbody>
												</table>
											</td>
											<td class="bordered">
												10. Вес нетто (кг)
												<br/>
												<xsl:value-of select="dca:NetWeightQuantity"/>
												<br/>
												<xsl:value-of select="dca:NetWeightQuantity2"/>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="2">11. Предшествующий документ
												<br/>
												<xsl:for-each select="dca:PrecedingDocuments">
													<!--xsl:value-of select="dca:LineNumber"/>
													<xsl:text> </xsl:text-->
													<!--xsl:choose>
														<xsl:when test="dca:PrecedingDocumentModeCode='09035'">для декларации на товары</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09013'">для транзитной декларации</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09036'">для декларации на транспортное средство</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09037'">для заявления о выпуске товаров до подачи декларации на товары</xsl:when>
														<xsl:when test="dca:PrecedingDocumentModeCode='09999'">для иного документа</xsl:when>
													</xsl:choose-->
													<xsl:value-of select="dca:PrecedingDocumentModeCode"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="dca:PrecedingDocumentNumber"/>
													<xsl:text>/</xsl:text>
													<xsl:value-of select="dca:PrecedingDocumentGoodsNumeric"/>
													<xsl:if test="position()!=last()">
														<br/>
													</xsl:if>
												</xsl:for-each>
											</td>
										</tr>
										<tr valign="top">
											<td class="bordered">12. Дополнительные единицы измерения
												<br/>
												<xsl:for-each select="dca:SupplementaryGoodsQuantity">
													<xsl:apply-templates mode="quantity" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
											<td class="bordered">
												13. Таможенная стоимость
												<br/>
												<xsl:value-of select="dca:CustomsCost"/>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="3">
												14. Дополнительная информация, представленные документы
												<br/>
												<xsl:for-each select="dca:PresentedDocuments">
													<xsl:apply-templates mode="document" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<br/>
						</td>
					</tr>
				</xsl:for-each>
				<tr>
					<td class="indent">3.4. В отношении товаров для личного пользования, ввезенных с освобождением от уплаты таможенных пошлин, налогов (пункт 7 статьи 268 Таможенного кодекса Евразийского экономического союза)  / товаров для личного пользования физических лиц, указанных в пункте 2 статьи 259 Таможенного кодекса Евразийского экономического союза (пункт 14 статьи 268 Таможенного кодекса Евразийского экономического союза) :</td>
				</tr>
				<tr>
					<td>
						<xsl:for-each select="dca:GoodsInfoLP">
							<table width="100%">
								<tbody>
									<tr>
										<td class="bordered" colspan="2" style="border-bottom:0;">1. Сведения о документе, в соответствии с которым товары находятся на таможенной территории ЕАЭС</td>
									</tr>
									<tr valign="top">
										<td class="bordered" style="border-top:0;">номер
											<br/>
											<xsl:value-of select="dca:PassengerDT/adt_cat:Number"/>
										</td>
										<td class="bordered" style="border-top:0;">дата
											<br/>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="dca:PassengerDT/adt_cat:Date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">2. Сведения о лице, на которого возложена обязанность по уплате таможенных пошлин, налогов
											<br/>
											<xsl:apply-templates mode="organization" select="dca:PayerDetails"/>
										</td>
										<td class="bordered">3. Лица, несущие солидарную обязанность
											<br/>
											<xsl:for-each select="dca:JointlyLiablePersonDetails">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-right:1px solid black;">4. Курс евро
															<br/>
															<xsl:value-of select="dca:CurrencyEuroRate"/>
														</td>
														<td>5. Курс доллара
															<br/>
															<xsl:value-of select="dca:CurrencyDollarRate"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td colspan="3">6. Общая стоимость</td>
													</tr>
													<tr>
														<td style="border-right:1px solid black;">
															6.1. в рублях
															<br/>
															<xsl:value-of select="dca:TotalCost/dca:Cost"/>
														</td>
														<td style="border-right:1px solid black;">
															6.2. в долларах
															<br/>
															<xsl:value-of select="dca:TotalCost/dca:DollarCost"/>
														</td>
														<td>
															6.3. в евро
															<br/>
															<xsl:value-of select="dca:TotalCost/dca:EuroCost"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<xsl:for-each select="dca:Goods">
										<tr valign="top">
											<td rowspan="3" class="bordered">
												<table width="100%">
													<tbody>
														<tr valign="top">
															<td style="border-right:1px solid black; border-bottom:1px solid black;width:25%;">
																7. Товар №
																<br/>
																<xsl:value-of select="dca:GoodsNumeric"/>
															</td>
															<td>8. Описание товара</td>
														</tr>
													</tbody>
												</table>
												<xsl:apply-templates select="dca:GoodsDescription"/>
											</td>
											<td class="bordered">
												9. Код ТН ВЭД ЕАЭС 
												<br/>
												<xsl:value-of select="dca:GoodsTNVEDCode"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												<table width="100%">
													<tbody>
														<tr>
															<td style="border-right: 1px solid black;">
																10. Количество товара
																<br/>
																<xsl:apply-templates mode="quantity" select="dca:GoodsQuantity"/>
															</td>
															<td>
																11. Вес товара (кг)
																<br/>
																<xsl:value-of select="dca:WeightQuantity"/>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												<table width="100%">
													<tbody>
														<tr>
															<td colspan="3">12. Стоимость товара</td>
														</tr>
														<tr>
															<td style="border-right:1px solid black;">
																12.1. в рублях
																<br/>
																<xsl:value-of select="dca:Cost/dca:Cost"/>
															</td>
															<td style="border-right:1px solid black;">
																12.2. в долларах
																<br/>
																<xsl:value-of select="dca:Cost/dca:DollarCost"/>
															</td>
															<td>
																12.3. в евро
																<br/>
																<xsl:value-of select="dca:Cost/dca:EuroCost"/>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="2">
												13. Дополнительная информация, представленные документы
												<br/>
												<xsl:for-each select="dca:PresentedDocuments">
													<xsl:apply-templates mode="document_add" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">3.5. В отношении транспортных средств для личного пользования (далее – ТСЛП):</td>
				</tr>
				<tr>
					<td>
						<xsl:for-each select="dca:GoodsInfoTSLP">
							<table width="100%">
								<tbody>
									<tr>
										<td class="bordered" colspan="2" style="border-bottom:0;">1. Сведения о документе, в соответствии с которым ТСЛП находятся на таможенной территории ЕАЭС</td>
									</tr>
									<tr valign="top">
										<td class="bordered" style="border-top:0;">номер
											<br/>
											<xsl:value-of select="dca:PassengerDT/adt_cat:Number"/>
										</td>
										<td class="bordered" style="border-top:0;">дата
											<br/>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="dca:PassengerDT/adt_cat:Date"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">2. Сведения о лице, на которого возложена обязанность по уплате таможенных пошлин, налогов
											<br/>
											<xsl:apply-templates mode="organization" select="dca:PayerDetails"/>
										</td>
										<td class="bordered">3. Лица, несущие солидарную обязанность
											<br/>
											<xsl:for-each select="dca:JointlyLiablePersonDetails">
												<xsl:apply-templates mode="organization" select="."/>
												<xsl:if test="position()!=last()">;<br/>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr valign="top">
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td style="border-right:1px solid black;">4. Курс евро
															<br/>
															<xsl:value-of select="dca:CurrencyEuroRate"/>
														</td>
														<td>5. Курс доллара
															<br/>
															<xsl:value-of select="dca:CurrencyDollarRate"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td class="bordered">
											<table width="100%">
												<tbody>
													<tr>
														<td colspan="3">6. Общая стоимость</td>
													</tr>
													<tr>
														<td style="border-right:1px solid black;">
															6.1. в рублях
															<br/>
															<xsl:value-of select="dca:TotalCustCost"/>
														</td>
														<td style="border-right:1px solid black;">
															6.2. в долларах
															<br/>
														</td>
														<td>
															6.3. в евро
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<xsl:for-each select="dca:Goods">
										<tr>
											<td colspan="2" class="bordered">
												7. ТСЛП № <xsl:value-of select="dca:GoodsNumeric"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												8. Марка, модель ТСЛП
												<br/>
												<xsl:value-of select="dca:MarkaModel"/>
											</td>
											<td class="bordered">
												9. Регистрационный номер ТСЛП
												<br/>
												<xsl:value-of select="dca:TransportRegNum"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												10. VIN (№ кузова) ТСЛП
												<br/>
												<xsl:value-of select="dca:VIN"/>
											</td>
											<td class="bordered">
												11. Код ТН ВЭД ЕАЭС
												<br/>
												<xsl:value-of select="dca:GoodsTNVEDCode"/>
											</td>
										</tr>
										<tr>
											<td class="bordered">
												12. Дата выпуска ТСЛП
												<br/>
												<xsl:value-of select="dca:Date"/>
											</td>
											<td class="bordered">
												13. Объем (мощность) двигателя
												<br/>
												<xsl:value-of select="dca:EngineVolumeQuanity"/>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="2">
												14. Стоимость ТСЛП
												<table width="100%">
													<tbody>
														<tr>
															<td style="border-right:1px solid black;">
																14.1. в рублях
																<br/>
																<xsl:value-of select="dca:Cost/dca:Cost"/>
															</td>
															<td style="border-right:1px solid black;">
																14.2. в долларах
																<br/>
																<xsl:value-of select="dca:Cost/dca:DollarCost"/>
															</td>
															<td>
																14.3. в евро
																<br/>
																<xsl:value-of select="dca:Cost/dca:EuroCost"/>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
										<tr>
											<td class="bordered" colspan="2">
												15. Дополнительная информация, представленные документы
												<br/>
												<xsl:for-each select="dca:PresentedDocuments">
													<xsl:apply-templates mode="document_add" select="."/>
													<xsl:if test="position()!=last()">; </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:for-each>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td width="30%" class="value">
						<xsl:value-of select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonPost"/>
					</td>
					<td/>
					<td width="30%" class="value"/>
					<td/>
					<td width="30%" class="value">
						<xsl:value-of select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonName,1,1)"/>
						<xsl:text>.</xsl:text>
						<xsl:if test="dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
							<xsl:value-of select="substring(dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1,1)"/>
							<xsl:text>.</xsl:text>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="descr">(должность лица, принявшего решение)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и отчества (инициал отчетства указывается при наличии отчества))</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="35%">
						4. Второй экземпляр решения с 
					</td>
					<td width="10%" class="value">
						<xsl:value-of select="dca:SecondExempReceived/adt_cat:AppendixNumber"/>
					</td>
					<td width="20%"> приложениями на </td>
					<td width="10%" class="value">
						<xsl:value-of select="dca:SecondExempReceived/adt_cat:SheetsNumber"/>
					</td>
					<td width="25%">листах получил:</td>
				</tr>
				<tr>
					<td/>
					<td class="descr">(количество приложений)</td>
					<td/>
					<td/>
					<td/>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="50%" class="value">
						<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonMiddleName"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="adt_cat:Passport"/>
					</td>
					<td/>
					<td width="25%" class="value"/>
				</tr>
				<tr>
					<td class="descr">(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества), паспортные данные лица, получившего второй экземпляр решения)</td>
					<td/>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<xsl:call-template name="inlinetable">
			<xsl:with-param name="data">
				<xsl:call-template name="russian_date_month">
					<xsl:with-param name="dateIn" select="dca:SecondExempReceived/adt_cat:Date"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="description" select="'(дата получения второго экземпляра решения)'"/>
			<xsl:with-param name="width" select="'20%'"/>
		</xsl:call-template>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td>
						5. При направлении решения по почте:
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates mode="address" select="dca:DirectionByPost/adt_cat:PostAddress"/>
					</td>
				</tr>
				<tr>
					<td class="descr">(почтовый адрес направления решения – указывается при направлении решения по почте)</td>
				</tr>
			</tbody>
		</table>
		<table width="100%">
			<tbody>
				<tr valign="top">
					<td width="40%" class="value">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="dca:DirectionByPost/adt_cat:Date"/>
						</xsl:call-template>
					</td>
					<td width="10%"/>
					<td width="50%" class="value">
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(дата направления решения по почте)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) и подпись должностного лица таможенного органа, направившего решение по почте)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<xsl:apply-templates mode="footer" select="."/>
	</xsl:template>
	<xsl:template match="dca:DecisionCustomsAudit" mode="decisionChange">
		<table>
			<tbody>
				<tr>
					<td align="center">
						МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>
						(МИНФИН РОССИИ)
						<br/>
						<br/>
						ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА
					</td>
				</tr>
				<tr>
					<td class="value" align="center">
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:OfficeName"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text> (</xsl:text>
						</xsl:if>
						<xsl:value-of select="dca:CustomsIssuedDecision/cat_ru:Code"/>
						<xsl:if test="dca:CustomsIssuedDecision/cat_ru:Code">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="descr">(наименование таможенного органа)</td>
				</tr>
				<tr>
					<td align="center">
						<br/>
						<br/>
						РЕШЕНИЕ
						<br/>
						О ВНЕСЕНИИ ИЗМЕНЕНИЙ (ДОПОЛНЕНИЙ)
						<br/>
						в решение по результатам таможенного контроля
						<br/>
						№ <span style="border-bottom:1px solid black; width:50mm;">
							<xsl:value-of select="dca:DecisionNumber/adt_cat:Number"/>
						</span>
					</td>
				</tr>
				<tr>
					<td class="descr">
						(номер)
					</td>
				</tr>
				<tr>
					<td align="center">
						<xsl:call-template name="russian_date_month">
							<xsl:with-param name="dateIn" select="dca:DecisionNumber/adt_cat:Date"/>
						</xsl:call-template> г.
					</td>
				</tr>
				<xsl:if test="dca:DecisionNumber/adt_cat:Date">
					<tr>
						<td class="descr">
							(дата)
						</td>
					</tr>
				</xsl:if>
				<tr>
					<td>
						<br/>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<table>
			<tbody>
				<tr>
					<td class="indent">
						1. Вводная часть.
					</td>
				</tr>
				<tr>
					<td class="indent">
						1.1. Должностное лицо таможенного органа, принявшее решение:
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:CustomsAuthorizingOrder/adt_cat:CustomsIssuedOrder"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:CustomsAuthorizingOrder/adt_cat:Order" mode="document"/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						1.2. Основание (основания) для внесения изменений:
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:value-of select="dca:Reason"/>
					</td>
				</tr>
				<tr>
					<td>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						2. Резолютивная часть.
					</td>
				</tr>
				<tr>
					<td class="indent">
						На основании изложенного, руководствуясь статьей 218 Федерального закона от ________________ № ______ «О таможенном регулировании»,<br/>РЕШЕНО:
					</td>
				</tr>
				<tr>
					<td class="indent">
						<xsl:text>Внести решение по результатам таможенного контроля от </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="dca:PrevDecisionNumber/adt_cat:Date"/>
								</xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="description" select="'(дата)'"/>
							<xsl:with-param name="width" select="'20%'"/>
							<xsl:with-param name="data_align" select="'center'"/>
						</xsl:call-template>
						<br/>
						<xsl:text> № </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="dca:PrevDecisionNumber/adt_cat:Number"/>
								</xsl:call-template>
							</xsl:with-param>
							<xsl:with-param name="description" select="'(номер)'"/>
							<xsl:with-param name="width" select="'20%'"/>
							<xsl:with-param name="data_align" select="'center'"/>
						</xsl:call-template>
						<xsl:text>, принятое </xsl:text>
						<xsl:call-template name="inlinetable">
							<xsl:with-param name="data">
								<xsl:apply-templates select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson"/>
							</xsl:with-param>
							<xsl:with-param name="description" select="'(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) должностного лица таможенного органа, принявшего изменяемое (дополняемое) решение)'"/>
							<xsl:with-param name="width" select="'100%'"/>
							<xsl:with-param name="data_align" select="'center'"/>
						</xsl:call-template>
						<xsl:text> следующие изменения (дополнения):</xsl:text>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">
						2.1. Изменения (дополнения), вносимые в решение по результатам таможенного контроля (за исключением изменений (дополнений), вносимых в таблицы, указанные в строках 3.2, 3.3, 3.4, 3.5 решения по результатам таможенного контроля):
					</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер строки решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeOther">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">2.2. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.2 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер строки таблицы, указанной в строке 3.2 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeDecisions">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:ChangeDecisions/dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousDecision/dca:Text"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeDecisions/dca:Text"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">2.3. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.3 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер товара</td>
									<td class="bordered" width="10%">Номер графы таблицы, указанной в строке 3.3 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeGoodsInfo">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="dca:NumberGrf"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">2.4. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.4 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер товара</td>
									<td class="bordered" width="10%">Номер графы таблицы, указанной в строке 3.4 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeInfoLP">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="dca:NumberGrf"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
				<tr>
					<td class="indent">2.5. Изменения (дополнения), вносимые в таблицу, указанную в строке 3.5 решения по результатам таможенного контроля:</td>
				</tr>
				<tr>
					<td>
						<table>
							<tbody>
								<tr valign="top" align="center">
									<td class="bordered" width="10%">Номер ТСЛП</td>
									<td class="bordered" width="10%">Номер графы таблицы, указанной в строке 3.5 решения по результатам таможенного контроля</td>
									<td class="bordered">Ранее указанные в строке сведения</td>
									<td class="bordered">Измененные (дополненные) сведения</td>
								</tr>
								<xsl:for-each select="dca:ChangeInfoTSLP">
									<tr valign="top">
										<td class="bordered">
											<xsl:value-of select="dca:NumberString"/>
										</td>
										<td class="bordered">
											<xsl:value-of select="dca:NumberGrf"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:PreviousText"/>
										</td>
										<td class="bordered">
											<xsl:apply-templates select="dca:ChangeText"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr valign="top" align="center">
					<td width="30%" class="value">
						<xsl:value-of select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonPost"/>
					</td>
					<td/>
					<td width="30%" class="value"/>
					<td/>
					<td width="30%" class="value">
						<xsl:value-of select="dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="substring(dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonName,1,1)"/>
						<xsl:text>.</xsl:text>
						<xsl:if test="dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName">
							<xsl:value-of select="substring(dca:CustomsIssuedDecision/adt_cat:ApproverPerson/cat_ru:PersonMiddleName,1,1)"/>
							<xsl:text>.</xsl:text>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td class="descr">(должность лица, принявшего решение)</td>
					<td/>
					<td class="descr">(подпись)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и отчества (инициал отчетства указывается при наличии отчества))</td>
				</tr>
			</tbody>
		</table>
				<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="35%">
						3. Второй экземпляр решения с 
					</td>
					<td width="10%" class="value">
						<xsl:value-of select="dca:SecondExempReceived/adt_cat:AppendixNumber"/>
					</td>
					<td width="20%"> приложениями на </td>
					<td width="10%" class="value">
						<xsl:value-of select="dca:SecondExempReceived/adt_cat:SheetsNumber"/>
					</td>
					<td width="25%">листах получил:</td>
				</tr>
				<tr>
					<td/>
					<td class="descr">(количество приложений)</td>
					<td/>
					<td/>
					<td/>
				</tr>
			</tbody>
		</table>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="50%" class="value">
						<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:SecondExempReceived/cat_ru:PersonMiddleName"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="adt_cat:Passport"/>
					</td>
					<td/>
					<td width="25%" class="value"/>
				</tr>
				<tr>
					<td class="descr">(должность, фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества), паспортные данные лица, получившего второй экземпляр решения)</td>
					<td/>
					<td class="descr">(подпись)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<xsl:call-template name="inlinetable">
			<xsl:with-param name="data">
				<xsl:call-template name="russian_date_month">
					<xsl:with-param name="dateIn" select="dca:SecondExempReceived/adt_cat:Date"/>
				</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="description" select="'(дата получения второго экземпляра решения)'"/>
			<xsl:with-param name="width" select="'20%'"/>
		</xsl:call-template>
		<br/>
		<table width="100%">
			<tbody>
				<tr>
					<td>
						4. При направлении решения по почте:
					</td>
				</tr>
				<tr>
					<td class="value">
						<xsl:apply-templates mode="address" select="dca:DirectionByPost/adt_cat:PostAddress"/>
					</td>
				</tr>
				<tr>
					<td class="descr">(почтовый адрес направления решения – указывается при направлении решения по почте)</td>
				</tr>
			</tbody>
		</table>
		<table width="100%">
			<tbody>
				<tr valign="top">
					<td width="40%" class="value">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="dca:DirectionByPost/adt_cat:Date"/>
						</xsl:call-template>
					</td>
					<td width="10%"/>
					<td width="50%" class="value">
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="dca:DirectionByPost/cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr valign="top">
					<td class="descr">(дата направления решения по почте)</td>
					<td/>
					<td class="descr">(фамилия, инициалы имени и отчества (инициал отчества указывается при наличии отчества) и подпись должностного лица таможенного органа, направившего решение по почте)</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<xsl:apply-templates mode="footer" select="."/>
	</xsl:template>
	<xsl:template mode="footer" match="*">
		<xsl:choose>
			<xsl:when test="dca:AuditOrganization/RUScat_ru:IdentityCard and not(dca:AuditOrganization/cat_ru:RFOrganizationFeatures/cat_ru:KPP)">
				<xsl:text>Для физических лиц.</xsl:text>
				<br/>
				<xsl:text>Настоящее решение может быть обжаловано </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:value-of select="dca:AuditOrganization/cat_ru:OrganizationName"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(фамилия, имя, отчество (отчество указывается при наличии))'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
				<xsl:text> в течение 3-х месяцев со дня его получения в соответствии со статьей 358 Таможенного кодекса Евразийского экономического союза и главой 46 Федерального закона от _____________ № _____ «О таможенном регулировании» в вышестоящий таможенный орган </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data" select="concat(dca:Appeals/dca:CustomsSuperior/cat_ru:OfficeName,' ',dca:Appeals/dca:CustomsSuperior/cat_ru:Code)"/>
					<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
					<xsl:with-param name="width" select="'100%'"/>
					<xsl:with-param name="data_align" select="'center'"/>
				</xsl:call-template>
				<xsl:text>, находящийся по адресу </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:apply-templates mode="address_catru" select="dca:Appeals/dca:CustomsSuperior/dca:Address"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(адрес таможенного органа)'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
				<xsl:text>либо в соответствии со статьей 218 Кодекса административного судопроизводства Российской Федерации в суд, находящийся по адресу: </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:apply-templates mode="address" select="dca:Appeals/dca:ArbitrationCourtAddress"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(адрес суда)'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Для юридических лиц.</xsl:text>
				<br/>
				<xsl:text>Настоящее решение может быть обжаловано </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:value-of select="dca:AuditOrganization/cat_ru:OrganizationName"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(наименование организации)'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
				<xsl:text> в течение 3-х месяцев со дня его получения в соответствии со статьей 358 Таможенного кодекса Евразийского экономического союза и главой 46 Федерального закона от _____________ № _____ «О таможенном регулировании» в вышестоящий таможенный орган </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data" select="dca:Appeals/dca:CustomsSuperior/cat_ru:OfficeName"/>
					<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
				<xsl:text>, находящийся по адресу </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:apply-templates mode="address_catru" select="dca:Appeals/dca:CustomsSuperior/dca:Address"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(адрес таможенного органа)'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
				<xsl:text>, либо в соответствии со статьей 198 Арбитражного процессуального кодекса Российской Федерации в арбитражный суд, находящийся по адресу: </xsl:text>
				<xsl:call-template name="inlinetable">
					<xsl:with-param name="data">
						<xsl:apply-templates mode="address" select="dca:Appeals/dca:ArbitrationCourtAddress"/>
					</xsl:with-param>
					<xsl:with-param name="description" select="'(адрес суда)'"/>
					<xsl:with-param name="width" select="'100%'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="adt_cat:Passport">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="."/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="dca:AuditDisorders">
		<xsl:value-of select="adt_cat:DisorderDescription"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="adt_cat:AKParts"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="adt_cat:LawArticle" mode="document"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="adt_cat:AuditPayments">
			<xsl:apply-templates select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
		<xsl:if test="position()!=last()"><br/><br/></xsl:if>
	</xsl:template>
	<xsl:template match="adt_cat:AuditPayments">
		<xsl:value-of select="adt_cat:PaymentModeCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="adt_cat:PaymentAmount"/>
		<xsl:if test="adt_cat:PaymentCurrencyCode"> (</xsl:if>
		<xsl:value-of select="adt_cat:PaymentCurrencyCode"/>
		<xsl:if test="adt_cat:PaymentCurrencyCode">)</xsl:if>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="not(cat_ru:OrganizationName) and cat_ru:ShortName">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес(а): </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="adt_cat:FactAddress">
			<xsl:text> факт. адрес: </xsl:text>
			<xsl:apply-templates select="adt_cat:FactAddress" mode="address"/>
		</xsl:if>
		<xsl:if test="dca:BirthDay">
			<xsl:text>, дата рождения: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="dca:BirthDay"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="details" match="*">
		<xsl:if test="cat_ru:Phone">
			<xsl:text> т.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="address_catru">
		<xsl:for-each select="cat_ru:CounryName|cat_ru:Region|cat_ru:District|cat_ru:Town|cat_ru:City|cat_ru:StreetHouse|cat_ru:House|cat_ru:Room">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="*" mode="document_add">
		<xsl:value-of select="dca:PresentedDocumentModeCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="number_date">
			<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="*" mode="document">
		<xsl:value-of select="dca:PresentedDocumentModeCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="adt_cat:CustomsIssuedOrder">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:text> </xsl:text>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="adt_cat:ApproverPerson">
		<xsl:for-each select="cat_ru:PersonPost|cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:text> </xsl:text>
		</xsl:for-each>
	</xsl:template>
	<!-- Адрес -->
	<xsl:template name="address">
		<xsl:param name="address"/>
		<xsl:for-each select="$address/*">
			<xsl:if test="local-name()!='CountryCode'">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="month_name">
		<xsl:param name="monthIn"/>
		<xsl:choose>
			<xsl:when test="$monthIn='01'">января</xsl:when>
			<xsl:when test="$monthIn='02'">февраля</xsl:when>
			<xsl:when test="$monthIn='03'">марта</xsl:when>
			<xsl:when test="$monthIn='04'">апреля</xsl:when>
			<xsl:when test="$monthIn='05'">мая</xsl:when>
			<xsl:when test="$monthIn='06'">июня</xsl:when>
			<xsl:when test="$monthIn='07'">июля</xsl:when>
			<xsl:when test="$monthIn='08'">августа</xsl:when>
			<xsl:when test="$monthIn='09'">сентября</xsl:when>
			<xsl:when test="$monthIn='10'">октября</xsl:when>
			<xsl:when test="$monthIn='11'">ноября</xsl:when>
			<xsl:when test="$monthIn='12'">декабря</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>" </xsl:text>
				<xsl:call-template name="month_name">
					<xsl:with-param name="monthIn" select="substring($dateIn,6,2)"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="number_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text/>
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
