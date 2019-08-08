<?xml version="1.0" encoding="utf-8"?>
<!-- Бланк в соответствии с приказом ФТС №2675 от 28.12.2012, приложение 1 -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ata_ct="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CommonTypes:5.14.3" xmlns:ata_cis="urn:customs.ru:Information:TransportDocuments:ATA:ATA_CarnetImportationSheet:5.14.3">
	<!-- Шаблон для типа ATA_CarnetImportationSheetType -->
	<xsl:template match="ata_cis:ATA_CarnetImportationSheet">
		<html>
			<head>
				<style>
									body {
									background: #cccccc;
									}

									div
									{
									white-space: nowrap;
									}

									div.page {
									width: 190mm;
									margin: 10px auto;
									margin-top: 6pt;
									margin-bottom: 6pt;
									padding: 10mm;
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
									font-family: Arial;
									font-size: 8pt;
									}

									table.border tr td
									{
									border: 1px solid gray;
									}

									.graph {
									font-family: Verdana;
									font-size: 8pt;
									}

									.value
									{
									border-bottom: dotted 1px black;
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
						<tr>
							<td class="graphMain" style="width:70%">
								<font size="3">
									<b>A.T.A. CARNET No.</b>
								</font>
							</td>
							<td class="graphMain bordered" style="width:30%">
								<font size="3">
									<xsl:text>RU/</xsl:text>
									<xsl:value-of select="ata_cis:Sheet/ata_ct:CarnetNumber"/>
								</font>
							</td>
						</tr>
						<tr>
							<td class="graphMain" style="width:100%" colspan="2">
								<font size="3">
									<b>КОРЕШОК ДОКУМЕНТА НА ВВОЗ № </b>
									<u><xsl:value-of select="ata_cis:Sheet/ata_ct:VoucherNumber"/></u>
									<b> КНИЖКА АТА № </b>
									<u><xsl:value-of select="ata_cis:Sheet/ata_ct:CarnetNumber"/></u>
								</font>
							</td>
						</tr>
					</table>
					<br/>
					<!--table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:DocumentID"/></td>
						</tr>
						<xsl:if test="cat_ru:RefDocumentID">
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%"><xsl:value-of select="cat_ru:RefDocumentID"/></td>
							</tr>
						</xsl:if>
					</table-->
					<table class="w190">
						<tr>
							<td class="graphMain bordered" style="width:3mm; vertical-align: middle; word-break: break-all" rowspan="4" bgcolor="#e3e3e3" align="center">
								<font size="2">
								<b>
									<xsl:choose>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='importation'">IMPORTATION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reexportation'">REEXPORTATION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='exportation'">EXPORTAT ION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reimportation'">REIMPORTATION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='transitOpen'">TRANSIT<br/><br/>OPEN</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='transitClose'">TRANSIT<br/><br/>CLOSE</xsl:when>
										<xsl:otherwise>IMPORTATION</xsl:otherwise>
									</xsl:choose>
								</b>
								</font>
							</td>
							<td class="graphMain bordered" style="width:3mm; vertical-align: middle; word-break: break-all" rowspan="4" bgcolor="#e3e3e3" align="center">
								<b>
								<font size="2">
									<xsl:choose>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='importation'">ВВОЗ</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reexportation' or ata_cis:Sheet/ata_ct:TearSheetType='exportation'">ВЫВОЗ</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reimportation'">ОБРАТНЫЙ<br/><br/>ВВОЗ</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='transitOpen' or ata_cis:Sheet/ata_ct:TearSheetType='transitClose'">ТРАНЗИТ</xsl:when>
										<xsl:otherwise>ВВОЗ</xsl:otherwise>
									</xsl:choose>
								</font>
								<font size="1"><xsl:if test="ata_cis:Sheet/ata_ct:TearSheetType='reexportation'"><br/>(ранее<br/><br/>ввезенных<br/><br/>товаров)</xsl:if></font>
								</b>
							</td>
							<td class="graphMain bordered" style="width:184mm" colspan="5" bgcolor="#e3e3e3">
								<b>1. The goods described in the General List under Item No(s)<br/>Товары, указанные в Общем списке под порядковым(ыми) номером(ами)</b><br/>
								<table class="w190" cellspacing="5">
									<tr>
										<td class="annot graphMain" style="width:3mm" rowspan="2"/>
										<td class="value graphMain" style="width:121mm"><xsl:value-of select="ata_cis:DeclarantInfo/ata_ct:GoodsNumbers"/></td>
										<td class="annot graphMain" style="width:50mm"><b>have been temporarily imported</b></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:121mm"/>
										<td class="annot graphMain" style="width:50mm"><b>были временно ввезены.</b></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:122mm" colspan="3" bgcolor="#e3e3e3">
								<b>2. Final date for re-exportation/production to the Customs of goods<br/>Предельная дата вывоза/предъявления на таможне товаров</b><br/>
							</td>
							<td class="graphMain bordered" style="width:62mm; vertical-align: middle" colspan="2">
								<table class="w190" cellspacing="5">
									<tr>
										<td class="annot graphMain" style="width:7mm"><b>year</b></td>
										<td class="annot graphMain" style="width:10mm"><b>/month</b></td>
										<td class="annot graphMain" style="width:8mm"><b>/day</b></td>
										<td class="annot graphMain" style="width:15mm"/>
										<td class="value graphMain" style="width:10mm">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_cis:ImportationPeriod,1,4)"/>
										</td>
										<td class="annot graphMain" style="width:1mm">/</td>
										<td class="value graphMain" style="width:5mm">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_cis:ImportationPeriod,6,2)"/>
										</td>
										<td class="annot graphMain" style="width:1mm">/</td>
										<td class="value graphMain" style="width:5mm">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_cis:ImportationPeriod,9,2)"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:7mm"><b>год</b></td>
										<td class="annot graphMain" style="width:10mm"><b>/месяц</b></td>
										<td class="annot graphMain" style="width:8mm"><b>/день</b></td>
										<td class="annot graphMain" style="width:15mm"/>
										<td class="annot graphMain" style="width:10mm"/>
										<td class="annot graphMain" style="width:1mm"/>
										<td class="annot graphMain" style="width:5mm"/>
										<td class="annot graphMain" style="width:1mm"/>
										<td class="annot graphMain" style="width:5mm"/>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:142mm" colspan="4" bgcolor="#e3e3e3">
								<b>3. Registered under reference No. / Зарегистрировано за №</b><br/>
								<table class="w190" cellspacing="5">
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="value graphMain" style="width:139mm">
											<xsl:apply-templates select="ata_cis:Sheet/ata_ct:RegistrationNumber"/>
										</td>
									</tr>
								</table>
							</td>
							<td class="graphMain bordered" style="width:42mm; border-bottom:0" bgcolor="#e3e3e3" rowspan="2">
								<b>8. </b><br/>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:142mm" colspan="4" bgcolor="#e3e3e3">
								<b>4. Other remarks / Прочие данные</b><br/>
								<table class="w190" cellspacing="5">
									<tr>
										<td class="annot graphMain" style="width:3mm"/>
										<td class="annot graphMain" style="width:139mm">
											<xsl:apply-templates select="ata_cis:CustomsInfo/ata_ct:CustomsMark"/>
											<xsl:if test="ata_cis:CustomsInfo/ata_ct:Type">
												<table class="w190">
													<tr>
														<td class="value graphMain">Date and Time of signing / Дата и время подписания:</td>
														<td class="value graphMain"><xsl:value-of select="ata_cis:CustomsInfo/ata_ct:Type"/></td>
													</tr>
												</table>
											</xsl:if>
										</td>
									</tr>
								</table>
							</td>
						</tr>	
						<tr>
							<td class="graphMain bordered" style="width:6mm; word-break: break-all" colspan="2">
								<font size="1">Counterfoil No</font><br/>
								<xsl:value-of select="ata_cis:Sheet/ata_ct:VoucherNumber"/>
							</td>
							<td class="graphMain bordered" style="width:52mm" bgcolor="#e3e3e3">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm" rowspan="2"><b>5.</b></td>
										<td class="value graphMain" style="width:49mm">
											<xsl:apply-templates select="ata_cis:CustomsInfo/ata_ct:CustomsPersonRequisites/ata_ct:CustomsInfo"/> 
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:49mm"><b>Customs Office<br/>Таможня</b></td>
									</tr>
								</table>
							</td>
							<td class="graphMain bordered" style="width:40mm" bgcolor="#e3e3e3">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm" rowspan="2"><b>6.</b></td>
										<td class="value graphMain" style="width:37mm"><xsl:value-of select="ata_cis:DeclarantInfo/ata_ct:DeclarantSign/ata_ct:Place"/></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:37mm"><b>Place<br/>Место</b></td>
									</tr>
								</table>
							</td>
							<td class="graphMain bordered" style="width:50mm" bgcolor="#e3e3e3" colspan="2">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm" rowspan="2"><b>7.</b></td>
										<td class="value graphMain" style="width:47mm">
											<xsl:for-each select="ata_cis:CustomsInfo/ata_ct:CustomsPersonRequisites/ata_ct:CustomsPersonSignature/ata_ct:IssueDate">
												<xsl:value-of select="substring(.,1,4)"/>
												<xsl:text> / </xsl:text>
												<xsl:value-of select="substring(.,6,2)"/>
												<xsl:text> / </xsl:text>
												<xsl:value-of select="substring(.,9,2)"/>
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:47mm"><b>Date (year/month/day)<br/>Дата (год/мес./день)</b></td>
									</tr>
								</table>
							</td>
							<td class="graphMain bordered" style="width:42mm; border-top:0" bgcolor="#e3e3e3">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:3mm" rowspan="2"/>
										<td class="value graphMain" style="width:39mm">
											<xsl:for-each select="ata_cis:CustomsInfo/ata_ct:CustomsPersonRequisites/ata_ct:CustomsPersonSignature">
												<xsl:apply-templates select="."/>
												<xsl:if test="position()!=last()"><br/></xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:39mm"><b>Signature and Stamp<br/>Подпись и печать</b></td>
									</tr>
								</table>
							</td>
						</tr>	
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:50%"><font size="3"><b>A.T.A. CARNET</b></font></td>
							<td class="annot graphMain" style="width:50%" align="right"><font size="3"><b>КАРНЕТ АТА</b></font></td>
						</tr>
					</table>
					<br/>
					<table class="w190">
						<tr>
							<td class="graphMain bordered" style="width:3mm; vertical-align: middle; word-break: break-all" rowspan="4" align="center">
								<font size="2">
								<b>
									<xsl:choose>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='importation'">IMPORTATION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reexportation'">REEXPORTATION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='exportation'">EXPORTAT ION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reimportation'">REIMPORTATION</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='transitOpen'">TRANSIT<br/><br/>OPEN</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='transitClose'">TRANSIT<br/><br/>CLOSE</xsl:when>
										<xsl:otherwise>IMPORTATION</xsl:otherwise>
									</xsl:choose>
								</b>
								</font>
							</td>
							<td class="graphMain bordered" style="width:3mm; vertical-align: middle; word-break: break-all" rowspan="4" align="center">
								<b>
								<font size="2">
									<xsl:choose>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='importation'">ВВОЗ</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reexportation' or ata_cis:Sheet/ata_ct:TearSheetType='exportation'">ВЫВОЗ</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='reimportation'">ОБРАТНЫЙ<br/><br/>ВВОЗ</xsl:when>
										<xsl:when test="ata_cis:Sheet/ata_ct:TearSheetType='transitOpen' or ata_cis:Sheet/ata_ct:TearSheetType='transitClose'">ТРАНЗИТ</xsl:when>
										<xsl:otherwise>ВВОЗ</xsl:otherwise>
									</xsl:choose>
								</font>
								<font size="1"><xsl:if test="ata_cis:Sheet/ata_ct:TearSheetType='reexportation'"><br/>(ранее<br/><br/>ввезенных<br/><br/>товаров)</xsl:if></font>
								</b>
							</td>
							<td class="graphMain bordered" style="width:84mm" rowspan="2">
								<b>А. HOLDER AND ADDRESS / ДЕРЖАТЕЛЬ И АДРЕС</b><br/>
							</td>
							<td class="graphMain bordered" style="width:100mm">
								<b>G. FOR ISSUING ASSOCIATION USE / Заполняется ассоциацией, выдающей документы</b><br/>
								<b>IMPORTATION VOUCHER No / ДОКУМЕНТ НА ВВОЗ № </b>
								<xsl:value-of select="ata_cis:Sheet/ata_ct:VoucherNumber"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<b>a) CARNET No. / Карнет №</b><br/>
								<xsl:value-of select="ata_cis:Sheet/ata_ct:CarnetNumber"/>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:84mm">
								<b>B. REPRESENTED BY / Кем представлен</b><br/><br/>
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<b>b) ISSUED BY / Кем выдано</b><br/><br/>
							</td>
						</tr>
						<tr>
							<td class="graphMain bordered" style="width:84mm">
								<b>C. INTENDED USE OF GOODS / Предполагаемое использование товаров</b><br/><br/>
							</td>
							<td class="graphMain bordered" style="width:100mm" colspan="2">
								<b>c) VALID UNTIL / Действительно до</b><br/>
								<table style="width:70mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:15mm" align="center"/>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:10mm" align="center"/>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:10mm" align="center"/>
										<td class="annot graphMain" style="width:29mm"/>
									</tr>
									<tr>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:15mm" align="center">
											<b>year<br/>год</b>
										</td>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:10mm" align="center">
											<b>month<br/>месяц</b>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center"/>
										<td class="annot graphMain" style="width:39mm" colspan="2">
											<b>day (inclusive)<br/>день (включительно)</b>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:6mm" colspan="2"/>
							<td class="graphMain bordered" style="width:84mm">
								<b>D. MEANS OF TRANSPORT / ТРАНСПОРТНОЕ СРЕДСТВО</b><br/>
								<table style="width:84mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:82mm">
											<xsl:value-of select="ata_cis:Sheet/ata_ct:TransportMeans"/>
										</td>
									</tr>
								</table>
							</td>
							<td class="graphMain bordered" style="width:100mm" rowspan="3" bgcolor="#e3e3e3">
								<b>FOR CUSTOMS USE ONLY / ЗАПОЛНЯЕТСЯ ТАМОЖНЕЙ</b><br/><br/>
								<b>H. CLEARANCE ON IMPORTATION / ТАМОЖЕННОЕ ОФОРМЛЕНИЕ ПРИ ВВОЗЕ</b><br/><br/>
								<b>a) The goods referred to in the above declaration have been temporarily imported / Товары, являющиеся предметом вышеуказанного заявления, ввезены временно</b><br/><br/>
								<b>b) Final date for re-exportation/production to Customs / Предельная дата вывоза/предъявления на таможне:</b><br/>
								<table style="width:70mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:15mm" align="center">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_cis:ImportationPeriod,1,4)"/>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:10mm" align="center">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_cis:ImportationPeriod,6,2)"/>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center">/</td>
										<td class="value graphMain" style="width:10mm" align="center">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_cis:ImportationPeriod,9,2)"/>
										</td>
										<td class="annot graphMain" style="width:29mm"/>
									</tr>
									<tr>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:15mm" align="center">
											<b>year<br/>год</b>
										</td>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:10mm" align="center">
											<b>month<br/>месяц</b>
										</td>
										<td class="annot graphMain" style="width:2mm" align="center"/>
										<td class="annot graphMain" style="width:39mm" colspan="2">
											<b>day (inclusive)<br/>день (включительно)</b>
										</td>
									</tr>
								</table>
								<br/>
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="annot graphMain" style="width:98mm">
											<b>Registered under reference No. / Зарегистрировано за №</b>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:98mm">
											<xsl:apply-templates select="ata_cis:Sheet/ata_ct:RegistrationNumber"/>
										</td>
									</tr>
								</table>
								<br/>
								<b>c) This voucher must be forwarded to Customs Office at / Данный отрывной талон должен быть передан в таможенный орган (место нахождение):</b><br/>
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:98mm">
											<xsl:value-of select="ata_cis:DeclarantInfo/ata_ct:DeclarantSign/ata_ct:Place"/>
										</td>
									</tr>
								</table>
								<br/>
								<b>d) Other remarks / Прочие данные:</b><br/>
								<table class="w190">
									<xsl:for-each select="ata_cis:CustomsInfo">
										<tr>
											<td class="annot graphMain" style="width:3mm"/>
											<td class="annot graphMain" style="width:97mm">
												<xsl:for-each select="ata_ct:CustomsMark">
													<table class="w190">
														<xsl:if test="ata_ct:ActInformation">
															<tr><td class="annot graphMain">Act(s) / Акт(ы):</td></tr>	
														</xsl:if>
														<xsl:for-each select="ata_ct:ActInformation">
															<tr><td class="value graphMain"><xsl:apply-templates select="."/></td></tr>
														</xsl:for-each>
														<xsl:if test="ata_ct:AuthorizationDocument">
															<tr><td class="annot graphMain">Permit(s) / Разрешительный(ые) документ(ы):</td></tr>	
														</xsl:if>
														<xsl:for-each select="ata_ct:AuthorizationDocument">
															<tr><td class="value graphMain"><xsl:apply-templates select="."/></td></tr>
														</xsl:for-each>
														<xsl:if test="ata_ct:AppliedSeal">
															<tr><td class="annot graphMain">Seal(s) / Наложенные пломбы:</td></tr>	
														</xsl:if>
														<xsl:for-each select="ata_ct:AppliedSeal">
															<tr><td class="value graphMain"><xsl:apply-templates select="."/></td></tr>
														</xsl:for-each>
														<xsl:if test="ata_ct:OtherMarks">
															<tr><td class="annot graphMain">Other remarks / Прочие данные:</td></tr>
															<tr><td class="value graphMain"><xsl:value-of select="ata_ct:OtherMarks"/></td></tr>
														</xsl:if>
													</table>
												</xsl:for-each>
												<xsl:if test="ata_ct:CustomsMark"><br/></xsl:if>
												<xsl:if test="ata_ct:Type">
													<table>
														<tr><td class="annot graphMain">Date and Time of signing / Дата и время подписания:</td></tr>
														<tr><td class="value graphMain"><xsl:value-of select="ata_ct:Type"/></td></tr>
													</table>
													<br/>
												</xsl:if>
											</td>
										</tr>
										<xsl:for-each select="ata_ct:Decision">
											<tr>
												<td class="annot graphMain" style="width:2mm"/>
												<td class="value graphMain" style="width:98mm">
													<xsl:text>Decision / Решение: </xsl:text>
													<xsl:value-of select="ata_ct:DecisionCode"/>
													<xsl:text> </xsl:text>
													<xsl:value-of select="ata_ct:DecisionText"/>
												</td>
											</tr>
											<xsl:if test="ata_ct:DecisionComment">
												<tr>
													<td class="annot graphMain" style="width:2mm"/>
													<td class="value graphMain" style="width:98mm">
														<xsl:text>Comment / Комментарий: </xsl:text>
														<xsl:value-of select="ata_ct:DecisionComment"/>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
									</xsl:for-each>
								</table>
								<br/>
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:10mm"><b>At / в</b></td>
										<td class="value graphMain" style="width:90mm" align="center">
											<xsl:apply-templates select="ata_cis:CustomsInfo/ata_ct:CustomsPersonRequisites/ata_ct:CustomsInfo"/>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:10mm"/>
										<td class="annot graphMain" style="width:90mm" align="center">
											<b>Customs Office / Таможенный орган</b>
										</td>
									</tr>
								</table>
								<br/><br/><br/>
								<table  class="w190">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:10mm" align="center">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_ct:Decision/ata_ct:DecisionDate,1,4)"/>
										</td>
										<td class="annot graphMain" style="width:1mm" align="center">/</td>
										<td class="value graphMain" style="width:7mm" align="center">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_ct:Decision/ata_ct:DecisionDate,6,2)"/>
										</td>
										<td class="annot graphMain" style="width:1mm" align="center">/</td>
										<td class="value graphMain" style="width:7mm" align="center">
											<xsl:value-of select="substring(ata_cis:CustomsInfo/ata_ct:Decision/ata_ct:DecisionDate,9,2)"/>
										</td>
										<td class="annot graphMain" style="width:25mm"/>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:45mm" align="center">
											<xsl:for-each select="ata_cis:CustomsInfo/ata_ct:CustomsPersonRequisites/ata_ct:CustomsPersonSignature">
												<xsl:value-of select="cat_ru:PersonName"/>
												<xsl:if test="cat_ru:LNP"> ЛНП: <xsl:value-of select="cat_ru:LNP"/></xsl:if>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:10mm" align="center">
											<b>year<br/>год</b>
										</td>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:7mm" align="center">
											<b>month<br/>месяц</b>
										</td>
										<td class="annot graphMain"/>
										<td class="annot graphMain" style="width:32mm" colspan="2">
											<b>day (inclusive)<br/>день (включительно)</b>
										</td>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="annot graphMain" style="width:45mm" align="center"><b>Signature and Stamp<br/>Подпись и печать</b></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:6mm" colspan="2"/>
							<td class="graphMain bordered" style="width:84mm">
								<b>E. PACKAGING DETAILS (Number, Kind, Marks etc.) / ПОДРОБНОЕ ОПИСАНИЕ УПАКОВКИ (количество, вид, маркировка и т.д.)</b><br/>
								<table style="width:84mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:82mm">
											<xsl:value-of select="ata_cis:Sheet/ata_ct:PackingDetails"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:6mm" colspan="2"/>
							<td class="graphMain bordered" style="width:84mm; border-bottom:0">
								<b>F. TEMPORARY IMPORTATION DECLARATION / ЗАЯВЛЕНИЯ О ВРЕМЕННОМ ВВОЗЕ</b><br/><br/>
								<b>I, duly authorised / Я, должным образом уполномоченный:</b><br/><br/>
								<b>a) declare that I am temporarily importing in compliance with the conditions laid down in the laws and regulations of the country/Customs territory of importation, the goods enumerated in the list overleaf and described in General List under Item No(s) / заявляю, что я временно ввожу на условиях предусмотренных законодательством страны/таможенной территории временного ввоза, товары, перечисленные в списке на обратной стороне листа и указанные в Общем списке товаров под порядковым(и) номером(ами)</b>
								<table style="width:84mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:82mm">
											<xsl:value-of select="ata_cis:DeclarantInfo/ata_ct:GoodsNumbers"/>
										</td>
									</tr>
								</table>
								<br/>
								<b>b) declare that the said goods are intended for use at / заявляю что указанные товары предназначаются для применения в</b>
								<table style="width:84mm">
									<tr>
										<td class="annot graphMain" style="width:2mm"/>
										<td class="value graphMain" style="width:82mm">
											<xsl:value-of select="ata_cis:DeclarantInfo/ata_cis:ImportationPurpose"/>
										</td>
									</tr>
								</table>
								<br/>
								<b>c) undertake to comply with these laws and regulations and to re-export the said goods within the period stipulated by the Customs Office or regularize their status in accordance with the laws and regulations of the country/Customs territory of importation / обязуюсь соблюдать требования данного законодательства и вывезти указанные ранее ввезенные товары в течение срока, установленного таможенным органом, или оформить их статус в соответствии с законодательством страны/таможенной территории временного ввоза</b>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" style="width:6mm" colspan="2"/>
							<td class="graphMain bordered" style="width:84mm; border-top:0; border-right:0">
								<br/><b>d) confirm that the information given is true and complete / подтверждаю, что предоставленная информация - достоверная и полная</b>
							</td>
							<td class="graphMain bordered" style="width:100mm; border-left:0">
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:10mm" rowspan="2"><b>Place<br/>Место</b></td>
										<td class="value graphMain" style="width:35mm"><xsl:value-of select="ata_cis:DeclarantInfo/ata_ct:DeclarantSign/ata_ct:Place"/></td>
										<td class="annot graphMain" style="width:35mm" rowspan="2" align="right"><b>Date (year/month/day)<br/>Дата (год/мес./день)</b></td>
										<td class="value graphMain" style="width:20mm" align="center">
											<xsl:for-each select="ata_cis:DeclarantInfo/ata_ct:DeclarantSign/ata_ct:FillingDate">
												<xsl:value-of select="substring(.,1,4)"/>
												<xsl:text> / </xsl:text>
												<xsl:value-of select="substring(.,6,2)"/>
												<xsl:text> / </xsl:text>
												<xsl:value-of select="substring(.,9,2)"/>
											</xsl:for-each>
										</td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:35mm"/>
										<td class="annot graphMain" style="width:20mm"><br/></td>
									</tr>
								</table>
								<table class="w190">
									<tr>
										<td class="annot graphMain" style="width:10mm" rowspan="2"><b>Name<br/>ФИО</b></td>
										<td class="value graphMain" style="width:90mm"><xsl:value-of select="ata_cis:DeclarantInfo/ata_ct:DeclarantSign/ata_ct:DeclarantName"/></td>
									</tr>
									<tr>
										<td class="annot graphMain" style="width:90mm"><br/></td>
									</tr>
								</table>
								<table class="w190">	
									<tr>
										<td class="annot graphMain" style="width:32mm" rowspan="2"><b>Signature of holder<br/>Подпись владельца</b></td>
										<td class="annot graphMain" style="width:2mm">X</td>
										<td class="value graphMain" style="width:64mm" align="center"/>
										<td class="annot graphMain" style="width:2mm">X</td>
									</tr>
									<tr>
										<td class="annot graphMain"/><td class="annot graphMain" style="width:64mm"></td>
										<td class="annot graphMain"><br/></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа DocumentBaseType -->
	<xsl:template match="ata_ct:DocumentRequisites">
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
	<!-- Шаблон для типа ata_ct:CustomsMarkType -->
	<xsl:template match="ata_ct:CustomsMark">
		<xsl:variable name="other1" select="count(ata_ct:ActInformation)"/>
		<xsl:variable name="other2" select="count(ata_ct:AuthorizationDocument)"/>
		<xsl:variable name="other3" select="count(ata_ct:AppliedSeal)"/>
		<table class="w190">
			<xsl:for-each select="ata_ct:ActInformation">
				<xsl:if test="position()=1">
					<tr>
						<td class="value graphMain" style="width:43mm; vertical-align:middle" rowspan="{$other1}">Act(s) / Акт(ы):</td>
						<td class="value graphMain"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position() &gt; 1">
					<tr><td class="value graphMain"><xsl:apply-templates select="."/></td></tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ata_ct:AuthorizationDocument">
				<xsl:if test="position()=1">
					<tr>
						<td class="value graphMain" style="width:43mm; vertical-align:middle" rowspan="{$other2}">Permit(s) /<br/>Разрешительный(ые) документ(ы):</td>
						<td class="value graphMain"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position() &gt; 1">
					<tr><td class="value graphMain"><xsl:apply-templates select="."/></td></tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:for-each select="ata_ct:AppliedSeal">
				<xsl:if test="position()=1">
					<tr>
						<td class="value graphMain" style="width:43mm; vertical-align:middle" rowspan="{$other3}">Seal(s) / Наложенные пломбы:</td>
						<td class="value graphMain"><xsl:apply-templates select="."/></td>
					</tr>
				</xsl:if>
				<xsl:if test="position() &gt; 1">
					<tr><td class="value graphMain"><xsl:apply-templates select="."/></td></tr>
				</xsl:if>
			</xsl:for-each>
			<xsl:if test="ata_ct:OtherMarks">
				<tr>
					<td class="value graphMain" style="width:43mm; vertical-align:middle">Other remarks / Прочие данные:</td>
					<td class="value graphMain"><xsl:value-of select="ata_ct:OtherMarks"/></td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:AppliedSealType -->
	<xsl:template match="ata_ct:AppliedSeal">
		<xsl:value-of select="ata_ct:SealNumbers"/>
		<xsl:text> the goods under Items No(s) / номер(а) товара(ов): </xsl:text>
		<xsl:value-of select="ata_ct:GoodsNumbers"/>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:ActInformationType -->
	<xsl:template match="ata_ct:ActInformation">
		<xsl:choose>
			<xsl:when test="ata_ct:ActType='ATD'">досмотра </xsl:when>
			<xsl:when test="ata_ct:ActType='ATO'">осмотра </xsl:when>
			<xsl:when test="ata_ct:ActType='ATN'">наблюдения </xsl:when>
		</xsl:choose>
		<xsl:if test="ata_ct:ActNumber">№ <xsl:value-of select="ata_ct:ActNumber"/></xsl:if>
		<xsl:if test="ata_ct:ActDate">
			<xsl:text>от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="ata_ct:ActDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:text> the goods under Items No(s) / номер(а) товара(ов): </xsl:text>
		<xsl:value-of select="ata_ct:GoodsNumbers"/>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:AuthorizationDocumentType -->
	<xsl:template match="ata_ct:AuthorizationDocument">
		<xsl:apply-templates select="ata_ct:DocumentRequisites"/>
		<xsl:text>  issued by / выдан: </xsl:text>
		<xsl:value-of select="ata_ct:FOIVName"/>
		<xsl:text> the goods under Items No(s) / номер(а) товара(ов): </xsl:text>
		<xsl:value-of select="ata_ct:GoodsNumbers"/>
	</xsl:template>
	<!-- Шаблон для типа ata_ct:CustomsPersonSignatureType -->
	<xsl:template match="ata_ct:CustomsPersonSignature">
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:LNP">
			<xsl:text> ЛНП </xsl:text>
			<xsl:value-of select="cat_ru:LNP"/>
		</xsl:if>
	</xsl:template>	
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="ata_ct:CustomsInfo">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:OfficeName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ata_ct:RegistrationNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
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
</xsl:stylesheet>
