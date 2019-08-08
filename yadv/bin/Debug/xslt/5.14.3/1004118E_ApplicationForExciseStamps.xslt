<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:aes="urn:customs.ru:Information:CustomsDocuments:AFES:5.14.3" xmlns:SInWs="Sum-In_Words.uri" exclude-result-prefixes="SInWs">
	<xsl:variable name="Self" select='document("")'/>
	<xsl:template match="aes:ApplicationForExciseStamps">
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
									
									@media print {
									.page {
									 page-break-after: always;
									} 
								   } 
								</style>
			</head>
			<body>
				<div class="page">
					<xsl:if test="aes:AuthorizedCustomsAuthority">
						<table class="w190">
							<tbody>
								<tr>
									<font size="4">
										<td align="center" class="graphMain" style="width:2cm">Начальнику</td>
										<td align="center" class=" value graphMain">
											<xsl:value-of select="aes:AuthorizedCustomsAuthority/cat_ru:OfficeName"/>
										</td>
										<td align="center" class="graphMain" style="width:4cm">регистрационный № </td>
										<td align="center" class="graphMain">
											<u>
												<xsl:value-of select="aes:DocumentInfo/cat_ru:PrDocumentName"/>
											</u>
										/
											<u>
												<xsl:value-of select="aes:DocumentInfo/cat_ru:PrDocumentNumber"/>
											</u>
										от
												<u>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="aes:DocumentInfo/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
											</u> г.
										</td>
									</font>
								</tr>
								<tr>
									<font size="4">
										<td align="center" class="graphMain"/>
										<td align="center" class="graphMain"><font size="1">(наименование уполномоченного таможенного органа)</font></td>
										<td align="center" class="graphMain"/>
										<td align="center" class="graphMain"><font size="1">(заполняется таможенным органом)</font></td>
									</font>
								</tr>
							</tbody>
						</table>
					</xsl:if>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<font size="4">
										<br/>
										<br/>
										<b>ЗАЯВЛЕНИЕ О ВЫДАЧЕ АКЦИЗНЫХ МАРОК</b>
										<br/>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tr>
							<td class="value graphMain">
								<xsl:value-of select="aes:Importer/cat_ru:OrganizationName"/>
								<xsl:if test="aes:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN">
									<xsl:value-of select="concat(', ИНН ',aes:Importer/cat_ru:RFOrganizationFeatures/cat_ru:INN)"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td class="annot graphMain" align="center"><font size="1">
								полное наименование организации, идентификационный номер налогоплательщика<br/></font>
							</td>
						</tr>
						<tr>
							<td class="value graphMain">
								<xsl:if test="aes:Importer/cat_ru:Address">
									<xsl:value-of select="aes:Importer/cat_ru:Address/cat_ru:CounryName"/>,
									<xsl:value-of select="aes:Importer/cat_ru:Address/cat_ru:Region"/>,
									<xsl:value-of select="aes:Importer/cat_ru:Address/cat_ru:City"/>,
									<xsl:value-of select="aes:Importer/cat_ru:Address/cat_ru:StreetHouse"/>,
								</xsl:if>
								<xsl:if test="aes:Importer/cat_ru:RFOrganizationFeatures">
									<xsl:value-of select="concat('ОГРН ',aes:Importer/cat_ru:RFOrganizationFeatures/cat_ru:OGRN)"/>,
									<xsl:value-of select="concat('КПП ',aes:Importer/cat_ru:RFOrganizationFeatures/cat_ru:KPP)"/>,
								</xsl:if>
								<xsl:if test="aes:Importer">
									<xsl:value-of select="concat('ОКПО ID ',aes:Importer/cat_ru:OKPOID)"/>,
									<xsl:value-of select="concat('ОКАТО ',aes:Importer/cat_ru:OKATOCode)"/>
								</xsl:if>
							</td>
						</tr>
						<tr>
							<td align="center">
								<font size="1">(ИНН), место государственной регистрации организации, банковские реквизиты<br/></font>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr class="annot graphMain">
							<td>
							для реализации внешнеторгового договора N <u>
									<xsl:value-of select="aes:ForeignTradeAgreement/cat_ru:PrDocumentNumber"/>
								</u> от <u>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aes:ForeignTradeAgreement/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</u> г.
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain" style="width:25%">с иностранной организацией</td>
							<td class="value graphMain" style="width:50%" align="left">
								<xsl:value-of select="aes:ForeignOrganization/cat_ru:OrganizationName"/>,								
								<xsl:value-of select="aes:ForeignOrganization/cat_ru:Address/cat_ru:CounryName"/>,
								<xsl:value-of select="aes:ForeignOrganization/cat_ru:Address/cat_ru:City"/>
							</td>
						</tr>
						<tr>
							<td/>
							<td align="center">
								<font size="1">(указывается название организации, страна и город, где она зарегистрирована)</font>
							</td>
						</tr>
					</table>
					<table class="w190">
						<tr>
							<td class="annot graphMain">
								просит выдать акцизные марки:
							</td>
						</tr>
					</table>
					<table class="w190" width="100%">
						<xsl:for-each select="//aes:ExciseStampKind">
							<tr>
								<td class="value graphMain" align="center" width="55%">
									<xsl:value-of select="aes:ExciseStampKindName"/>,
									<xsl:value-of select="translate(aes:ExcisableGood/aes:ContainerCapacity/cat_ru:GoodsQuantity, '.', ',')"/>
									<xsl:value-of select="aes:ExcisableGood/aes:ContainerCapacity/cat_ru:MeasureUnitQualifierName"/>
								</td>
								<td class="annot graphMain"> в кол-ве </td>
								<td class="value graphMain" align="center">
									<xsl:value-of select="aes:Quantity"/>
								</td>
								<td class="annot graphMain"> штук на сумму </td>
								<td class="value graphMain" align="center">
									<xsl:value-of select="string(number(aes:Quantity) * number(aes:Price))"/>
								</td>
								<td class="annot graphMain"> рублей</td>
							</tr>
							<tr>
								<td class="annot graphMain" align="center">
											<font size="1">(надписи на акцизной марке о виде алкогольной продукции и объеме алкогольной продукции в потребительской таре)</font>
										</td>
								<td/>
								<td/>
								<td/>
								<td/>
								<td/>
							</tr>
						</xsl:for-each>
					</table>
					<table class="w190" width="100%">
						<tr>
							<td width="17%">на общую сумму</td>
							<td class="value">
								<xsl:variable name="items-with-sub-totals">
									<xsl:call-template name="sum">
										<xsl:with-param name="nodes" select="//aes:ExciseStampKind"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:call-template name="RecurseSumWords">
									<xsl:with-param name="Value" select="$items-with-sub-totals"/>
								</xsl:call-template>
							</td>
							<td width="1px"> рублей</td>
						</tr>
					</table>
					<table class="w190" width="100%">
						<tr>
							<td align="justify">
								Акцизные  марки  необходимы  для  маркировки  алкогольной  продукции, указанной в "приложении" к данному заявлению, которая будет помещена под таможенную процедуру
							</td>
						</tr>
						<tr>
							<td class="value graphMain" align="center">
								<xsl:value-of select="aes:ApplicationForExciseStampsCode"/>
							</td>
						</tr>
						<tr>
							<td align="justify">Документ, подтверждающий  правомерность  использования  на алкогольной продукции товарного знака, предусмотренный гражданским законодательством № <u>
									<xsl:value-of select="aes:TradeMarkUsageContract/cat_ru:PrDocumentNumber"/>
								</u> от <u>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aes:TradeMarkUsageContract/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</u> г.</td>
						</tr>
						<tr>
							<td>
								Лицензия на закупку, хранение и поставки алкогольной и спиртосодержащей продукции
							</td>
						</tr>
						<tr>
							<td class="value graphMain">
								<xsl:value-of select="aes:AlcoholSellingLicence/aes:PrDocumentNumber"/>
								<xsl:text>, </xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="aes:AlcoholSellingLicence/aes:PrDocumentDate"/>
								</xsl:call-template>
								<xsl:text>, </xsl:text>
								<xsl:value-of select="aes:AlcoholSellingLicence/aes:OrganizationName"/>
							</td>
						</tr>
						<tr>
							<td align="center">
								<font size="1">(регистрационный номер, дата выдачи, орган, выдавший лицензию)</font>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:text>Срок действия лицензии до </xsl:text>
								<u>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aes:AlcoholSellingLicence/aes:ExpirationDate"/>
									</xsl:call-template>
								</u>
								<xsl:text> г.</xsl:text>
							</td>
						</tr>
						<tr>
							<td align="justify">
								Денежные  средства  на  покупку  акцизных  марок  внесены  на  счет Федерального казначейства платежным документом N <u>
									<xsl:value-of select="aes:PaymentDocument/cat_ru:PrDocumentNumber"/>
								</u> от <u>
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="aes:PaymentDocument/cat_ru:PrDocumentDate"/>
									</xsl:call-template>
								</u>  в сумме
							</td>
						</tr>
						<tr>
							<td class="value graphMain" align="center">
								<xsl:value-of select="aes:PaymentDocument/aes:AmountDeposited"/>
								<xsl:text> (</xsl:text>
								<xsl:call-template name="RecurseSumWords">
									<xsl:with-param name="Value" select="aes:PaymentDocument/aes:AmountDeposited"/>
								</xsl:call-template>
								<xsl:text>)</xsl:text><br/>
							</td>
						</tr>
						<tr>
							<td>
								С правилами приобретения акцизных марок и контроля за их использованием ознакомлены:<br/>
								<br/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td>
								М.П.<br/>организации
							</td>
							<td width="60%">
								<table>
									<tr>
										<td>
											Руководитель<br/>организации
										</td>
										<td class="value">
											<xsl:value-of select="aes:HeadOfTheOrganization/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(aes:HeadOfTheOrganization/cat_ru:PersonName,1,1)"/>.
											<xsl:value-of select="substring(aes:HeadOfTheOrganization/cat_ru:PersonMiddleName,1,1)"/>.
										</td>
									</tr>
									<tr>
										<td/>
										<td align="center"><font size="1">(фамилия, инициалы, подпись)</font><br/>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											Главный бухгалтер
										</td>
										<td class="value">
											<xsl:value-of select="aes:ChiefAccountant/cat_ru:PersonSurname"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="substring(aes:ChiefAccountant/cat_ru:PersonName,1,1)"/>.
											<xsl:value-of select="substring(aes:ChiefAccountant/cat_ru:PersonMiddleName,1,1)"/>.
										</td>
									</tr>
									<tr>
										<td/>
										<td align="center"><font size="1">(фамилия, инициалы, подпись)</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<div class="page">
					<table class="w190" width="100%">
						<tr>
							<td align="center">Приложение к заявлению о выдаче акцизных марок</td>
						</tr>
					</table>
					<table class="w190">
						<tbody>
							<tr>
								<td align="center" class="graphMain">
									<u>
										<xsl:value-of select="aes:DocumentInfo/cat_ru:PrDocumentNumber"/>
									</u>
								от
									<u>
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="aes:DocumentInfo/cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</u> г.
								</td>
							</tr>
						</tbody>
					</table>
					<table class="w190">
						<tbody>
							<tr align="center">
								<td class="graphMain bordered">N<br/>п/п</td>
								<td class="graphMain bordered">Наименование и товарный знак алкогольной продукции</td>
								<td class="graphMain bordered">Код товара, заявляемого к ввозу (на уровне 10 знаков ТН ВЭД ЕАЭС)</td>
								<td class="graphMain bordered">Количество бутылок или иной потребительской тары (штук)</td>
								<td class="graphMain bordered">Объем товара данного наименования в 1 бутылке или иной потребительской таре (литров алкогольной продукции)</td>
								<td class="graphMain bordered">Содержание этилового спирта в алкогольной продукции данного наименования (%)</td>
							</tr>
							<tr align="center">
								<td class="graphMain bordered">1</td>
								<td class="graphMain bordered">2</td>
								<td class="graphMain bordered">3</td>
								<td class="graphMain bordered">4</td>
								<td class="graphMain bordered">5</td>
								<td class="graphMain bordered">6</td>
							</tr>
							<xsl:for-each select="//aes:ExcisableGood">
								<tr align="center">
									<td class="graphMain bordered">
										<xsl:value-of select="position()"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="aes:GoodsDescription"/>
										<br/>
										<xsl:value-of select="aes:TradeMark"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="aes:GoodsTNVEDCode"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="aes:GoodsQuantity"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="aes:ContainerCapacity/cat_ru:GoodsQuantity"/>
									</td>
									<td class="graphMain bordered">
										<xsl:value-of select="aes:Concentration/aes:Max"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="graphMain bordered" colspan="3">Всего:</td>
								<td class="graphMain bordered" align="center">
									<xsl:value-of select="sum(//aes:ExcisableGood//aes:GoodsQuantity)"/>
								</td>
								<td class="graphMain bordered"/>
								<td class="graphMain bordered"/>
							</tr>
							<tr>
								<td>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="6">
									<table>
										<tr>
											<td>
												Руководитель организации
											</td>
											<td class="value">
												<xsl:value-of select="aes:HeadOfTheOrganization/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="substring(aes:HeadOfTheOrganization/cat_ru:PersonName,1,1)"/>.
												<xsl:value-of select="substring(aes:HeadOfTheOrganization/cat_ru:PersonMiddleName,1,1)"/>.
											</td>
										</tr>
										<tr>
											<td/>
											<td align="center"><font size="1">(фамилия, инициалы, подпись)</font><br/>
												<br/>
											</td>
										</tr>
										<tr>
											<td>
												Главный бухгалтер
											</td>
											<td class="value">
												<xsl:value-of select="aes:ChiefAccountant/cat_ru:PersonSurname"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="substring(aes:ChiefAccountant/cat_ru:PersonName,1,1)"/>.
												<xsl:value-of select="substring(aes:ChiefAccountant/cat_ru:PersonMiddleName,1,1)"/>.
											</td>
										</tr>
										<tr>
											<td/>
											<td align="center"><font size="1">(фамилия, инициалы, подпись)</font><br/>
												<br/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									М.П.<br/>организации
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="sum">
		<xsl:param name="nodes"/>
		<xsl:param name="sum" select="0"/>
		<xsl:variable name="current" select="$nodes[1]"/>
		<xsl:if test="$current">
			<xsl:call-template name="sum">
				<xsl:with-param name="nodes" select="$nodes[position() &gt; 1]"/>
				<xsl:with-param name="sum" select="$sum + $current/aes:Quantity * $current/aes:Price"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="not($current)">
			<xsl:value-of select="$sum"/>
		</xsl:if>
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
	<xsl:template name="RecurseSumWords">
		<xsl:param name="Value" select="''"/>
		<xsl:choose>
			<xsl:when test="($Value div 1000000) - (($Value mod 1000000) div 1000000) > 0">
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="($Value div 1000000) - (($Value mod 1000000) div 1000000)"/>
					<xsl:with-param name="controlbad" select="0"/>
				</xsl:call-template>
				<xsl:call-template name="GetWordType">
					<xsl:with-param name="Value" select="($Value div 1000000) - (($Value mod 1000000) div 1000000)"/>
					<xsl:with-param name="tagName" select="'SInWs:Billion'"/>
				</xsl:call-template>
				<xsl:call-template name="RecurseSumWords">
					<xsl:with-param name="Value" select="$Value mod 1000000"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="($Value div 1000) - (($Value mod 1000) div 1000) > 0">
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="($Value div 1000) - (($Value mod 1000) div 1000)"/>
					<xsl:with-param name="controlbad" select="1"/>
				</xsl:call-template>
				<xsl:call-template name="GetWordType">
					<xsl:with-param name="Value" select="($Value div 1000) - (($Value mod 1000) div 1000)"/>
					<xsl:with-param name="tagName" select="'SInWs:Thousand'"/>
				</xsl:call-template>
				<xsl:call-template name="RecurseSumWords">
					<xsl:with-param name="Value" select="$Value mod 1000"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Value != 0">
				<xsl:call-template name="DecodeInteger">
					<xsl:with-param name="Value" select="$Value"/>
					<xsl:with-param name="controlbad" select="0"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="DecodeInteger">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="controlbad" select="''"/>
		<xsl:variable name="Value100" select="$Value mod 100"/>
		<xsl:if test="($Value div 100) - ($Value100 div 100) != 0">
			<xsl:call-template name="GetWordData">
				<xsl:with-param name="Pos" select="27 + (($Value div 100) - ($Value100 div 100))"/>
				<xsl:with-param name="tagName" select="'SInWs:Words'"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$Value100 > 20">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="18 + (($Value100 div 10) - (($Value100 mod 10) div 10))"/>
					<xsl:with-param name="tagName" select="'SInWs:Words'"/>
				</xsl:call-template>
				<xsl:if test="$Value100 mod 10 != 0">
					<xsl:call-template name="GetSmallWord">
						<xsl:with-param name="Value" select="$Value100 mod 10"/>
						<xsl:with-param name="controlbad" select="$controlbad"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$Value100 != 0">
				<xsl:call-template name="GetSmallWord">
					<xsl:with-param name="Value" select="$Value100"/>
					<xsl:with-param name="controlbad" select="$controlbad"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetSmallWord">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="controlbad" select="''"/>
		<xsl:choose>
			<xsl:when test="($controlbad = 1) and ($Value &lt; 3)">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="$Value"/>
					<xsl:with-param name="tagName" select="'SInWs:BadWord'"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="$Value"/>
					<xsl:with-param name="tagName" select="'SInWs:Words'"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetWordType">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="tagName" select="''"/>
		<xsl:choose>
			<xsl:when test="($Value mod 100) > 20">
				<xsl:call-template name="GetInnerType">
					<xsl:with-param name="Value" select="($Value mod 100) mod 10"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="GetInnerType">
					<xsl:with-param name="Value" select="$Value mod 100"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetInnerType">
		<xsl:param name="Value" select="''"/>
		<xsl:param name="tagName" select="''"/>
		<xsl:choose>
			<xsl:when test="$Value = 1">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="1"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$Value > 1 and $Value &lt; 5">
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="2"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="GetWordData">
					<xsl:with-param name="Pos" select="3"/>
					<xsl:with-param name="tagName" select="$tagName"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="GetWordData">
		<xsl:param name="Pos" select="''"/>
		<xsl:param name="tagName" select="''"/>
		<xsl:for-each select="$Self//SInWs:*[name() = $tagName]">
			<xsl:if test="position() = $Pos">
				<xsl:value-of select="./@word"/>
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<SInWs:Billion word="миллион"/>
	<SInWs:Billion word="миллиона"/>
	<SInWs:Billion word="миллионов"/>
	<SInWs:Thousand word="тысяча"/>
	<SInWs:Thousand word="тысячи"/>
	<SInWs:Thousand word="тысяч"/>
	<SInWs:BadWord word="одна"/>
	<SInWs:BadWord word="две"/>
	<SInWs:Words word="один"/>
	<SInWs:Words word="два"/>
	<SInWs:Words word="три"/>
	<SInWs:Words word="четыре"/>
	<SInWs:Words word="пять"/>
	<SInWs:Words word="шесть"/>
	<SInWs:Words word="семь"/>
	<SInWs:Words word="восемь"/>
	<SInWs:Words word="девять"/>
	<SInWs:Words word="десять"/>
	<SInWs:Words word="одиннадцать"/>
	<SInWs:Words word="двенадцать"/>
	<SInWs:Words word="тринадцать"/>
	<SInWs:Words word="четырнадцать"/>
	<SInWs:Words word="пятнадцать"/>
	<SInWs:Words word="шестнадцать"/>
	<SInWs:Words word="семнадцать"/>
	<SInWs:Words word="восемнадцать"/>
	<SInWs:Words word="девятнадцать"/>
	<SInWs:Words word="двадцать"/>
	<SInWs:Words word="тридцать"/>
	<SInWs:Words word="сорок"/>
	<SInWs:Words word="пятьдесят"/>
	<SInWs:Words word="шестьдесят"/>
	<SInWs:Words word="семьдесят"/>
	<SInWs:Words word="восемьдесят"/>
	<SInWs:Words word="девяносто"/>
	<SInWs:Words word="сто"/>
	<SInWs:Words word="двести"/>
	<SInWs:Words word="триста"/>
	<SInWs:Words word="четыреста"/>
	<SInWs:Words word="пятьсот"/>
	<SInWs:Words word="шестьсот"/>
	<SInWs:Words word="семьсот"/>
	<SInWs:Words word="восемьсот"/>
	<SInWs:Words word="девятьсот"/>
</xsl:stylesheet>
