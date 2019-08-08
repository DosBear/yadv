<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:idd="urn:customs.ru:Information:CustomsDocuments:InqDelayDocs:5.14.0" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="no" media-type="text/html" omit-xml-declaration="no" version="1.0"/>
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
	<xsl:template name="GTD_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/><xsl:value-of select="substring($dateIn,6,2)"/><xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head/>
			<body>
				<table border="0" width="100%">
					<tbody>
						<tr>
							<td align="center">
								<span style="font-size:28; font-weight:bold; text-decoration:underline; ">Обращение о разрешении представления документов в определенный срок</span>
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:for-each select="idd:InqDelayDocs">
					<table border="0" width="100%">
						<tbody>
							<tr>
								<td align="right" colspan="2">
									<span style="font-size:13; font-weight:bold; ">Уникальный идентификатор документа</span>
								</td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<xsl:for-each select="cat_ru:DocumentID">
										<span style="font-size:14; ">
											<xsl:apply-templates/>
										</span>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" width="20%">
						<tbody>
							<tr>
								<td align="left" height="13">Дата</td>
								<td align="right" height="13">
									<span style="background-color:#C0C0C0; width:3 cm; ">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="idd:SendDate"/>
										</xsl:call-template>
									</span>
								</td>
							</tr>
							<tr>
								<td align="left">Время</td>
								<td align="right">
									<xsl:for-each select="idd:SendTime">
										<span style="background-color:#C0C0C0; width:3 cm; ">
											<xsl:apply-templates/>
										</span>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<span style="font-size:18; font-weight:bold; ">Сведения о заявителе</span>
					<br/>
					<xsl:for-each select="idd:Applicant">
						<table border="1" width="100%">
							<tbody>
								<tr>
									<td height="203">
										<table border="0" width="100%">
											<tbody>
												<tr>
													<td width="20%">Наименование</td>
													<td align="left" width="30%">
														<xsl:for-each select="cat_ru:ShortName">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td colspan="3" width="50%">
														<xsl:for-each select="cat_ru:OrganizationName">
															<span style="background-color:#C0C0C0; width:100 %; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table border="0" width="100%">
											<tbody>
												<tr>
													<xsl:if test="cat_ru:RFOrganizationFeatures">
														<td width="5%">ИНН</td>
														<td width="20%">
															<xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:INN">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
														<td width="5%">КПП</td>
														<td width="20%">
															<xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
														<td width="5%">ОГРН</td>
														<td width="20%">
															<xsl:for-each select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
													</xsl:if>
													<xsl:if test="cat_ru:RBOrganizationFeatures">
														<td width="5%">УНП</td>
														<td width="70%">
															<xsl:for-each select="cat_ru:RBOrganizationFeatures/cat_ru:UNP">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
													</xsl:if>
													<xsl:if test="cat_ru:RKOrganizationFeatures">
														<td width="5%">БИН</td>
														<td width="20%">
															<xsl:for-each select="cat_ru:RKOrganizationFeatures/cat_ru:BIN">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
														<td width="5%">ИИН</td>
														<td width="20%">
															<xsl:for-each select="cat_ru:RKOrganizationFeatures/cat_ru:IIN">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
														<td width="5%">ИТН</td>
														<td width="20%">
															<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
					<xsl:value-of select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
														</td>
													</xsl:if>
													<td width="5%">ОКПО</td>
													<td width="20%">
														<xsl:for-each select="cat_ru:OKPOID">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
												</tr>
												<tr>
													<td colspan="2" width="20%">Местонахождение</td>
													<td colspan="6" width="80%">
														<xsl:for-each select="cat_ru:Address/cat_ru:StreetHouse">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<table border="0" width="100%">
											<tbody>
												<tr>
													<td width="9%">Телефон</td>
													<td width="25%">
														<xsl:for-each select="cat_ru:Contact/cat_ru:Phone">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td align="center" width="7%">Факс</td>
													<td width="25%">
														<xsl:for-each select="cat_ru:Contact/cat_ru:Fax">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td align="center" width="9%">Телекс</td>
													<td width="25%">
														<xsl:for-each select="cat_ru:Contact/cat_ru:Telex">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
												</tr>
											</tbody>
										</table>
										<span style="font-weight:bold; ">Адрес</span>
										<xsl:for-each select="cat_ru:Address">
											<table border="0" width="100%">
												<tbody>
													<tr>
														<td width="5%">Код</td>
														<td width="10%">
															<xsl:for-each select="cat_ru:CountryCode">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
														<td align="center" width="8%">Индекс</td>
														<td width="19%">
															<xsl:for-each select="cat_ru:PostalCode">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
														<td align="center" width="8%">Город</td>
														<td width="50%">
															<xsl:for-each select="cat_ru:City">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
													</tr>
													<tr>
														<td colspan="6">
															<xsl:for-each select="cat_ru:StreetHouse">
																<span style="background-color:#C0C0C0; width:100%; ">
																	<xsl:apply-templates/>
																</span>
															</xsl:for-each>
														</td>
													</tr>
												</tbody>
											</table>
										</xsl:for-each>
										<!--span style="font-weight:bold; ">Банковские счета</span>
                                        <xsl:for-each select="cat_ru:BankInformation">
                                            <table border="1" width="100%">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <table border="0" width="100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td align="left" width="10%">Банк</td>
                                                                        <td colspan="10">
                                                                            <xsl:for-each select="cat_ru:BankName">
                                                                                <span style="background-color:#C0C0C0; width:100 %; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <table border="0" width="100%">
                                                                <tbody>
                                                                    <tr>
                                                                        <td width="10%">Номер</td>
                                                                        <td width="25%">
                                                                            <xsl:for-each select="cat_ru:BankAccount">
                                                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                        <td align="center" width="5%">Тип</td>
                                                                        <td width="25%">
                                                                            <xsl:for-each select="cat_ru:BankAccountDescription">
                                                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                        <td align="center" width="15%">МФО банка</td>
                                                                        <td width="20%">
                                                                            <xsl:for-each select="cat_ru:BankMFO">
                                                                                <span style="background-color:#C0C0C0; width:100%; ">
                                                                                    <xsl:apply-templates />
                                                                                </span>
                                                                            </xsl:for-each>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </xsl:for-each-->
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<span style="font-size:18; font-weight:bold; ">Описание документов, которые предполагается представить в определенный срок</span>
					<table border="1">
						<thead>
							<tr>
								<td align="center">Номер</td>
								<td align="center">Код</td>
								<td align="center">Вид документа</td>
								<td align="center">Причина</td>
								<xsl:if test="//idd:DocumentFormSign">
									<td align="center">Форма представления документа</td>
								</xsl:if>
								<td align="center" width="15%">Дата</td>
								<xsl:if test="idd:DelayDocDescription/idd:RequestPositionID">
									<td align="center">Идентификатор позиции в запросе</td>
								</xsl:if>
								<td align="center">Примечание</td>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="idd:DelayDocDescription">
								<tr>
									<td align="center">
										<xsl:for-each select="catESAD_ru:Position">
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:apply-templates/>
											</span>
										</xsl:for-each>
									</td>
									<td align="center">
										<xsl:for-each select="catESAD_ru:DocCode">
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:apply-templates/>
											</span>
										</xsl:for-each>
									</td>
									<td>
										<xsl:for-each select="catESAD_ru:DocName">
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:apply-templates/>
											</span>
										</xsl:for-each>
									</td>
									<td>
										<xsl:for-each select="idd:DelayReason">
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:apply-templates/>
											</span>
										</xsl:for-each>
									</td>
									<xsl:if test="//idd:DocumentFormSign">
										<td>
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:choose>
													<xsl:when test="idd:DocumentFormSign=0">Электронная</xsl:when>
													<xsl:otherwise>Бумага</xsl:otherwise>
												</xsl:choose>
											</span>
										</td>
									</xsl:if>
									<td align="center" width="15%">
										<xsl:for-each select="catESAD_ru:SuggDate">
											<span style="background-color:#C0C0C0; width:3 cm; ">
												<xsl:apply-templates/>
											</span>
										</xsl:for-each>
									</td>
									<xsl:if test="//idd:RequestPositionID">
										<td>
											<span style="background-color:#C0C0C0; width:100%;">
												<xsl:value-of select="idd:RequestPositionID"/>
											</span>
										</td>
									</xsl:if>
									<td>
										<xsl:for-each select="catESAD_ru:Note">
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:apply-templates/>
											</span>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<span style="font-size:18; font-weight:bold; ">Справочный номер ДТ</span>
					<xsl:for-each select="idd:GTDNumber">
						<table border="1" width="100%">
							<tbody>
								<tr>
									<td>
										<xsl:value-of select="cat_ru:CustomsCode"/>
										<xsl:text>/</xsl:text>
										<xsl:call-template name="GTD_date">
											<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
										</xsl:call-template>
										<xsl:text>/</xsl:text>
										<xsl:value-of select="cat_ru:GTDNumber"/>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
				</xsl:for-each>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
