<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.12.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.12.0" xmlns:cltESAD_ru="urn:customs.ru:RUCommonLeafTypes:5.4.0" xmlns:catESAD_ru="urn:customs.ru:RUCommonAggregateTypes:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.13.1" xmlns:voia="urn:customs.ru:Information:CustomsDocuments:Voi_ActInspection:5.13.2" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа Voi_ActInspectionType -->
	<xsl:template match="voia:Voi_ActInspection">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
					@media print {
						div.page {
							border: none;
							margin:0;
							padding:0;
						}
					}

					body {
						background: #cccccc;
					}

					div.page {
						width: 210mm;
						margin: 10px auto;
						margin-top: 6pt;
						margin-bottom: 6pt;
						padding: 10mm 10mm 10mm 15mm;
						background: #ffffff;
						border: solid 1pt #000000;
						page-break-after: always;
						font-family: Verdana;
					}

					.marg-top {
						margin-top:5mm;
					}

					table {
						width: 100%;
						border: 0;
						empty-cells: show;
						border-collapse: collapse;
						margin-top: 1px;
						word-break: break-all; /*перенос длинных строк не выходя за ширину ячейки*/
					}

					table.border tr {
						border: 1px solid gray;
						padding: 5px;
					}

					table.border td {
						padding: 5px;
						border: solid 1px windowtext;
					}

					.graph {
						font-family: Verdana;
						font-size: 12pt;
					}

					.value {
						border-bottom: solid 1px DarkGrey;
					}

					div.title, tr.title td { font-weight:bold;  }

					.bordered { border-collapse: collapse; }

					td {vertical-align:bottom;}
					
					td.bordered {
						border: solid 1px windowtext;
					}

					.graphMainTitle {
						vertical-align:top;
						font-size: 12pt;
						font-family:Verdana;
						font-weight: bold;
					}

					.graphMainSubTitle {
						vertical-align:top;
						font-size: 11pt;
						font-family:Verdana;
						font-weight: bold;
					}

					.graphMainHd {
						vertical-align:top;
						font-size: 12pt;
						font-family:Verdana;
					}

					.graphMainSubHd {
						vertical-align:top;
						font-size: 10pt;
						font-family:Verdana;
					}

					.graphMainValue {
						vertical-align:bottom;
						font-style: italic;
						font-family:Verdana;
						font-size: 12pt;
					}

					td.bord_bottom {
						border-bottom: solid 1px DarkGrey;
					}
					
					.delim {
						height: 7pt;
					}

					.docheader
					{
					font-size: 20pt;
					font-family:Verdana;
					}			

					.docheader_number
					{
					font-size: 18pt;
					font-family:Verdana;
					}			

					.normal
					{
					font-size: 12pt;
					font-family:Verdana;
					}			

					.bold
					{
					font-weight: bold;
					font-family:Verdana;
					font-size: 12pt;
					}			

					.italic
					{
					font-style: italic;
					font-family:Verdana;
					font-size: 10pt;
					}			
					

				</style>
			</head>
			<body>
				<div class="page">
					<xsl:variable name="img_gto">
						<xsl:value-of select="'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'"/>
					</xsl:variable>				

					<table width="190">
						<tbody>
							<tr>
								<td align="left" valign="top" width="25%">
									<img>
										<xsl:attribute name="src">
											<xsl:value-of select="concat('data:image/jpeg;base64,',$img_gto)"/>
										</xsl:attribute>
									</img> 
								</td>
								<td align="center"  style="vertical-align:middle;" width="70%">
									<span class="docheader">Акт осмотра с ИДК</span>
									<xsl:if test="voia:ActNumber">
										<br/>
										<br/>
										<span class="docheader_number">№ </span>
										<span class="docheader_number">
											<xsl:value-of select="voia:ActNumber/*[local-name() = 'CustomsCode']"/>
											<xsl:text>/</xsl:text>
											<xsl:call-template name="gtd_date">
												<xsl:with-param name="dateIn" select="voia:ActNumber/*[local-name() = 'RegistrationDate']"/>
											</xsl:call-template>
											<xsl:text>/</xsl:text>
											<xsl:choose>
												<xsl:when test="string-length(voia:ActNumber/*[local-name() = 'GTDNumber']) = 7">
													<xsl:call-template name="ActNumber">
														<xsl:with-param name="GTDID" select="substring(voia:ActNumber/*[local-name() = 'GTDNumber'],2,6)"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="ActNumber">
														<xsl:with-param name="GTDID" select="voia:ActNumber/*[local-name() = 'GTDNumber']"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</span>	
									</xsl:if>
								</td>
								<td align="left" valign="top" width="5%">
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table width="190">
						<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
						<tbody>
							<tr>
								<td><br/></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>Дата и время начала осмотра</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td class="bord_bottom">
									<xsl:call-template name="russian_datetime">
										<xsl:with-param name="dateIn" select="voia:BeginInspectionDateTime"/>
									</xsl:call-template>
								</td>
							</tr>
							<tr class="delim"><td colspan="5"></td></tr>
							<tr>
								<td>Дата и время окончания осмотра</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td class="bord_bottom">
									<xsl:call-template name="russian_datetime">
										<xsl:with-param name="dateIn" select="voia:EndInspectionDateTime"/>
									</xsl:call-template>
								</td>
							</tr>
							<xsl:if test="voia:ReplaceDateTime">
								<tr class="delim"><td colspan="5"></td></tr>
								<tr>
									<td>Дата и время выставления объекта<br/>для проведения осмотра с ИДК</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:call-template name="russian_datetime">
											<xsl:with-param name="dateIn" select="voia:ReplaceDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="voia:CommentsDateTime">
								<tr class="delim"><td colspan="5"></td></tr>
								<tr>
									<td>Дата и время внесения заключения<br/>оператором</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:call-template name="russian_datetime">
											<xsl:with-param name="dateIn" select="voia:CommentsDateTime"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="voia:PreviousInspection">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Регистрационный номер акта ранее<br/>проведенного осмотра с ИДК</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:value-of select="voia:PreviousInspection/*[local-name() = 'CustomsCode']"/>
										<xsl:text>/</xsl:text>
										<xsl:call-template name="gtd_date">
											<xsl:with-param name="dateIn" select="voia:PreviousInspection/*[local-name() = 'RegistrationDate']"/>
										</xsl:call-template>
										<xsl:text>/</xsl:text>
										<xsl:choose>
											<xsl:when test="string-length(voia:PreviousInspection/*[local-name() = 'GTDNumber']) = 7">
												<xsl:call-template name="ActNumber">
													<xsl:with-param name="GTDID" select="substring(voia:PreviousInspection/*[local-name() = 'GTDNumber'],2,6)"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="ActNumber">
													<xsl:with-param name="GTDID" select="voia:PreviousInspection/*[local-name() = 'GTDNumber']"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="voia:RepeatComments">
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td colspan="4">Причины проведения повторного  осмотра:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td colspan="4" class="bord_bottom">
										<xsl:for-each select="voia:RepeatComments">
											<xsl:apply-templates select="."/>
											<xsl:if test="position()!=last()">
												<br/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<table>
						<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="2%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="47%" align="left" class="graphMainValue" valign="bottom"/>
						<tbody>
							<tr>
								<td><br/></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="5" class="graphMainTitle">Направление на осмотр:</td>
							</tr>
							<tr class="delim"><td colspan="5"></td></tr>
							<tr>
								<td>Регистрационный номер</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td colspan="2" class="bord_bottom">
									<xsl:value-of select="voia:InstrNumber/*[local-name() = 'CustomsCode']"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="gtd_date">
										<xsl:with-param name="dateIn" select="voia:InstrNumber/*[local-name() = 'RegistrationDate']"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="voia:InstrNumber/*[local-name() = 'GTDNumber']"/>
								</td>
							</tr>
							<tr class="delim"><td colspan="5"></td></tr>
							<tr>
								<td>Уникальный идентификатор</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td colspan="2" class="bord_bottom italic">
									<xsl:value-of select="voia:InstrID"/>
								</td>
							</tr>
							<xsl:if test="voia:RepeatAct">
								<tr class="delim"><td colspan="5"></td></tr>
								<tr>
									<td>Признак повторного осмотра<br/>по одному номеру направления</td>
									<td></td>
									<td colspan="2">
										<xsl:choose>
											<xsl:when test="voia:RepeatAct='true' or voia:RepeatAct='1'">
												<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
											</xsl:when>
											<xsl:otherwise>
												<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td></td>
								</tr>
							</xsl:if>
							<xsl:if test="voia:DelayComments">
								<tr class="delim"><td colspan="5"></td></tr>
								<tr>
									<td>Причины нарушения сроков<br/>проведения осмотра</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td colspan="2" class="bord_bottom" >
										<xsl:for-each select="voia:DelayComments"><xsl:value-of select="."/></xsl:for-each>
									</td>
									<td></td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<table width="190">
						<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
						<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="2%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="20%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="3%" align="left" class="graphMainValue" valign="bottom"/>
						<col width="24%" align="left" class="graphMainValue" valign="bottom"/>
						<tbody>
							<tr>
								<td><br/></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="7" class="graphMainTitle">ИДК:</td>
							</tr>
							<xsl:if test="voia:TypeScan">
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Тип сканирования</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td colspan="4" class="bord_bottom">
										<xsl:choose>
											<xsl:when test="voia:TypeScan='1'">сканирование объекта контроля</xsl:when>
											<xsl:when test="voia:TypeScan='2'">радиационный контроль</xsl:when>
											<xsl:when test="voia:TypeScan='3'">повторное сканирование</xsl:when>
											<xsl:when test="voia:TypeScan='4'">при проведении сканирования<br/>произошел сбой</xsl:when>
											<xsl:otherwise><xsl:value-of select="voia:TypeScan"/></xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="voia:IDKType">
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Тип эксплуатируемого ИДК</td>
									<td></td>
									<td colspan="2">
										<xsl:choose>
											<xsl:when test="voia:IDKType='М' or voia:IDKType='м' or voia:IDKType='M' or voia:IDKType='m'">
												<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
											</xsl:when>
											<xsl:otherwise>
												<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td> - мобильный</td>
									<td>
										<xsl:choose>
											<xsl:when test="voia:IDKType='С' or voia:IDKType='с' or voia:IDKType='C' or voia:IDKType='c'">
												<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
											</xsl:when>
											<xsl:otherwise>
												<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td> - стационарный</td>
								</tr>
							</xsl:if>
							<tr class="delim"><td colspan="7"></td></tr>
							<tr>
								<td>Уникальный идентификатор ИДК</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td colspan="4" class="bord_bottom">
									<xsl:value-of select="voia:IDK_id"/>
								</td>
							</tr>
							<xsl:if test="voia:IDKKind">
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Вид места дислокации ИДК</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td colspan="4" class="bord_bottom">
										<xsl:choose>
											<xsl:when test="voia:IDKKind = 1">автомобильный ПП</xsl:when>
											<xsl:when test="voia:IDKKind = 2">морской порт</xsl:when>
											<xsl:when test="voia:IDKKind = 3">ЖДПП</xsl:when>
											<xsl:when test="voia:IDKKind = 4">воздушный ПП</xsl:when>
											<xsl:when test="voia:IDKKind = 5">вне ПП</xsl:when>
											<xsl:otherwise>неизвестно</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>

							<xsl:if test="voia:NumberCustomsZone or voia:CustomsZoneName">
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Зона таможенного контроля:</td>
								</tr>
								<xsl:if test="voia:NumberCustomsZone">
									<tr class="delim"><td colspan="7"></td></tr>
									<tr>
										<td>&#160;&#160;&#160;Номер зоны</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td colspan="4" class="bord_bottom">
											<xsl:value-of select="voia:NumberCustomsZone"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="voia:CustomsZoneName">
									<tr class="delim"><td colspan="7"></td></tr>
									<tr>
										<td>&#160;&#160;&#160;Наименование зоны</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td colspan="4" class="bord_bottom">
											<xsl:value-of select="voia:CustomsZoneName"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<xsl:if test="voia:CustomsOfficerIDK">
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Оператор ИДК:</td>
									<xsl:call-template name="CustomsOfficer">
										<xsl:with-param name="nodeCO" select="voia:CustomsOfficerIDK"/>
									</xsl:call-template>
								</tr>
							</xsl:if>
						</tbody>
					</table>

					<xsl:if test="voia:CustomsOfficer">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
							<tbody>
								<tr>
									<td><br/></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="4" class="graphMainTitle">Должностное лицо, подписавшее Акт осмотра:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:if test="voia:CustomsOfficer">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td colspan="4">Должностное лицо ТО:</td>
										<xsl:call-template name="CustomsOfficer">
											<xsl:with-param name="nodeCO" select="voia:CustomsOfficer"/>
										</xsl:call-template>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="voia:IDKCustoms">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
							<tbody>
								<tr>
									<td><br/></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="4" class="graphMainTitle">Таможенный орган:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:for-each select="voia:IDKCustoms">
									<xsl:if test="cat_ru:Code">
										<tr class="delim"><td colspan="4"></td></tr>
										<tr>
											<td>Код таможенного органа</td>
											<td></td>
											<td class="bord_bottom"></td>
											<td class="bord_bottom">
												<xsl:apply-templates select="cat_ru:Code"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="cat_ru:OfficeName">
										<tr class="delim"><td colspan="4"></td></tr>
										<tr>
											<td>Наименование таможенного органа</td>
											<td></td>
											<td class="bord_bottom"></td>
											<td class="bord_bottom">
												<xsl:apply-templates select="cat_ru:OfficeName"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="cat_ru:CustomsCountryCode">
										<tr class="delim"><td colspan="4"></td></tr>
										<tr>
											<td>Код государства - члена ЕАЭС</td>
											<td></td>
											<td class="bord_bottom"></td>
											<td class="bord_bottom">
												<xsl:apply-templates select="cat_ru:CustomsCountryCode"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>	
							</tbody>
						</table>
					</xsl:if>

					<xsl:if test="voia:CustDocNumber">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
							<tbody>
								<tr>
									<td><br/></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="4" class="graphMainTitle">Номер таможенного документа, по которому произведен осмотр:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<xsl:for-each select="voia:CustDocNumber">
									<xsl:if test="ATDcat:DocKind">
										<tr class="delim"><td colspan="4"></td></tr>
										<tr>
											<td>Тип документа</td>
											<td></td>
											<td class="bord_bottom"></td>
											<td class="bord_bottom">
												<xsl:choose>
													<xsl:when test="ATDcat:DocKind='0'">уведомление о прибытии на таможенную территорию</xsl:when>
													<xsl:when test="ATDcat:DocKind='1'">транзитная декларация</xsl:when>
													<xsl:when test="ATDcat:DocKind='2'">книжка МДП</xsl:when>
													<xsl:when test="ATDcat:DocKind='3'">номер ДО-1/описи</xsl:when>
													<xsl:when test="ATDcat:DocKind='4'">ДТ</xsl:when>
													<xsl:when test="ATDcat:DocKind='5'">уведомление об убытии</xsl:when>
													<xsl:when test="ATDcat:DocKind='6'">иностранная транзитная декларация</xsl:when>
													<xsl:when test="ATDcat:DocKind='7'">коносамент</xsl:when>
													<xsl:when test="ATDcat:DocKind='8'">документ физического лица</xsl:when>
													<xsl:when test="ATDcat:DocKind='9'">иное</xsl:when>
													<xsl:otherwise><xsl:value-of select="ATDcat:DocKind"/></xsl:otherwise>
												</xsl:choose>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="ATDcat:GTDID">
										<tr class="delim"><td colspan="4"></td></tr>
										<tr>
											<td>Регистрационный номер документа</td>
											<td></td>
											<td class="bord_bottom"></td>
											<td class="bord_bottom">
												<xsl:apply-templates select="ATDcat:GTDID"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="ATDcat:DocNumber">
										<tr class="delim"><td colspan="4"></td></tr>
										<tr>
											<td>Номер документа</td>
											<td></td>
											<td class="bord_bottom"></td>
											<td class="bord_bottom">
												<xsl:value-of select="ATDcat:DocNumber/*[local-name() = 'DocNumber']"/>
												<xsl:if test="ATDcat:DocNumber/*[local-name() = 'DocDate']">
												<text> от </text>
												<xsl:value-of select="concat(substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],9,2),'.',substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],6,2),'.',substring(ATDcat:DocNumber/*[local-name() = 'DocDate'],1,4))"/>
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>	
								<xsl:if test="voia:Consignee">
									<tr><td colspan="4"><br/></td></tr>
									<tr>
										<td colspan="4" class="graphMainTitle">Сведения о получателе:</td>
										<xsl:apply-templates select="voia:Consignee"/>
									</tr>
								</xsl:if>
						
								<xsl:if test="voia:Carrier">
									<tr><td colspan="4"><br/></td></tr>
									<tr>
										<td colspan="4" class="graphMainTitle">Сведения о перевозчике:</td>
										<xsl:apply-templates select="voia:Carrier"/>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</xsl:if>
					
					<xsl:if test="voia:InspTransportMeans">
						<xsl:apply-templates select="voia:InspTransportMeans"/>
					</xsl:if>
					<xsl:if test="voia:BillDoc">
						<table width="190">
							<tbody>
								<tr>
									<td><br/></td>
								</tr>
								<tr>
									<td class="graphMainTitle">Товаросопроводительные документы:</td>
								</tr>
								<tr class="delim"><td></td></tr>
							</tbody>
						</table>
						<table width="190" class="border">
							<col width="45%" align="left" valign="bottom"/>
							<col width="35%" align="left" valign="bottom"/>
							<col width="20%" align="left" valign="bottom"/>
							<tbody>
								<tr class="graphMainHd" align="center">
									<td style="vertical-align:middle;">Наименование документа</td>
									<td style="vertical-align:middle;">Номер документа</td>
									<td style="vertical-align:middle;">Дата<br/>документа</td>
								</tr>
								<xsl:for-each select="voia:BillDoc">
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="voia:Distrust">
						<xsl:apply-templates select="voia:Distrust"/>
					</xsl:if>
					<xsl:if test="voia:Comments">
						<table width="190">
							<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
							<tbody>
								<tr>
									<td><br/></td>
								</tr>
								<tr>
									<td colspan="4" class="graphMainTitle">Общие результаты осмотра без подозрений:</td>
								</tr>
								<tr class="delim"><td></td></tr>
								<tr class="graphMainValue">
									<!--td class="bord_bottom"><xsl:value-of select="voia:Comments"/></td-->
									<td class="bord_bottom"><xsl:for-each select="voia:Comments"><xsl:value-of select="."/></xsl:for-each></td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа voia:ATOPhotoListType -->
	<xsl:template match="voia:ATOPhotoMeans|voia:ATOPhoto">
		<xsl:if test="voia:PhotoID">
			<table width="190">
				<tbody>
					<tr class="delim"><td> </td></tr>
					<tr>
						<td class="graphMain">&#160;&#160;&#160;&#160;&#160;Уникальный идентификатор RAW-снимка:</td>
					</tr>
					<tr class="delim"><td> </td></tr>
					<tr>
						<td class="bord_bottom"><xsl:value-of select="voia:PhotoID"/></td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="voia:PhotoJPG">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr class="delim"><td></td></tr>
					<tr>
						<td class="graphMain">&#160;&#160;&#160;&#160;&#160;Снимки формата JPG:</td>
					</tr>
					<tr class="delim"><td></td></tr>
				</tbody>
			</table>
			<table width="190" class="border">
				<col width="50%" align="left" valign="bottom"/>
				<col width="50%" align="left" valign="bottom"/>
				<tbody>
					<tr class="graphMainHd" align="center">
						<td style="vertical-align:middle;">Имя<br/>файла</td>
						<td style="vertical-align:middle;">Результаты<br/>анализа снимка</td>
					</tr>
					<xsl:for-each select="voia:PhotoJPG">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа voia:CargoPlaceType -->
	<xsl:template match="voia:CargoPlace">
		<xsl:if test="voia:CargoPlaceKind">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Тип грузового места</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:choose>
						<xsl:when test="voia:CargoPlaceKind='1'">платформа</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='2'">бортовая платформа с тентом</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='3'">самосвал - односторонняя разгрузка</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='4'">самосвал - двухсторонняя разгрузка</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='5'">самосвал - трехсторонняя разгрузка</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='6'">цистерна</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='7'">термо-цистерна</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='8'">крытый фургон</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='9'">изотермический фургон</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='10'">рефрижераторный фургон</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='11'">пассажирский кунг</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='12'">грузопассажирский фургон вагонной компоновки</xsl:when>
						<xsl:when test="voia:CargoPlaceKind='13'">другое</xsl:when>
						<xsl:otherwise><xsl:value-of select="voia:CargoPlaceKind"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="voia:Lengthm">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Длина грузовой площадки<br/>&#160;&#160;&#160;платформы, м</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="translate(voia:Lengthm, '.', ',')"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="voia:Widthm">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Ширина грузовой площадки<br/>&#160;&#160;&#160;платформы, м</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="translate(voia:Widthm, '.', ',')"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="voia:Heightm">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Высота грузового отсека<br/>&#160;&#160;&#160;фургона, м</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="translate(voia:Heightm, '.', ',')"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа voia:CustomsPersonDetails -->
	<!--	match="voia:CustomsOfficer|voia:CustomsOfficerIDK">-->
	<xsl:template name="CustomsOfficer">
		<xsl:param name="nodeCO"/>
		
		<tr class="delim"><td colspan="4"></td></tr>
		<tr>
			<td>&#160;&#160;&#160;ФИО</td>
			<td></td>
			<td class="bord_bottom"></td>
			<td colspan="4" class="bord_bottom">
				<xsl:value-of select="$nodeCO/cat_ru:PersonSurname"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$nodeCO/cat_ru:PersonName"/>
				<xsl:if test="$nodeCO/cat_ru:PersonMiddleName">										
					<xsl:text> </xsl:text>
					<xsl:value-of select="$nodeCO/cat_ru:PersonMiddleName"/>
				</xsl:if>
			</td>
		</tr>
		<xsl:if test="$nodeCO/cat_ru:PersonPost">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Должность</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td colspan="4" class="bord_bottom">
					<xsl:value-of select="$nodeCO/cat_ru:PersonPost"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="$nodeCO/ATDcat:LNP or $nodeCO/ATDcat:CustomsCode">
			<tr class="delim"><td colspan="$colcnt+3"></td></tr>
			<tr>
				<xsl:choose>
					<xsl:when test="$nodeCO/ATDcat:LNP and $nodeCO/ATDcat:CustomsCode">
						<td>&#160;&#160;&#160;ЛНП (код ТО на оттиске ЛНП)</td>
					</xsl:when>
					<xsl:when test="$nodeCO/ATDcat:LNP">
						<td>&#160;&#160;&#160;ЛНП</td>
					</xsl:when>
					<xsl:when test="$nodeCO/ATDcat:CustomsCode">
						<td>&#160;&#160;&#160;Код ТО на оттиске ЛНП</td>
					</xsl:when>
				</xsl:choose>
				<td></td>
				<td class="bord_bottom"></td>
				<td colspan="4" class="bord_bottom">
					<xsl:if test="$nodeCO/ATDcat:LNP">
						<xsl:value-of select="$nodeCO/ATDcat:LNP"/>
						<xsl:if test="$nodeCO/ATDcat:CustomsCode">
							<xsl:text> (</xsl:text>
						</xsl:if>
					</xsl:if>
					<xsl:if test="$nodeCO/ATDcat:CustomsCode">
						<xsl:value-of select="$nodeCO/ATDcat:CustomsCode"/>
						<xsl:if test="$nodeCO/ATDcat:LNP">
							<xsl:text>)</xsl:text>
						</xsl:if>
					</xsl:if>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа voia:DistrustType -->
	<xsl:template match="voia:Distrust">
		<table width="190">
			<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
			<tbody>
				<tr>
					<td><br/></td>
				</tr>
				<tr>
					<td class="graphMainTitle">Объект под подозрением:</td>
				</tr>
			</tbody>
		</table>
		<xsl:if test="voia:TruckInspResults">
			<xsl:apply-templates select="voia:TruckInspResults"/>
		</xsl:if>
		<xsl:if test="voia:DistrustDesc">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr>
						<td><br/></td>
					</tr>
					<tr>
						<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Результаты анализа снимков:</td>
					</tr>
					<tr class="delim"><td></td></tr>
					<tr class="graphMainValue">
						<td class="bord_bottom"><xsl:value-of select="voia:DistrustDesc"/></td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
		<xsl:if test="voia:DistrustRes">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr>
						<td><br/></td>
					</tr>
					<tr>
						<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Рекомендации по проведению досмотра:</td>
					</tr>
					<tr class="delim"><td></td></tr>
					<tr class="graphMainValue">
						<td class="bord_bottom"><xsl:value-of select="voia:DistrustRes"/></td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ATDcat:GTDID| voia:InstrNumber|voia:PreviousInspection">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<!-- Шаблон для типа voia:ATOPhotoType -->
	<xsl:template match="voia:PhotoJPG|voia:PhotoRAW">
		<tr class="graphMainValue">
			<!--td class="italic">
				<xsl:value-of select="voia:PhotoID"/>
			</td-->
			<td>
				<xsl:value-of select="voia:FileName"/>
				<!--img>
					<xsl:attribute name="src">
						<xsl:text>data:image/jpeg;base64,</xsl:text>
						<xsl:value-of select="voia:Preview" />
					</xsl:attribute>
				</img-->
			</td>
			<td>
				<xsl:value-of select="voia:Comments"/>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="voia:BillDoc">
		<tr class="graphMainValue">
			<td>
				<xsl:value-of select="cat_ru:PrDocumentName"/>
			</td>
			<td>
				<xsl:value-of select="cat_ru:PrDocumentNumber"/>
			</td>
			<td align="center">
				<xsl:call-template name="russian_datetime">
					<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
				</xsl:call-template>
			</td>
		</tr>
	</xsl:template>
	
	<!-- Шаблон для типа catESAD_cu:ContainerNumberType -->
	<xsl:template match="voia:InspContainer">
		<table width="190" class="border">
			<col width="50%" align="left"/>
			<col width="50%" align="left"/>
			<tbody>
				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr align="left">
					<td colspan="2" style="vertical-align:top;">


						<span class="graphMainHd">Номер (идентификатор) контейнера: </span>
						<span class="graphMainValue" style="font-weight: bold;">
							<xsl:value-of select="./*[local-name() = 'ContainerIdentificaror']"/>
						</span>
					</td>	
				</tr>
				<tr align="left">
					<td colspan="2" style="vertical-align:top;">
						<span class="graphMainHd">Признак заполнения контейнера.<br/></span>
						<span class="graphMainSubHd">(1 - товар занимает весь контейнер,
						   2- товар занимает часть контейнера): 
						</span>
						<span class="graphMainValue">
							<xsl:value-of select="./*[local-name() = 'FullIndicator']"/>
						</span>
					</td>	
				</tr>
				<xsl:if test="voia:ATOPhoto">
					<xsl:apply-templates select="voia:ATOPhoto"/>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>

	<!-- Шаблон для типа voia:InspTransportMeansType -->
	<xsl:template match="voia:InspTransportMeans">
		<table width="190">
			<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
			<tbody>
				<tr>
					<td><br/></td>
				</tr>
				<tr>
					<td class="graphMainTitle">Транспортное средство/контейнеры:</td>
				</tr>
			</tbody>
		</table>
		<xsl:if test="voia:ObjType">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr class="delim"><td></td></tr>
					<tr>
						<td class="graphMainSubTitle">&#160;&#160;&#160;Тип ТС:</td>
					</tr>
					<tr class="delim"><td></td></tr>
				</tbody>
			</table>
			<table class="w190">
				<tr class="graphMainValue">
					<td width="3%" align="center">
						<xsl:choose>
							<xsl:when test="voia:ObjType='0'">
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
							</xsl:when>
							<xsl:otherwise>
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="left" style="width:37%"> - грузовой (более 3,5 тонн)</td>
					<td width="3%" align="center">
						<xsl:choose>
							<xsl:when test="voia:ObjType='1'">
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
							</xsl:when>
							<xsl:otherwise>
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="left" style="width:37%"> - грузовой (менее 3,5 тонн)</td>
					<td width="3%" align="center">
						<xsl:choose>
							<xsl:when test="voia:ObjType='2'">
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
							</xsl:when>
							<xsl:otherwise>
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="left" style="width:17%"> - легковой</td>
					</tr>
					<tr class="delim" colspan="6"><td></td></tr>
					<tr class="graphMainValue">
						<td width="3%" align="center">
						<xsl:choose>
							<xsl:when test="voia:ObjType='3'">
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
							</xsl:when>
							<xsl:otherwise>
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="left" style="width:37%"> - пассажирский</td>
					<td width="3%" align="center">
						<xsl:choose>
							<xsl:when test="voia:ObjType='4'">
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
							</xsl:when>
							<xsl:otherwise>
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="left" style="width:37%"> - порожний</td>
					<td width="3%" align="center">
						<xsl:choose>
							<xsl:when test="voia:ObjType='9'">
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;">X</div>
							</xsl:when>
							<xsl:otherwise>
								<div align="right" style="width:5mm;height:5mm;border:1px solid grey;"> </div>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td align="left" style="width:17%"> - иной</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="voia:TransportMeans">
			<xsl:apply-templates select="voia:TransportMeans"/>
		</xsl:if>
		
		<xsl:if test="../voia:Person">
			<xsl:for-each select="../voia:Person">
				<table width="190">
					<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
					<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
					<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
					<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr class="delim"><td colspan="4"></td></tr>
						<tr>
							<td>Физическое лицо, управляющее ТС:</td>
						</tr>
						<tr>
							<td>&#160;&#160;&#160;ФИО</td>
							<td></td>
							<td class="bord_bottom"></td>
							<td colspan="4" class="bord_bottom">
								<xsl:for-each select="voia:PersonFIO">
									<xsl:value-of select="cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="cat_ru:PersonName"/>
									<xsl:if test="cat_ru:PersonMiddleName">										
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:PersonMiddleName"/>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<xsl:if test="voia:Person/cat_ru:PersonPost">
							<tr class="delim"><td colspan="4"></td></tr>
							<tr>
								<td>&#160;&#160;&#160;Должность</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td colspan="4" class="bord_bottom">
									<xsl:value-of select="cat_ru:PersonPost"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="voia:IdentityCard">
							<tr class="delim"><td colspan="4"></td></tr>
							<xsl:apply-templates select="voia:IdentityCard"/>
						</xsl:if>
					</tbody>
				</table>		
			</xsl:for-each>
		</xsl:if>

		<xsl:if test="voia:ATOPhotoMeans and (voia:ATOPhotoMeans/voia:PhotoRAW or voia:ATOPhotoMeans/voia:PhotoJPG)">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr>
						<td><br/></td>
					</tr>
					<tr>
						<td class="graphMainSubTitle">&#160;&#160;&#160;ИДК снимки транспортного средства:</td>
					</tr>
				</tbody>
			</table>
			<xsl:apply-templates select="voia:ATOPhotoMeans"/>
		</xsl:if>
		
		<xsl:if test="voia:InspContainer">
			<table width="190">
				<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
				<tbody>
					<tr class="delim"><td></td></tr>
					<tr>
						<td class="graphMainSubTitle">&#160;&#160;&#160;Сведения о контейнерах:</td>
					</tr>
					<tr class="delim"><td></td></tr>
				</tbody>
			</table>
			<xsl:for-each select="voia:InspContainer">
				<xsl:apply-templates select="."/>
				<br/>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа voia:TransportMeansType -->
	<xsl:template match="voia:TransportMeans">
		<table width="190">
			<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
			<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
			<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
			<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
			<tbody>
				<tr>
					<td><br/></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Сведения о транспортном средстве:</td>
				</tr>
				<xsl:if test="voia:TransportModeCode">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Код вида ТС</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="voia:TransportModeCode"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voia:TransportIdentifier">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Номер ТС</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="voia:TransportIdentifier"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voia:TrailerIdentifier">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Регистрационный номер<br/>прицепа/полуприцепа</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:for-each select="voia:TrailerIdentifier"><xsl:value-of select="."/></xsl:for-each>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>

	<!-- Шаблон для типа voia:TruckInspResultsType -->
	<xsl:template match="voia:TruckInspResults">
		<table width="190">
			<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
			<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
			<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
			<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
			<tbody>
				<tr>
					<td><br/></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Результаты досмотра грузового автомобиля:</td>
				</tr>
				<xsl:if test="voia:Model">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Марка, модель</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="voia:Model"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voia:CapstanNumber">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Число осей</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="voia:CapstanNumber"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voia:ArriveMode">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Транспортное средство</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:choose>
								<xsl:when test="voia:ArriveMode='1'">
									<xsl:text>на транспортном средстве</xsl:text>
								</xsl:when>
								<xsl:when test="voia:ArriveMode='2'">
									<xsl:text>в контейнере(ах)</xsl:text>
								</xsl:when>
								<xsl:when test="voia:ArriveMode='3'">
									<xsl:text>своим ходом</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="voia:ArriveMode"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voia:CapstanNumber">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Число осей</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="voia:CapstanNumber"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="voia:TruckParameters">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td colspan="4">Параметры, присущие тягачам и грузовикам</td>
					</tr>
					<xsl:apply-templates select="voia:TruckParameters"/>
				</xsl:if>
				<xsl:if test="voia:CargoPlace">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td colspan="4">Характеристика грузового места</td>
					</tr>
					<xsl:apply-templates select="voia:CargoPlace"/>
				</xsl:if>
				<xsl:if test="voia:Damages">
					<tr class="delim"><td colspan="4"></td></tr>
					<tr>
						<td>Видимые повреждения</td>
						<td></td>
						<td class="bord_bottom"></td>
						<td class="bord_bottom">
							<xsl:value-of select="."/>
						</td>
					</tr>
				</xsl:if>
			</tbody>
		</table>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:IdentityCardType -->
	<xsl:template match="voia:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Код вида документа,<br/>&#160;&#160;&#160;удостоверяющего личность</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardCode"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Краткое наименование документа,<br/>&#160;&#160;&#160;удостоверяющего личность</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Серия документа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardSeries"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номер документа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IdentityCardNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Дата выдачи документа</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Наименование организации,<br/>&#160;&#160;&#160;выдавшей документ</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OrganizationName"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:OrganizationBaseType -->
	<xsl:template match="voia:Consignee| voia:Carrier">
		<xsl:if test="cat_ru:OrganizationName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Наименование организации /<br/>ФИО физического лица</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OrganizationName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Краткое наименование организации</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:ShortName"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>Код языка для заполнения<br/>наименования</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OrganizationLanguage"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Российской Федерации:</td>
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RKOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Республики Казахстан:</td>
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RBOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Республики Беларусь:</td>
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RAOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Республики Армения:</td>
				<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:KGOrganizationFeatures">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">Сведения об организации. Особенности Кыргызской Республики:</td>
				<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;ИНН - идентификационный налоговый<br/>&#160;&#160;&#160;номер налогоплательщика,<br/>&#160;&#160;&#160;ПИН - персональный идентификационный<br/>&#160;&#160;&#160;номер</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:KGINN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Код Общереспубликанского классификатора<br/>&#160;&#160;&#160;предприятий и организаций (ОКПО)<br/>&#160;&#160;&#160;для юридических лиц и <br/>&#160;&#160;&#160;индивидуальных предпринимателей</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:KGOKPO"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Учетный номер налогоплательщика (УНН)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:UNN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номерной знак общественных услуг (НЗОУ)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:SocialServiceNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Номер справки об отсутствии<br/>&#160;&#160;&#160;номерного знака общественных<br/>&#160;&#160;&#160;услуг (НЗОУ)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Учетный номер плательщика (УНП)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:UNP"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Идентификационный номер<br/>&#160;&#160;&#160;физического лица</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;ОГРН/ОГРНИП. Основной<br/>&#160;&#160;&#160;государственный регистрационный<br/>&#160;&#160;&#160;номер</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:OGRN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;ИНН - Индивидуальный номер<br/>&#160;&#160;&#160;налогоплательщика</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:INN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;КПП - Код причины постановки<br/>&#160;&#160;&#160;на учет</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:KPP"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Бизнес-идентификационный номер (БИН)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:BIN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Индивидуальный идентификационный<br/>&#160;&#160;&#160;номер (ИИН)</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="cat_ru:IIN"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td colspan="4">&#160;&#160;&#160;Идентификационный таможенный номер (ИТН):</td>
				<xsl:apply-templates select="cat_ru:ITN"/>
			</tr>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа voia:TruckParametersType -->
	<xsl:template match="voia:TruckParameters">
		<xsl:if test="voia:DriveCapstanNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Число ведущих осей</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="voia:DriveCapstanNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="voia:Compositing">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Компоновка</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:choose>
						<xsl:when test="voia:Compositing='1'">
							<xsl:text>кабина за двигателем (капотная)</xsl:text>
						</xsl:when>
						<xsl:when test="voia:Compositing='2'">
							<xsl:text>кабина над двигателем (бескапотная)</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="voia:Compositing"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="voia:SleepPlaceNumber">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Количество спальных мест</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:value-of select="voia:SleepPlaceNumber"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="voia:Skatnost">
			<tr class="delim"><td colspan="4"></td></tr>
			<tr>
				<td>&#160;&#160;&#160;Колеса задних осей</td>
				<td></td>
				<td class="bord_bottom"></td>
				<td class="bord_bottom">
					<xsl:choose>
						<xsl:when test="voia:Skatnost='1'">
							<xsl:text>односкатные</xsl:text>
						</xsl:when>
						<xsl:when test="voia:Skatnost='2'">
							<xsl:text>двускатные</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="voia:Skatnost"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
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
	<xsl:template name="russian_datetime">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text>   </xsl:text>
				<xsl:value-of select="substring($dateIn,12,8)"/>
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
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template name="GTDID">
		<xsl:param name="DocName"/>
		<xsl:param name="DocNode"/>
		<table class="w190">
			<tr>
				<td class="annot graphMain" style="width:47%"><xsl:value-of select="$DocName"/></td>	
				<td class="annot graphMain" style="width:3%"></td>
				<td class="value graphMain" style="width:50%">
					<xsl:value-of select="$DocNode/*[local-name() = 'CustomsCode']"/>
					<xsl:text>/</xsl:text>
					<xsl:call-template name="gtd_date">
						<xsl:with-param name="dateIn" select="$DocNode/*[local-name() = 'RegistrationDate']"/>
					</xsl:call-template>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="$DocNode/*[local-name() = 'GTDNumber']"/>
				</td>
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="ActNumber">
		<xsl:param name="GTDID"/>
		<xsl:choose>
			<xsl:when test="string-length($GTDID) &lt; 6">
				<xsl:variable name="temp" select="concat('0',$GTDID)"/>
				<xsl:call-template name="ActNumber">
					<xsl:with-param name="GTDID" select="$temp"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$GTDID"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>
