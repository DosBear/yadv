<?xml version="1.0" encoding="utf-8"?>
<!-- 
Проект Приказа ФТС "Об утверждении формы заявления перевозчика на выгрузку (передачу) припасов и форм решений таможенного органа по результатам рассмотрения указанного заявления"
Приложение № 2 - Решение таможенного органа о выдаче разрешения на выгрузку (передачу) припасов
Внесены изменения согласно Письму ГУОТОиТК от 15.08.2018 г. № 04-64/50988 (Добавлен номер 289-ФЗ «О таможенном регулировании...»)
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:res_us="urn:customs.ru:Information:TransportDocuments:ResUnloadingStore:5.14.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ResUnloadingStoreType -->
	<xsl:template match="res_us:ResUnloadingStore">
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
					}
					.indent{
						text-indent: 1.5em;
					}
					.underlined{
						border-bottom: 1px solid windowtext;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<!--td width="50%"></td-->
								<td width="100%" align="center">
									<b>Федеральная таможенная служба</b>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="res_us:Customs"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование таможенного органа)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td>
									<br/>
									<br/>
									<b>Решение
									<br/>таможенного органа о выдаче разрешения на выгрузку (передачу) припасов</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					На основании обращения <br/>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:apply-templates mode="organization" select="res_us:AppCarrier"/>
							<xsl:text disable-output-escaping="yes">;&lt;br&gt;Дата заявления: </xsl:text>
							<xsl:call-template name="russian_date">
								<xsl:with-param name="dateIn" select="res_us:AppDate"/>
							</xsl:call-template> г.
						</xsl:with-param>
						<xsl:with-param name="data_align" select="'left'"/>
						<xsl:with-param name="description" select="'(наименование, ИНН (при наличии), адрес перевозчика; дата заявления)'"/>
						<xsl:with-param name="width" select="'100%'"/>
					</xsl:call-template>
					<table>
						<tbody>
							<tr style="text-align: justify;">
								<td>
									<xsl:text>в соответствии со статьей 201 Федерального закона от 3 августа 2018 г. № 289-ФЗ «О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные
законодательные акты Российской Федерации» принято решение о выдаче разрешения на </xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="res_us:ActionStore"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(выгрузку и (или) передачу)'"/>
										<xsl:with-param name="supIndexDescr" select="'1'"/>
										<xsl:with-param name="width" select="'60mm'"/>
									</xsl:call-template>
									<xsl:text>&#160;припасов, находящихся на (в) </xsl:text>
								</td>
							</tr>
							<tr style="text-align: justify;">
								<td>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates select="res_us:PlaceStoreInfo/res_us:AircraftInformation"/>
											<xsl:apply-templates select="res_us:PlaceStoreInfo/res_us:ShipDetails"/>
											<xsl:apply-templates select="res_us:PlaceStoreInfo/res_us:Train"/>
											<xsl:apply-templates select="res_us:PlaceStoreInfo/res_us:StoragePlace"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(указываются сведения: для воздушного судна – о знаках национальной принадлежности и регистрационных знаках судна; для водного судна – о судне (наименование и описание), регистрации судна и его национальной принадлежности; для поезда – о номере (индексе) поезда, для выгруженных припасов – о месте хранения припасов (включая указание почтового адреса) и реквизитах документа о создании зоны таможенного контроля в месте хранения припасов)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<div>Сведения о выгружаемых (передаваемых) припасах:</div>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered">№ п/п</td>
								<td class="bordered">Наименование припасов</td>
								<td class="bordered">Количество<sup>2</sup></td>
								<td class="bordered">Код товара по ТН ВЭД ЕАЭС<sup>3</sup></td>
							</tr>
							<xsl:for-each select="res_us:StoresInfo">
								<tr valign="top">
									<td class="bordered">
										<xsl:value-of select="res_us:NumPP"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="res_us:NameStores"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates mode="quantity" select="res_us:StoresQuantity"/>
										<xsl:if test="res_us:SupplementaryQuantity and res_us:StoresQuantity">
											<br/>
										</xsl:if>
										<xsl:apply-templates mode="quantity" select="res_us:SupplementaryQuantity"/>
									</td>
									<td class="bordered">
										<xsl:value-of select="res_us:GoodsNomenclatureCode"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/><br/>
					<div>Сведения о  перевозчике, которому передаются припасы<sup>4</sup></div>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:apply-templates select="res_us:OtherCarrier" mode="organization"/>
						</xsl:with-param>
						<xsl:with-param name="data_align" select="'left'"/>
						<xsl:with-param name="description" select="'(наименование, ИНН (при наличии), адрес перевозчика)'"/>
						<xsl:with-param name="width" select="'100%'"/>
					</xsl:call-template>
					<br/><br/>
					<div>Сведения о месте хранения припасов<sup>5</sup></div>
					<xsl:call-template name="inlinetable">
						<xsl:with-param name="data">
							<xsl:apply-templates select="res_us:WhereStoragePlace"/>
						</xsl:with-param>
						<xsl:with-param name="data_align" select="'left'"/>
						<xsl:with-param name="description" select="'(указываются место хранения припасов (включая указание почтового адреса) и реквизиты документа о создании зоны таможенного контроля в предполагаемом месте хранения припасов)'"/>
						<xsl:with-param name="width" select="'100%'"/>
					</xsl:call-template>
					<br/>
					<br/>
					<table width="100%">
						<tbody>
							<tr>
								<td width="20%" valign="bottom">Начальник<br/>(заместитель начальника)</td>
								<td width="28%" class="underlined" valign="bottom"><xsl:apply-templates select="res_us:Customs"/></td>
								<td width="2%"></td>
								<td width="20%" class="underlined" valign="bottom"></td>
								<td width="2%"></td>
								<td width="28%" class="underlined" align="center" valign="bottom">
									<xsl:value-of select="res_us:CustomsChief/cat_ru:PersonName"/>
								</td>
							</tr>
							<tr valign="top" align="center">
								<td></td>
								<td class="descr">(наименование таможенного органа)</td>
								<td></td>
								<td class="descr">(подпись)</td>
								<td></td>
								<td class="descr">(инициалы, фамилия)</td>
							</tr>
							<tr>
								<td colspan="6" align="left">
									<br/>
								</td>
							</tr>
							<tr>
								<td colspan="6" align="left">
									<xsl:call-template name="russian_date_month"><xsl:with-param name="dateIn" select="res_us:ResDate"/></xsl:call-template>								
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<div>_____________________________________</div>
					<div class="descr" style="text-align:left;">
						<sup>1</sup>Указываются сведения о дате, времени и предполагаемых действиях с припасами.<br/>
						<sup>2</sup>Указывается количество припасов в основной и дополнительной единице измерения.<br/>
						<sup>3</sup>Указывается десятизначный код товара по единой Товарной номенклатуре внешнеэкономической деятельности Евразийского экономического союза.<br/>
						<sup>4</sup>Заполняются в случае передачи припасов иному перевозчику.<br/>
						<sup>5</sup>Заполняются в случае размещения припасов  в зоне таможенного контроля.<br/>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
<xsl:template match="res_us:AircraftInformation">
		<xsl:text> воздушное судно </xsl:text>
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="res_us:ShipDetails">
		<xsl:text> водное судно </xsl:text>
		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="contains(local-name(.),'Date')">
					<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="."/></xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="."/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="position()!=last()">, </xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="res_us:Train">
		<xsl:text> поезд </xsl:text>
		<xsl:for-each select="*">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text> </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="res_us:StoragePlace|res_us:WhereStoragePlace">
		<xsl:apply-templates select="res_us:Customs"/>
		<xsl:apply-templates select="res_us:Address" mode="address"/>
		<xsl:if test="res_us:DocumentNumber">
			<xsl:text>, № </xsl:text>
			<xsl:value-of select="res_us:DocumentNumber"/>
		</xsl:if>
		<xsl:if test="res_us:DocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="res_us:DocumentDate"/></xsl:call-template>
		</xsl:if>
		<xsl:if test="res_us:DateBegin">
			<xsl:text>, дата создания зоны ТК: </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="res_us:DateBegin"/></xsl:call-template>
		</xsl:if>
		<xsl:if test="res_us:DateEnd">
			<xsl:text>, дата ликвидации зоны ТК: </xsl:text>
			<xsl:call-template name="russian_date"><xsl:with-param name="dateIn" select="res_us:DateEnd"/></xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="res_us:Customs">
		<xsl:value-of select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>(</xsl:text>
		</xsl:if>
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="res_us:ActionStore">
		<xsl:choose>
			<xsl:when test=".=1">выгрузку</xsl:when>
			<xsl:when test=".=2">передачу</xsl:when>
			<xsl:when test=".=3">выгрузку и передачу</xsl:when>
			<xsl:otherwise>код действия: <xsl:value-of select="."/></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
			
	<xsl:template mode="quantity" match="*">
		<xsl:value-of select="cat_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:text> </xsl:text>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="res_us:GTDID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	
	<xsl:template mode="person_nopost" match="*">
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template mode="person" match="*">
		<xsl:value-of select="cat_ru:PersonPost"/>
		<xsl:text> </xsl:text>
		<xsl:for-each select="cat_ru:PersonSurname|cat_ru:PersonName|cat_ru:PersonMiddleName">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="supIndexDescr"/>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value">
						<xsl:value-of select="$data" disable-output-escaping="yes"/>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						<xsl:value-of select="$description" disable-output-escaping="yes"/><sup><xsl:value-of select="$supIndexDescr"/></sup>
					</td>
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
		<!--xsl:text> </xsl:text>
		<xsl:apply-templates mode="identity" select="RUScat_ru:IdentityCard"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="RUScat_ru:PersonId"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates mode="details" select="RUScat_ru:CommunicationDetails"/>
		<xsl:text> </xsl:text-->
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:text> адрес: </xsl:text>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="." mode="address"/>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<!--xsl:if test="adt_cat:FactAddress">
			<xsl:text> факт. адрес: </xsl:text>
			<xsl:apply-templates select="adt_cat:FactAddress" mode="address"/>
		</xsl:if-->
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
		<!--xsl:if test="cat_ru:OGRN">
			<xsl:text> ОГРН </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if-->
		<xsl:if test="cat_ru:INN">
			<xsl:text> ИНН </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<!--xsl:if test="cat_ru:KPP">
			<xsl:text> КПП </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if-->
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
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>"</xsl:text>
				<u>&#160;
				<xsl:value-of select="substring($dateIn,9,2)"/>
				&#160;</u>
				<xsl:text>" </xsl:text>
				<u>&#160;
				<xsl:call-template name="month"><xsl:with-param name="number" select="substring($dateIn,6,2)"/></xsl:call-template> 
				&#160;</u>
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="substring($dateIn,1,2)"/>
				<u>
					<xsl:value-of select="substring($dateIn, 3, 2)"/>
				</u>
				<xsl:text> г.</xsl:text>
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
</xsl:stylesheet>
