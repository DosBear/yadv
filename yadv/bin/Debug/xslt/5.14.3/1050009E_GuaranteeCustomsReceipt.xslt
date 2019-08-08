<?xml version="1.0" encoding="utf-8"?>

<!-- Бланк регламентируется приказом Минфин России №86н от 09.06.2017, приложение №1 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:grn_cr="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCustomsReceipt:5.14.3">
	<xsl:include href="SumInWords.xslt"/>
	<!-- Шаблон для типа GuaranteeCustomsReceiptType -->
	<xsl:template match="grn_cr:GuaranteeCustomsReceipt">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
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
									font-family: Verdana;
									font-size: 8pt;
									font-weight: bold;
									}

									.graph_under {
									font-family: Verdana;
									font-size: 8pt;
									}

									.sign {
									font-family: Verdana;
									font-size: 10pt;
									font-style: italic;
									font-weight: normal;
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
								<td align="center" class="graphMain graph">
									<font size="4">
										<b>Таможенная расписка</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr>
								<td class="graph" style="border: 1px solid gray;width:50%;">
									1. Регистрационный номер таможенной расписки<br/>
										<span class="sign">
											<xsl:apply-templates select="grn_cr:CustomsReceiptRegNumber"/>
										</span>	
										<br/><br/>
										<xsl:if test="not(grn_cr:CustomsReceiptRegNumber) and grn_cr:DTRegNumber">
											<xsl:text>Рег.номер ДТ </xsl:text>
											<span class="sign">
												<xsl:apply-templates select="grn_cr:DTRegNumber"/>
											</span>	
										</xsl:if>	
								</td>
								<td class="graph" style="border: 1px solid gray;width:50%;">
									<table>
										<tbody>
											<tr>
												<td class="graph" style="border-right:1px solid gray;width:50%">
													2. Способ обеспечения уплаты таможенных пошлин, налогов<br/>
													<xsl:for-each select="grn_cr:WayEnsure">
														<span class="sign">
															<xsl:value-of select="grn_cr:WayEnsureCode"/>
															<xsl:text> </xsl:text>
															<xsl:value-of select="grn_cr:WayEnsureName"/>
														</span>	
													</xsl:for-each>
												</td>
												<td class="graph" style="width:50%" valign="top">
													3. Генеральное обеспечение уплаты таможенных пошлин, налогов<br/>
													<span class="sign">
														<xsl:choose>
															<xsl:when test="grn_cr:GeneralEnsure">
																<xsl:value-of select="grn_cr:GeneralEnsure"/>
															</xsl:when>
															<xsl:otherwise>
															&#8212;
															</xsl:otherwise>
														</xsl:choose>
													</span>	
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graph" style="border-left: 1px solid gray;">
									4. Плательщик таможенных пошлин, налогов
								</td>
								<td class="graph" style="border: 1px solid gray;">
									4.1. Статус плательщика 
									<span class="sign">
										<xsl:if test="grn_cr:PayerDutiesAndTaxes/grn_cr:PersonModeCode='Ф'">Ф</xsl:if>
										<xsl:if test="grn_cr:PayerDutiesAndTaxes/grn_cr:PersonModeCode='О'">О</xsl:if>
									</span>	
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									<span class="sign">
										<xsl:apply-templates select="grn_cr:PayerDutiesAndTaxes"/>
									</span>	
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									5. Лицо, предоставившее обеспечение уплаты таможенных пошлин, налогов
									<br/>
									<span class="sign">
										<xsl:apply-templates select="grn_cr:PersonEnsuring"/>
									</span>	
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									6. Гарант / поручитель / залогодатель
									<br/>
									<span class="sign">
										<xsl:apply-templates select="grn_cr:Guarantor"/>
									</span>	
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									7. Дополнительная информация / предоставляемые документы
									<br/>
									<br/>
									<span class="sign">
										<xsl:for-each select="grn_cr:PresentedDocuments">
											<xsl:value-of select="cat_ru:PrDocumentName"/>
											<xsl:text> № </xsl:text>
											<xsl:value-of select="cat_ru:PrDocumentNumber"/>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
											<xsl:text> </xsl:text>
											<xsl:if test="grn_cr:DocCode">
												<xsl:value-of select="concat('(',grn_cr:DocCode,')')"/>
											</xsl:if>
											<xsl:text> </xsl:text>
											<xsl:choose>
												<xsl:when test="grn_cr:DocumentKind='0'">ДТ</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='1'">Обязательство о подаче ДТ</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='2'">Заявление на условный выпуск</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='3'">Разрешение на временное хранение в иных местах</xsl:when>
												<xsl:when test="grn_cr:DocumentKind='4'">Акт отбора проб и образцов</xsl:when>
											</xsl:choose>
											<xsl:if test="position()!=last()"><br/></xsl:if>
										</xsl:for-each>
									</span>	
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									8. Сведения о принятом обеспечении уплаты таможенных пошлин, налогов<br/><br/>
									<table>
										<tbody>
											<tr>
												<td class="graph" width="10%" style="border-right:1px solid gray;" valign="top" align="center">Вид<br/>платежа</td>
												<td class="graph" width="20%" style="border-right:1px solid gray;" valign="top" align="center">Сумма</td>
												<!--td width="15%" style="border-right:1px solid gray;" valign="top" align="center">Способ обеспечения</td-->
												<td class="graph" width="10%" style="border-right:1px solid gray;" valign="top" align="center">Способ<br/>платежа</td>
												<td class="graph" width="60%" valign="top" align="center">Реквизиты документов обеспечения</td>
											</tr>
											<xsl:for-each select="grn_cr:DetailsEnsure/grn_cr:RecDetailsEnsure">
												<tr>
													<td class="sign" style="border-top:1px solid gray; border-right:1px solid gray;" valign="top" align="center">
														<xsl:value-of select="grn_cr:PaymentModeCode"/>
													</td>
													<td class="sign" style="border-top:1px solid gray; border-right:1px solid gray;" valign="top" align="right">
														<xsl:value-of select="grn_cr:PaymentAmount"/>
													</td>
													<!--td style="border-top:1px solid gray; border-right:1px solid gray;" valign="top">
														<xsl:value-of select="grn_cr:RecDetailsWayEnsure/grn_cr:WayEnsureCode"/>
														<br/>
														<xsl:value-of select="grn_cr:RecDetailsWayEnsure/grn_cr:WayEnsureName"/>
													</td-->
													<td class="sign" style="border-top:1px solid gray; border-right:1px solid gray;" valign="top" align="center">
														<xsl:value-of select="grn_cr:PaymentMethodCode"/>
													</td>
													<td class="sign" style="border-top:1px solid gray;" valign="top">
														<xsl:for-each select="grn_cr:DetailsDocuments">
															<xsl:value-of select="cat_ru:PrDocumentName"/>
															<xsl:text> № </xsl:text>
															<xsl:value-of select="cat_ru:PrDocumentNumber"/>
															<xsl:text> от </xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
															</xsl:call-template>
															<xsl:text> сумма </xsl:text>
															<xsl:value-of select="grn_cr:DocAmount"/>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graph" colspan="2" style="border-left: 1px solid gray;border-right:1px solid gray; border-bottom: 1px solid gray;">
									<xsl:text>Сумма прописью: </xsl:text>
									<span class="sign">
										<xsl:variable name="splittedSum">
											<xsl:value-of select="translate(grn_cr:DetailsEnsure/grn_cr:TotalAmount,'.',',')"/>
										</xsl:variable>
										<xsl:variable name="integerPart">
											<xsl:choose>
												<xsl:when test="substring-before($splittedSum,',')!=''">
													<xsl:value-of  select="substring-before($splittedSum,',')"/>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="$splittedSum"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<xsl:variable name="fractionalPart" select="substring-after($splittedSum,',')"/>
										<xsl:choose>
											<xsl:when test="$integerPart!='0'">
												<xsl:call-template name="RecurseSumWords">
													<xsl:with-param name="Value" select="$integerPart"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
										<xsl:text> руб. </xsl:text>
										<xsl:if test="$fractionalPart!=''">
											<xsl:value-of select="substring(concat($fractionalPart,'00'),1,2)"/>
											<xsl:text> коп.</xsl:text>
										</xsl:if>
									</span>	
								</td>
							</tr>
							<tr>
								<td class="graph" style="border:1px solid gray;" valign="top" width="50%">
									9. Отметки таможенного органа <br/>
									<table width="100%">
										<col width="30%" align="left" valign="top"/>
										<col width="5%" align="left" valign="top"/>
										<col width="65%" align="left" valign="top"/>
										<tbody>
											<tr>
												<td class="sign">
													<table width="100%">
														<tbody>
															<tr>
																<td class="sign">
																	<xsl:choose>
																		<xsl:when test="grn_cr:CustomsReceiptOfficialMark">
																			<xsl:call-template name="russian_date">
																				<xsl:with-param name="dateIn" select="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsReceiptCompletDateTime"/>
																			</xsl:call-template>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="substring(grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsReceiptCompletDateTime, 12, 8)"/>
																		</xsl:when>
																		<xsl:otherwise><br/></xsl:otherwise>
																	</xsl:choose>
																</td>
															</tr>
															<tr>
																<td class="graph_under" style="border-top: solid 1px black;" align="center">
																	<text>(дата, время)</text>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td rowspan="2"></td>
												<td rowspan="2" class="sign">
													<xsl:value-of select="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="grn_cr:CustomsReceiptOfficialMark/grn_cr:CustomsPerson/cat_ru:LNP"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td class="graph" style="border-right:1px solid gray;border-bottom:1px solid gray;" valign="top" width="50%">
									10. Признак корректировки <br/>
									<table width="100%">
										<col width="50%" align="left" valign="top"/>
										<col width="5%" align="left" valign="top"/>
										<col width="45%" align="left" valign="top"/>
										<tbody>
											<tr>
												<td valign="top">
													<table width="100%">
														<tbody>
															<tr>
																<td class="sign" width="50%" valign="top">
																	<xsl:choose>
																		<xsl:when test="grn_cr:CustomsReceiptCorrectMark/grn_cr:LastCorrectDateTime">
																			<xsl:call-template name="russian_date">
																				<xsl:with-param name="dateIn" select="grn_cr:CustomsReceiptCorrectMark/grn_cr:LastCorrectDateTime"/>
																			</xsl:call-template>
																			<xsl:text> </xsl:text>
																			<xsl:value-of select="substring(grn_cr:CustomsReceiptCorrectMark/grn_cr:LastCorrectDateTime,12,8)"/>
																		</xsl:when>
																		<xsl:otherwise><br/></xsl:otherwise>
																	</xsl:choose>
																</td>
															</tr>
															<tr>
																<td class="graph_under" width="50%" style="border-top: solid 1px black;" align="center">
																	<text>(дата, время)</text>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
												<td></td>
												<td class="sign" valign="top">
													<table align="left">
														<tbody>
															<tr style="height:4mm;" align="center">
																<td class="graph" style="width:5mm;">да</td>
																<td class="graph" style="width:4mm;border:1px solid gray;font-family:Arial;">
																	<xsl:if test="grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='t' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='true' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='1'">
																		<xsl:text>v</xsl:text>
																	</xsl:if>
																</td>
																<td class="graph" style="width:5mm;"></td>
																<td class="graph" style="width:5mm;">нет</td>
																<td class="graph" style="width:4mm;border:1px solid gray;font-family:Arial;">
																	<xsl:if test="grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='f' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='false' or grn_cr:CustomsReceiptCorrectMark/grn_cr:CorrectSign='0'">
																		<xsl:text>v</xsl:text>
																	</xsl:if>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td colspan="3" class="sign" valign="top">
													<xsl:value-of select="grn_cr:CustomsReceiptCorrectMark/grn_cr:CustomsPerson/cat_ru:PersonName"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="grn_cr:CustomsReceiptCorrectMark/grn_cr:CustomsPerson/cat_ru:LNP"/>
												</td>
											</tr>

										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="grn_cr:PayerDutiesAndTaxes|grn_cr:PersonEnsuring|grn_cr:Guarantor"><!-- для граф 3, 4, 5-->
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="RUScat_ru:ShortName and not(RUScat_ru:OrganizationName)">
			<xsl:value-of select="RUScat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="grn_cr:OrganizationForm">
			<br/>
			Организационно-правовая форма: <xsl:value-of select="grn_cr:OrganizationForm"/>
		</xsl:if>
		<xsl:if test="grn_cr:Address">
			<br/>
			Адрес: <xsl:apply-templates select="grn_cr:Address"/>
		</xsl:if>
		<xsl:if test="grn_cr:FactAddress">
			<br/>
			Место нахождения: <xsl:apply-templates select="grn_cr:FactAddress"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:RFOrganizationFeatures">
			<br/>
			<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="grn_cr:OKPOID">
			<br/>
			ОКПО: <xsl:value-of select="grn_cr:OKPOID"/>
		</xsl:if>
		<xsl:if test="grn_cr:BirthDate">
			<br/>
			Дата рождения: 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="grn_cr:BirthDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="grn_cr:IdentityCard">
			<br/>
			Документ, удостоверяющий личность: <xsl:apply-templates select="grn_cr:IdentityCard"/>
		</xsl:if>
		<!--xsl:if test="grn_cr:ResidentRFSign">
			<xsl:if test="grn_cr:ResidentRFSign='true' or grn_cr:ResidentRFSign='1' or grn_cr:ResidentRFSign='t' or grn_cr:ResidentRFSign=true or grn_cr:ResidentRFSign='false' or grn_cr:ResidentRFSign='0' or grn_cr:ResidentRFSign='f' or grn_cr:ResidentRFSign=false">
				<br/>
				Резидент: 
				<xsl:if test="grn_cr:ResidentRFSign='true' or grn_cr:ResidentRFSign='1' or grn_cr:ResidentRFSign='t' or grn_cr:ResidentRFSign=true">Да</xsl:if>
				<xsl:if test="grn_cr:ResidentRFSign='false' or grn_cr:ResidentRFSign='0' or grn_cr:ResidentRFSign='f' or grn_cr:ResidentRFSign=false">Нет</xsl:if>
			</xsl:if>	
		</xsl:if-->
		<xsl:if test="grn_cr:RegCountry">
			<br/>
			Страна регистрации / гражданство: <xsl:value-of select="grn_cr:RegCountry"/>
		</xsl:if>
		<xsl:if test="grn_cr:AddressRFForForeign">
			<br/>
			Место жительства в РФ: <xsl:apply-templates select="grn_cr:AddressRFForForeign"/>
		</xsl:if>
		<xsl:if test="grn_cr:Contact">
			<br/>
			Контакты: <xsl:apply-templates select="grn_cr:Contact"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="grn_cr:Contact">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:text> факс: </xsl:text><xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:text> телекс: </xsl:text><xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:text> e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		
	</xsl:template>
	<xsl:template match="grn_cr:IdentityCard">
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
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text> </xsl:text>
			ИНН: <xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text> </xsl:text>
			КПП: <xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="grn_cr:Address|grn_cr:FactAddress|grn_cr:AddressRFForForeign">
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="russian_date_gdt">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="grn_cr:CustomsReceiptRegNumber|grn_cr:DTRegNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="russian_date_gdt">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:if test="grn_cr:DocNumberPrefix">
			<xsl:value-of select="grn_cr:DocNumberPrefix"/>
			<xsl:text>-</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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
