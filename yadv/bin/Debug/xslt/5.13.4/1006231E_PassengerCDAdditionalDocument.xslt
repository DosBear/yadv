<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cat_pcd="urn:customs.ru:Information:CustomsDocuments:PassengerCDCommonAggregateTypesCust:5.12.0" xmlns:pcd_ad="urn:customs.ru:Information:CustomsDocuments:PassengerCDAdditionalDocument:5.12.0">
	<xsl:template match="pcd_ad:PassengerCDAdditionalDocument">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style>
									body {
									background: #cccccc;
									}

									div.page {
									width: 190mm;
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
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<i>Лицевая сторона</i>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<div align="right" style="font-size:8pt;">Приложение к пассажирской таможенной декларации</div>
					<br/>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<b>
											ПАССАЖИРСКАЯ ТАМОЖЕННАЯ ДЕКАРАЦИЯ
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="3">
										<b>Дополнительный формуляр «Декларация наличных денег и (или) денежных инструментов»</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="left" class="graphMain" style="border:2px solid;text-align:justify;">
									<b>
										<i>
									Формуляр заполняется физическими лицами, достигшими 16-летнего возраста, при перемещении через таможенную границу таможенного союза:
									<br/>
											<xsl:text>    </xsl:text>- наличных денежных средств (банкноты и монеты, за исключением монет из драгоценных металлов) и дорожных чеков, в сумме, превышающей в эквиваленте 10 000 долларов США;
									<br/>
											<xsl:text>    </xsl:text>- иных денежных инструментов в документарной форме (векселя, чеки (банковские), ценные бумаги на предъявителя)
									<br/>
									При заполнении формуляра указываются сведения <u>о всех</u> перемещаемых наличных денежных средствах, дорожных чеках и денежных инструментах
									</i>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr style="font-size:10pt;">
								<td style="border:1px solid;">
									<b>Тип декларации</b>
								</td>
								<td style="border:1px solid;">
									<div style="width:5mm;display:inline-block;">
										<xsl:if test="pcd_ad:EnterOrExitCustomsTerritory='1'"><b>X</b></xsl:if>
									</div>⁭въезд на территорию таможенного союза</td>
								<td style="border:1px solid;">
									<div style="width:5mm;display:inline-block;">
										<xsl:if test="pcd_ad:EnterOrExitCustomsTerritory='2'"><b>X</b></xsl:if>
									</div>⁭выезд с территории таможенного союза</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>1. Сведения о физическом лице:</b>
						</font>
					</div>
					<table class="w190">
						<tbody>
							<tr style="height:4mm;">
								<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
									<xsl:value-of select="pcd_ad:DeclarantPerson/cat_pcd:PersonSurname"/>
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
									<xsl:value-of select="pcd_ad:DeclarantPerson/cat_pcd:PersonName"/>
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
									<xsl:value-of select="pcd_ad:DeclarantPerson/cat_pcd:PersonMiddleName"/>
								</td>
							</tr>
							<tr style="height:4mm;font-size:8pt;">
								<td align="center">фамилия</td>
								<td align="center">имя</td>
								<td align="center">отчество</td>
							</tr>
							<tr style="height:4mm;">
								<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
									<xsl:value-of select="pcd_ad:DeclarantPerson/pcd_ad:BirthPlace"/>
									<xsl:text> </xsl:text>
									<xsl:variable name="bday">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pcd_ad:DeclarantPerson/pcd_ad:BirthDate"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:value-of select="translate($bday,'.','/')"/>
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
									<xsl:for-each select="pcd_ad:DeclarantPerson/cat_pcd:RegCountry/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
									<xsl:for-each select="pcd_ad:DeclarantPerson/cat_pcd:CountryPermanentResidence/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text> </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr style="height:4mm;font-size:8pt;">
								<td align="center">место и дата рождения (дд/мм/гггг)</td>
								<td align="center">гражданство/подданство</td>
								<td align="center">страна постоянного проживания</td>
							</tr>
							<tr style="height:4mm;">
								<xsl:for-each select="pcd_ad:DeclarantPerson/cat_pcd:PersonIdCard">
									<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
										<xsl:value-of select="cat_ru:IdentityCardName"/>
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
										<xsl:value-of select="cat_ru:IdentityCardSeries"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:IdentityCardNumber"/>
									</td>
									<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
										</xsl:call-template>
										<xsl:text> </xsl:text>
										<xsl:value-of select="cat_ru:OrganizationName"/>
									</td>
								</xsl:for-each>
							</tr>
							<tr style="height:4mm;font-size:8pt;">
								<td align="center">тип документа, удостоверяющего личность</td>
								<td align="center">серия, №</td>
								<td align="center">дата и место выдачи документа</td>
							</tr>
							<tr style="height:4mm;">
								<td width="33%" align="center" style="border-bottom:1px solid;border-left:1px solid;">
									<xsl:for-each select="pcd_ad:DeclarantPerson/pcd_ad:Address/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;border-left:1px solid;">
									<xsl:for-each select="pcd_ad:DeclarantPerson/cat_pcd:RegAddress/*">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
								<td width="33%" align="center" style="border-bottom:1px solid;border-right:1px solid;">
									<xsl:for-each select="pcd_ad:DeclarantPerson/pcd_ad:RegDocumentReference/*">
										<xsl:choose>
											<xsl:when test="contains(local-name(.),'Date')">
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
								</td>
							</tr>
							<tr style="height:4mm;font-size:8pt;">
								<td align="center" valign="top">адрес постоянного места жительства</td>
								<td align="center" valign="top">адрес места пребывания (регистрации) на территории таможенного союза</td>
								<td align="center" valign="top">номер и дата выдачи визы (реквизиты документа, подтверждающего право пребывания на территории таможенного союза)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>2. Сведения о наличных денежных средствах и денежных инструментах</b>
						</font>
					</div>
					<br/>
					<div>
						<font size="4">
							<b>2.1 Наличные денежные средства и дорожные чеки  </b>
						</font>
					</div>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td style="border:1px solid;" width="33%"/>
								<td style="border:1px solid;" width="33%">Сумма</td>
								<td style="border:1px solid;" width="33%">Вид валюты</td>
							</tr>
							<xsl:variable name="notescoins">
								<xsl:choose>
									<xsl:when test="count(pcd_ad:RecDetailsForeignCur[pcd_ad:ForeignCurKind='1' or pcd_ad:ForeignCurKind='2']) &gt;= 1">
										<xsl:value-of select="count(pcd_ad:RecDetailsForeignCur[pcd_ad:ForeignCurKind='1' or pcd_ad:ForeignCurKind='2'])"/>
									</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr valign="top">
								<td style="border:1px solid">
									<xsl:attribute name="rowspan"><xsl:value-of select="$notescoins"/></xsl:attribute>
									Банкноты, монеты
								</td>
								<td style="border:1px solid">
									<xsl:value-of select="pcd_ad:RecDetailsForeignCur[number(pcd_ad:ForeignCurKind) &lt; 3][1]/pcd_ad:MoveAmount/cat_pcd:Amount"/>
								</td>
								<td style="border:1px solid">
									<xsl:value-of select="pcd_ad:RecDetailsForeignCur[number(pcd_ad:ForeignCurKind) &lt; 3][1]/pcd_ad:MoveAmount/cat_pcd:CurrencyName"/>
								</td>
							</tr>
							<xsl:for-each select="pcd_ad:RecDetailsForeignCur[number(pcd_ad:ForeignCurKind) &lt; 3][position() &gt; 1]">
								<tr>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_ad:MoveAmount/cat_pcd:Amount"/>
									</td>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_ad:MoveAmount/cat_pcd:CurrencyName"/>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:variable name="checks">
								<xsl:choose>
									<xsl:when test="count(pcd_ad:RecDetailsForeignCur[number(pcd_ad:ForeignCurKind)=3]) &gt;= 1">
										<xsl:value-of select="count(pcd_ad:RecDetailsForeignCur[pcd_ad:ForeignCurKind='3'])"/>
									</xsl:when>
									<xsl:otherwise>1</xsl:otherwise>
								</xsl:choose>
							</xsl:variable>
							<tr valign="top">
								<td style="border:1px solid">
									<xsl:attribute name="rowspan"><xsl:value-of select="$checks"/></xsl:attribute>
									Дорожные чеки
								</td>
								<td style="border:1px solid">
									<xsl:value-of select="pcd_ad:RecDetailsForeignCur[number(pcd_ad:ForeignCurKind)=3][1]/pcd_ad:MoveAmount/cat_pcd:Amount"/>
								</td>
								<td style="border:1px solid">
									<xsl:value-of select="pcd_ad:RecDetailsForeignCur[number(pcd_ad:ForeignCurKind)=3][1]/pcd_ad:MoveAmount/cat_pcd:CurrencyName"/>
								</td>
							</tr>
							<xsl:for-each select="pcd_ad:RecDetailsForeignCur[number(pcd_ad:ForeignCurKind)=3][position() &gt; 1]">
								<tr>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_ad:MoveAmount/cat_pcd:Amount"/>
									</td>
									<td style="border:1px solid">
										<xsl:value-of select="pcd_ad:MoveAmount/cat_pcd:CurrencyName"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>2.2. Денежные инструменты, за исключением дорожных чеков <i>(векселя, чеки (банковские), ценные бумаги на предъявителя и иное)</i>
							</b>
						</font>
					</div>
					<br/>
					<table class="w190">
						<tbody>
							<tr valign="top" align="center" style="font-weight:bold;">
								<td style="border:1px solid;">Тип<br/>инструмента</td>
								<td style="border:1px solid;">Кем выпущен</td>
								<td style="border:1px solid;">Дата выпуска</td>
								<td style="border:1px solid;">Идентификационный<br/>номер (при наличии)</td>
								<td style="border:1px solid;">Количество</td>
								<td style="border:1px solid;">Стоимость </td>
							</tr>
							<xsl:for-each select="pcd_ad:MonetaryInstrumentsDetails">
								<tr valign="top">
									<td style="border:1px solid;">
										<xsl:choose>
											<xsl:when test="pcd_ad:MonetaryInstrumentKind='0'">вексель</xsl:when>
											<xsl:when test="pcd_ad:MonetaryInstrumentKind='1'">банковский чек</xsl:when>
											<xsl:when test="pcd_ad:MonetaryInstrumentKind='2'">ценные бумаги на предъявителя</xsl:when>
											<xsl:when test="pcd_ad:MonetaryInstrumentKind='3'">иное</xsl:when>
										</xsl:choose>
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="pcd_ad:WhoReleased"/>
									</td>
									<td style="border:1px solid;">
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="pcd_ad:DateReleased"/>
										</xsl:call-template>
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="pcd_ad:MonetaryInstrumentNumber"/>
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="pcd_ad:Quantity"/>
									</td>
									<td style="border:1px solid;">
										<xsl:value-of select="pcd_ad:MoveAmount/cat_pcd:Amount"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
				<div class="page">
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<i>Оборотная сторона</i>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<font size="4">
							<b>3. Сведения о владельце наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<table class="w190">
						<tbody>
							<tr align="center">
								<td>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OwnerMoney/pcd_ad:OwnerMoneyKind='0' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OwnerMoney/pcd_ad:OwnerMoneyKind='0'"><b>X</b></xsl:if>
									</div>
									декларант
								</td>
								<td>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OwnerMoney/pcd_ad:OwnerMoneyKind='1' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OwnerMoney/pcd_ad:OwnerMoneyKind='1'"><b>X</b></xsl:if>
									</div>
									другое физическое лицо
								</td>
								<td>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OwnerMoney/pcd_ad:OwnerMoneyKind='2' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OwnerMoney/pcd_ad:OwnerMoneyKind='2'"><b>X</b></xsl:if>
									</div>
									иное лицо
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>3.1. Сведения о владельце наличных денежных средств и (или) денежных инструментов – указывается, если декларант не является собственником</b>
						</font>
					</div>
					<table class="w190">
						<tbody>
							<xsl:for-each select="pcd_ad:RecDetailsForeignCur|pcd_ad:MonetaryInstrumentsDetails">
								<xsl:for-each select="pcd_ad:OwnerMoney">
									<xsl:if test="pcd_ad:OwnerMoneyKind != '0'">
										<tr valign="top">
											<td style="border:1px solid;" width="50%">Фамилия, имя для физических лиц/Наименование иного лица</td>
											<td style="border:1px solid;" width="50%">
												<xsl:value-of select="pcd_ad:OwnerMoneyName"/>
											</td>
										</tr>
										<tr valign="top">
											<td style="border:1px solid;">Адрес местожительства для физического лица/Адрес местонахождения (юридический адрес) для иных лиц</td>
											<td style="border:1px solid;">
												<xsl:for-each select="pcd_ad:OwnerMoneyAddress/*">
													<xsl:value-of select="."/>
													<xsl:if test="position()!=last()">, </xsl:if>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>4. Сведения о происхождении наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<br/>
					<table class="w190">
						<tbody>
							<tr valign="top">
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='1' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='1'"><b>X</b></xsl:if>
									</div>
									заработная плата, доходы от предпринимательской деятельности физического лица
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='2' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='2'"><b>X</b></xsl:if>
									</div>
									дивиденды и другие доходы от участия в капитале предприятий
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='3' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='3'"><b>X</b></xsl:if>
									</div>
									доходы от реализации движимого и недвижимого имущества
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='4' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='4'"><b>X</b></xsl:if>
									</div>
									безвозмездные трансферты, полученные от физических и юридических лиц (материальная помощь, гранты и т.п.) 
								</td>
							</tr>
							<tr valign="top">
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='5' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='5'"><b>X</b></xsl:if>
									</div>
									пенсия, стипендия, социальные пособия, алименты
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='6' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='6'"><b>X</b></xsl:if>
									</div>
									доходы от аренды недвижимости и земельных участков
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='7' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='7'"><b>X</b></xsl:if>
									</div>
									заемные средства
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='8' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='8'"><b>X</b></xsl:if>
									</div>
									наследство
								</td>
							</tr>
							<tr valign="top">
								<td colspan="4">
									<br/>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:RecDetailsForeignCur/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='9' or pcd_ad:MonetaryInstrumentsDetails/pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='9'"><b>X</b></xsl:if>
									</div>
									прочее (указать):
 									<xsl:for-each select="pcd_ad:RecDetailsForeignCur[pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='9']|pcd_ad:MonetaryInstrumentsDetails[pcd_ad:OriginMoney/pcd_ad:OriginMoneyKind='9']">
										<xsl:value-of select="pcd_ad:OriginMoney/pcd_ad:OriginMoneyOther"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>5. Сведения о предполагаемом использовании наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<table class="w190">
						<tbody>
							<tr valign="top">
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:IntendedUseMoney[pcd_ad:IntendedUseMoneyKind='1']"><b>X</b></xsl:if>
									</div>
									текущие расходы (приобретение товаров и услуг)
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:IntendedUseMoney[pcd_ad:IntendedUseMoneyKind='2']"><b>X</b></xsl:if>
									</div>
									инвестиции, включая  приобретение недвижимости
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:IntendedUseMoney[pcd_ad:IntendedUseMoneyKind='3']"><b>X</b></xsl:if>
									</div>
									безвозмездные трансферты в пользу физических лиц (материальная помощь и т.п.)
								</td>
								<td width="25%">
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:IntendedUseMoney[pcd_ad:IntendedUseMoneyKind='4']"><b>X</b></xsl:if>
									</div>
									безвозмездные трансферты в пользу юридических лиц (благотворительность, пожертвования и т.п.)
								</td>
							</tr>
							<br/>
							<tr valign="top">
								<td colspan="4">
									<br/>
									<div style="display:inline-block;width:5mm;">
										<xsl:if test="pcd_ad:IntendedUseMoney[pcd_ad:IntendedUseMoneyKind='5']"><b>X</b></xsl:if>
									</div>
									прочее (указать):
 									<xsl:for-each select="pcd_ad:IntendedUseMoney[pcd_ad:IntendedUseMoneyKind='5']">
										<xsl:value-of select="pcd_ad:IntendedUseMoneyOther"/>
										<xsl:if test="position()!=last()">
											<br/>
										</xsl:if>
									</xsl:for-each>
								</td>
								<br/>
							</tr>
							<br/>
						</tbody>
					</table>
					<br/>
					<div>
						<font size="4">
							<b>6. Сведения о маршруте и способе перевозке (о виде транспорта)  наличных денежных средств и (или) денежных инструментов</b>
						</font>
					</div>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td style="border:1px solid;">Страна убытия <xsl:value-of select="pcd_ad:RouteMoney/pcd_ad:CountryDeparture/cat_pcd:CountryName"/><xsl:text> </xsl:text><xsl:value-of select="pcd_ad:RouteMoney/pcd_ad:CountryDeparture/cat_pcd:CountryCode"/></td>
								<td style="border:1px solid;">Страна прибытия <xsl:value-of select="pcd_ad:RouteMoney/pcd_ad:CountryArrival/cat_pcd:CountryName"/><xsl:text> </xsl:text><xsl:value-of select="pcd_ad:RouteMoney/pcd_ad:CountryArrival/cat_pcd:CountryCode"/></td>
							</tr>
							<tr>
								<td style="border:1px solid;">Дата убытия <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcd_ad:RouteMoney/pcd_ad:DateDeparture"/></xsl:call-template></td>
								<td style="border:1px solid;">Дата прибытия <xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcd_ad:RouteMoney/pcd_ad:DateArrival"/></xsl:call-template></td>
							</tr>
							<tr>
								<td style="border:1px solid;" colspan="2">
									Транзитные страны
									<xsl:text> </xsl:text>
									<xsl:for-each select="pcd_ad:RouteMoney/pcd_ad:TransitCountries">
										<xsl:for-each select="./*">
											<xsl:value-of select="."/>
											<xsl:if test="position()!=last"><xsl:text> </xsl:text></xsl:if>
										</xsl:for-each>
										<xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr valign="top">
								<td style="border:1px solid;width:20%;">Вид транспорта, на котором декларант прибыл/убывает на территорию таможенного союза/с территории таможенного союза</td>
								<td style="border:1px solid;width:16%;text-align:center">воздушный
									<xsl:if test="pcd_ad:RouteMoney/pcd_ad:TransportModeCode = '40'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">железнодорожный
																	<xsl:if test="pcd_ad:RouteMoney/pcd_ad:TransportModeCode = '20'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">водный
																	<xsl:if test="pcd_ad:RouteMoney/pcd_ad:TransportModeCode = '10'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">автомобильный
									<xsl:if test="pcd_ad:RouteMoney/pcd_ad:TransportModeCode = '30'"><br/><br/><b>X</b></xsl:if>
								</td>
								<td style="border:1px solid;width:16%;text-align:center;">прочее
									<xsl:if test="pcd_ad:RouteMoney/pcd_ad:TransportModeCode != '10' and pcd_ad:RouteMoney/pcd_ad:TransportModeCode != '20' and pcd_ad:RouteMoney/pcd_ad:TransportModeCode != '30' and pcd_ad:RouteMoney/pcd_ad:TransportModeCode != '40'"><br/><br/><b>X</b></xsl:if>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="bottom">
								<td style="border:1px solid;width:50%">
									<b>Мне известно, что сообщение в таможенной декларации недостоверных сведений влечет за собой ответственность в соответствии с законодательством государств-членов таможенного союза</b>
								</td>
								<td style="border:1px solid;width:50%;">
									Подпись лица ______________________
									<br/>
									Дата заполнения декларации
									<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="pcd_ad:Signer/cat_pcd:IssueDate"/></xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="w190">
						<tbody>
							<tr>
								<td width="25%" align="right">
									Для служебных отметок:
									<br/>
									<div style="width:25mm;height:25mm;border:1px solid;"></div>
									<br/>
									М.П.
								</td>
								<td width="5%"></td>
								<td width="70%" valign="top">
									<xsl:value-of select="pcd_ad:CustomsMark/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:value-of select="pcd_ad:CustomsMark/cat_ru:LNP"/>
									<br/>
									<xsl:for-each select="pcd_ad:CustomsMark/pcd_ad:Mark">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
									</xsl:for-each>
									<!--xsl:apply-templates select="pcd_ad:CustomsMark/cat_pcd:Mark"/-->
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="yesno">
		<xsl:param name="sign"/>
		<table>
			<tbody>
				<tr>
					<td align="center">
						<div style="display:inline-block;border:1px solid;width:4mm;height:4mm;">
							<xsl:if test="$sign='1' or $sign='true' or $sign='t'"><b>X</b></xsl:if>
						</div>
					</td>
					<td align="center">
						<div style="display:inline-block;border:1px solid;width:4mm;height:4mm;">
							<xsl:if test="$sign='0' or $sign='false' or $sign='f'"><b>X</b></xsl:if>
						</div>
					</td>
				</tr>
				<tr>
					<td align="center">Да</td>
					<td align="center">Нет</td>
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
