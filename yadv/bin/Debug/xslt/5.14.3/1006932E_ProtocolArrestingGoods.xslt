<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ ФТС России от 21.11.2018 г. № 1876 "Об утверждении форм документов, применяемых таможенными органами в целях обеспечения взыскания таможенных платежей,
специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет имущества и обращения взыскания на товары-->
<!--
Приложение № 6 - Протокол таможенного органа о наложении ареста на имущество (DocKind=1)
Прилжение № 10 - Протокол таможенного органа о наложении ареста на товары (DocKind=2)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pag="urn:customs.ru:Information:CustomsAuditDocuments:ProtocolArrestingGoods:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ProtocolArrestingGoodsType -->
	<xsl:template match="pag:ProtocolArrestingGoods">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									font-family: Arial;}

									div
									{
									/*white-space: nowrap;*/
									}

									div.page {
									width: 180mm;
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
									font-style: italic;
									text-align: center;
									}

									div.title, tr.title td { font-weight:bold;  }
									.bordered { border-collapse: collapse; }
									td.bordered
									{
									border: solid 1px windowtext;
									}

			                        .delim_3 {
				                    height: 3pt;
			                        }

									td.graphMain
									{
									vertical-align:top;
									}
									td.value.graphMain
									{
									vertical-align:bottom;
									}
									.graph8{
									font-size:8pt;
									}
									div.cellwidener {
									margin-top: 0pt;
									margin-left: 0pt;
									margin-bottom: 0pt;
									margin-right: 5pt;
									}
									.indent{
						             text-indent: 1.5em;
					                }	
									underline 
									{ text-decoration: underline; }
								</style>
			</head>
			<body>
				<div class="page">
					<tr>
						<td>
							<table width="100%">
								<tbody>
									<tr>
										<td width="15%"/>
										<td align="center" width="70%">
											<xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
										</td>
										<td width="15%"/>
									</tr>
									<tr>
										<td/>
										<td class="value" align="center" width="70%">
											<xsl:apply-templates select="pag:CustomProtocolArresting"/>
										</td>
										<td/>
									</tr>
									<tr>
										<td/>
										<td class="graph8" align="center" width="70%">
											<xsl:text>(наименование таможенного органа)</xsl:text>
										</td>
										<td/>
									</tr>
									<tr align="center" valign="top">
										<td colspan="3">
											<br/>
											<br/>
											<b>
												<xsl:text>Протокол таможенного органа о наложении ареста</xsl:text>
												<xsl:choose>
													<xsl:when test="pag:DocKind='1'">
														<xsl:text> на имущество</xsl:text>
													</xsl:when>
													<xsl:when test="pag:DocKind='2'">
														<xsl:text> на товары</xsl:text>
													</xsl:when>
												</xsl:choose>
											</b>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td width="35%">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="pag:ProtocolDate" name="date"/>
											</xsl:call-template>
										</td>
										<td width="25%" align="right">
											<xsl:text>№ </xsl:text>
										</td>
										<td width="40%" class="value" align="left">
											<xsl:value-of select="pag:ProtocolNumber"/>
										</td>
									</tr>
									<tr>
										<td class="delim_3" colspan="3">
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:text>Начало: </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="substring(pag:TimeBegin,1,2)"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> ч </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="substring(pag:TimeBegin,4,2)"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> мин.</xsl:text>
										</td>
										<td/>
										<td align="right">
											<xsl:text>Оконачание: </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="substring(pag:TimeBegin,1,2)"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> ч </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="substring(pag:TimeEnd,4,2)"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> мин.</xsl:text>
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
									<tr valign="top" align="center">
										<td class="value">
											<xsl:value-of select="pag:ProtocolPlace"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">(место составления)</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr valign="top" align="center">
										<td class="value">
											<xsl:value-of select="pag:CustomProtocolArresting/pag:CustomsPerson/pag:ClassRank"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:apply-templates mode="personBase" select="pag:CustomProtocolArresting/pag:CustomsPerson"/>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">
											<xsl:text>(должность, фамилия, имя, отчество</xsl:text>
											<span class="graph8">
												<sup>1</sup>
											</span>
											<xsl:text>должностного лица таможенного органа)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>с участием понятых:</xsl:text>
										</td>
									</tr>
									<xsl:for-each select="pag:Witnesses">
										<tr>
											<td>
												<table width="100%">
													<tbody>
														<tr>
															<td valign="top" width="3%">
																<xsl:value-of select="position()"/>
																<xsl:text>.</xsl:text>
															</td>
															<td class="value" width="97%">
																<xsl:apply-templates mode="Witnesses" select="."/>
															</td>
														</tr>
														<tr>
															<td/>
															<td align="center" class="graph8">
																<xsl:text>(должноcть (при наличии), фамилия, имя, отчество</xsl:text>
																<span>
																	<sup>1</sup>
																</span>
																<xsl:text>, паспортные данные)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>с участием специалистов:</xsl:text>
										</td>
									</tr>
									<xsl:for-each select="pag:Specialist">
										<tr>
											<td>
												<table width="100%">
													<tbody>
														<tr>
															<td valign="top" width="3%">
																<xsl:value-of select="position()"/>
																<xsl:text>.</xsl:text>
															</td>
															<td class="value" width="97%">
																<xsl:apply-templates mode="Witnesses" select="."/>
															</td>
														</tr>
														<tr>
															<td/>
															<td align="center" class="graph8">
																<xsl:text>(должноcть (при наличии), фамилия, имя, отчество</xsl:text>
																<span>
																	<sup>1</sup>
																</span>
																<xsl:text>, паспортные данные)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>в присутствии:</xsl:text>
										</td>
									</tr>
									<xsl:for-each select="pag:OtherPersons">
										<tr>
											<td>
												<table width="100%">
													<tbody>
														<tr>
															<td valign="top" width="3%">
																<xsl:value-of select="position()"/>
																<xsl:text>.</xsl:text>
															</td>
															<td class="value" width="97%">
																<xsl:apply-templates mode="Witnesses" select="."/>
															</td>
														</tr>
														<tr>
															<td/>
															<td align="center" class="graph8">
																<xsl:text>(должноcть (при наличии), фамилия, имя, отчество</xsl:text>
																<span>
																	<sup>1</sup>
																</span>
																<xsl:text>, паспортные данные)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>с применением видеозаписи:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value">
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:for-each select="pag:FixInfo">
												<xsl:value-of select="."/>
												<xsl:if test="position()!=last()">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td align="center" class="graph8">
											<xsl:text>(сведения о технических средствах, использованных для проведения видеозаписи)</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>на основании части 27 статьи 78 Федерального закона от 3 августа 2018 г. № 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации" и в соответствии с принятым решением таможенного органа о наложении ареста</xsl:text>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text> на имущество</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text> на товары</xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:text> от </xsl:text>
											<xsl:call-template name="text_date">
												<xsl:with-param select="pag:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="pag:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:if test="pag:DocKind='2'">
												<xsl:text> наложен арест на товары</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<xsl:if test="pag:DocKind='1'">
										<tr>
											<td style="text-align: justify">
												<table width="100%">
													<tbody>
														<tr>
															<td width="20%">
																<xsl:text>наложен </xsl:text>
															</td>
															<td width="40%" align="center" class="value">
																<xsl:choose>
																	<xsl:when test="pag:ArrestKind=1">
																		<xsl:text>полный</xsl:text>
																	</xsl:when>
																	<xsl:when test="pag:ArrestKind=2">
																		<xsl:text>частичный</xsl:text>
																	</xsl:when>
																</xsl:choose>
															</td>
															<td width="40%" align="center">
																<xsl:text> арест на имущество</xsl:text>
															</td>
														</tr>
														<tr>
															<td/>
															<td align="center" class="graph8">
																<xsl:text>(полный или частичный)</xsl:text>
															</td>
															<td/>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td class="delim_3"/>
									</tr>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<tr>
												<td class="value" align="center">
													<xsl:apply-templates mode="organization" select="pag:PersonOwnGoods"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr align="center">
												<td class="graph8">(сведения о лице, на имущество которого наложен арест)<span>
														<sup>2</sup>
													</span>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td>
													<table>
														<tbody>
															<tr>
																<td width="98%" class="value" align="center">
																	<xsl:apply-templates mode="organization" select="pag:PersonOwnGoods"/>
																	<xsl:if test="not(pag:PersonOwnGoods)">
																		<xsl:text>сведения о плательщике отсутствуют</xsl:text>
																	</xsl:if>
																	<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
																</td>
																<td width="2%" valign="bottom">
																	<span>
																		<sup class="graph8">
																			<xsl:text>2</xsl:text>
																		</sup>
																	</span>
																</td>
															</tr>
															<tr align="center">
																<td colspan="2" class="graph8">(сведения о лице, на товары которого наложен арест)<span>
																		<sup>3</sup>
																	</span>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>Лицам, участвующим в производстве ареста</xsl:text>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text> имущества</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text> товаров</xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:text> в качестве понятых, специалистов, а также собственнику имущества, его представителю разъяснены их права и обязанности.</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>Права разъяснены и понятны:</xsl:text>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<span class="graph8">
														<sup>3</sup>
													</span>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<span class="graph8">
														<sup>4</sup>
													</span>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<xsl:for-each select="pag:Witnesses|pag:Specialist|pag:OtherPersons|pag:PersonOwnGoods/adt_cat:ResponsiblePerson">
										<tr>
											<td style="text-align: justify">
												<table width="100%">
													<tbody>
														<tr>
															<td width="5%">
																<xsl:value-of select="position()"/>
																<xsl:text>.</xsl:text>
															</td>
															<td class="value" width="30%">
																<xsl:apply-templates select="." mode="RefusalMark"/>
																<xsl:if test="../../pag:PersonOwnGoods/pag:RefusalMark='false' or ../../pag:PersonOwnGoods/pag:RefusalMark='f' or ../../pag:PersonOwnGoods/pag:RefusalMark='0'">Отказ лица</xsl:if>
															</td>
															<td width="5%"/>
															<td width="40%" align="center" class="value">
																<xsl:apply-templates mode="personBase" select="."/>
															</td>
														</tr>
														<tr>
															<td/>
															<td align="center" class="graph8" valign="top">
																<xsl:text>(подпись)</xsl:text>
															</td>
															<td/>
															<td align="center" class="graph8">
																<xsl:text>(фамилия, имя, отчество</xsl:text>
																<span class="graph8">
																	<sup>1</sup>
																</span>
																<xsl:text>)</xsl:text>
															</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:for-each>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:text>Описи и аресту</xsl:text>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text> подвергнуто следующее имущество:</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text> подвергнуты следующие товары:</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td>
											<xsl:apply-templates mode="Goods" select="."/>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>Всего описано имущества на сумму</xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="pag:TotalCost"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text>рублей </xsl:text>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<span class="graph8">
														<sup>5</sup>
													</span>
													<xsl:text>.</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<span class="graph8">
														<sup>6</sup>
													</span>
													<xsl:text>.</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text>Указанное в настоящем протоколе имущество изъято и передано на хранение</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text>Указанные в настоящем протоколе товары изъяты и переданы на хранение</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="personBase" select="pag:GoodsKeeper"/>
											<xsl:if test="pag:GoodsKeeper/pag:Passport">
												<xsl:apply-templates select="pag:GoodsKeeper/pag:Passport" mode="identity"/>
											</xsl:if>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="pag:GoodsKeeper/pag:AuthoritesDocument">
												<xsl:apply-templates mode="document" select="pag:GoodsKeeper/pag:AuthoritesDocument"/>
											</xsl:if>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">
											<xsl:text>(фамилия, имя, отчество</xsl:text>
											<span>
												<sup>1</sup>
											</span>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text>лица, которому передано под охрану или на хранение изъятое имущество, должность, реквизиты документа, удостоверяющего личность, номер и дата доверенности)</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text>лица, которому переданы под охрану или на хранение изъятые товары, должность, реквизиты документа, удостоверяющего личность, номер и дата доверенности)</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify">
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text>арестованное имущество должно находиться</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text>арестованные товары должны находиться</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:apply-templates mode="organization" select="pag:StorageOrganization"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											<xsl:if test="pag:StorageOrganization/pag:StoragePlace">
												<xsl:text> Место хранения: </xsl:text>
												<xsl:apply-templates select="pag:StorageOrganization/pag:StoragePlace"/>
											</xsl:if>
										</td>
									</tr>
									<tr align="center">
										<td class="graph8">
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text>(наименование организации, адрес и место хранения арестованного имущества)</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text>(наименование организации, адрес и место хранения арестованных товаров)</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text>Лицу, которому передано под охрану или на хранение арестованное имущество, обязанности разъяснены.</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text>Лицу, которому переданы под охрану или на хранение арестованные товары, права и обязанности разъяснены.</xsl:text>
												</xsl:when>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text>Об ответственности, предусмотренной статьей 312 Уголовного кодекса Российской Федерации за растрату, отчуждение, сокрытие или незаконную передачу имущества, подвергнутого аресту, совершенные лицом, которому это имущество вверено, предупрежден</xsl:text>
													<span class="graph8">
														<sup>
															<xsl:text>3</xsl:text>
														</sup>
													</span>
													<xsl:text>:</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text>Об ответственности, предусмотренной статьей 312 Уголовного кодекса Российской Федерации, часть 2 статьи 16.20 Кодекса Российской Федерации об административных правонарушениях, за пользование арестованными товарами без разрешения таможенного органа, растрату, отчуждение, сокрытие или незаконную передачу товаров, подвергнутых аресту, совершенные лицом, которому эти товары вверены, предупрежден</xsl:text>
													<span class="graph8">
														<sup>
															<xsl:text>4</xsl:text>
														</sup>
													</span>
													<xsl:text>:</xsl:text>
												</xsl:when>
											</xsl:choose>
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
														<td class="value" valign="bottom" width="30%">
															<xsl:if test="pag:GoodsKeeper/pag:RefusalMark='false' or pag:GoodsKeeper/pag:RefusalMark='f' or pag:GoodsKeeper/pag:RefusalMark='0'">
																<xsl:text>Отказ лица</xsl:text>
															</xsl:if>
														</td>
														<td width="5%"/>
														<td class="value" width="65%">
															<xsl:apply-templates mode="personBase" select="pag:GoodsKeeper"/>
															<xsl:if test="pag:GoodsKeeper/pag:Passport">
																<xsl:apply-templates select="pag:GoodsKeeper/pag:Passport" mode="identity"/>
															</xsl:if>
															<xsl:if test="pag:GoodsKeeper/pag:Address">
																<xsl:apply-templates select="pag:GoodsKeeper/pag:Address"/>
																<xsl:for-each select="pag:GoodsKeeper/pag:Address">
																	<xsl:apply-templates select="pag:GoodsKeeper/pag:Address"/>
																</xsl:for-each>
															</xsl:if>
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</td>
													</tr>
													<tr>
														<td class="graph8" align="center" valign="top">
															<xsl:text>(подпись)</xsl:text>
														</td>
														<td/>
														<td class="graph8" align="center">
															<xsl:text>(фамилия, имя, отчество</xsl:text>
															<span>
																<sup>1</sup>
															</span>
															<xsl:text> реквизиты документа, удостоверяющего личность, адрес регистрации и фактического проживания</xsl:text>
															<xsl:choose>
																<xsl:when test="pag:DocKind='1'">
																	<span>
																		<sup>6</sup>
																	</span>
																</xsl:when>
																<xsl:when test="pag:DocKind='2'">
																	<span>
																		<sup>7</sup>
																	</span>
																</xsl:when>
															</xsl:choose>
															<xsl:text>)</xsl:text>
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
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>Заявления, замечания лиц, присутствовавших при производстве ареста</xsl:text>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<span class="graph8">
														<sup>
															<xsl:text>7</xsl:text>
														</sup>
													</span>
													<xsl:text> имущества</xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text> товаров </xsl:text>
													<span class="graph8">
														<sup>
															<xsl:text>8</xsl:text>
														</sup>
													</span>
												</xsl:when>
											</xsl:choose>
											<xsl:text>:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="value" align="center">
											<xsl:choose>
												<xsl:when test="pag:PersonsNotesInfo">
													<xsl:for-each select="pag:PersonsNotesInfo">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>Замечаний нет</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>Приложения:</xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3">
											<br/>
										</td>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>1. Копия решения таможенного органа о наложении ареста </xsl:text>
											<xsl:choose>
												<xsl:when test="pag:DocKind='1'">
													<xsl:text> на имущество от </xsl:text>
												</xsl:when>
												<xsl:when test="pag:DocKind='2'">
													<xsl:text> на товары от </xsl:text>
												</xsl:when>
											</xsl:choose>
											<xsl:call-template name="text_date">
												<xsl:with-param select="pag:DecisionArrest/cat_ru:PrDocumentDate" name="date"/>
											</xsl:call-template>
											<xsl:text> № </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="pag:DecisionArrest/cat_ru:PrDocumentNumber"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> на  </xsl:text>
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:value-of select="pag:Applications/pag:Quantity"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
											<xsl:text> листах.  </xsl:text>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>2. Материалы видеозаписи, прилагаемые к настоящему протоколу </xsl:text>
											<span class="value">
												<xsl:if test="pag:Applications/pag:VideoMaterials">
													<xsl:for-each select="pag:Applications/pag:VideoMaterials">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</span>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
									<tr>
										<td style="text-align: justify; text-indent:5%">
											<xsl:text>3. Иные документы, замечания, объяснения, поступившие во время составления протокола </xsl:text>
											<span class="value">
												<xsl:if test="pag:Applications/pag:Other">
													<xsl:for-each select="pag:Applications/pag:Other">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()">
															<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														</xsl:if>
													</xsl:for-each>
												</xsl:if>
											</span>
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td>
							<xsl:apply-templates select="pag:CustomProtocolArresting/pag:CustomsPerson"/>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
							<xsl:text>Лицо (представитель лица),</xsl:text>
							<xsl:choose>
								<xsl:when test="pag:DocKind='1'">
									<xsl:text> на имущество которого налагается арест:</xsl:text>
								</xsl:when>
								<xsl:when test="pag:DocKind='2'">
									<xsl:text> на товары которого налагается арест:</xsl:text>
								</xsl:when>
							</xsl:choose>
							<br/>
							<xsl:apply-templates select="pag:PersonOwnGoods"/>
						</td>
					</tr>
					<tr>
						<td class="delim_3">
							<br/>
						</td>
					</tr>
					<tr>
						<td>
							<br/>
							<xsl:text>Представитель организации, осуществляющей хранение</xsl:text>
							<xsl:choose>
								<xsl:when test="pag:DocKind='1'">
									<xsl:text> арестованного имущества:</xsl:text>
								</xsl:when>
								<xsl:when test="pag:DocKind='2'">
									<xsl:text> арестованных товаров:</xsl:text>
								</xsl:when>
							</xsl:choose>
							<br/>
							<xsl:apply-templates select="pag:GoodsKeeper"/>
						</td>
					</tr>
					<xsl:if test="not(pag:Applications/pag:VideoMaterials) or not (pag:FixInfo)">
						<tr>
							<td>
								<br/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:if test="pag:Witnesses">
									<xsl:text>Понятые</xsl:text>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<sup class="graph8">3</sup>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<sup class="graph8">4</sup>
										</xsl:when>
									</xsl:choose>
									<xsl:text>:</xsl:text>
									<table>
										<tbody>
											<tr>
												<td class="delim_3"/>
											</tr>
											<xsl:for-each select="pag:Witnesses">
												<tr>
													<td class="value" width="40%">
														<xsl:apply-templates select="." mode="RefusalMark"/>
													</td>
													<td width="10%"/>
													<td class="value" width="50%">
														<xsl:apply-templates mode="personBase" select="."/>
													</td>
												</tr>
												<tr>
													<td class="graph8" align="center">
														<xsl:text>(подпись)</xsl:text>
													</td>
													<td width="10%"/>
													<td align="center" class="graph8">
														<xsl:text>(фамилия, имя, отчество</xsl:text>
														<sup>1</sup>
														<xsl:text>)</xsl:text>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="delim_3">
								<br/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:if test="pag:Specialist">
									<xsl:text>Специалисты</xsl:text>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<sup class="graph8">3</sup>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<sup class="graph8">4</sup>
										</xsl:when>
									</xsl:choose>
									<xsl:text>:</xsl:text>
									<table>
										<tbody>
											<tr>
												<td class="delim_3"/>
											</tr>
											<xsl:for-each select="pag:Specialist">
												<tr>
													<td class="value" width="40%">
														<xsl:apply-templates select="." mode="RefusalMark"/>
													</td>
													<td width="10%"/>
													<td class="value" width="50%">
														<xsl:apply-templates mode="personBase" select="."/>
													</td>
												</tr>
												<tr>
													<td class="graph8" align="center">
														<xsl:text>(подпись)</xsl:text>
													</td>
													<td width="10%"/>
													<td align="center" class="graph8">
														<xsl:text>(фамилия, имя, отчество</xsl:text>
														<sup>1</sup>
														<xsl:text>)</xsl:text>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="delim_3">
								<br/>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:if test="pag:OtherPersons">
									<xsl:text>Иные лица, присутствующие при аресте</xsl:text>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<xsl:text> имущества</xsl:text>
											<sup class="graph8">3</sup>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<xsl:text> товаров</xsl:text>
											<sup class="graph8">4</sup>
										</xsl:when>
									</xsl:choose>
									<xsl:text>:</xsl:text>
									<table>
										<tbody>
											<tr>
												<td class="delim_3"/>
											</tr>
											<xsl:for-each select="pag:OtherPersons">
												<tr>
													<td class="value" width="40%">
														<xsl:apply-templates select="." mode="RefusalMark"/>
													</td>
													<td width="10%"/>
													<td class="value" width="50%">
														<xsl:apply-templates mode="personBase" select="."/>
													</td>
												</tr>
												<tr>
													<td class="graph8" align="center">
														<xsl:text>(подпись)</xsl:text>
													</td>
													<td width="10%"/>
													<td align="center" class="graph8">
														<xsl:text>(фамилия, имя, отчество</xsl:text>
														<sup>1</sup>
														<xsl:text>)</xsl:text>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:if>
							</td>
						</tr>
					</xsl:if>
					<tr>
						<td>
							<br/>
							<xsl:text>Копию настоящего протокола таможенного органа о наложении ареста</xsl:text>
							<xsl:choose>
								<xsl:when test="pag:DocKind='1'">
									<xsl:text> на имущество</xsl:text>
								</xsl:when>
								<xsl:when test="pag:DocKind='2'">
									<xsl:text> на товары</xsl:text>
								</xsl:when>
							</xsl:choose>
							<xsl:text> получил:</xsl:text>
							<br/>
							<xsl:apply-templates select="pag:SecondExempReceived"/>
							<br/>
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
										<td width="30%" class="value"/>
										<td width="70%"/>
									</tr>
									<tr>
										<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
											<sup>1 </sup>
											<xsl:text>Отчество указывается при наличии.</xsl:text>
										</td>
									</tr>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>2 </sup>
													<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);			</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен).</xsl:text>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>2 </sup>
													<xsl:text>При отсутствии сведений о плательщике таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: "сведения о плательщике отсутствуют".</xsl:text>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>3 </sup>
													<xsl:text>В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>3 </sup>
													<xsl:text>Указывается для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика, основной государственный регистрационный номер налогоплательщика (если известен);			</xsl:text>
												</td>
											</tr>
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<xsl:text>указывается для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика (индивидуального предпринимателя), основной государственный регистрационный номер предпринимателя (если известен).</xsl:text>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>4 </sup>
													<xsl:text>Указывается при возможности.</xsl:text>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>4 </sup>
													<xsl:text>В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>5 </sup>
													<xsl:text>Заполняется в случае указания стоимости имущества.</xsl:text>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>5 </sup>
													<xsl:text>Указывается при возможности.</xsl:text>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>6 </sup>
													<xsl:text>Адрес фактического проживания указывается при наличии.</xsl:text>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>6 </sup>
													<xsl:text>Заполняется в случае указания стоимости товаров.</xsl:text>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="pag:DocKind='1'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>7 </sup>
													<xsl:text>При отсутствии замечаний вносится запись "Замечаний нет".</xsl:text>
												</td>
											</tr>
										</xsl:when>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>7 </sup>
													<xsl:text>Адрес фактического проживания указывается при наличии.</xsl:text>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="pag:DocKind='2'">
											<tr>
												<td class="graph8" align="left" colspan="2" style="text-align: justify; text-indent:5%;">
													<sup>8 </sup>
													<xsl:text>При отсутствии замечаний вносится запись "Замечаний нет".</xsl:text>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
								</tbody>
							</table>
						</td>
					</tr>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template mode="organization" match="*">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures and (cat_ru:OrganizationName or cat_ru:ShortName)">&#032;<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">,&#032;Код страны:&#032;<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">,&#032;ОПФ:&#032;<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<xsl:for-each select="RUScat_ru:CommunicationDetails">
				<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="normal">,&#032;</span>
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
				<span class="normal">:&#032;</span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">
			<span class="normal">,&#032;</span>
			<span class="italic">ОГРН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span class="normal">,&#032;</span>
			<span class="italic">БИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal">&#032;/&#032;</span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<span class="normal">,&#032;</span>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<span class="normal">,&#032;</span>
			<span class="italic">ИТН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal">&#032;/&#032;</span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal">&#032;/&#032;</span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span class="normal">,&#032;</span>
			<span class="italic">УНП</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">ИНФЛ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<span class="normal">,&#032;</span>
			<span class="italic">УНН</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<span class="normal">,&#032;</span>
			<span class="italic">НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<span class="normal">,&#032;</span>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<span class="italic">, ИНН(ПИН)</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<span class="italic">, ОКПО</span>
			<span class="normal">:&#032;</span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">,&#032;УИТН:&#032;<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">&#032;(<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>)</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode"> Код ОПФ: <xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId"> (по справ. <xsl:value-of select="RUScat_ru:CodeListId"/>)</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone"> Тел: <xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">Факс: <xsl:value-of select="cat_ru:Fax"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:Telex">Телекс: <xsl:value-of select="cat_ru:Telex"/>,&#032;</xsl:if>
		<xsl:if test="cat_ru:E_mail">Email:<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>,&#032;</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails | pag:GoodsLocation | adt_cat:ResidencePlace|pag:StoragePlace|pag:Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressKindCode=1">,&#032;Адрес регистрации: </xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode=2">,&#032;Фактический адрес: </xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode=3">,&#032;Почтовый адрес: </xsl:when>
			<xsl:otherwise>
				<xsl:text>,&#032;Адрес: </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:for-each select="RUScat_ru:PostalCode|RUScat_ru:CountryCode|RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
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
		<xsl:apply-templates mode="personBase" select="."/>
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
		<xsl:apply-templates mode="identity" select="adt_cat:Passport"/>
		<xsl:if test="adt_cat:ResidencePlace">
			<xsl:apply-templates select="adt_cat:ResidencePlace"/>
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
	<xsl:template match="*" mode="Goods">
		<table>
			<tbody width="100%" select="pag:GoodsInfo">
				<tr valign="top" align="center">
					<td class="bordered" width="10%">№ п/п</td>
					<td class="bordered" width="25%">Наименование</td>
					<td class="bordered" width="15%">Количество (ед. изм)</td>
					<td class="bordered" width="30%">Индивидуальные признаки</td>
					<td class="bordered" width="20%">Стоимость (руб.)<xsl:choose>
							<xsl:when test="pag:DocKind='1'">
								<span class="graph8">
									<sup>4</sup>
								</span>
							</xsl:when>
							<xsl:when test="pag:DocKind='2'">
								<span class="graph8">
									<sup>5</sup>
								</span>
							</xsl:when>
						</xsl:choose>
					</td>
				</tr>
				<xsl:for-each select="pag:GoodsInfo">
					<tr align="center">
						<td class="bordered">
							<xsl:value-of select="position()"/>
						</td>
						<td class="bordered">
							<xsl:for-each select="pag:GoodsDescription">
								<!--xsl:apply-templates/-->
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:if test="pag:GoodsQuantity">
								<xsl:value-of select="pag:GoodsQuantity/cat_ru:GoodsQuantity"/>&#160;<xsl:if test="pag:GoodsQuantity/cat_ru:MeasureUnitQualifierName">
									<xsl:value-of select="pag:GoodsQuantity/cat_ru:MeasureUnitQualifierName"/>
								</xsl:if>
								<xsl:if test="pag:GoodsQuantity/cat_ru:MeasureUnitQualifierCode">
													(<xsl:value-of select="pag:GoodsQuantity/cat_ru:MeasureUnitQualifierCode"/>)
													</xsl:if>
							</xsl:if>
						</td>
						<td class="bordered">
							<xsl:for-each select="pag:GoodsCharacteristics">
								<!--xsl:apply-templates/-->
								<xsl:value-of select="."/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</xsl:for-each>
						</td>
						<td class="bordered">
							<xsl:value-of select="pag:Cost"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template mode="document" match="*">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="pag:PersonOwnGoods">
		<table width="100%">
			<tbody>
				<tr>
					<td class="value" colspan="3">
						<xsl:if test="cat_ru:OrganizationName">
							<xsl:value-of select="cat_ru:OrganizationName"/>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">)</xsl:if>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:value-of select="adt_cat:ResponsiblePerson/cat_ru:PersonPost"/>
						<xsl:if test="RUScat_ru:IdentityCard">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates select="RUScat_ru:IdentityCard" mode="identity"/>
						</xsl:if>
						<xsl:if test="adt_cat:AuthoritesDocument">
							<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							<xsl:apply-templates mode="document" select="adt_cat:AuthoritesDocument"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td align="center" class="graph8" colspan="3">
						<xsl:text>(наименование организации (фамилия, инициалы индивидуального предпринимателя), должность лица, реквизиты документа, удостоверяющего личность (реквизиты документа, подтверждающего полномочия лица (при наличии)</xsl:text>
					</td>
				</tr>
				<tr>
					<td class="value" width="35%"/>
					<td width="10%" align="center"/>
					<td class="value" width="55%">
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:apply-templates mode="personBase" select="adt_cat:ResponsiblePerson"/>
					</td>
				</tr>
				<tr align="center" valign="top">
					<td class="graph8">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td/>
					<td class="graph8">(фамилия, имя, отчество<sup>1</sup>
						<xsl:text>)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="pag:CustomProtocolArresting/pag:CustomsPerson">
		<table width="100%">
			<tbody>
				<tr>
					<td colspan="5">Должностное лицо таможенного органа:</td>
				</tr>
				<tr align="center" valign="bottom">
					<td class="value" width="39%" align="left">
						<xsl:choose>
							<xsl:when test="../../pag:DocKind='1'">
								<xsl:value-of select="cat_ru:PersonPost"/>
							</xsl:when>
							<xsl:when test="../../pag:DocKind='2'">
								<xsl:value-of select="pag:ClassRank"/>
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								<xsl:value-of select="cat_ru:PersonPost"/>
							</xsl:when>
						</xsl:choose>
					</td>
					<td width="4%"/>
					<td class="value" width="12%"/>
					<td width="5%"/>
					<td class="value" width="40%">
						<xsl:apply-templates mode="personBase" select="."/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
					</td>
				</tr>
				<tr align="center">
					<td class="graph8">
						<xsl:choose>
							<xsl:when test="../../pag:DocKind='1'">(должность)</xsl:when>
							<xsl:when test="../../pag:DocKind='2'">(должность, классный чин)</xsl:when>
						</xsl:choose>
					</td>
					<td/>
					<td class="graph8">(подпись)</td>
					<td/>
					<td class="graph8">(фамилия, имя, отчество<sup>1</sup>)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="*" mode="personBase">
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:text> </xsl:text>
	</xsl:template>
	<xsl:template match="pag:GoodsKeeper">
		<table width="100%">
			<tbody>
				<tr>
					<td class="value" colspan="4">
						<xsl:if test="pag:Passport">
							<xsl:apply-templates select="pag:Passport" mode="identity"/>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:if test="pag:AuthoritesDocument">
							<xsl:apply-templates mode="document" select="pag:AuthoritesDocument"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td align="center" class="graph8" colspan="4">
						<xsl:text>(должность, реквизиты документа, удостоверяющего личность (реквизиты документа, подтверждающего полномочия представителя лица)</xsl:text>
					</td>
				</tr>
				<tr>
					<td width="40%"/>
					<td width="20%" class="value"/>
					<td width="5%"/>
					<td width="35%" class="value">
						<xsl:apply-templates mode="personBase" select="."/>
					</td>
				</tr>
				<tr>
					<td/>
					<td align="center" class="graph8">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td/>
					<td valign="bottom" align="center" class="graph8">
						<xsl:text>(фамилия, имя, отчество</xsl:text>
						<sup>1</sup>
						<xsl:text>)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="pag:SecondExempReceived">
		<table width="100%">
			<tbody>
				<tr>
					<td class="value" colspan="3">
						<xsl:value-of select="cat_ru:PersonPost"/>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:if test="adt_cat:Passport">
							<xsl:apply-templates select="adt_cat:Passport" mode="identity"/>
						</xsl:if>
						<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
						<xsl:if test="adt_cat:AuthoritesDocument">
							<xsl:apply-templates mode="document" select="adt_cat:AuthoritesDocument"/>
						</xsl:if>
					</td>
				</tr>
				<tr>
					<td align="center" class="graph8" colspan="3">
						<xsl:text>(должность лица, представителя лица), </xsl:text>
						<xsl:choose>
							<xsl:when test="../pag:DocKind='1'">
								<xsl:text> на имущество которого наложен арест имущества)</xsl:text>
							</xsl:when>
							<xsl:when test="../pag:DocKind='2'">
								<xsl:text> на товары которого наложен арест товаров)</xsl:text>
							</xsl:when>
						</xsl:choose>
					</td>
				</tr>
				<tr>
					<td width="40%" class="value"/>
					<td width="10%"/>
					<td width="50%" class="value">
						<xsl:apply-templates mode="personBase" select="."/>
					</td>
				</tr>
				<tr>
					<td align="center" class="graph8">
						<xsl:text>(подпись)</xsl:text>
					</td>
					<td/>
					<td valign="bottom" align="center" class="graph8">
						<xsl:text>(фамилия, имя, отчество</xsl:text>
						<sup>1</sup>
						<xsl:text>)</xsl:text>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="pag:CustomProtocolArresting">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:if test="not(cat_ru:OfficeName) and adt_cat:FullOfficeName">
			<xsl:value-of select="adt_cat:FullOfficeName"/>
		</xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<xsl:template mode="RefusalMark" match="*">
		<xsl:if test="pag:RefusalMark='false' or pag:RefusalMark='f' or pag:RefusalMark='0'">
			<xsl:text>Отказ лица</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="gtd_number" match="*">
		<xsl:if test="./*[local-name()='DocNumberPrefix']">
			<xsl:value-of select="./*[local-name()='DocNumberPrefix']"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:value-of select="./*[local-name()='CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="num_date" select="./*[local-name()='RegistrationDate']"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="./*[local-name()='RegNumber']|./*[local-name()='GTDNumber']"/>
		<xsl:if test="./*[local-name()='Code']">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="./*[local-name()='Code']"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="num_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
	<xsl:template name="text_date">
		<xsl:param name="date"/>«<span class="value">&#160;<xsl:choose>
				<xsl:when test="substring($date,9,2)">
					<xsl:value-of select="substring($date,9,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>»&#160;<span class="value">&#160;<xsl:choose>
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
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>&#160;</span>&#160;<xsl:choose>
			<xsl:when test="substring($date,1,2)">
				<xsl:value-of select="substring($date,1,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>20</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<span class="value">
			<xsl:choose>
				<xsl:when test="substring($date,3,2)">
					<xsl:value-of select="substring($date,3,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">&amp;nbsp;&amp;nbsp;&amp;nbsp;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span> г.</xsl:template>
	<xsl:template name="russian_date" mode="russian_date" match="*">
		<xsl:param name="dateIn" select="."/>
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
