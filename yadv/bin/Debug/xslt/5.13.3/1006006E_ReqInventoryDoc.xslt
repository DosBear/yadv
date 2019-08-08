<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="cat_ru rid" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:rid="urn:customs.ru:Information:CustomsDocuments:ReqInventoryDoc:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="utf-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<html>
			<head/>
			<style type="">
			table {
				border-collapse: collapse;
			}
         </style>
			<body>
				<xsl:if test="rid:ReqInventoryDoc/rid:DocSign='0' or rid:ReqInventoryDoc/rid:DocSign='f' or rid:ReqInventoryDoc/rid:DocSign='false'">
					<table border="1">
						<tbody>
							<tr>
								<td align="center" width="138">
									<br>
										<xsl:for-each select="rid:ReqInventoryDoc">
											<xsl:for-each select="rid:SendDate">
												<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
												<xsl:text disable-output-escaping="yes">.</xsl:text>
												<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
											</xsl:for-each>
										</xsl:for-each>
									</br>
									<br>
										<xsl:for-each select="rid:ReqInventoryDoc/rid:SendTime">
											<xsl:value-of select="substring(., 1, 8)"/>
										</xsl:for-each>
									</br>
								</td>
							</tr>
							<tr>
								<td align="center" width="138">№ запроса: <xsl:for-each select="rid:ReqInventoryDoc">
										<xsl:for-each select="rid:RequestNumber">
											<xsl:apply-templates/>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" width="100%">
						<tr>
							<td align="center">
								<span style="font-size:large; font-weight:bold; ">Запрос</span>
								<br/>
								<span style="font-size:medium; font-weight:bold; "> о представлении документов</span>
							</td>
						</tr>
						<tr>
							<td align="center" style="text-decoration:underline; ">от 
							<xsl:for-each select="rid:ReqInventoryDoc">
									<xsl:for-each select="rid:RequestDate">
										<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
										<xsl:text disable-output-escaping="yes">.</xsl:text>
										<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
										<xsl:text disable-output-escaping="yes">.</xsl:text>
										<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
									</xsl:for-each>
								 
								<xsl:for-each select="rid:RequestTime">
										<xsl:value-of select="substring(., 1, 8)"/>
									</xsl:for-each>
								</xsl:for-each>
								<br/>
							</td>
						</tr>
					</table>
					<br/>
					<table border="0" width="100%">
						<tr>
							<td width="131">
								<table border="1">
									<tr>
										<td align="center" width="110">
											<xsl:for-each select="rid:ReqInventoryDoc">
												<xsl:for-each select="rid:Customs">
													<xsl:for-each select="cat_ru:Code">
														<xsl:apply-templates/>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table border="1">
									<tr>
										<td align="center" height="22" width="371">
											<xsl:for-each select="rid:ReqInventoryDoc">
												<xsl:for-each select="rid:Customs">
													<xsl:for-each select="cat_ru:OfficeName">
														<xsl:apply-templates/>
													</xsl:for-each>
												</xsl:for-each>
											</xsl:for-each>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<br/>
					<xsl:if test="string-length(  rid:ReqInventoryDoc/rid:GTDNumber/cat_ru:CustomsCode  )  != 0">Декларация № <xsl:for-each select="rid:ReqInventoryDoc">
							<xsl:for-each select="rid:GTDNumber">
								<xsl:for-each select="cat_ru:CustomsCode">
									<xsl:apply-templates/>
								</xsl:for-each>/<xsl:for-each select="cat_ru:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
								</xsl:for-each>
								<xsl:for-each select="cat_ru:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
								</xsl:for-each>
								<xsl:for-each select="cat_ru:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
								</xsl:for-each>/<xsl:for-each select="cat_ru:GTDNumber">
									<xsl:apply-templates/>
								</xsl:for-each>, </xsl:for-each>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="rid:ReqInventoryDoc/rid:OEZ_RegistrationNumber">Уведомление  № <xsl:for-each select="rid:ReqInventoryDoc">
							<xsl:for-each select="rid:OEZ_RegistrationNumber">
								<xsl:value-of select="rid:CustomsCode"/>
                              /
                             <xsl:for-each select="rid:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
								</xsl:for-each>
								<xsl:for-each select="rid:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
								</xsl:for-each>
								<xsl:for-each select="rid:RegistrationDate">
									<xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
								</xsl:for-each>/
                            <xsl:value-of select="rid:Number"/>
                                , </xsl:for-each>
						</xsl:for-each>
					</xsl:if>
					<br/>
					<br/>Вам необходимо в срок до <xsl:for-each select="rid:ReqInventoryDoc">
						<xsl:for-each select="rid:DateLimit">
							<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
							<xsl:text disable-output-escaping="yes">.</xsl:text>
							<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
							<xsl:text disable-output-escaping="yes">.</xsl:text>
							<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
						</xsl:for-each>
					</xsl:for-each>  предоставить следующие документы:<br/>
					<br/>
					<xsl:for-each select="rid:ReqInventoryDoc">
						<table border="1">
							<tbody>
								<xsl:for-each select="rid:RequestedDoc">
									<tr>
										<td height="17" valign="top" width="493">
											<xsl:for-each select="rid:Position">
												<xsl:apply-templates/>
											</xsl:for-each>. <xsl:for-each select="cat_ru:PrDocumentName">
												<xsl:apply-templates/>
											</xsl:for-each> <xsl:if test="string-length(  rid:DocCode  )  != 0">(код <xsl:for-each select="rid:DocCode">
													<xsl:apply-templates/>
												</xsl:for-each>) </xsl:if>
											<xsl:if test="string-length(  cat_ru:PrDocumentNumber  )  != 0">№ <xsl:for-each select="cat_ru:PrDocumentNumber">
													<xsl:apply-templates/>
												</xsl:for-each>
											</xsl:if> <xsl:if test="string-length(  cat_ru:PrDocumentDate  )  != 0">от <xsl:for-each select="cat_ru:PrDocumentDate">
													<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
													<xsl:text disable-output-escaping="yes">.</xsl:text>
													<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
													<xsl:text disable-output-escaping="yes">.</xsl:text>
													<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="rid:CommKind">
												<xsl:text> </xsl:text>
												<xsl:choose>
													<xsl:when test="rid:CommKind='0'">документ из архива декларанта</xsl:when>
													<xsl:when test="rid:CommKind='1'">представление оригинала документа, в том числе сканирование в ТО</xsl:when>
												</xsl:choose>
											</xsl:if>
											<br/>
											<table border="0" width="100%">
												<tbody>
													<tr>
														<td>
															<xsl:if test="(string-length(  rid:ArchDeclID  )   !=  0 ) or   (string-length(  rid:ArchID  ) !=  0) or  (string-length(   rid:ArchDocID  )  !=  0)  or    (string-length(   rid:ADocumentID  )  !=  0)">
																<xsl:if test="string-length(  rid:ArchDeclID  )  != 0">Уникальный идентификатор декларанта в Электронном Архиве Декларанта: <xsl:for-each select="rid:ArchDeclID">
																		<xsl:apply-templates/>
																	</xsl:for-each>
																</xsl:if>
																<br/>
																<xsl:if test="string-length(  rid:ArchID  )  != 0">Уникальный идентификатор архива декларанта: <xsl:for-each select="rid:ArchID">
																		<xsl:apply-templates/>
																	</xsl:for-each>
																</xsl:if>
																<br/>
																<xsl:if test="string-length(  rid:ArchDocID  )  != 0">Уникальный архивный идентификатор документа: <xsl:for-each select="rid:ArchDocID">
																		<xsl:apply-templates/>
																	</xsl:for-each>
																</xsl:if>
																<br/>
																<xsl:if test="string-length(  rid:ADocumentID  )  != 0">Уникальный идентификатор документа: <xsl:for-each select="rid:ADocumentID">
																		<xsl:apply-templates/>
																	</xsl:for-each>
																</xsl:if>
															</xsl:if>
														</td>
													</tr>
												</tbody>
											</table>
											<xsl:if test="rid:Preferencii">
												<xsl:text>Преференции: </xsl:text>
												<xsl:apply-templates select="rid:Preferencii"/>
											</xsl:if>
											<xsl:if test="rid:GoodsNumeric">
												<br/>
												<xsl:text>Порядковый номер декларируемого товара: </xsl:text>
												<xsl:value-of select="rid:GoodsNumeric"/>
											</xsl:if>
										</td>
										<td height="17" valign="top" width="258">
								  Запрашивает: <xsl:for-each select="rid:RequestorName">
												<xsl:apply-templates/>
											</xsl:for-each>
											<br/>
											<br/>
											<xsl:if test="string-length(  rid:ReqPurpose  )  != 0">
									 Цель запроса: <xsl:for-each select="rid:ReqPurpose">
													<xsl:apply-templates/>
												</xsl:for-each>
											</xsl:if>
											<br/>
											<xsl:if test="string-length(  rid:Note  )  != 0">
									 Примечание: <xsl:for-each select="rid:Note">
													<xsl:apply-templates/>
												</xsl:for-each>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:for-each>
					<br/>
					<br/>
					<table border="0" width="100%">
						<tbody>
							<tr>
								<td align="center" width="422">
									<xsl:for-each select="rid:ReqInventoryDoc">
										<xsl:for-each select="rid:CustomsPerson">
											<xsl:for-each select="cat_ru:PersonName">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td width="123"/>
								<td align="center">
									<xsl:for-each select="rid:ReqInventoryDoc">
										<xsl:for-each select="rid:CustomsPerson">
											<xsl:for-each select="cat_ru:LNP">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td align="center" width="422">
									<hr color="black" size="1"/>Уполномоченное должностное лицо таможенного органа</td>
								<td width="123"/>
								<td align="center">
									<hr color="black" size="1"/>ЛНП</td>
							</tr>
						</tbody>
					</table>
					<br/>   <br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
				<xsl:if test="rid:ReqInventoryDoc/rid:DocSign='1' or rid:ReqInventoryDoc/rid:DocSign='t' or rid:ReqInventoryDoc/rid:DocSign='true'">
					<table border="0" class="font-size:12pt;" width="100%">
						<tbody>
							<tr>
								<td width="50%">
									<xsl:for-each select="rid:ReqInventoryDoc">
										<xsl:for-each select="rid:Customs">
											<xsl:for-each select="cat_ru:OfficeName">
												<xsl:apply-templates/>
											</xsl:for-each>
										</xsl:for-each>
									</xsl:for-each>
								</td>
								<td width="50%">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
									<b>ЗАПРОС <br/> о представлении недостающих документов и сведений</b>
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
						от  <xsl:for-each select="rid:ReqInventoryDoc">
										<xsl:for-each select="rid:RequestDate">
											<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
										</xsl:for-each> № <xsl:value-of select="rid:RequestNumber"/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td colspan="2"> 
								Рассмотрев  Заявление  на  уничтожение товаров,  пришедших  в негодность, и
(или)        упаковки        на         (вне)        территории         ОЭЗ<br/>
N  
									<u>
										<xsl:apply-templates select="rid:ReqInventoryDoc/rid:OEZ_RegistrationNumber"/>
										<!--<xsl:for-each select="rid:ReqInventoryDoc">
											<xsl:for-each select="rid:OEZ_RegistrationNumber">
												<xsl:value-of select="rid:CustomsCode"/>/

 <xsl:for-each select="rid:RegistrationDate">
													<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
													<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
													<xsl:value-of select="format-number(substring(., 3, 2), '00')"/>
												</xsl:for-each>/
<xsl:value-of select="rid:Number"/>
											</xsl:for-each>
										</xsl:for-each>-->
									</u>,

								</td>
							</tr>
							<tr>
								<td class="font-size: 6pt;" width="50%">  (регистрационный номер Заявления)</td>
								<td width="50%">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td colspan="2">
		сообщаем,  что Вам необходимо представить в уполномоченный таможенный орган
следующие  документы  и сведения, необходимые для принятия решения о выдаче
разрешения  на  уничтожение,  пришедших  в  негодность, и (или) упаковки на
территории  ОЭЗ  или  вывоз  таких  товаров  и  (или)  упаковки  в целях их
уничтожения за пределы территории ОЭЗ:						
		  </td>
							</tr>
							<xsl:for-each select="rid:ReqInventoryDoc/rid:RequestedDoc">
								<tr>
									<td colspan="2">
										<xsl:value-of select="cat_ru:PrDocumentName"/>
										<xsl:text> № </xsl:text>
										<xsl:value-of select="cat_ru:PrDocumentNumber"/>	
							от
							<xsl:for-each select="cat_ru:PrDocumentDate">
											<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
										</xsl:for-each>
										<xsl:if test="rid:GoodsNumeric"> номер декларируемого товара: <xsl:value-of select="rid:GoodsNumeric"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td colspan="2">
									<br/>
									<br/>
		Срок представления документов до 
		<u>
										<xsl:for-each select="rid:ReqInventoryDoc/rid:DateLimit">
											<xsl:value-of select="format-number(substring(., 9, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 6, 2), '00')"/>
											<xsl:text disable-output-escaping="yes">.</xsl:text>
											<xsl:value-of select="format-number(substring(., 1, 4), '0000')"/>
										</xsl:for-each>
									</u>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" width="100%">
						<tr>
							<td width="50%">
								<xsl:for-each select="rid:ReqInventoryDoc/rid:CustomsPerson">
									<xsl:value-of select="cat_ru:PersonName"/>
								</xsl:for-each>
							</td>
							<td width="25%">
								<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
							</td>
							<td align="right" width="25%">
								<br/>
								<xsl:for-each select="rid:ReqInventoryDoc/rid:CustomsPerson">
									<xsl:value-of select="cat_ru:LNP"/>
								</xsl:for-each>
							</td>
						</tr>
						<tr>
							<td class="font-size:4pt;" width="50%">
						(инициалы и фамилия уполномоченного должностного лица таможенного органа)
					 </td>
							<td align="center" class="font-size:4pt;" width="25%">(подпись)</td>
							<td align="right" class="font-size:4pt;" width="25%">ЛНП </td>
						</tr>
					</table>
					<br/>   <br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="rid:Preferencii">
		<xsl:if test="catESAD_cu:CustomsTax">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;Таможенные сборы </xsl:text>
			<xsl:value-of select="catESAD_cu:CustomsTax"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:CustomsDuty">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;Таможенная пошлина </xsl:text>
			<xsl:value-of select="catESAD_cu:CustomsDuty"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Excise">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;Акцизы </xsl:text>
			<xsl:value-of select="catESAD_cu:Excise"/>
		</xsl:if>
		<xsl:if test="catESAD_cu:Rate">
			<br/>
			<xsl:text>&#160;&#160;&#160;&#160;НДС </xsl:text>
			<xsl:value-of select="catESAD_cu:Rate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="rid:OEZ_RegistrationNumber">
		<xsl:value-of select="rid:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
			<xsl:with-param name="dateIn" select="rid:RegistrationDate"/>
		</xsl:call-template>/<xsl:value-of select="rid:Number"/> ЗУН
	</xsl:template>
	<xsl:template name="russian_date_gtd">
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
</xsl:stylesheet>
