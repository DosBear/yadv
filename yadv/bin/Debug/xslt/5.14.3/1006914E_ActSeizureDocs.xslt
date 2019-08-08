<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России  от 05.02.2019 г. № 180 "Об утверждении Порядка изъятия таможенных, транспортных (перевозочных), коммерческих и иных документов, средств идентификации таких документов и товаров для проведения таможенной экспертизы и формы акта об изъятии таможенных, транспортных (перевозочных), коммерческих и иных документов, средств идентификации таких документов и товаров для проведения таможенной экспертизы" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:asd="urn:customs.ru:Information:CustomsAuditDocuments:ActSeizureDocs:5.14.3">
	<xsl:param name="QRCodeValue"/>
	<!-- Шаблон для типа ActSeizureDocsType -->
	<xsl:template match="asd:ActSeizureDocs">
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
					<table class="w180">
						<tbody>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>АКТ<br>об изъятии таможенных, транспортных (перевозочных), 
								</br>
										<br>коммерческих и иных документов, средств идентификации</br>
										<br>таких документов и товаров для проведения</br>
										<br>таможенной экспертизы</br>
									</b>
								</td>
								<xsl:if test="string-length($QRCodeValue) &gt; 0">
									<td width="20%">
										<img src="{$QRCodeValue}" alt="" style="margin-left:5mm;width:30mm;height:30mm;"/>
									</td>
								</xsl:if>
							</tr>
						</tbody>
					</table>
					<table class="w180">
						<tbody>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:value-of select="asd:CustomActArresting/adt_cat:FullOfficeName"/>
									<xsl:if test="not(asd:CustomActArresting/adt_cat:FullOfficeName)">
										<xsl:value-of select="asd:CustomActArresting/cat_ru:OfficeName"/>
									</xsl:if>
									<xsl:if test="asd:CustomActArresting/adt_cat:FullOfficeName|asd:CustomActArresting/cat_ru:OfficeName">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="asd:CustomActArresting/cat_ru:Code"/>
									<xsl:if test="asd:CustomActArresting/adt_cat:FullOfficeName|asd:CustomActArresting/cat_ru:OfficeName">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr">(наименование таможенного органа)</td>
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
											<tr valign="bottom" align="center">
												<td width="35%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="asd:ActDate"/>
													</xsl:call-template>
												</td>
												<td align="right" width="25%">
													<xsl:text>№ </xsl:text>
												</td>
												<td width="40%" class="value">
													<xsl:apply-templates mode="RegNum" select="asd:ActRegNumber"/>
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
								<td>
									<xsl:text>I.  Изъятие  проведено  в  соответствии с пунктом 10 статьи 393 Таможенного кодекса  Евразийского  экономического союза (далее - ТК ЕАЭС) по декларации на  товары  (иным документам в соответствии с пунктом 6 статьи 105 ТК ЕАЭС)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:choose>
										<xsl:when test="asd:DTInfo/asd:DTNumberInfo">
											<xsl:apply-templates mode="RegNum" select="asd:DTInfo/asd:DTNumberInfo"/>
										</xsl:when>
										<xsl:when test="asd:DTInfo/asd:OtherDocument">
											<xsl:apply-templates mode="document" select="asd:DTInfo/asd:OtherDocument"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>На основании решения о назначении таможенной экспертизы </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:if test="asd:DecisionNumber/cat_ru:RegistrationDate">
										<xsl:text> от&#160;</xsl:text>
										<xsl:call-template name="russian_date">
											<xsl:with-param select="asd:DecisionNumber/cat_ru:RegistrationDate" name="dateIn"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="asd:DecisionNumber">
										<xsl:text>&#160;№&#160;</xsl:text>
										<xsl:apply-templates mode="RegNum" select="asd:DecisionNumber"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									<xsl:if test="asd:InitiatorDecision/asd:Name">
										<xsl:value-of select="asd:InitiatorDecision/asd:Name"/>
									</xsl:if>
									<xsl:if test="asd:InitiatorDecision/asd:CustomsCode">
										<xsl:text> (</xsl:text>
										<xsl:value-of select="asd:InitiatorDecision/asd:CustomsCode"/>
										<xsl:text>)</xsl:text>
									</xsl:if>
									<xsl:if test="asd:InitiatorDecision/asd:Address">
										<xsl:text>, </xsl:text>
										<xsl:value-of select="asd:InitiatorDecision/asd:Address"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(дата, номер решения, наименование таможенного органа, вынесшего решение)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Изъятие документов и (или) средств идентификации произведено у: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:apply-templates mode="organization" select="asd:PersonStorDocs"/>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(полное наименование организации (фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица, идентификационный номер налогоплательщика, код причины постановки на учет в налоговых органах (КПП)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Сведения  о  лице,  в присутствии которого произведено изъятие документов и (или) средств идентификации </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:apply-templates select="asd:RespSubject/asd:ResponsiblePerson" mode="person"/>
									<xsl:if test="asd:RespSubject/asd:AuthoritesDocument">
										<xsl:text>, </xsl:text>
										<xsl:apply-templates mode="document" select="asd:RespSubject/asd:AuthoritesDocument"/>
										<xsl:if test="asd:RespSubject/asd:AuthoritesDocument/cat_ru:ComplationAuthorityDate">
											<xsl:text> (до </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param select="asd:RespSubject/asd:AuthoritesDocument/cat_ru:ComplationAuthorityDate" name="dateIn"/>
											</xsl:call-template>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(фамилия, имя, отчество (при наличии), реквизиты  документа, подтверждающего полномочия лица в отношении товара)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Сведения  о понятых, в присутствии которых произведено изъятие документов и (или) средств идентификации: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<xsl:choose>
								<xsl:when test="asd:Witnesses">
									<xsl:for-each select="asd:Witnesses">
										<tr>
											<td align="center" class="value">
												<xsl:apply-templates select="." mode="Witnesses"/>
											</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
										<tr>
											<td class="descr">
												<xsl:text>(фамилия, имя, отчество (при наличии), паспортные данные, место жительства)</xsl:text>
											</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td align="center" class="value">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<xsl:text>(фамилия, имя, отчество (при наличии), паспортные данные, место жительства)</xsl:text>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>II. Изъятие документов и (или) средств идентификации проводилось в: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:apply-templates mode="organization" select="asd:PlaceSeizureDocs"/>
									<xsl:if test="asd:PlaceSeizureDocs/RUScat_ru:IdentityCard">
										<xsl:text>,</xsl:text>
										<xsl:apply-templates mode="identity" select="asd:PlaceSeizureDocs/RUScat_ru:IdentityCard"/>
									</xsl:if>
									<xsl:if test="asd:PlaceSeizureDocs/RUScat_ru:CommunicationDetails">
										<xsl:text>,</xsl:text>
										<xsl:apply-templates mode="сommunication" select="asd:PlaceSeizureDocs/RUScat_ru:CommunicationDetails"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(наименование таможенного органа, учреждения, организации)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>по адресу:</xsl:text>
								</td>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:for-each select="asd:PlaceSeizureDocs/RUScat_ru:SubjectAddressDetails">
										<xsl:apply-templates select="." mode="address"/>
										<xsl:if test="position()!=last()">
											<xsl:text>; </xsl:text>
										</xsl:if>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>III. По настоящему акту изъяты:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody align="center">
											<tr>
												<td width="5%" class="bordered">N п/п</td>
												<td width="35%" class="bordered">Наименование изъятого документа и (или) средства идентификации</td>
												<td width="35%" class="bordered">Реквизиты изъятого документа (при наличии) или описание средства идентификации</td>
												<td width="20%" class="bordered">Количество листов изъятого документа</td>
											</tr>
											<xsl:for-each select="asd:DocsInfo">
												<tr>
													<td class="bordered">
														<xsl:value-of select="position()"/>
													</td>
													<td class="bordered">
														<xsl:value-of select="asd:PrDocumentName"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td class="bordered">
														<xsl:if test="asd:PrDocumentNumber">
															<xsl:text> №  </xsl:text>
															<xsl:value-of select="asd:PrDocumentNumber"/>
														</xsl:if>
														<xsl:if test="asd:PrDocumentDate">
															<xsl:text> от </xsl:text>
															<xsl:call-template name="russian_date">
																<xsl:with-param select="asd:PrDocumentDate" name="dateIn"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:for-each select="asd:DocsDescription">
															<xsl:value-of select="."/>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:for-each>
													</td>
													<td class="bordered">
														<xsl:value-of select="asd:SheetQuantity"/>
													</td>
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
								<td>
									<xsl:text>IV. Изъятые документы и (или) средства идентификации упакованы</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:for-each select="asd:Package">
										<xsl:value-of select="."/>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</xsl:for-each>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(описание упаковки и наименование средства идентификации)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>V. Заявления, замечания присутствующих лиц:</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<xsl:choose>
								<xsl:when test="asd:PersonsNotesInfo">
									<xsl:for-each select="asd:PersonsNotesInfo">
										<tr>
											<td align="center" class="value">
												<xsl:for-each select="asd:Notes">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:if>
												</xsl:for-each>
												<xsl:if test="asd:Proposal">
													<xsl:if test="asd:PersonsNotesInfo|asd:Proposal">
														<xsl:text>; </xsl:text>
													</xsl:if>
													<xsl:for-each select="asd:Proposal">
														<xsl:value-of select="."/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="asd:PersonsNotesInfo|asd:Proposal">
													<xsl:text>(</xsl:text>
												</xsl:if>
												<xsl:apply-templates select="." mode="person"/>
												<xsl:if test="asd:PersonsNotesInfo|asd:Proposal">
													<xsl:text>)</xsl:text>
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td class="descr">
												<xsl:text>(содержание, фамилия, имя, отчество (при наличии) лица, сделавшего заявление или замечание, если есть предложение - указать)</xsl:text>
											</td>
										</tr>
										<tr>
											<td class="delim_3"/>
										</tr>
									</xsl:for-each>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td align="center" class="value">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="descr">
											<xsl:text>(содержание, фамилия, имя, отчество (при наличии) лица, сделавшего заявление или замечание, если есть предложение - указать)</xsl:text>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Акт прочитан. Записано правильно.</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Понятые</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<xsl:choose>
												<xsl:when test="asd:Witnesses">
													<xsl:for-each select="asd:Witnesses">
														<tr>
															<td width="15%"/>
															<td class="value" width="25%"/>
															<td width="5%"/>
															<td class="value" align="center" width="30%">
																<xsl:apply-templates mode="signature" select="."/>
															</td>
															<td width="25%"/>
														</tr>
														<tr>
															<td/>
															<td class="descr" width="25%">
																<xsl:text>(подпись)</xsl:text>
															</td>
															<td/>
															<td class="descr">
																<xsl:text>(фамилия, инициалы)</xsl:text>
															</td>
															<td width="25%"/>
														</tr>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td width="15%"/>
														<td class="value" width="25%"/>
														<td width="5%"/>
														<td class="value" align="center" width="30%"/>
														<td width="25%"/>
													</tr>
													<tr>
														<td/>
														<td class="descr" width="25%">
															<xsl:text>(подпись)</xsl:text>
														</td>
														<td/>
														<td class="descr">
															<xsl:text>(фамилия, инициалы)</xsl:text>
														</td>
														<td width="25%"/>
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
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Присутствующие (участвующие) лица:</xsl:text>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<xsl:choose>
												<xsl:when test="asd:PersonsNotesInfo">
													<xsl:for-each select="asd:PersonsNotesInfo">
														<tr>
															<td width="35%"/>
															<td class="value" width="25%"/>
															<td width="5%"/>
															<td class="value" align="center" width="35%">
																<xsl:apply-templates mode="signature" select="."/>
															</td>
														</tr>
														<tr>
															<td/>
															<td class="descr">
																<xsl:text>(подпись)</xsl:text>
															</td>
															<td/>
															<td class="descr">
																<xsl:text>(фамилия, инициалы)</xsl:text>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td width="15%"/>
														<td class="value" width="25%"/>
														<td width="5%"/>
														<td class="value" align="center" width="35%">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
														<td width="25%"/>
													</tr>
													<tr>
														<td/>
														<td class="descr">
															<xsl:text>(подпись)</xsl:text>
														</td>
														<td/>
														<td class="descr">
															<xsl:text>(фамилия, инициалы)</xsl:text>
														</td>
														<td/>
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
							<tr style="text-align: justify;">
								<td>
									<xsl:text>Акт составил </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3"/>
							</tr>
							<tr>
								<td align="center" class="value">
									<xsl:if test="asd:CustPerson">
										<xsl:apply-templates select="asd:CustPerson" mode="person"/>
									</xsl:if>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="descr">
									<xsl:text>(должность, Ф.И.О. должностного лица таможенного органа)</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td width="60%" class="value"/>
												<td width="40%"/>
											</tr>
											<tr>
												<td class="descr">
													<xsl:text>(подпись должностного лица таможенного органа)</xsl:text>
												</td>
												<td class="descr">
													<xsl:text>(оттиск личной номерной печати)</xsl:text>
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
								<td>
									<table>
										<tbody>
											<tr>
												<td width="35%">
													<xsl:text>Экземпляр акта получил</xsl:text>
												</td>
												<td width="35%" class="value" align="center">
													<xsl:apply-templates mode="signature" select="asd:RespSubject/asd:ResponsiblePerson"/>
												</td>
												<td width="5%"/>
												<td width="25%" class="value"/>
											</tr>
											<tr>
												<td/>
												<td class="descr">
													<xsl:text>(фамилия, инициалы)</xsl:text>
												</td>
												<td/>
												<td class="descr">
													<xsl:text>(подпись)</xsl:text>
												</td>
											</tr>
											<tr>
												<td colspan="4" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td>
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="asd:RespSubject/asd:Date"/>
													</xsl:call-template>
												</td>
												<td colspan="3"/>
											</tr>
											<tr width="35%">
												<td class="descr">
													<xsl:text> (дата получения копии акта)</xsl:text>
												</td>
												<td colspan="3"/>
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
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="signature" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:if test="cat_ru:PersonName">.&#160;</xsl:if>
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="descr"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$descr"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="organization">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">&#160;(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#160;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<xsl:if test="cat_ru:OrganizationName|cat_ru:ShortName">,&#160;</xsl:if>Код страны:&#160;<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:if test="cat_ru:OrganizationName|cat_ru:ShortName|RUScat_ru:CountryA2Code">,&#160;</xsl:if>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<xsl:if test="cat_ru:OrganizationName|cat_ru:ShortName|RUScat_ru:CountryA2Code|RUScat_ru:BusinessEntityTypeCode">,&#160;</xsl:if>ОПФ:&#160;<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:if test="cat_ru:OrganizationName|cat_ru:ShortName|RUScat_ru:CountryA2Code|RUScat_ru:BusinessEntityTypeCode|RUScat_ru:BusinessEntityTypeName">,&#160;</xsl:if>УИТН:&#160;<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">&#160;<xsl:if test="string-length(cat_ru:INN) &gt; 0">ИНН</xsl:if>
			<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">/</xsl:if>
			<xsl:if test="string-length(cat_ru:KPP) &gt; 0">КПП</xsl:if>:&#160;</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">&#160;/&#160;</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<xsl:if test="cat_ru:INN|cat_ru:KPP">,&#160;</xsl:if>ОГРН:&#160;<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">&#160;БИН::&#160;<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#160;/&#160;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">&#160;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">&#160;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#160;/&#160;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#160;/&#160;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#160;/&#160;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">&#160;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">&#160;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">&#160;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">&#160;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">&#160;</span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#160;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#160;(<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template mode="Witnesses" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:if test="adt_cat:Job">
			<xsl:if test="cat_ru:PersonPost">
				<xsl:text> (</xsl:text>
			</xsl:if>
			<xsl:value-of select="adt_cat:Job"/>
			<xsl:if test="cat_ru:PersonPost">
				<xsl:text>)</xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates mode="person" select="."/>
		<xsl:if test="adt_cat:Passport">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates mode="identity" select="adt_cat:Passport"/>
		</xsl:if>
		<xsl:if test="adt_cat:ResidencePlace">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates mode="address" select="adt_cat:ResidencePlace"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="сommunication" match="*">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email:<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
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
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
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
						<xsl:value-of select="substring($dateIn,1,2)"/>
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
	<xsl:template mode="RegNum" match="*">
		<xsl:if test="asd:DeclarationKind">
			<xsl:value-of select="asd:DeclarationKind"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:if test="asd:ExpertisePoint">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="asd:ExpertisePoint"/>
		</xsl:if>
		<xsl:if test="cat_ru:SerialNumber">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:SerialNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:GTDNumber">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:GTDNumber"/>
		</xsl:if>
		<xsl:if test="asd:GTDDocumentID">
			<xsl:text> (уникальный идентификатор ДТ: </xsl:text>
			<xsl:value-of select="asd:GTDDocumentID"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
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
