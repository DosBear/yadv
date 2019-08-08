<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:pdd="urn:customs.ru:Information:CustomsDocuments:PermitDelayDocs:5.14.3" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
								<span style="font-size:28; font-weight:bold; text-decoration:underline; ">
									<xsl:choose>
										<xsl:when test="pdd:PermitDelayDocs/pdd:DocSign=0">
											Разрешение представления документов в установленный срок
										</xsl:when>
										<xsl:when test="pdd:PermitDelayDocs/pdd:DocSign=1">
											Разрешение представления документов в графическом виде
										</xsl:when>
									</xsl:choose>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:for-each select="pdd:PermitDelayDocs">
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
											<xsl:with-param name="dateIn" select="string(pdd:SendDate)"/>
										</xsl:call-template>
									</span>
								</td>
							</tr>
							<tr>
								<td align="left" height="13">Время</td>
								<td align="right" height="13">
									<xsl:for-each select="pdd:SendTime">
										<span style="background-color:#C0C0C0; width:3 cm; ">
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
								<td width="20%">Комментарии</td>
								<td>
									<xsl:for-each select="pdd:Comments">
										<span style="background-color:#C0C0C0; width:100%; ">
											<xsl:apply-templates/>
										</span>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<span style="font-size:18; font-weight:bold; ">Решение по документам</span>
					<table border="1">
						<thead>
							<tr>
								<td align="center">Номер</td>
								<td align="center">Код</td>
								<td align="center">Вид документа</td>
								<td align="center">Решение</td>
								<td align="center" width="15%">Дата</td>
								<xsl:if test="//pdd:RequestPositionID">
									<td align="center">Идентификатор позиции в запросе</td>
								</xsl:if>
								<td align="center">Примечание</td>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="pdd:DelayedDocs">
								<tr>
									<td>
										<xsl:for-each select="catESAD_ru:Position">
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:apply-templates/>
											</span>
										</xsl:for-each>
									</td>
									<td>
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
										<xsl:for-each select="pdd:DelayDecision">
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:choose>
													<xsl:when test=".='1'">положительное решение (отсрочка/в графическом виде)</xsl:when>
													<xsl:when test=".='0'">отрицательное решение</xsl:when>
												</xsl:choose>
											</span>
										</xsl:for-each>
									</td>
									<td>
										<span style="background-color:#C0C0C0; width:3 cm; ">
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="string(catESAD_ru:SuggDate)"/>
											</xsl:call-template>
										</span>
									</td>
									<xsl:if test="//pdd:RequestPositionID">
										<td>
											<span style="background-color:#C0C0C0; width:100%; ">
												<xsl:value-of select="pdd:RequestPositionID"/>
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
					<xsl:for-each select="pdd:GTDNumber">
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
					<span style="font-size:18; font-weight:bold; ">Таможенный орган</span>
					<xsl:for-each select="pdd:Customs">
						<table border="1" width="100%">
							<tbody>
								<tr>
									<td>
										<table border="0" width="100%">
											<tbody>
												<tr>
													<td width="5%">Код</td>
													<td width="10%">
														<xsl:for-each select="cat_ru:Code">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td width="10%">Наименование</td>
													<td>
														<xsl:for-each select="cat_ru:OfficeName">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
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
					</xsl:for-each>
					<span style="font-size:18; font-weight:bold; ">Должностное лицо</span>
					<xsl:for-each select="pdd:CustomsPerson">
						<table border="1" width="100%">
							<tbody>
								<tr>
									<td>
										<table border="0" width="100%">
											<tbody>
												<tr>
													<td width="5%">ЛНП</td>
													<td width="5%">
														<xsl:for-each select="cat_ru:LNP">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
															</span>
														</xsl:for-each>
													</td>
													<td width="5%">ФИО</td>
													<td>
														<xsl:for-each select="cat_ru:PersonName">
															<span style="background-color:#C0C0C0; width:100%; ">
																<xsl:apply-templates/>
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
					</xsl:for-each>
					<br/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
