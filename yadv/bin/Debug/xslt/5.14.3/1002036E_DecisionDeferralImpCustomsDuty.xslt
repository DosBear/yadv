<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 28.02.2019 г. № 342 "Об утверждении форм документов, необходимых для изменения сроков уплаты ввозных таможенных пошлин, налогов в форме отсрочки или 
рассрочки, а также порядков их заполнения, рассмотрения и принятия решения по ним"-->
<!--DocKind=2 - Приложение № 3 "Решение о предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин и (или) налогов"
	 DocKind=1 - Приложение № 4 "Решение об отказе в предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин и (или) налогов"
   	 DocKind=3 - Приложение № 5 "Решение об аннулировании принятоо решения о предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин и (или) налогов"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ddicd="urn:customs.ru:Information:CommercialFinanceDocuments:DecisionDeferralImpCustomsDuty:5.14.3" xmlns:els_agr="urn:customs.ru:Information:ELSDocuments:ELSAggregateTypes:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="ddicd:DecisionDeferralImpCustomsDuty">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
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
					font-style: italic;
					vertical-align:bottom;
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
					vertical-align:top;
					}
					.indent{
					text-indent: 1.5em;
					}

					.delim_3 {
					height: 3pt;
					}

				</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td>
									<b>РЕШЕНИЕ<xsl:choose>
											<xsl:when test="ddicd:DocKind='2'">
												<br>о предоставлении отсрочки или рассрочки уплаты</br>
												<br>ввозных таможенных пошлин и (или) налогов</br>
											</xsl:when>
											<xsl:when test="ddicd:DocKind='1'">
												<br>об отказе в предоставлении отсрочки или рассрочки уплаты</br>
												<br>ввозных таможенных пошлин и (или) налогов</br>
											</xsl:when>
											<xsl:when test="ddicd:DocKind='3'">
												<br>об аннулировании принятого решения о предоставлении отсрочки </br>
												<br>или рассрочки уплаты ввозных таможенных пошлин и (или) налогов</br>
											</xsl:when>
										</xsl:choose>
										<xsl:if test="ddicd:DecisionRegNumber">
											<br>№ </br>
											<xsl:value-of select="ddicd:DecisionRegNumber/ddicd:CustomsCode"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="gtd_date">
												<xsl:with-param select="ddicd:DecisionRegNumber/ddicd:RegistrationDate" name="dateIn"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="ddicd:DecisionRegNumber/ddicd:AbbTermsPay"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="ddicd:DecisionRegNumber/ddicd:AbbBasis"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="ddicd:DecisionRegNumber/ddicd:SerialNumberPrefix"/>
											<xsl:text>/</xsl:text>
											<xsl:value-of select="ddicd:DecisionRegNumber/ddicd:SerialNumber"/>
										</xsl:if>
									</b>
								</td>
							</tr>
							<tr>
								<td class="delim_3"><br/><br/></td>
							</tr>
							<xsl:choose>
								<xsl:when test="ddicd:DocKind='2'">
									<tr>
										<td><xsl:text>1. По результатам рассмотрения заявления</xsl:text></td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td align="center" class="value"><xsl:apply-templates select="ddicd:Applicant"/></td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="5%"><xsl:text>от </xsl:text></td>
														<td width="35%">
															<xsl:call-template name="russian_date_month">
																<xsl:with-param name="dateIn" select="ddicd:DateApplication"/>
															</xsl:call-template>
														</td>
														<td align="center" width="10%"><xsl:text> №  </xsl:text>
														</td>
														<td align="center" class="value" width="30%"><xsl:value-of select="ddicd:NumberApplication"/></td>
														<td width="20%"/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"><br/></td>
									</tr>
									<tr>
										<td>принято решение:</td>
									</tr>
									<tr>
										<td class="delim_3"><br/></td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="15%"><b><xsl:text>предоставить </xsl:text></b></td>
														<td align="center" class="value" width="25%">
															<b>
																<xsl:choose>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='1' or ddicd:DeferralOrDeferredSign='2' or ddicd:DeferralOrDeferredSign='4' or ddicd:DeferralOrDeferredSign='6' or ddicd:DeferralOrDeferredSign='8' ">
																		<xsl:text>отсрочку</xsl:text>
																	</xsl:when>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='3' or ddicd:DeferralOrDeferredSign='5' or ddicd:DeferralOrDeferredSign='7' or ddicd:DeferralOrDeferredSign='9'">
																		<xsl:text>рассрочку</xsl:text>
																	</xsl:when>
																</xsl:choose>
															</b>
														</td>
														<td align="center" width="60%"><b><xsl:text>уплаты ввозных таможенных пошлин</xsl:text></b></td>
													</tr>
													<tr>
														<td/>
														<td class="descr"><xsl:text>(отсрочку / рассрочку)</xsl:text></td>
														<td><br/><b><xsl:text>и (или) налогов в соответствии с:</xsl:text></b></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%" cellspacing="3">
												<tbody>
													<tr>
														<td align="center" class="bordered" width="4%"><xsl:if test="ddicd:BasisGrantingDeferral/ddicd:St59TK_p='1'"><b><xsl:text>x</xsl:text></b></xsl:if></td>
														<td width="96%" style="text-align: justify;"><xsl:text>пунктом 1 статьи 59 Таможенного кодекса Евразийского</xsl:text></td>
													</tr>
													<tr>
														<td/>
														<td><xsl:text>экономического союза;</xsl:text></td>
													</tr>
													<tr>
														<td align="center" class="bordered"><xsl:if test="ddicd:BasisGrantingDeferral/ddicd:St59TK_pp"><b><xsl:text>x</xsl:text></b></xsl:if></td>
														<td style="text-align: justify;"><xsl:text>подпунктом (подпунктами) </xsl:text>
															<span class="value">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:for-each select="ddicd:BasisGrantingDeferral/ddicd:St59TK_pp">
																	<xsl:value-of select="."/>
																	<xsl:if test="position()!=last()">
																		<xsl:text>, </xsl:text>
																	</xsl:if>
																</xsl:for-each>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</span>
															<xsl:text> пункта 2 статьи 59 Таможенного</xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td><xsl:text>кодекса Евразийского экономического союза;</xsl:text></td>
													</tr>
													<tr>
														<td align="center" class="bordered">
															<xsl:if test="ddicd:BasisGrantingDeferral/ddicd:St59TK_p='3'">
																<b><xsl:text>x</xsl:text></b>
															</xsl:if>
														</td>
														<td><xsl:text>пунктом 3 статьи 59 Таможенного кодекса Евразийского</xsl:text></td>
													</tr>
													<tr>
														<td/>
														<td><xsl:text>экономического союза;</xsl:text></td>
													</tr>
													<tr>
														<td align="center" class="bordered"><xsl:if test="ddicd:BasisGrantingDeferral/ddicd:St50FZ_p"><b><xsl:text>x</xsl:text></b></xsl:if></td>
														<td style="text-align: justify;">
															<xsl:text>пунктом (пунктами) </xsl:text>
															<span class="value">
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:for-each select="ddicd:BasisGrantingDeferral/ddicd:St50FZ_p">
																	<xsl:value-of select="."/>
																	<xsl:if test="position()!=last()">
																		<xsl:text>, </xsl:text>
																	</xsl:if>
																</xsl:for-each>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															</span>
															<xsl:text> части 1 статьи 50 Федерального закона</xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td style="text-align: justify;"><xsl:text> от 3 августа 2018 г. "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации",</xsl:text></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%" cellspacing="3">
												<tbody>
													<tr>
														<td width="49%"><xsl:text>по виду таможенного платежа:</xsl:text></td>
														<td align="center" class="bordered" width="4%"><xsl:if test="ddicd:ImportCustomsDuty='true' or ddicd:ImportCustomsDuty='t'  or ddicd:ImportCustomsDuty='1' "><b><xsl:text>х</xsl:text></b></xsl:if></td>
														<td width="57%"><xsl:text>ввозная таможенная пошлина;</xsl:text></td>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td/>
														<td align="center" class="bordered"><xsl:if test="ddicd:Excise='true' or ddicd:Excise='t'  or ddicd:Excise='1' "><b><xsl:text>х</xsl:text></b></xsl:if></td>
														<td><xsl:text>акциз;</xsl:text></td>
													</tr>
													<tr>
														<td colspan="3" class="delim_3"/>
													</tr>
													<tr>
														<td/>
														<td align="center" class="bordered"><xsl:if test="ddicd:ValueAddedTax='true' or ddicd:ValueAddedTax='t'  or ddicd:ValueAddedTax='1' "><b><xsl:text>х</xsl:text></b></xsl:if></td>
														<td><xsl:text>налог на добавленную стоимость</xsl:text></td>
													</tr>
													<tr>
														<td class="delim_3"><br/></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%">2. На сумму: </td>
														<td align="center" class="value" width="65%">
															<xsl:value-of select="translate(translate(format-number(ddicd:TotalAmount, '#,###.00'),',',' '),'.',',')"/>
														</td>
														<td align="right" width="15%"> рублей</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%">3. На срок: </td>
														<td align="center" class="value" width="65%">
															<xsl:value-of select="ddicd:NumberMonths"/>
														</td>
														<td align="right" width="15%">
															<xsl:text>месяцев</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" cellspacing="3">
												<tbody>
													<tr>
														<td width="4%" align="center" class="bordered">
															<xsl:if test="ddicd:PercentAmount='true' or ddicd:PercentAmount='t' or ddicd:PercentAmount='1'">
																<b>
																	<xsl:text>x</xsl:text>
																</b>
															</xsl:if>
														</td>
														<td width="46%">
															<xsl:text>с уплатой процентов в отношении</xsl:text>
														</td>
														<td align="center" class="value" width="50%">
															<xsl:choose>
																<xsl:when test="ddicd:DeferralOrDeferredSign='1' or ddicd:DeferralOrDeferredSign='4' or ddicd:DeferralOrDeferredSign='5'">
																	<xsl:text>ввозной таможенной пошлины</xsl:text>
																</xsl:when>
																<xsl:when test="ddicd:DeferralOrDeferredSign='6' or ddicd:DeferralOrDeferredSign='7'">
																	<small>
																		<xsl:text>ввозной таможенной пошлины и налогов</xsl:text>
																	</small>
																</xsl:when>
																<xsl:when test="ddicd:DeferralOrDeferredSign='8' or ddicd:DeferralOrDeferredSign='9'">
																	<xsl:text>налогов</xsl:text>
																</xsl:when>
															</xsl:choose>
														</td>
													</tr>
													<tr>
														<td/>
														<td/>
														<td valign="top" class="descr">
															<xsl:text>(ввозной таможенной пошлины / налогов)</xsl:text>
														</td>
													</tr>
													<tr>
														<td align="center" class="bordered">
															<xsl:if test="ddicd:PercentAmount='false' or ddicd:PercentAmount='f' or ddicd:PercentAmount='0'">
																<b>
																	<xsl:text>x</xsl:text>
																</b>
															</xsl:if>
														</td>
														<td colspan="2">
															<xsl:text>без уплаты процентов в отношении ввозной пошлины</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr style="text-align: justify;">
										<td>со дня, следующего за днем выпуска в соответствии с таможенной процедурой выпуска для внутреннего потребления товаров, ввозимых на основании следующих документов, подтверждающих совершение внешнеэкономической сделки с товарами:</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<xsl:for-each select="ddicd:BaseDocuments">
										<xsl:choose>
											<xsl:when test="ddicd:PresentedDocumentModeCode='03011' or ddicd:PresentedDocumentModeCode='03012'  or ddicd:PresentedDocumentModeCode= '03013'  or ddicd:PresentedDocumentModeCode='03014'  or ddicd:PresentedDocumentModeCode='03021'  or ddicd:PresentedDocumentModeCode='03022'  or ddicd:PresentedDocumentModeCode='03031' or ddicd:PresentedDocumentModeCode='04021' ">
												<!--or ddicd:PresentedDocumentModeCode='03998' or ddicd:PresentedDocumentModeCode='03999' -->
												<tr>
													<td align="center" class="value">
														<xsl:apply-templates select="." mode="BaseDoc"/>
													</td>
												</tr>
												<tr class="delim_3">
													<td/>
												</tr>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									<xsl:if test="not(ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03011' or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03012'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode= '03013'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03014'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03021'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03022'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03031' or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='04021' )">
										<!--or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03998' or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03999' -->
										<tr>
											<td class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="15%"/>
														<td width="78%"/>
														<td width="7%"/>
													</tr>
													<tr>
														<td colspan="3" style="text-align: justify;">
															<xsl:text>4</xsl:text>
															<span class="descr">
																<sup>1</sup>
															</span>
															<xsl:text>. Исполнение обязанности по уплате ввозных таможенных пошлин, налогов обеспечено </xsl:text>
														</td>
													</tr>
													<tr>
														<td>
															<xsl:text>на сумму </xsl:text>
														</td>
														<td align="center" class="value">
															<xsl:value-of select="translate(translate(format-number(ddicd:Guarantee/ddicd:GuaranteeAmount, '#,###.00'),',',' '),'.',',')"/>
														</td>
														<td>
															<xsl:text>рублей, </xsl:text>
														</td>
													</tr>
													<tr>
														<td colspan="3" style="text-align: justify;">
															<xsl:text>что подтверждается таможенной распиской (таможенными расписками)</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<xsl:choose>
														<xsl:when test="ddicd:Guarantee/ddicd:CustomsReceipt">
															<xsl:for-each select="ddicd:Guarantee/ddicd:CustomsReceipt">
																<tr>
																	<td width="3%">№&#160;</td>
																	<td class="value" align="center" width="45%">
																		<xsl:apply-templates select="ddicd:CustomsReceiptID"/>
																	</td>
																	<td width="15%">&#160;на сумму&#160;</td>
																	<td class="value" align="center" width="30%">
																		<xsl:value-of select="translate(translate(format-number(ddicd:CRAmount, '#,###.00'),',',' '),'.',',')"/>
																	</td>
																	<td width="7%">&#160;рублей, </td>
																</tr>
																<tr>
																	<td class="delim_3" colspan="5"/>
																</tr>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<tr>
																<td width="3%">№&#160;</td>
																<td class="value" align="center" width="45%"/>
																<td width="15%">&#160;на сумму&#160;</td>
																<td class="value" align="center" width="30%"/>
																<td width="7%">&#160;рублей, </td>
															</tr>
														</xsl:otherwise>
													</xsl:choose>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify;">5. Декларирование товаров на основании документов, указанных в разделе 3 настоящего решения, с предоставлением отсрочки (рассрочки) уплаты ввозных таможенных пошлин и (или) налогов будет осуществляться в следующем (следующих) таможенном органе (таможенных органах): будет осуществляться в следующем (следующих) таможенном органе (таможенных органах):</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<xsl:choose>
														<xsl:when test="ddicd:DeclCustoms">
															<xsl:for-each select="ddicd:DeclCustoms">
																<tr>
																	<td width="5%">
																		<xsl:value-of select="position()"/>)&#160;&#160;</td>
																	<td align="center" class="value" width="25%">
																		<xsl:value-of select="cat_ru:Code"/>
																	</td>
																	<td width="5%"/>
																	<td align="center" class="value" width="65%">
																		<xsl:value-of select="cat_ru:OfficeName"/>
																	</td>
																</tr>
																<tr>
																	<td colspan="4" class="delim_3"/>
																</tr>
																<xsl:if test="position()=last()">
																	<tr>
																		<td/>
																		<td class="descr">
																			<xsl:text>(код таможенного органа)</xsl:text>
																		</td>
																		<td/>
																		<td class="descr">
																			<xsl:text>(наименование таможенного органа)</xsl:text>
																		</td>
																	</tr>
																</xsl:if>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<tr>
																<td width="5%"/>
																<td align="center" class="value" width="25%">
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</td>
																<td width="5%"/>
																<td align="center" class="value" width="65%"/>
															</tr>
															<tr>
																<td/>
																<td class="descr">
																	<xsl:text>(код таможенного органа)</xsl:text>
																</td>
																<td/>
																<td class="descr">
																	<xsl:text>(наименование таможенного органа)</xsl:text>
																</td>
															</tr>
														</xsl:otherwise>
													</xsl:choose>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" cellspacing="3">
												<tbody>
													<tr>
														<td width="4%" align="center" class="bordered">
															<xsl:if test="ddicd:TimetableSign='true' or ddicd:TimetableSign='t' or ddicd:TimetableSign='1'">
																<b>x</b>
															</xsl:if>
														</td>
														<td width="97%">
															<xsl:text>График поэтапной уплаты сумм ввозных таможенных пошлин и (или)</xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td>
															<xsl:text>налогов при рассрочке уплаты сумм ввозных таможенных пошлин и (или) налогов прилагается</xsl:text>
															<span class="descr">
																<xsl:text>2</xsl:text>
															</span>
															<xsl:text>.</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>Настоящее решение действительно для подачи декларации на товары в течение четырех месяцев со дня его выдачи.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="ddicd:DocKind='1'">
									<tr>
										<td>
											<xsl:text>1. По результатам рассмотрения заявления</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td align="center" class="value">
											<xsl:apply-templates select="ddicd:Applicant"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="5%">
															<xsl:text>от </xsl:text>
														</td>
														<td width="35%">
															<xsl:call-template name="russian_date_month">
																<xsl:with-param name="dateIn" select="ddicd:DateApplication"/>
															</xsl:call-template>
														</td>
														<td align="center" width="10%">
															<xsl:text> №  </xsl:text>
														</td>
														<td align="center" class="value" width="30%">
															<xsl:value-of select="ddicd:NumberApplication"/>
														</td>
														<td width="20%"/>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="24%">
															<xsl:text>о предоставлении</xsl:text>
														</td>
														<td align="center" class="value" width="22%">
															<xsl:choose>
																<xsl:when test="ddicd:DeferralOrDeferredSign='1' or ddicd:DeferralOrDeferredSign='2' or ddicd:DeferralOrDeferredSign='4' or ddicd:DeferralOrDeferredSign='6' or ddicd:DeferralOrDeferredSign='8' ">
																	<xsl:text>отсрочки</xsl:text>
																</xsl:when>
																<xsl:when test="ddicd:DeferralOrDeferredSign='3' or ddicd:DeferralOrDeferredSign='5' or ddicd:DeferralOrDeferredSign='7' or ddicd:DeferralOrDeferredSign='9'">
																	<xsl:text>рассрочки</xsl:text>
																</xsl:when>
															</xsl:choose>
														</td>
														<td align="center" width="54%">
															<xsl:text>уплаты ввозных таможенных пошлин</xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="descr">
															<xsl:text>(отсрочки / рассрочки)</xsl:text>
														</td>
														<td/>
													</tr>
													<tr>
														<td colspan="3">
															<xsl:text>и (или) налогов по виду таможенного платежа:</xsl:text>
														</td>
													</tr>
													<tr>
														<td colspan="3">
															<table cellspacing="3" width="100%">
																<tbody>
																	<tr>
																		<td width="49%"/>
																		<td align="center" class="bordered" width="4%">
																			<xsl:if test="ddicd:ImportCustomsDuty='true' or ddicd:ImportCustomsDuty='t'  or ddicd:ImportCustomsDuty='1' ">
																				<b>
																					<xsl:text>х</xsl:text>
																				</b>
																			</xsl:if>
																		</td>
																		<td width="57%">
																			<xsl:text>ввозная таможенная пошлина;</xsl:text>
																		</td>
																	</tr>
																	<tr>
																		<td class="delim_3" colspan="3"/>
																	</tr>
																	<tr>
																		<td/>
																		<td align="center" class="bordered">
																			<xsl:if test="ddicd:Excise='true' or ddicd:Excise='t'  or ddicd:Excise='1' ">
																				<b>
																					<xsl:text>х</xsl:text>
																				</b>
																			</xsl:if>
																		</td>
																		<td>
																			<xsl:text>акциз;</xsl:text>
																		</td>
																	</tr>
																	<tr>
																		<td class="delim_3" colspan="3"/>
																	</tr>
																	<tr>
																		<td/>
																		<td align="center" class="bordered">
																			<xsl:if test="ddicd:ValueAddedTax='true' or ddicd:ValueAddedTax='t'  or ddicd:ValueAddedTax='1' ">
																				<b>
																					<xsl:text>х</xsl:text>
																				</b>
																			</xsl:if>
																		</td>
																		<td>
																			<xsl:text>налог на добавленную стоимость</xsl:text>
																		</td>
																	</tr>
																</tbody>
															</table>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%">2. На сумму: </td>
														<td align="center" class="value" width="65%">
															<xsl:value-of select="translate(translate(format-number(ddicd:TotalAmount, '#,###.00'),',',' '),'.',',')"/>
														</td>
														<td align="right" width="15%"> рублей</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%">3. На срок: </td>
														<td align="center" class="value" width="65%">
															<xsl:value-of select="ddicd:NumberMonths"/>
														</td>
														<td align="right" width="15%">
															<xsl:text>месяцев</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr style="text-align: justify;">
										<td>со дня, следующего за днем выпуска в соответствии с таможенной процедурой выпуска для внутреннего потребления товаров, ввозимых на основании следующих документов, подтверждающих совершение внешнеэкономической сделки с товарами:</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<xsl:for-each select="ddicd:BaseDocuments">
										<xsl:choose>
											<xsl:when test="ddicd:PresentedDocumentModeCode='03011' or ddicd:PresentedDocumentModeCode='03012'  or ddicd:PresentedDocumentModeCode= '03013'  or ddicd:PresentedDocumentModeCode='03014'  or ddicd:PresentedDocumentModeCode='03021'  or ddicd:PresentedDocumentModeCode='03022'  or ddicd:PresentedDocumentModeCode='03031' or ddicd:PresentedDocumentModeCode='04021' ">
												<!--or ddicd:PresentedDocumentModeCode='03998' or ddicd:PresentedDocumentModeCode='03999' -->
												<tr>
													<td align="center" class="value">
														<xsl:apply-templates select="." mode="BaseDoc"/>
													</td>
												</tr>
												<tr class="delim_3">
													<td/>
												</tr>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									<xsl:if test="not(ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03011' or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03012'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode= '03013'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03014'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03021'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03022'  or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03031' or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='04021' )">
										<!--or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03998' or ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='03999' -->
										<tr>
											<td class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr style="text-align: justify;">
										<td>принято решение:</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="40%">
															<b>
																<xsl:text>отказать в предоставлении</xsl:text>
															</b>
														</td>
														<td align="center" class="value" width="25%">
															<b>
																<xsl:choose>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='1' or ddicd:DeferralOrDeferredSign='2' or ddicd:DeferralOrDeferredSign='4' or ddicd:DeferralOrDeferredSign='6' or ddicd:DeferralOrDeferredSign='8' ">
																		<xsl:text>отсрочки</xsl:text>
																	</xsl:when>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='3' or ddicd:DeferralOrDeferredSign='5' or ddicd:DeferralOrDeferredSign='7' or ddicd:DeferralOrDeferredSign='9'">
																		<xsl:text>рассрочки</xsl:text>
																	</xsl:when>
																</xsl:choose>
															</b>
														</td>
														<td align="center" width="35%">
															<b>
																<xsl:text>уплаты ввозных</xsl:text>
															</b>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="descr">
															<xsl:text>(отсрочки / рассрочки)</xsl:text>
														</td>
														<td>
															<br/>
														</td>
													</tr>
													<tr>
														<td align="center" colspan="3">
															<b>
																<xsl:text> таможенных пошлин и (или) налогов</xsl:text>
															</b>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr style="text-align: justify;">
										<td>по следующему основанию (следующим основаниям):</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<xsl:choose>
														<xsl:when test="ddicd:FactExclPermitKind">
															<xsl:for-each select="ddicd:FactExclPermitKind">
																<tr>
																	<td>
																		<xsl:value-of select="position()"/>
																		<xsl:text>) </xsl:text>
																	</td>
																	<td align="center" class="value">
																		<xsl:choose>
																			<xsl:when test="current()='1'">
																				<xsl:text>отсутствие основания для предоставления отсрочки или рассрочки, указанного в заявлении</xsl:text>
																			</xsl:when>
																			<xsl:when test="current()='2'">
																				<xsl:text>непредставление на момент подачи заявления, документов, подтверждающих наличие оснований для предоставления отсрочки или рассрочки</xsl:text>
																			</xsl:when>
																			<xsl:when test="current()='3'">
																				<xsl:text>наличие на момент подачи заявления не исполненной в установленный срок обязанности по уплате таможенных платежей</xsl:text>
																			</xsl:when>
																			<xsl:when test="current()='4'">
																				<xsl:text>наличие двух и более фактов привлечения плательщика к административной ответственности за правонарушения в сфере таможенного дела в течение одного года до обращения за предоставлением отсрочки или рассрочки уплаты ввозных таможенных пошлин, налогов</xsl:text>
																			</xsl:when>
																			<xsl:when test="current()='5'">
																				<xsl:text>непредставление документов, подтверждающих предоставление обеспечения исполнения обязанности по уплате ввозных таможенных пошлин, налогов</xsl:text>
																			</xsl:when>
																			<xsl:when test="current()='6'">
																				<xsl:text>возбуждение в отношении учредителей, руководителей плательщика уголовного дела</xsl:text>
																			</xsl:when>
																			<xsl:when test="current()='7'">
																				<xsl:text>возбуждение процедуры банкротства в отношении плательщика</xsl:text>
																			</xsl:when>
																			<xsl:when test="current()='8'">
																				<xsl:text>подача заявления о выпуске товаров до подачи декларации на товары, в отношении которой подано заявление о выпуске товаров до подачи декларации на товары</xsl:text>
																			</xsl:when>
																		</xsl:choose>
																	</td>
																</tr>
																<xsl:if test="position()=1">
																	<tr>
																		<td class="descr" colspan="2">
																			<xsl:text>(указываются причины отказа в предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин и (или) налогов) </xsl:text>
																		</td>
																	</tr>
																</xsl:if>
																<tr>
																	<td class="delim_3" colspan="2"/>
																</tr>
															</xsl:for-each>
														</xsl:when>
														<xsl:otherwise>
															<tr>
																<td colspan="2" class="value"/>
															</tr>
															<tr>
																<td class="descr" colspan="2">
																	<xsl:text>(указываются причины отказа в предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин и (или) налогов) </xsl:text>
																</td>
															</tr>
														</xsl:otherwise>
													</xsl:choose>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
								</xsl:when>
								<xsl:when test="ddicd:DocKind='3'">
									<tr>
										<td>
											<xsl:text>В связи с выявлением:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" cellspacing="3">
												<tbody>
													<tr>
														<td align="center" class="bordered" width="4%">
															<xsl:if test="ddicd:FactExclPermitKind">
																<b>
																	<xsl:text>x</xsl:text>
																</b>
															</xsl:if>
														</td>
														<td style="text-align: justify;" width="96%">
															<xsl:text>обстоятельств, указанных в статье 51 Федерального закона </xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td style="text-align: justify;">
															<xsl:text>от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="delim_3" colspan="2"/>
													</tr>
													<tr>
														<td colspan="2">
															<table width="100%">
																<tbody>
																	<xsl:for-each select="ddicd:FactVolation">
																		<tr>
																			<td width="5%">
																				<xsl:value-of select="position()"/>
																				<xsl:text>) </xsl:text>
																			</td>
																			<td width="95%" align="center" class="value">
																				<xsl:value-of select="."/>
																			</td>
																		</tr>
																		<tr>
																			<td colspan="2" class="delim_3"/>
																		</tr>
																		<xsl:if test="position()=1">
																			<tr>
																				<td/>
																				<td class="descr">
																					<xsl:text>(указываются причины отказа в предоставлении отсрочки или рассрочки уплаты ввозных таможенных пошлин и (или) налогов)</xsl:text>
																				</td>
																			</tr>
																		</xsl:if>
																	</xsl:for-each>
																</tbody>
															</table>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="delim_3">
															<br/>
														</td>
													</tr>
													<tr>
														<td align="center" class="bordered" width="4%">
															<xsl:if test="ddicd:FactFalseInfo">
																<b>
																	<xsl:text>x</xsl:text>
																</b>
															</xsl:if>
														</td>
														<td width="96%" style="text-align: justify;">
															<xsl:text>факта предоставления недостоверных сведений при подаче заявления</xsl:text>
														</td>
													</tr>
													<tr>
														<td/>
														<td style="text-align: justify;">
															<xsl:text>о предоставлении отсрочки или рассрочки уплаты возных таможенных пошлин и (или) налогов, а именно:</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="delim_3" colspan="2"/>
													</tr>
													<xsl:for-each select="ddicd:FactFalseInfo">
														<tr>
															<td>
																<xsl:value-of select="position()"/>
																<xsl:text>) </xsl:text>
															</td>
															<td align="center" class="value">
																<xsl:value-of select="."/>
															</td>
														</tr>
														<tr>
															<td colspan="2" class="delim_3"/>
														</tr>
													</xsl:for-each>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr style="text-align: justify;">
										<td>принято решение:</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="21%"/>
														<td width="79%"/>
													</tr>
													<tr>
														<td align="center" colspan="2">
															<b>
																<xsl:text>аннулировать принятое решение о предоставлении </xsl:text>
															</b>
														</td>
													</tr>
													<tr>
														<td align="center" class="value">
															<b>
																<xsl:choose>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='1' or ddicd:DeferralOrDeferredSign='2' or ddicd:DeferralOrDeferredSign='4' or ddicd:DeferralOrDeferredSign='6' or ddicd:DeferralOrDeferredSign='8' ">
																		<xsl:text>отсрочки</xsl:text>
																	</xsl:when>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='3' or ddicd:DeferralOrDeferredSign='5' or ddicd:DeferralOrDeferredSign='7' or ddicd:DeferralOrDeferredSign='9'">
																		<xsl:text>рассрочки</xsl:text>
																	</xsl:when>
																</xsl:choose>
															</b>
														</td>
														<td>
															<b>
																<xsl:text> уплаты ввозных таможенных пошлин и (или) налогов</xsl:text>
															</b>
														</td>
													</tr>
													<tr>
														<td class="descr">
															<xsl:text>(отсрочки/рассрочки)</xsl:text>
														</td>
														<td>
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table>
												<tbody>
													<tr>
														<td width="4%">
															<xsl:text>№ </xsl:text>
														</td>
														<td class="value" align="center" width="95%">
															<xsl:if test="ddicd:PrevDecisionRegNumber">
																<xsl:value-of select="ddicd:PrevDecisionRegNumber/ddicd:CustomsCode"/>
																<xsl:text>/</xsl:text>
																<xsl:call-template name="gtd_date">
																	<xsl:with-param select="ddicd:PrevDecisionRegNumber/ddicd:RegistrationDate" name="dateIn"/>
																</xsl:call-template>
																<xsl:text>/</xsl:text>
																<xsl:value-of select="ddicd:PrevDecisionRegNumber/ddicd:AbbTermsPay"/>
																<xsl:text>/</xsl:text>
																<xsl:value-of select="ddicd:PrevDecisionRegNumber/ddicd:AbbBasis"/>
																<xsl:text>/</xsl:text>
																<xsl:value-of select="ddicd:PrevDecisionRegNumber/ddicd:SerialNumberPrefix"/>
																<xsl:text>/</xsl:text>
																<xsl:value-of select="ddicd:PrevDecisionRegNumber/ddicd:SerialNumber"/>
															</xsl:if>
														</td>
														<td width="4%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr style="text-align: justify;">
										<td>выданное</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="99%" align="center" class="value">
															<xsl:apply-templates select="ddicd:Applicant"/>
														</td>
														<td valign="bottom" width="1%">
															<xsl:text>,</xsl:text>
														</td>
													</tr>
													<tr class="descr">
														<td colspan="2">(указывается наименование и органиационно-правовая форма юрилического лица / фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица; идентификационный номер налогоплательщика; код причины постановки на учет (для юридического лица)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="20%"/>
														<td width="80%"/>
													</tr>
													<tr>
														<td align="center" colspan="2">
															<b>
																<xsl:text>и отменить по следующей декларации (следующим декларациям) на товары</xsl:text>
															</b>
														</td>
													</tr>
													<tr>
														<td align="center" class="value">
															<b>
																<xsl:choose>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='1' or ddicd:DeferralOrDeferredSign='2' or ddicd:DeferralOrDeferredSign='4' or ddicd:DeferralOrDeferredSign='6' or ddicd:DeferralOrDeferredSign='8' ">
																		<xsl:text>отсрочку</xsl:text>
																	</xsl:when>
																	<xsl:when test="ddicd:DeferralOrDeferredSign='3' or ddicd:DeferralOrDeferredSign='5' or ddicd:DeferralOrDeferredSign='7' or ddicd:DeferralOrDeferredSign='9'">
																		<xsl:text>рассрочку</xsl:text>
																	</xsl:when>
																</xsl:choose>
															</b>
														</td>
														<td>
															<b>
																<xsl:text>уплаты ввозных таможенных пошлин и (или) налогов:</xsl:text>
															</b>
														</td>
													</tr>
													<tr>
														<td class="descr">
															<xsl:text>(отсрочки/рассрочки)</xsl:text>
														</td>
														<td/>
													</tr>
													<tr>
														<td colspan="2" class="delim_3">
															<br/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<xsl:for-each select="ddicd:BaseDocuments">
										<xsl:choose>
											<xsl:when test="ddicd:PresentedDocumentModeCode='09035'">
												<tr>
													<td align="center" class="value">
														<xsl:apply-templates select="." mode="BaseDoc"/>
													</td>
												</tr>
												<tr>
													<td class="delim_3"/>
												</tr>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
									<xsl:if test="not(ddicd:BaseDocuments/ddicd:PresentedDocumentModeCode='09035')">
										<tr>
											<td class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="descr">
											<xsl:text>(указываются номера деклараций на товары, по которым предоставлены отсрочка/рассрочка уплаты ввозных таможенных пошлин и (или) налогов в соответствии с указанным решением)</xsl:text>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td width="40%" valign="bottom">
													<xsl:text>Начальник (заместитель начальника) таможенного органа</xsl:text>
												</td>
												<td class="value" width="15%"/>
												<td width="5%"/>
												<td align="center" class="value" width="40%">
													<xsl:value-of select="ddicd:CustomsChief/cat_ru:PersonName"/>
													<xsl:if test="ddicd:CustomsChief/cat_ru:LNP">
														<xsl:text> (ЛНП: </xsl:text>
														<xsl:value-of select="ddicd:CustomsChief/cat_ru:LNP"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="ddicd:CustomsChief/ddicd:CustomsSubUnit"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="descr">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(фамилия, имя, отчество (при наличии)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="4" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td valign="bottom" width="40%">
													<xsl:text>Начальник (заместитель начальника) структурного подразделения таможенного органа</xsl:text>
												</td>
												<td class="value" width="15%"/>
												<td width="5%"/>
												<td align="center" class="value" width="40%">
													<xsl:value-of select="ddicd:CustomsDepChief/cat_ru:PersonName"/>
													<xsl:if test="ddicd:CustomsDepChief/cat_ru:LNP">
														<xsl:text> (ЛНП: </xsl:text>
														<xsl:value-of select="ddicd:CustomsDepChief/cat_ru:LNP"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="ddicd:CustomsDepChief/ddicd:CustomsSubUnit"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="descr">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(фамилия, имя, отчество (при наличии)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="4" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td width="40%" valign="bottom">
													<xsl:text>Исполнитель</xsl:text>
												</td>
												<td class="value" width="15%"/>
												<td width="5%"/>
												<td align="center" class="value" width="40%">
													<xsl:value-of select="ddicd:CustomsExecutor/cat_ru:PersonName"/>
													<xsl:if test="ddicd:CustomsExecutor/cat_ru:LNP">
														<xsl:text> (ЛНП: </xsl:text>
														<xsl:value-of select="ddicd:CustomsExecutor/cat_ru:LNP"/>
														<xsl:text>)</xsl:text>
													</xsl:if>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													<xsl:value-of select="ddicd:CustomsExecutor/ddicd:CustomsSubUnit"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="descr">
													<xsl:text>(подпись)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(фамилия, имя, отчество (при наличии)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="4" class="delim_3">
													<br/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="ddicd:DocKind='2'">
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="30%"/>
														<td width="70%">
															<br/>
															<br/>
															<br/>
														</td>
													</tr>
													<tr>
														<td class="value"/>
														<td/>
													</tr>
													<tr>
														<td colspan="2" style="text-align: justify;" class="descr">
															<span>
																<sup>1 </sup>
															</span>
															<xsl:text>Раздел не заполняется в случае подачи заявления юридическим лицом, являющимся уполномоченным экономическим оператором, имеющим свидетельство второго или третьего типа.</xsl:text>
														</td>
													</tr>
													<tr>
														<td colspan="2" style="text-align: justify;" class="descr">
															<span>
																<sup>2 </sup>
															</span>
															<xsl:text>Поле заполняется в случае выдачи решения о предоставлении рассрочки уплаты ввозных таможенных пошлин и (или) налогов.</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
						</tbody>
					</table>
				</div>
				<xsl:if test="ddicd:DocKind='2'">
					<xsl:if test="ddicd:TimetablePayment">
						<div class="page">
							<table class="graphMain">
								<tbody>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="40%"/>
														<td width="15%"/>
														<td width="5%"/>
														<td width="40%"/>
													</tr>
													<tr>
														<td/>
														<td colspan="3">
															<xsl:text>УТВЕРЖДАЮ</xsl:text>
															<br>Начальник (заместитель начальника) таможенного органа</br>
														</td>
													</tr>
													<tr>
														<td class="delim_3" colspan="4"/>
													</tr>
													<tr>
														<td/>
														<td class="value">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td/>
														<td align="center" class="value">
															<xsl:value-of select="ddicd:CustomsChief/cat_ru:PersonName"/>
															<xsl:if test="ddicd:CustomsChief/cat_ru:LNP">
																<xsl:text> (ЛНП: </xsl:text>
																<xsl:value-of select="ddicd:CustomsChief/cat_ru:LNP"/>
																<xsl:text>)</xsl:text>
															</xsl:if>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
															<xsl:value-of select="ddicd:CustomsChief/ddicd:CustomsSubUnit"/>
														</td>
													</tr>
													<tr>
														<td/>
														<td class="descr">
															<xsl:text>(подпись)</xsl:text>
														</td>
														<td/>
														<td class="descr">
															<xsl:text>(фамилия, имя, отчество (при наличии)</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="delim_3" colspan="4">
															<br/>
														</td>
													</tr>
													<tr>
														<td colspan="2"/>
														<td colspan="2">
															<xsl:call-template name="russian_date_month"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<b>
												<br/>
												<xsl:text>График поэтапной уплаты сумм ввозных таможенных пошлин и (или) налогов при рассрочке уплаты сумм ввозных таможенных пошлин и (или) налогов</xsl:text>
											</b>
										</td>
									</tr>
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td align="center" class="bordered" width="6%">№ п/п</td>
														<td align="center" class="bordered" width="40%">
															<xsl:text>Количество календарных дней, начиная со дня, следующего за днем выпуска товаров в соответствии с таможенной процедурой выпуска для внутреннего потребеления, не позднее которых будет осуществлена уплата очередной части платежа</xsl:text>
															<span class="descr">
																<xsl:text>1</xsl:text>
															</span>
														</td>
														<td width="54%" class="bordered" align="center">
															<xsl:text>Доля подлежащих уплате сумм ввозных таможенных пошлин и (или) налогов в процентах от общей суммы ввозных таможенных пошлин и (или) налогов, на которую предоставлена рассрочка уплаты при выпуске товаров, %</xsl:text>
															<span class="descr">
																<xsl:text>2</xsl:text>
															</span>
														</td>
													</tr>
													<xsl:for-each select="ddicd:TimetablePayment/ddicd:TimetablePayMoment">
														<tr>
															<td class="bordered" align="center">
																<xsl:value-of select="els_agr:RecNumber"/>
															</td>
															<td class="bordered" align="center">
																<xsl:value-of select="els_agr:NumberDays"/>
															</td>
															<td class="bordered" align="center">
																<xsl:value-of select="els_agr:Percent"/>
															</td>
														</tr>
													</xsl:for-each>
													<tr>
														<td align="center" class="bordered">ИТОГО:</td>
														<td align="center" class="bordered">
															<xsl:value-of select="ddicd:TimetablePayment/ddicd:TotalDays"/>
														</td>
														<td align="center" class="bordered">
															<xsl:value-of select="ddicd:TimetablePayment/ddicd:TotalPercent"/>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td class="value" width="35%"/>
														<td width="15%"/>
														<td class="value" align="center" width="50%"/>
													</tr>
													<tr>
														<td class="descr" align="center" width="35%">(подпись руководителя организации либо уполномоченного им лица, индивидуального предпринимателя или физического лица)</td>
														<td width="15%"/>
														<td class="descr" align="center" width="50%">(фамилия, имя, отчетство (при наличии) руководителя юридического лица лиюо уполномоченного им физического лица)</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
											<br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%">
												<tbody>
													<tr>
														<td width="30%" class="value"/>
														<td width="70%"/>
													</tr>
													<tr>
														<td colspan="2" style="text-align: justify" class="descr">
															<sup>1</sup>
															<xsl:text>Указывается количество календарных дней, не позднее которых будет осуществлена уплата очередной части суммы ввозных таможенных пошлин и (или) налогов, на которую предоставлена рассрока уплаты, в виде количества календарных дней нарастающим итогом начиная со следующего дня после даты выпуска товаров. Общее количество календарных дней, в течение которых будет осуществляться выплата суммы ввозных таможенных пошлин и (или) налогов, на которую предоставлена рассрочка уплаты, по строке "Итоги" не должно превышать количество календарных, составляющих полное число месяцев, указанных в заявлении о предоставлении рассрочки уплаты ввозных таможенных пошлин и (или) налогов.</xsl:text>
														</td>
													</tr>
													<tr>
														<td colspan="2" style="text-align: justify" class="descr">
															<sup>2</sup>
															<xsl:text>Указывается доля ввозных таможенных пошлин и (или налогов), подлежащих уплате в каждм периоде, в вде полного числа процентов от общей суммы ввозных таможенных пошлин и (или) налогов, на которую предоставлена рассрочка уплаты при выпуске товаров. Указание десятичных знаков при заполнении данного раздела не допускается. Сумма долей ввозных таможенных пошлин и (или) налогов,указанных в графе, по строке "Итоги" должна составлять 100 (сто) процентов.</xsl:text>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</xsl:if>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="ddicd:Applicant">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
			<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text disable-output-escaping="yes">,&amp;nbsp;</xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates mode="address" select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">&#160;<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">, </xsl:if>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<br/>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<br/>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<br/>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<br/>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<br/>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<br/>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<br/>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<br/>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<br/>
			<span class="italic">ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<br/>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal">, </span>
		<span class="italic"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">(</span>
			<span class="italic">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic">по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="identity" match="*">
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.), 'Date')">
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
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressKindCode=1">
				<xsl:text>адрес регистрации: </xsl:text>
			</xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode=2">
				<xsl:text>фактический адрес: </xsl:text>
			</xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode=3">
				<xsl:text>почтовый адрес: </xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="value">
						<xsl:value-of select="substring($dateIn,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="value" align="center" style="text-align: center;">
						<xsl:variable name="month" select="substring($dateIn, 6, 2)"/>
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
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">
						<xsl:text>20</xsl:text>
					</td>
					<td width="9%" class="value" align="left">
						<xsl:value-of select="substring($dateIn,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="ddicd:CustomsReceiptID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="ddicd:DocNumberPrefix"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/> от <xsl:call-template name="russian_date">
			<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
		</xsl:call-template> №  <xsl:value-of select="cat_ru:PrDocumentNumber"/>
		<xsl:if test="ddicd:DocumentBeginActionsDate">
			<xsl:if test="cat_ru:PrDocumentName|cat_ru:PrDocumentDate|cat_ru:PrDocumentNumber">
				<xsl:text>,</xsl:text>
			</xsl:if>
			<xsl:text> дата начала действия: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="ddicd:DocumentBeginActionsDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="ddicd:DocumentEndActionsDate">
			<xsl:if test="ddicd:DocumentBeginActionsDate">
				<xsl:text>, </xsl:text>
			</xsl:if>
			<xsl:text>дата окончания действия: </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param select="ddicd:DocumentEndActionsDate" name="dateIn"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="BaseDoc" match="*">
		<xsl:call-template name="document">
			<xsl:with-param name="DocType"/>
		</xsl:call-template>
		<xsl:if test="ddicd:DocArchIdDetails"> (<xsl:if test="ddicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID">ID документа: <xsl:value-of select="ddicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID"/>
			</xsl:if>
			<xsl:if test="ddicd:DocArchIdDetails/catESAD_cu:ElectronicArchID">
				<xsl:if test="ddicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID">,&#160;</xsl:if>ID хранилища: <xsl:value-of select="ddicd:DocArchIdDetails/catESAD_cu:ElectronicArchID"/>
			</xsl:if>
			<xsl:if test="ddicd:DocArchIdDetails/catESAD_cu:DocumentModeID">
				<xsl:if test="ddicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID or ddicd:DocArchIdDetails/catESAD_cu:ElectronicArchID">,&#160;</xsl:if>код вида документа: <xsl:value-of select="ddicd:DocArchIdDetails/catESAD_cu:DocumentModeID"/>
			</xsl:if>)</xsl:if>
	</xsl:template>
	<xsl:template name="gtd_date">
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
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
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
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">20</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;
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
					</xsl:choose> 					
				&#160;</u>&#160;&#160;20<u>
					<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="Goods">
		<xsl:for-each select="ddicd:GoodsDescription">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">&#160;</xsl:if>
		</xsl:for-each>
		<xsl:if test="ddicd:GoodsTNVEDCode"> (</xsl:if>
		<xsl:value-of select="ddicd:GoodsTNVEDCode"/>
		<xsl:if test="ddicd:GoodsTNVEDCode">)</xsl:if>
		<xsl:if test="position()!=last()">;&#160;</xsl:if>
	</xsl:template>
</xsl:stylesheet>