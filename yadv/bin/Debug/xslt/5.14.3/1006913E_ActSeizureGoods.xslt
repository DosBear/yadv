<?xml version="1.0" encoding="utf-8"?>
<!--Приказ ФТС России  от 14.02.2019 г. № 258 "Об утверждении форм документов, составляемых таможенными органами при проведении таможенных проверок, 
порядков их заполнения и порядка внесения изменений в решение о проведении выездной таможенной проверки" 
Приложение № 9 - Акт изъятия товаров (SeizureKind=1)
Приказ ФТС России от 04.12.2018 г. №1980 "Об утверждении форм постановления об изъятии товаров, акта изъятия товаров и акта о возврате изъятых товаров и порядков их заполнения"
Приложение № 2 Акт изъятия товаров (SeizureKind=2)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:adt_cat="urn:customs.ru:Information:CustomsAuditDocuments:AuditCommonAggregateTypesCust:5.14.3" xmlns:asg="urn:customs.ru:Information:CustomsAuditDocuments:ActSeizureGoods:5.14.3">
	<!-- Шаблон для типа ActSeizureGoodsType -->
	<xsl:template match="asg:ActSeizureGoods">
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
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										МИНИСТЕРСТВО ФИНАНСОВ РОССИЙСКОЙ ФЕДЕРАЦИИ<br/>(МИНФИН РОССИИ)<br/>
										<br/>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА<br/>
									</font>
								</td>
							</tr>
							<tr>
								<td class="value" align="center">
									<xsl:value-of select="asg:CustomActArresting/cat_ru:OfficeName"/>
									<xsl:if test="asg:CustomActArresting/cat_ru:OfficeName and asg:CustomActArresting/cat_ru:Code">
										<xsl:text> (</xsl:text>
									</xsl:if>
									<xsl:value-of select="asg:CustomActArresting/cat_ru:Code"/>
									<xsl:if test="asg:CustomActArresting/cat_ru:OfficeName and asg:CustomActArresting/cat_ru:Code">
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td class="descr">(наименование таможенного органа)</td>
							</tr>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>АКТ</b>
									<br/>изъятия товаров
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
											<tr valign="bottom" align="center">
												<td width="35%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="asg:ActDate"/>
													</xsl:call-template>
												</td>
												<td width="30%"/>
												<td width="35%" class="value">
													<xsl:value-of select="asg:ActPlace"/>
												</td>
											</tr>
											<tr>
												<td class="descr"></td>
												<td/>
												<td class="descr">(место составления)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="asg:SeizureKind=1">
								<tr>
									<td>
										<br/>
										<br/>
										<xsl:text>Изъятие товаров начато: </xsl:text>
										<u>&#160;&#160;<xsl:value-of select="substring(asg:ActTimeBegin, 1, 5)"/>&#160;&#160;</u>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:text>Изъятие товаров окончено: </xsl:text>
										<u>&#160;&#160;<xsl:value-of select="substring(asg:ActTimeEnd, 1, 5)"/>&#160;&#160;</u>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="asg:SeizureKind=2">
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td width="40%">Изъятие товаров начато:</td>
													<td class="value" width="45%" align="center">
														<xsl:value-of select="substring(asg:ActTimeBegin, 1, 5)"/>
													</td>
													<td width="25%"/>
												</tr>
												<tr>
													<td/>
													<td class="descr">(время начала изъятия товаров)</td>
													<td/>
												</tr>
												<tr>
													<td>Изъятие товаров окончено:</td>
													<td class="value" align="center">
														<xsl:value-of select="substring(asg:ActTimeEnd, 1, 5)"/>
													</td>
													<td/>
												</tr>
												<tr>
													<td/>
													<td class="descr">(время окончания изъятия товаров)</td>
													<td/>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<br/>
									<xsl:choose>
										<xsl:when test="asg:SeizureKind=1">
											<xsl:text>Должностное лицо таможенного органа:</xsl:text>
										</xsl:when>
										<xsl:when test="asg:SeizureKind=2">
											<xsl:text>Должностным лицом</xsl:text>
										</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="asg:CustomActArresting/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="descr">
											<xsl:if test="asg:SeizureKind=2">
												<xsl:text>(должность, фамилия, имя, отчество (отчество указывается при наличии),  лица, вынесшего постановление об изъятии товаров)</xsl:text>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
										<xsl:with-param name="comma" select="1"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:choose>
										<xsl:when test="asg:SeizureKind=1">
											<xsl:text>руководствуясь подпунктом 6 пункта 2 статьи 335 Таможенного кодекса Евразийского экономического союза, а также статьей 233 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации», и на основании постановления об изъятии товаров</xsl:text>
										</xsl:when>
										<xsl:when test="asg:SeizureKind=2">
											<xsl:text>в соответствии со статьей </xsl:text>
											<u>&#160;&#160;
												<xsl:choose>
													<xsl:when test="asg:Article=1">
														<xsl:text>318</xsl:text>
													</xsl:when>
													<xsl:when test="asg:Article=2">
														<xsl:text>319</xsl:text>
													</xsl:when>
												</xsl:choose>&#160;&#160;</u>
											<xsl:text> Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации» </xsl:text>
											<br/>
											<br>на основании постановления об изъятии товаров</br>
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="person" select="asg:ResolutionInfo/adt_cat:CustomsIssued/adt_cat:ApproverPerson"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="descr">
											<xsl:choose>
												<xsl:when test="asg:SeizureKind=1">
													<xsl:text>(фамилия, имя, отчество (отчество указывается при наличии), должность лица, вынесшего постановление об изъятии товаров)</xsl:text>
												</xsl:when>
												<xsl:when test="asg:SeizureKind=2">
													<xsl:text>(должность, фамилия, имя, отчество (отчество указывается при наличии), начальника таможенного органа либо уполномоченного им лица, вынесшего постановление об изъятии товаров)</xsl:text>
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="5%"> от </td>
												<td width="40%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="asg:ResolutionInfo/adt_cat:Date"/>
													</xsl:call-template>
												</td>
												<td width="45%"/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<xsl:text>в присутствии:</xsl:text>
									<br/>
									<br/>
									<xsl:choose>
										<xsl:when test="asg:SeizureKind=1">
											<xsl:text>проверяемого лица, у которого обнаружены изымаемые товары, либо его представителя:</xsl:text>
										</xsl:when>
										<xsl:when test="asg:SeizureKind=2">
											<xsl:text>лица, у которого обнаружены товары, либо его представителя</xsl:text>
										</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="asg:PersonStorGoods/cat_ru:OrganizationName"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="person" select="asg:PersonStorGoods/adt_cat:ResponsiblePerson"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="identity" select="asg:PersonStorGoods/RUScat_ru:IdentityCard"/>
											<xsl:text> </xsl:text>
											<xsl:apply-templates mode="document" select="asg:PersonStorGoods/adt_cat:AuthoritesDocument"/>
										</xsl:with-param>
										<xsl:with-param name="descr">
											<xsl:choose>
												<xsl:when test="asg:SeizureKind=2">
													<xsl:text>(место работы, должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)</xsl:text>
												</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>понятых:</xsl:text>
									<xsl:choose>
										<xsl:when test="asg:Witnesses">
											<xsl:for-each select="asg:Witnesses">
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="position()"/>
														<xsl:text>. </xsl:text>
														<xsl:apply-templates mode="person_nopost" select="."/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="identity" select="adt_cat:Passport"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="identity" select="adt_cat:ResidencePlace"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'left'"/>
													<xsl:with-param name="descr" select="'(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">&#160;&#160;&#8212;</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="descr" select="'(фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность, место жительства)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
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
								<td>
									<xsl:text>иных лиц:</xsl:text>
									<xsl:choose>
										<xsl:when test="asg:OtherPersons">
											<xsl:for-each select="asg:OtherPersons">
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="position()"/>
														<xsl:text>. </xsl:text>
														<xsl:value-of select="adt_cat:Job"/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="person" select="."/>
														<xsl:text> </xsl:text>
														<xsl:apply-templates mode="identity" select="adt_cat:IdentityCard"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'left'"/>
													<xsl:with-param name="descr" select="'(место работы, должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">&#160;&#160;&#8212;</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="descr" select="'(место работы, должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<xsl:if test="asg:SeizureKind=1">
								<tr>
									<td>
										<table>
											<tbody>
												<td>
													<xsl:text>с участием специалиста:</xsl:text>
												</td>
												<tr>
													<td>
														<xsl:choose>
															<xsl:when test="asg:Specialist">
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<xsl:value-of select="asg:Specialist/adt_cat:Job"/>
																		<xsl:text> </xsl:text>
																		<xsl:apply-templates mode="person" select="asg:Specialist"/>
																		<xsl:text> </xsl:text>
																		<xsl:apply-templates mode="identity" select="asg:Specialist/adt_cat:IdentityCard"/>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'left'"/>
																	<xsl:with-param name="descr" select="'(место работы, должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)'"/>
																	<xsl:with-param name="width" select="'100%'"/>
																	<xsl:with-param name="comma" select="1"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">&#160;&#160;&#8212;</xsl:with-param>
																	<xsl:with-param name="data_align" select="'left'"/>
																	<xsl:with-param name="descr" select="'(место работы, должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа, удостоверяющего личность)'"/>
																	<xsl:with-param name="width" select="'100%'"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
												<tr>
													<td class="delim_3"/>
												</tr>
												<tr>
													<td>
														<xsl:text>которому разъяснены его права и обязанности, установленные статьей 346 Таможенного кодекса Евразийского экономического союза, произведено изъятие следующих товаров:</xsl:text>
													</td>
												</tr>
												<tr>
													<td class="delim_3"/>
												</tr>
												<tr>
													<td class="value">
														<xsl:choose>
															<xsl:when test="asg:GoodsInfo/asg:Goods">
																<xsl:for-each select="asg:GoodsInfo/asg:Goods">
																	<xsl:value-of select="position()"/>
																	<xsl:text>) </xsl:text>
																	<xsl:apply-templates select="asg:GoodsDescription"/>
																	<xsl:if test="asg:GoodsQuantity">
																		<xsl:text>; кол-во: </xsl:text>
																		<xsl:apply-templates mode="quantity" select="asg:GoodsQuantity"/>
																	</xsl:if>
																	<xsl:if test="asg:GoodsCharacteristics">
																		<xsl:text>; индивидуальные признаки: </xsl:text>
																		<xsl:apply-templates select="asg:GoodsCharacteristics"/>
																	</xsl:if>
																	<xsl:if test="position()!=last()">; </xsl:if>
																</xsl:for-each>
															</xsl:when>
															<xsl:when test="not(asg:GoodsInfo/asg:Goods)">
																<xsl:if test="asg:GoodsInfo/asg:InventoryGoodsSign='true' or asg:GoodsInfo/asg:InventoryGoodsSign='t' or asg:GoodsInfo/asg:InventoryGoodsSign='1'">к Акту приложена опись товаров</xsl:if>
																<xsl:if test="asg:GoodsInfo/asg:InventoryGoodsSign='false' or asg:GoodsInfo/asg:InventoryGoodsSign='f' or asg:GoodsInfo/asg:InventoryGoodsSign='0'">к Акту не приложена опись товаров</xsl:if>
															</xsl:when>
														</xsl:choose>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="asg:SeizureKind=2">
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td>
														<xsl:text>произведено изъятие следующих товаров:</xsl:text>
													</td>
												</tr>
												<tr>
													<td class="delim_3"/>
												</tr>
												<tr>
													<td class="value">
														<xsl:choose>
															<xsl:when test="asg:GoodsInfo/asg:Goods">
																<xsl:for-each select="asg:GoodsInfo/asg:Goods">
																	<xsl:value-of select="position()"/>
																	<xsl:text>) </xsl:text>
																	<xsl:apply-templates select="asg:GoodsDescription"/>
																	<xsl:if test="asg:GoodsQuantity">
																		<xsl:text>; кол-во: </xsl:text>
																		<xsl:apply-templates mode="quantity" select="asg:GoodsQuantity"/>
																	</xsl:if>
																	<xsl:if test="asg:GoodsCharacteristics">
																		<xsl:text>; индивидуальные признаки: </xsl:text>
																		<xsl:apply-templates select="asg:GoodsCharacteristics"/>
																	</xsl:if>
																	<xsl:if test="position()!=last()">; </xsl:if>
																</xsl:for-each>
															</xsl:when>
															<xsl:when test="not(asg:GoodsInfo/asg:Goods)">
																<xsl:if test="asg:GoodsInfo/asg:InventoryGoodsSign='true' or asg:GoodsInfo/asg:InventoryGoodsSign='t' or asg:GoodsInfo/asg:InventoryGoodsSign='1'">к Акту приложена опись товаров</xsl:if>
																<xsl:if test="asg:GoodsInfo/asg:InventoryGoodsSign='false' or asg:GoodsInfo/asg:InventoryGoodsSign='f' or asg:GoodsInfo/asg:InventoryGoodsSign='0'">к Акту не приложена опись товаров</xsl:if>
															</xsl:when>
														</xsl:choose>
													</td>
												</tr>
												<tr>
													<td class="descr">(производится описание изъятых товаров с указанием их наименования, индивидуальных признаков, количество либо делается указание о приложении к данному акту описи товаров)</td>
												</tr>
												<tr>
													<td class="delim_3">
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:text>находящихся</xsl:text>
													</td>
												</tr>
												<tr>
													<td class="delim_3">
														<br/>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:choose>
															<xsl:when test="asg:GoodsLocation">
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data">
																		<!--xsl:text>Место хранения: </xsl:text-->
																		<xsl:if test="asg:GoodsLocation/asg:WarehouseSign=1 or asg:GoodsLocation/asg:WarehouseSign='true'"> склад временного хранения </xsl:if>
																		<xsl:if test="asg:GoodsLocation/asg:CertificateNumber">
																			<xsl:text> (свидетельство № </xsl:text>
																			<xsl:value-of select="asg:GoodsLocation/asg:CertificateNumber"/>
																			<xsl:text>) </xsl:text>
																		</xsl:if>
																		<xsl:apply-templates mode="address" select="asg:GoodsLocation/asg:StoragePlace"/>
																	</xsl:with-param>
																	<xsl:with-param name="descr">
																		<xsl:choose>
																			<xsl:when test="asg:SeizureKind=2">
																				<xsl:text>(место нахождения товаров)</xsl:text>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'left'"/>
																	<xsl:with-param name="width" select="'100%'"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="inlinetable">
																	<xsl:with-param name="data"/>
																	<xsl:with-param name="descr">
																		<xsl:choose>
																			<xsl:when test="asg:SeizureKind=2">
																				<xsl:text>(место нахождения товаров)</xsl:text>
																			</xsl:when>
																		</xsl:choose>
																	</xsl:with-param>
																	<xsl:with-param name="data_align" select="'left'"/>
																	<xsl:with-param name="width" select="'100%'"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</td>
												</tr>
											</tbody>
										</table>
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
									<xsl:text>В ходе изъятия товаров проводилась: </xsl:text>
									<xsl:choose>
										<xsl:when test="asg:GoodsInfo/asg:FixInfo">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<br/>
													<br/>
													<xsl:apply-templates select="asg:GoodsInfo/asg:FixInfo"/>
												</xsl:with-param>
												<xsl:with-param name="descr">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=2">
															<xsl:text>(применялась видеозапись)</xsl:text>
														</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=2">&#160;&#160;&#8212;</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="descr">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=2">
															<xsl:text>(применялась видеозапись)</xsl:text>
														</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
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
								<td>
									<xsl:choose>
										<xsl:when test="asg:SeizureKind=1">
											<xsl:text>Средства идентификации:</xsl:text>
										</xsl:when>
										<xsl:when test="asg:SeizureKind=2">
											<xsl:text>В ходе изъятия применялись средства идентификации:</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="asg:Seal">
											<br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<br/>
													<br/>
													<xsl:for-each select="asg:Seal">
														<xsl:value-of select="asg:IdentNumber"/>
														<xsl:text> </xsl:text>
														<xsl:choose>
															<xsl:when test="asg:IdentKind=1">пломба</xsl:when>
															<xsl:when test="asg:IdentKind=2">печать</xsl:when>
															<xsl:when test="asg:IdentKind=3">иное</xsl:when>
														</xsl:choose>
														<xsl:if test="asg:IdentDesc">
															<xsl:text>; прим.: </xsl:text>
															<xsl:value-of select="asg:IdentDesc"/>
														</xsl:if>
														<xsl:if test="asg:Quantity">
															<xsl:text>; кол-во: </xsl:text>
															<xsl:value-of select="asg:Quantity"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:with-param>
												<xsl:with-param name="descr">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=2">
															<xsl:text>(указываются средства идентификации, в том числе о наложении пломб, печатей)</xsl:text>
														</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data"/>
												<xsl:with-param name="descr">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=2">
															<xsl:text>(указываются средства идентификации, в том числе о наложении пломб, печатей)</xsl:text>
														</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
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
								<td>
									<xsl:text>Изъятые товары будут переданы на хранение </xsl:text>
									<!--xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="organization" select="asg:PersonStorGoods"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template-->
									<xsl:choose>
										<xsl:when test="asg:StoragePlaceInfo/asg:StoragePlace">
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<!--xsl:text>Место хранения: </xsl:text-->
													<xsl:if test="asg:StoragePlaceInfo/asg:WarehouseSign=1 or asg:StoragePlaceInfo/asg:WarehouseSign='true'"> склад временного хранения </xsl:if>
													<xsl:if test="asg:StoragePlaceInfo/asg:CertificateNumber">
														<xsl:text> (свидетельство № </xsl:text>
														<xsl:value-of select="asg:StoragePlaceInfo/asg:CertificateNumber"/>
														<xsl:text>) </xsl:text>
													</xsl:if>
													<xsl:apply-templates mode="address" select="asg:StoragePlaceInfo/asg:StoragePlace"/>
												</xsl:with-param>
												<xsl:with-param name="descr">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=2">
															<xsl:text>(указывается место хранения)</xsl:text>
														</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data"/>
												<xsl:with-param name="descr">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=2">
															<xsl:text>(указывается место хранения)</xsl:text>
														</xsl:when>
													</xsl:choose>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
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
								<td>
									<xsl:text>Замечания: </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="asg:PersonsNotesInfo">
													<xsl:apply-templates select="asg:PersonsNotesInfo"/>
												</xsl:when>
												<xsl:otherwise>  замечания отсутствуют</xsl:otherwise>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="descr" select="'(содержание замечаний лиц, участвовавших в производстве изъятия или присутствовавших при его проведении, либо указание на отсутствие замечаний)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<td class="delim_3">
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text>Приложение: </xsl:text>
									<xsl:choose>
										<xsl:when test="asg:Applications">
											<xsl:for-each select="asg:Applications">
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="asg:AppName"/> на <xsl:value-of select="asg:Quantity"/>
														<xsl:text> </xsl:text>
														<xsl:value-of select="asg:MeasureUnitQualifierName"/>
														<xsl:if test="position()!=last()">,&#160;</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'left'"/>
													<xsl:with-param name="width" select="'100%'"/>
												</xsl:call-template>
											</xsl:for-each>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:if test="asg:SeizureKind=2">&#160;&#160;&#8212;</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'left'"/>
												<xsl:with-param name="width" select="'100%'"/>
											</xsl:call-template>
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
								<td>
									<table>
										<tbody>
											<xsl:if test="asg:SeizureKind=2">
												<tr>
													<td colspan="4">Подписи:</td>
												</tr>
												<tr>
													<td class="delim_3">
														<br/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td colspan="4">
													<xsl:choose>
														<xsl:when test="asg:SeizureKind=1">Проверяемое лицо, у которого обнаружены изымаемые товары (его представитель):</xsl:when>
														<xsl:otherwise>Лицо, у которого обнаружены<br/>изымаемые товары, либо его<br/>представитель:</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
											<tr>
												<td width="41%"/>
												<td width="20%" class="value"/>
												<td width="5%"/>
												<td width="34%" class="value">
													<xsl:apply-templates mode="signature" select="asg:PersonStorGoods/adt_cat:ResponsiblePerson"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="descr">(подпись)</td>
												<td/>
												<td class="descr">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td colspan="4">Понятые:</td>
											</tr>
											<xsl:choose>
												<xsl:when test="asg:Witnesses">
													<xsl:for-each select="asg:Witnesses">
														<tr>
															<td width="41%"/>
															<td width="20%" class="value"/>
															<td width="5%"/>
															<td width="34%" class="value">
																<xsl:apply-templates mode="signature" select="."/>
															</td>
														</tr>
														<tr>
															<td/>
															<td class="descr">(подпись)</td>
															<td/>
															<td class="descr">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества)</td>
														</tr>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td width="41%"/>
														<td width="20%" class="value"/>
														<td width="5%"/>
														<td width="34%" class="value"/>
													</tr>
													<tr>
														<td/>
														<td class="descr">(подпись)</td>
														<td/>
														<td class="descr">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества)</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td colspan="4">Иные присутствующие лица:</td>
											</tr>
											<xsl:choose>
												<xsl:when test="asg:OtherPersons">
													<xsl:for-each select="asg:OtherPersons">
														<tr>
															<td width="41%"/>
															<td width="20%" class="value"/>
															<td width="5%"/>
															<td width="34%" class="value">
																<xsl:apply-templates mode="signature" select="."/>
															</td>
														</tr>
														<tr>
															<td/>
															<td class="descr">(подпись)</td>
															<td/>
															<td class="descr">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества)</td>
														</tr>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td width="41%"/>
														<td width="20%" class="value"/>
														<td width="5%"/>
														<td width="34%" class="value"/>
													</tr>
													<tr>
														<td/>
														<td class="descr">(подпись)</td>
														<td/>
														<td class="descr">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества)</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="asg:SeizureKind=1">
								<tr>
									<td>
										<table>
											<tbody>
												<tr>
													<td colspan="4">Специалист:</td>
												</tr>
												<tr>
													<td width="41%"/>
													<td width="20%" class="value"/>
													<td width="5%"/>
													<td width="34%" class="value">
														<xsl:apply-templates mode="signature" select="asg:Specialist"/>
													</td>
												</tr>
												<tr>
													<td/>
													<td class="descr">(подпись)</td>
													<td/>
													<td class="descr">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td colspan="4">Акт составил:</td>
											</tr>
											<tr>
												<td width="41%"/>
												<td width="20%" class="value"/>
												<td width="5%"/>
												<td width="34%" class="value">
													<xsl:apply-templates mode="signature" select="asg:CustomActArresting/adt_cat:ApproverPerson"/>
												</td>
											</tr>
											<tr>
												<td/>
												<td class="descr">(подпись)</td>
												<td/>
												<td class="descr">(фамилия, инициалы имено и отчества (инициал отчества указывается при наличии отчества)</td>
											</tr>
										</tbody>
									</table>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td colspan="5">
													<br/>Отметки должностных лиц таможенного органа:</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="value">
													<xsl:value-of select="asg:RefusalMark/adt_cat:RefusalMarkText"/>
												</td>
											</tr>
											<tr>
												<td colspan="5" class="delim_3">
													<br/>
													<br/>
												</td>
											</tr>
											<tr>
												<td class="value" width="36%">
													<xsl:value-of select="asg:RefusalMark/cat_ru:PersonPost"/>
												</td>
												<td width="5%"/>
												<td class="value" width="20%"/>
												<td width="5%"/>
												<td class="value" width="34%">
													<xsl:apply-templates mode="signature" select="asg:RefusalMark"/>
												</td>
											</tr>
											<tr>
												<td class="descr" valign="top">(должность)</td>
												<td/>
												<td class="descr" valign="top">(подпись)</td>
												<td/>
												<td class="descr" valign="top">(фамилия, инициалы имени и отчества (инициал отчества<br/>указывается при наличии отчества)</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="40%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="asg:RefusalMark/cat_ru:IssueDate"/>
													</xsl:call-template>
												</td>
												<td width="60%"/>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="asg:SeizureKind=1">
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td colspan="3">
														<br/>Копию настоящего акта получил:</td>
												</tr>
												<tr>
													<td colspan="3">
														<br/>
													</td>
												</tr>
												<tr>
													<td class="value">
														<xsl:apply-templates mode="signature2ndCopy" select="asg:SecondExempReceived"/>
													</td>
													<td/>
													<td class="value"/>
												</tr>
												<tr valign="top">
													<td class="descr" width="70%">(должность, фамилия, имя, отчество (отчество указывается при наличии), наименование и номер документа,удостоверяющего личность проверяемого лица, у которого обнаружены  изъятые товары (его представителя)</td>
													<td/>
													<td class="descr" width="20%">(подпись)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="asg:SeizureKind=2">
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td colspan="5">
														<br/>Копию настоящего акта получил:</td>
												</tr>
												<tr>
													<td colspan="5" class="delim_3">
														<br/>
														<br/>
													</td>
												</tr>
												<tr>
													<td class="value" width="36%">
														<xsl:value-of select="asg:SecondExempReceived/cat_ru:PersonPost"/>
													</td>
													<td width="5%"/>
													<td class="value" width="20%"/>
													<td width="5%"/>
													<td class="value" width="34%">
														<xsl:apply-templates mode="signature" select="asg:SecondExempReceived"/>
													</td>
												</tr>
												<tr>
													<td class="descr" valign="top">(должность)</td>
													<td/>
													<td class="descr" valign="top">(подпись)</td>
													<td/>
													<td class="descr" valign="top">(фамилия, инициалы имени и отчества (инициал отчества<br/>указывается при наличии отчества)<br/>лица, у которого изъяты товары, либо его представителя)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td width="40%">
													<xsl:call-template name="russian_date_month">
														<xsl:with-param name="dateIn" select="asg:SecondExempReceived/adt_cat:Date"/>
													</xsl:call-template>
												</td>
												<td width="60%"/>
											</tr>
											<tr>
												<td class="descr">(дата получения копии акта)</td>
												<td/>
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
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="signature2ndCopy" match="*">
		<xsl:if test="cat_ru:PersonPost">
			<xsl:value-of select="cat_ru:PersonPost"/>,&#160;</xsl:if>
		<xsl:value-of select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
		<xsl:if test="adt_cat:Passport">,<xsl:text> </xsl:text>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardCode">
				<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardCode"/>&#160;</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardName">
				<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardName"/>
			</xsl:if>
			<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardSeries) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">,&#160;</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardSeries">серия&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardSeries"/>
				<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardNumber) &gt; 0">&#160;</xsl:if>
			</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardNumber">№&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:IdentityCardNumber"/>
			</xsl:if>
			<xsl:if test="string-length(adt_cat:Passport/RUScat_ru:IdentityCardDate) &gt; 0 or string-length(adt_cat:Passport/RUScat_ru:OrganizationName) &gt; 0">, выдан&#160;</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:IdentityCardDate">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="adt_cat:Passport/RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="adt_cat:Passport/RUScat_ru:OrganizationName">	&#160;<xsl:value-of select="adt_cat:Passport/RUScat_ru:OrganizationName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="adt_cat:AuthoritesDocument">; документ, подтверждающий полномочия:&#160;
						<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName">
				<xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentName"/>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber">&#160;№&#160;<xsl:value-of select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate">&#160;от&#160;<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate">&#160;(дата окончания полномочий&#160;<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="adt_cat:AuthoritesDocument/cat_ru:ComplationAuthorityDate"/>
				</xsl:call-template>)
					</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="signature" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="substring(cat_ru:PersonName,1,1)"/>
		<xsl:if test="cat_ru:PersonName">.&#160;</xsl:if>
		<xsl:value-of select="substring(cat_ru:PersonMiddleName,1,1)"/>
		<xsl:if test="cat_ru:PersonMiddleName">.</xsl:if>
	</xsl:template>
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
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