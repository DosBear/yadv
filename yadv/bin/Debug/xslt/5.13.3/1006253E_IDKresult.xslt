<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ATDcat="urn:customs.ru:Information:CustomsDocuments:ATDCommon:5.13.1" xmlns:idr="urn:customs.ru:Information:CustomsDocuments:IDKresult:5.13.1">
	<!-- Шаблон для типа IDKresultType -->
	<xsl:template match="idr:IDKresult">
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

					.border-tbl {
						padding: 5px;
						border-top: solid 1px windowtext;
						border-bottom: solid 1px windowtext;
						border-left: solid 1px windowtext;
					}

					.border {
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
									<span class="docheader">Выявленные нарушения<br/>в результате применения ИДК</span>
								</td>
								<td align="left" valign="top" width="5%">
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
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
									<xsl:value-of select="idr:InstrNumber/*[local-name() = 'CustomsCode']"/>
									<xsl:text>/</xsl:text>
									<xsl:call-template name="gtd_date">
										<xsl:with-param name="dateIn" select="idr:InstrNumber/*[local-name() = 'RegistrationDate']"/>
									</xsl:call-template>
									<xsl:text>/</xsl:text>
									<xsl:value-of select="idr:InstrNumber/*[local-name() = 'GTDNumber']"/>
								</td>
							</tr>
							<tr class="delim"><td colspan="5"></td></tr>
							<tr>
								<td>Уникальный идентификатор</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td colspan="2" class="bord_bottom italic">
									<xsl:value-of select="idr:InstrID"/>
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:if test="idr:ActNumber">
						<table>
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
									<td colspan="4" class="graphMainTitle">Акт осмотра с ИДК:</td>
								</tr>
								<tr class="delim"><td colspan="4"></td></tr>
								<tr>
									<td>Регистрационный номер</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td class="bord_bottom">
										<xsl:value-of select="idr:ActNumber/*[local-name() = 'CustomsCode']"/>
										<xsl:text>/</xsl:text>
										<xsl:call-template name="gtd_date">
											<xsl:with-param name="dateIn" select="idr:ActNumber/*[local-name() = 'RegistrationDate']"/>
										</xsl:call-template>
										<xsl:text>/</xsl:text>
										<xsl:choose>
											<xsl:when test="string-length(idr:ActNumber/*[local-name() = 'GTDNumber']) = 7">
												<xsl:call-template name="ActNumber">
													<xsl:with-param name="GTDID" select="substring(idr:ActNumber/*[local-name() = 'GTDNumber'],2,6)"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="ActNumber">
													<xsl:with-param name="GTDID" select="idr:ActNumber/*[local-name() = 'GTDNumber']"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</tbody>
						</table>
					</xsl:if>
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
							<xsl:if test="idr:IDKType">
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Тип эксплуатируемого ИДК</td>
									<td></td>
									<td colspan="2">
										<xsl:choose>
											<xsl:when test="idr:IDKType='М' or idr:IDKType='м' or idr:IDKType='M' or idr:IDKType='m'">
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
											<xsl:when test="idr:IDKType='С' or idr:IDKType='с' or idr:IDKType='C' or idr:IDKType='c'">
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
									<xsl:value-of select="idr:IDK_id"/>
								</td>
							</tr>
							<xsl:if test="idr:IDKKind">
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Вид места дислокации ИДК</td>
									<td></td>
									<td class="bord_bottom"></td>
									<td colspan="4" class="bord_bottom">
										<xsl:choose>
											<xsl:when test="idr:IDKKind = 1">автомобильный ПП</xsl:when>
											<xsl:when test="idr:IDKKind = 2">морской порт</xsl:when>
											<xsl:when test="idr:IDKKind = 3">ЖДПП</xsl:when>
											<xsl:when test="idr:IDKKind = 4">воздушный ПП</xsl:when>
											<xsl:when test="idr:IDKKind = 5">вне ПП</xsl:when>
											<xsl:otherwise>неизвестно</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:if>
						</tbody>
					</table>
					<xsl:if test="idr:IDKCustoms">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
							<tr class="delim">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4" class="graphMainTitle">Таможенный орган:</td>
							</tr>
							<tr class="delim"><td colspan="4"></td></tr>
							<xsl:for-each select="idr:IDKCustoms">
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
						</table>
					</xsl:if>
					<table width="190">
						<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
						<tr>
							<td><br/></td>
						</tr>
						<tr>
							<td class="graphMainTitle">Выявленные нарушения:</td>
						</tr>
						<tr class="delim"><td ></td></tr>
					</table>
					<xsl:if test="idr:ViolationDateTime">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
							<tr>
								<td><br/></td>
								<td/><td/><td/>
							</tr>
							<tr>
								<td>Дата выявления нарушения<br/>таможенного законодательства<br/>в результате проведенного<br/>таможенного осмотра</td>
								<td></td>
								<td class="bord_bottom"></td>
								<td class="bord_bottom">
									<xsl:call-template name="russian_datetime">
										<xsl:with-param name="dateIn" select="idr:ViolationDateTime"/>
									</xsl:call-template>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="idr:CustomsOfficerIDK">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="2%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="20%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="3%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="24%" align="left" class="graphMainValue" valign="bottom"/>
							<tbody>
								<tr class="delim">
									<td><br/></td>
									<td/><td/><td/><td/><td/><td/>
								</tr>
								<tr class="delim"><td colspan="7"></td></tr>
								<tr>
									<td>Должностное лицо<br/>выявившее нарушение:</td>
									<xsl:call-template name="CustomsOfficer">
										<xsl:with-param name="nodeCO" select="idr:CustomsOfficerIDK"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="idr:GoodsDescription or idr:TotalCost">
						<table width="190">
							<col width="47%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="3%" align="left" class="graphMainHd" valign="bottom"/>
							<col width="1%" align="left" class="graphMainValue" valign="bottom"/>
							<col width="49%" align="left" class="graphMainValue" valign="bottom"/>
								<tr class="delim">
									<td><br/></td><td/><td/><td/>
								</tr>
								<tr>
									<td colspan="4" class="graphMainTitle">Товары:</td>
								</tr>
								<xsl:if test="idr:GoodsDescription">
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td colspan="4">Описание товаров:</td>
									</tr>
									<tr class="delim"><td colspan="4"></td></tr>
									<tr>
										<td colspan="4" class="bord_bottom">
											<xsl:for-each select="idr:GoodsDescription">
												<xsl:apply-templates select="."/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="idr:TotalCost">
									<tr class="delim"><td colspan="4"><br/></td></tr>
									<tr>
										<td>Общая фактурная стоимость товаров</td>
										<td></td>
										<td class="bord_bottom"></td>
										<td class="bord_bottom">
											<xsl:value-of  select="translate(format-number(idr:TotalCost,'#.00'), '.', ',')"/>
										</td>
									</tr>
								</xsl:if>
						</table>
					</xsl:if>
					<table width="190">
						<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
						<tbody>
							<tr><td><br/></td></tr>
							<tr>
								<td class="graphMainTitle">Дела об административных правонарушениях, уголовные дела:</td>
							</tr>
							<tr class="delim"><td></td></tr>
						</tbody>
					</table>
					<table width="190">
						<col width="12%" align="center"/>
						<col width="18%" align="center"/>
						<col width="11%" align="center"/>
						<col width="19%" align="center"/>
						<col width="20%" align="left"/>
						<col width="20%" align="left"/>
						<tbody>
							<tr class="graphMainHd">
								<td class="border-tbl" style="vertical-align:middle;" align="center">Код<br/>резуль-<br/>тата<br/>приме-<br/>нения<br/>ИДК</td>
								<td class="border-tbl" style="vertical-align:middle;" align="center">Номер статьи<br/>Кодекса<br/>Российской<br/>Федерации<br/>об админист-<br/>ративных<br/>право-<br/>нарушениях<br/>(КоАП<br/>России),<br/>Уголовного<br/>Кодекса<br/>Российской<br/>Федерации<br/>(УК России)</td>
								<td class="border-tbl" style="vertical-align:middle;" align="center">Номер<br/>части<br/>статьи<br/>КоАП<br/>России,<br/>УК<br/>России</td>
								<td class="border-tbl" style="vertical-align:middle;" align="center">Номер дела<br/>об админист-<br/>ративном<br/>право<br/>нарушении<br/>или<br/>уголовного<br/>дела</td>
								<td class="border-tbl" style="vertical-align:middle;" align="center">Cумма<br/>штрафов и<br/>доначис-<br/>ленных<br/>таможенных<br/>платежей </td>
								<td class="border" style="vertical-align:middle;" align="center">Cумма<br/>корректи-<br/>ровки<br/>таможенной<br/>стоимости<br/>по<br/>результатам<br/>применения<br/>ИДК </td>
							</tr>
							<xsl:for-each select="idr:AdministrativeInfraction">
								<tr class="graphMainValue">
									<td class="border-tbl">
										<xsl:value-of select="idr:DocType"/>
									</td>
									<td class="border-tbl">
										<xsl:value-of select="idr:KodeksPunkt"/>
									</td>
									<td class="border-tbl">
										<xsl:value-of select="idr:KodeksPartPunkt"/>
									</td>
									<td class="border-tbl">
										<xsl:value-of select="idr:InfractionNumber"/>
									</td>
									<td class="border-tbl">
										<xsl:if test="idr:Penalty">
											<xsl:value-of  select="translate(format-number(idr:Penalty,'#.00'), '.', ',')"/>
										</xsl:if>
									</td>
									<td class="border">
										<xsl:if test="idr:CorrectedAmount">
											<xsl:value-of  select="translate(format-number(idr:CorrectedAmount,'#.00'), '.', ',')"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>

					<xsl:if test="idr:Comments">
						<table width="190">
							<col width="100%" align="left" class="graphMainHd" valign="bottom"/>
							<tr>
								<td><br/></td>
							</tr>
							<tr>
								<td colspan="4" class="graphMainSubTitle">&#160;&#160;&#160;Комментарии:</td>
							</tr>
							<tr class="delim"><td></td></tr>
							<tr class="graphMainValue">
								<td class="bord_bottom">
									<xsl:for-each select="idr:Comments">
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
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
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="ATDcat:GTDID| idr:InstrNumber">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
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