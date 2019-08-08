<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="rktsg cat_ru" version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rktsg="urn:customs.ru:Information:ExchangeDocuments:ReqCorrectPayment:5.14.3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
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
	<xsl:template match="rktsg:ReqCorrectPayment">
		<html>
			<head>
				<title>Решение о корректировке таможенной стоимости товаров.</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
						text-align: center;
							background: #cccccc;
							}
						div.page {
							width: 210mm;
							margin-top: 6pt;
							margin-bottom: 6pt;
							padding:	10mm;
							padding-left:	10mm;
							background: #ffffff;
							border: solid .5pt #000000;
							}						
						td {
							font-family:Courier;
							}
						.normal{
							font-weight: bold;
							font-family:Arial;
							font-size: 10pt; border-left: medium none; border-right: medium none; border-top: medium none; border-bottom: 1pt solid windowtext; 
							}
						.bold{
							font-weight: bold;
							font-family:Arial;
							font-size: 13pt;
							}
						.italic{
							font-style: italic; 
							font-family:Arial;
							font-size: 9pt
							}
							.graph {
						font-family: Arial;
						font-size: 10pt;
						font-weight: bold;
						}
					.graphMain {
						font-family: Arial;
						font-size: 10pt;
						font-weight: normal;
						}
						.graphLittle {
						font-family: Arial;
						font-size: 7pt;
						}
						.graph8Bold {
						font-family: Arial;
						font-size: 8pt;
						font-weight: bold;
						}				
						.bordered {
					border: solid 1pt #000000;
										}
					.Main {					
						font-family: Arial;
						font-size: 10pt;
						}	
                </style>
			</head>
			<body>
				<div class="page">
					<h2>Решение<br/>о корректировке таможенной стоимости товаров</h2>
					<table border="0" style="width:190mm">
						<tbody>
							<tr>
								<td align="center" class="graphMain"> от									
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="rktsg:ResolDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table border="0" style="width:190mm">
						<tbody>
							<tr>
								<td class="graphMain" colspan="2" style="width:190mm">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<tr>
								<td class="Main">
									<table style="width:190mm;">
										<tr>
											<td align="center" class="Main" style="width:90mm;border-top:1px solid #000000; border-bottom:1px solid #000000;border-left:1px solid #000000; border-right:1px solid #000000;">
												<xsl:value-of select="rktsg:OfficeName"/>
											</td>
											<td align="center" class="Main" style="width:30mm;border-top:0px solid #ffffff; border-bottom:0px solid #ffffff;">&#160;</td>
											<td align="center" class="Main" style="width:90mm;border-top:1px solid #000000; border-bottom:1px solid #000000;border-left:1px solid #000000; border-right:1px solid #000000;">
												<xsl:value-of select="rktsg:DeclName"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphMain" colspan="2" style="width:190mm">
									<xsl:text>Уведомляем, что в соответствии со статьей 68 Таможенного кодекса Таможенного союза таможенным органом принято решение о корректировке таможенной стоимости товаров, заявленной в декларации на товары № </xsl:text>
									<xsl:value-of select="rktsg:GTDID/cat_ru:CustomsCode"/>
									<xsl:text> / </xsl:text>
									<xsl:call-template name="russian_date_gtd">
										<xsl:with-param name="dateIn" select="rktsg:GTDID/cat_ru:RegistrationDate"/>
									</xsl:call-template>
									<xsl:text> / </xsl:text>
									<xsl:value-of select="rktsg:GTDID/cat_ru:GTDNumber"/>
									<xsl:text>, в связи с </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2" style="width:190mm">
									<table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
										<tbody>
											<tr>
												<td align="center" class="graphMain" style="width:30mm">№ товара</td>
												<td align="center" class="graphMain" style="width:160mm">Обоснование принятого решения</td>
											</tr>
											<xsl:for-each select="rktsg:KTSGoods">
												<tr>
													<td align="center" class="graphMain" style="width:30mm">
														<xsl:value-of select="rktsg:NumberGood"/>
													</td>
													<td class="graphMain" style="width:160mm">
														<xsl:for-each select="rktsg:Rationale">
															<xsl:value-of select="."/>
															<xsl:text> </xsl:text>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphMain" colspan="2" style="width:190mm">
									<xsl:text>Таможенная стоимость товаров должна быть определена в соответствии с Соглашением об определении таможенной стоимости товаров, перемещаемых через таможенную границу Таможенного союза, от 25 января 2008 года, на основании следующей информации: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2" style="width:190mm">
									<table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
										<tbody>
											<tr>
												<td align="center" class="graphMain" style="width:30mm">№ товара</td>
												<td align="center" class="graphMain" style="width:30mm">№ метода определения таможенной стоимости товаров</td>
												<td align="center" class="graphMain" style="width:60mm">Таможенная стоимость товаров</td>
												<td align="center" class="graphMain" style="width:70mm">Источник информации (с указанием реквизитов - при наличии)</td>
											</tr>
											<xsl:for-each select="rktsg:ValuationCustCost">
												<tr>
													<td align="center" class="graphMain" style="width:30mm">
														<xsl:value-of select="rktsg:NumberGood"/>
													</td>
													<td align="center" class="graphMain" style="width:30mm">
														<xsl:value-of select="rktsg:MethodNumber"/>
													</td>
													<td align="center" class="graphMain" style="width:60mm">
														<xsl:value-of select="rktsg:CustCostGoods"/>
													</td>
													<td class="graphMain" style="width:70mm">
														<xsl:for-each select="rktsg:SourceInf">
															<xsl:value-of select="."/>
															<xsl:text> </xsl:text>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td align="left" class="graphMain" colspan="2" style="width:190mm">
									<xsl:text>В соответствии со статьей 191 Таможенного кодекса Таможенного союза Вам необходимо внести следующие изменения и (или) дополнения в декларацию на товары: </xsl:text>
								</td>
							</tr>
							<tr>
								<td class="graphMain" style="width:190mm">
									<table border="1" cellpadding="0" cellspacing="0" style="width:190mm">
										<tr>
											<td align="center" class="graphMain">№ п/п</td>
											<td align="center" class="graphMain">Номер<br/>товара</td>
											<td align="center" class="graphMain">Номер графы/<br/>подраздела графы</td>
											<td align="center" class="graphMain">Ранее указанные сведения</td>
											<td align="center" class="graphMain">Скорректированные сведения</td>
										</tr>
										<xsl:for-each select="rktsg:ValuationCustCost">
											<xsl:variable name="DeclChangesCount" select="count(rktsg:DeclarationChanges)"/>
											<tr>
												<td align="center" class="graphMain" rowspan="{$DeclChangesCount}">
													<xsl:value-of select="position()"/>
												</td>
												<td align="center" class="graphMain" rowspan="{$DeclChangesCount}">
													<xsl:value-of select="rktsg:NumberGood"/>
												</td>
												<xsl:apply-templates select="rktsg:DeclarationChanges[1]"/>
											</tr>
											<xsl:for-each select="rktsg:DeclarationChanges[position() &gt; 1]">
												<tr>
													<xsl:apply-templates select="."/>
												</tr>
											</xsl:for-each>
										</xsl:for-each>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2" style="width:190mm">
									<table border="0" style="width:190mm">
										<tbody>
											<tr>
												<td align="center" class="graphMain" style="width:30mm">
													<xsl:text> [  </xsl:text>
													<xsl:if test="rktsg:DateLimitPriorRelease">
														<span class="graph8Bold">х</span>
													</xsl:if>
													<xsl:text> ] </xsl:text>
												</td>
												<td align="left" class="graphMain" style="width:160mm">
													<xsl:text> в срок до </xsl:text>
                                       "<xsl:value-of select="substring(rktsg:DateLimitPriorRelease, 9, 2)"/>"&#160;
                                       <xsl:choose>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='01'">январь</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='02'">февраль</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='03'">март</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='04'">апрель</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='05'">май</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='06'">июнь</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='07'">июль</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='08'">август</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='09'">сентябрь</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='10'">октябрь</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='11'">ноябрь</xsl:when>
														<xsl:when test="substring(rktsg:DateLimitPriorRelease, 6, 2)='12'">декабрь</xsl:when>
													</xsl:choose>&#160;
                                       <xsl:value-of select="substring(rktsg:DateLimitPriorRelease, 1, 4)"/>г.
                                    </td>
											</tr>
											<tr>
												<td align="center" class="graphMain" style="width:30mm">
													<xsl:text> [  </xsl:text>
													<xsl:if test="(number(rktsg:DateLimitAfterRelease)=1) or (rktsg:DateLimitAfterRelease='t') or (rktsg:DateLimitAfterRelease='true')">
														<span class="graph8Bold">х</span>
													</xsl:if>
													<xsl:text> ] </xsl:text>
												</td>
												<td align="left" class="graphMain" style="width:160mm">
													<xsl:text> в срок, не превышающий 10 рабочих дней со дня получения декларантом (таможенным представителем) данного решения. </xsl:text>
												</td>
											</tr>
											<!--<tr>
                                    <td align="center" class="graphMain" style="width:30mm">
                                       <xsl:text> [  </xsl:text>
                                       <xsl:if test="(number(rktsg:DateLimit)=1) or (rktsg:DateLimit='t') or (rktsg:DateLimit='true')">
                                          <span class="graph8Bold">х</span>
                                       </xsl:if>
                                       <xsl:text> ] </xsl:text>
                                    </td>
                                    <td align="left" class="graphMain" style="width:160mm">
                                       <xsl:text> в срок, установленный в государстве-члене Таможенного союза (при принятии решения после выпуска товаров, по которым принято решение в отношении их таможенной стоимости). </xsl:text>
                                    </td>
                                 </tr>-->
										</tbody>
									</table>
								</td>
							</tr>
							<!--<tr>
                        <td align="left" class="graphMain" colspan="2" style="width:190mm">
                           <xsl:text>В случае несогласия декларанта с решением таможенного органа о корректировке таможенной стоимости товаровкорректировка таможенной стоимости товаров и пересчет подлежащих уплате таможенных пошлин, налогов осуществляться таможенным органом. </xsl:text>
                        </td>
                     </tr>-->
							<tr>
								<td class="graphMain" colspan="2" style="width:190mm;">
									<table border="0" style="width:190mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="5" style="width:190mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td align="center" class="normal" style="width:63mm">
													<xsl:value-of select="rktsg:CustomsPerson/cat_ru:PersonName"/>
												</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:63mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:62mm">
										ЛНП: <xsl:value-of select="rktsg:CustomsPerson/cat_ru:LNP"/>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle" style="width:63mm">
									(Ф.И.О. должностного лица таможенного органа)
								</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:63mm">
									(подпись)
									</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="left" style="width:62mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td class="graphMain" colspan="2" style="width:190mm;">
									<table border="0" style="width:190mm">
										<tbody>
											<tr>
												<td class="graphMain" colspan="5" style="width:190mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
											</tr>
											<tr>
												<td align="center" class="normal" style="width:63mm">
													<xsl:if test="rktsg:ReceivingResolution">
														<xsl:value-of select="rktsg:ReceivingResolution/rktsg:PersonName"/>
													</xsl:if>
												</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:63mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="normal" style="width:62mm">
													<xsl:if test="rktsg:ReceivingResolution">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rktsg:ReceivingResolution/rktsg:Date"/>
														</xsl:call-template>
													</xsl:if>
												</td>
											</tr>
											<tr>
												<td align="center" class="graphLittle" style="width:63mm">
									(Ф.И.О. представителя декларанта (таможенного представителя))
								</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:63mm">
									(подпись)
									</td>
												<td class="graphMain" style="width:1mm">
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</td>
												<td align="center" class="graphLittle" style="width:62mm">
									(дата получения решения)
									</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<xsl:if test="rktsg:SendResolution">
								<!--<tr>
                           <td align="left" class="graphMain" colspan="2" style="width:190mm">
                              <xsl:text>При направлении почтой </xsl:text>
                           </td>
                        </tr>-->
								<tr>
									<td class="graphMain" colspan="2" style="width:190mm;">
										<table border="0" style="width:190mm">
											<tbody>
												<tr>
													<td align="center" class="normal" colspan="5" style="width:190mm">
														<!--<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>-->
														<xsl:value-of select="rktsg:Address/cat_ru:PostalCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="rktsg:Address/cat_ru:CountryCode"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="rktsg:Address/cat_ru:CounryName"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="rktsg:Address/cat_ru:Region"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="rktsg:Address/cat_ru:City"/>
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
														<xsl:value-of select="rktsg:Address/cat_ru:StreetHouse"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle" colspan="5" style="width:190mm">
										(почтовый адрес направления решения - указывается при направлении решения по почте)</td>
												</tr>
												<tr>
													<td align="center" class="normal" style="width:75mm">
														<xsl:call-template name="russian_date">
															<xsl:with-param name="dateIn" select="rktsg:SendResolution/rktsg:Date"/>
														</xsl:call-template>
													</td>
													<td class="graphMain" style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="normal" style="width:75mm">
														<xsl:value-of select="rktsg:SendResolution/rktsg:PersonName"/>
													</td>
												</tr>
												<tr>
													<td align="center" class="graphLittle" style="width:75mm">
									(дата направления решения по почте)
									</td>
													<td class="graphMain" style="width:10mm">
														<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
													</td>
													<td align="center" class="graphLittle" style="width:75mm">
									(Ф.И.О. и подпись должностного лица таможенного органа, направившего решение по почте)
									</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="rktsg:DeclarationChanges">
		<td align="center" class="graphMain">
			<xsl:value-of select="rktsg:GRNumber"/>
		</td>
		<td class="graphMain">
			<xsl:apply-templates select="rktsg:PreviousData"/>
		</td>
		<td class="graphMain">
			<xsl:apply-templates select="rktsg:ModifiedData"/>
		</td>
	</xsl:template>
</xsl:stylesheet>
