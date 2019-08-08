<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:grn_cat="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeCommonAggregateTypesCust:5.14.3" xmlns:grn_cl="urn:customs.ru:Information:GuaranteeDocuments:GuaranteeUsage:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
	<xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="grn_cl:GuaranteeUsage">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
					body {
					background: #cccccc;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
					}

					div.album_page {
					width: 297mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
					}

					.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
					}

					.header {
					font-weight: bold;
					margin-top:20px;
					}

					table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
					}

					.low {
					font: 12;
					font-fase: Courier;
					}
					.graph {
					font-family: Arial;
					font-size: 10pt;
					}
					jh {
					font: 16;
					font-face: Arial;
					}
					dog1 {
					position:relative;
					left: 50px;
					bottom: 50px;
					}
					.gra {
					font-family: Arial;
					font-size: 6pt;
					}
					.g{
					border-right:0pt solid;
					}

				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tr>
							<td align="center" colspan="2" style="border:solid 0pt">
								<font face="Times new roman" size="4">
									<b>
										<xsl:choose>
											<xsl:when test="grn_cl:DocumentSign='1'">Запрос на резервирование</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='2'">Уведомление об использовании</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='3'">Продление срока</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='4'">Завершение использования</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='5'">Прекращение обеспеченного обязательства</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='6'">Уведомление о внесении сведений о банковских гарантиях</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='7'">Уведомление о завершении ТТ</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='8'">Прекращение использования обеспечения</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='9'">Зачет в счет авансовых платежей</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='10'">Временное решение о предоставлении отсрочки/рассрочки</xsl:when>
											<xsl:when test="grn_cl:DocumentSign='11'">Регистрационный номер решения о предоставлении отсрочки/рассрочки</xsl:when>
											<xsl:otherwise>Завершение использования обеспечения</xsl:otherwise>
										</xsl:choose>
									</b>
								</font>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="border:solid 0pt"> </td>
						</tr>
						<tr>
							<td style="width:50%">
								<span class="graph">Дата и время формирования электронного документа</span>
							</td>
							<td class="graph" style="width:50%">
								<xsl:call-template name="date_time">
									<xsl:with-param name="dateTimeIn" select="grn_cl:DocumentDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
						<tr>
							<td align="center" class="graph" colspan="2">
								Информация о документе обеспечения
							</td>
						</tr>
						<xsl:for-each select="grn_cl:GuaranteeDocument">
							<tr>
								<td class="graph" colspan="2">


									Тип документа: <xsl:choose>
										<xsl:when test="grn_cat:DocumentKind=1">ДТ</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=2">ТД</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=3">Книжка МДП</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=4">Сертификат</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=5">ТПО</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=6">ТР</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=7">Дополнение к договору поручительства</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=8">Банковская гарантия</xsl:when>
										<xsl:when test="grn_cat:DocumentKind=9">Документ включения в реестр</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:if test="cat_ru:PrDocumentName">
										<xsl:value-of select="cat_ru:PrDocumentName"/> 
									</xsl:if>
									<xsl:if test="cat_ru:PrDocumentNumber">
										№
										<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
									</xsl:if>
									<xsl:if test="cat_ru:PrDocumentDate">
										от
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="grn_cat:ContractNumber or grn_cat:ContractDate">
										<br/>
										Номер/Дата договора поручительства:
										<xsl:if test="grn_cat:ContractNumber">
											№ <xsl:value-of select="grn_cat:ContractNumber"/>
										</xsl:if>
										<xsl:if test="grn_cat:ContractDate">
											от
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="grn_cat:ContractDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
								</td>
							</tr>
						</xsl:for-each>
						<xsl:if test="grn_cl:CustomsDocument">
							<xsl:for-each select="grn_cl:CustomsDocument">
								<tr>
									<td class="graph">Идентификатор таможенной процедуры, в рамках которой осуществляется резервирование/использование обеспечения</td>
									<td class="graph">
										Тип документа: <xsl:choose>
											<xsl:when test="grn_cat:DocumentKind=1">ДТ</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=2">ТД</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=3">Книжка МДП</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=4">Сертификат</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=5">ТПО</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=6">ТР</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=7">Дополнение к договору поручительства</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=8">Банковская гарантия</xsl:when>
											<xsl:when test="grn_cat:DocumentKind=9">Документ включения в реестр</xsl:when>
										</xsl:choose>
										<br/>
										<xsl:if test="cat_ru:PrDocumentName">
											<xsl:value-of select="cat_ru:PrDocumentName"/> 
										</xsl:if>
										<xsl:if test="cat_ru:PrDocumentNumber">
											№
											<xsl:value-of select="cat_ru:PrDocumentNumber"/> 
										</xsl:if>
										<xsl:if test="cat_ru:PrDocumentDate">
											от
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="grn_cat:ContractNumber or grn_cat:ContractDate">
											<br/>
											Номер/Дата договора поручительства:
											<xsl:if test="grn_cat:ContractNumber">
												№ <xsl:value-of select="grn_cat:ContractNumber"/>
											</xsl:if>
											<xsl:if test="grn_cat:ContractDate">
												от
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="grn_cat:ContractDate"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="grn_cl:LiableTrader">
							<tr>
								<td class="graph">Участник ВЭД, несущий обязательства по обеспечению</td>
								<td class="graph">
									<xsl:apply-templates select="grn_cl:LiableTrader"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:ReservationAmount">
							<tr>
								<td class="graph">Резервируемая сумма денежных средств:</td>
								<td class="graph">
									<xsl:value-of select="grn_cl:ReservationAmount/grn_cat:Amount"/>
									(<xsl:value-of select="grn_cl:ReservationAmount/grn_cat:CurrencyCode"/>)
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:DateLimit">
							<tr>
								<td class="graph">Планируемый срок завершения использования обеспечения</td>
								<td class="graph">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_cl:DateLimit"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:Reason">
							<tr>
								<td class="graph">Причина, по которой завершено использование обеспечения</td>
								<td class="graph">
									<xsl:value-of select="grn_cl:Reason/grn_cl:Name"/> <xsl:value-of select="grn_cl:Reason/grn_cl:Comment"/>
									<xsl:if test="grn_cl:Reason/grn_cl:DecisionCode">
										, код решения: <xsl:value-of select="grn_cl:Reason/grn_cl:DecisionCode"/>
									</xsl:if>
									<xsl:if test="grn_cl:Reason/grn_cl:DateClose">
										<br/>дата завершения использования обеспечения: 
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="grn_cl:Reason/grn_cl:DateClose"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="grn_cl:Reason/grn_cl:ReasonClose">
										<br/>причина закрытия  сертификата: <xsl:choose>
											<xsl:when test="grn_cl:Reason/grn_cl:ReasonClose=1">Завершение транзита</xsl:when>
											<xsl:when test="grn_cl:Reason/grn_cl:ReasonClose=2">Погашение сертификата в связи с его неиспользованием</xsl:when>
											<xsl:when test="grn_cl:Reason/grn_cl:ReasonClose=3">Погашение сертификата в связи с недоставкой товара</xsl:when>
											<xsl:when test="grn_cl:Reason/grn_cl:ReasonClose=4">Прочее</xsl:when>
											<xsl:when test="grn_cl:Reason/grn_cl:ReasonClose=5">Аннулирование в связи с технической ошибкой</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="grn_cl:Reason/grn_cl:ReasonClose"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</td>
							</tr>
						</xsl:if>
						<tr>
							<td class="graph">Коды видов обязательств</td>
							<td class="graph">
								<xsl:for-each select="grn_cl:ObligationInfo/grn_cl:ObligationCode">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
						<xsl:if test="grn_cl:TransitDate">
							<tr>
								<td class="graph">Дата оформления транзита</td>
								<td class="graph">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_cl:TransitDate"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:TransitDateLimit">
							<tr>
								<td class="graph">Срок таможенного транзита</td>
								<td class="graph">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_cl:TransitDateLimit"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:TransitCloseDateTime">
							<tr>
								<td class="graph">Дата и время завершения транзита</td>
								<td class="graph">
									<xsl:call-template name="date_time">
										<xsl:with-param name="dateTimeIn" select="grn_cl:TransitCloseDateTime"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:SertifDateLimit">
							<tr>
								<td class="graph">Cрок действия сертификата</td>
								<td class="graph">
									<xsl:call-template name="russian_date">
										<xsl:with-param name="dateIn" select="grn_cl:SertifDateLimit"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:TransitCloseState">
							<tr>
								<td class="graph">Тип завершения транзита</td>
								<td class="graph">
									<xsl:choose>
										<xsl:when test="grn_cl:TransitCloseState=1">штатное завершение</xsl:when>
										<xsl:when test="grn_cl:TransitCloseState=2">завершение с оговорками</xsl:when>
										<xsl:otherwise>код <xsl:value-of select="grn_cl:TransitCloseState"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:BorderCustoms">
							<tr>
								<td class="graph">Таможенный орган отправления</td>
								<td class="graph">
									<xsl:apply-templates select="grn_cl:BorderCustoms"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:DeliveryCustoms">
							<tr>
								<td class="graph">Таможенный орган назначения</td>
								<td class="graph">
									<xsl:apply-templates select="grn_cl:DeliveryCustoms"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:CustomsOffice">
							<tr>
								<td class="graph">Таможенный орган оформления</td>
								<td class="graph">
									<xsl:apply-templates select="grn_cl:CustomsOffice"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="grn_cl:CustomsOfficial">
							<tr>
								<td class="graph">Должностное лицо ТО</td>
								<td class="graph">
									<xsl:apply-templates select="grn_cl:CustomsOfficial"/>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div>
			</body>
		</html>
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
	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
	</xsl:template>
	<xsl:template match="grn_cl:LiableTrader">
		<xsl:if test="cat_ru:OrganizationLanguage">
			Язык заполнения:
			<xsl:value-of select="cat_ru:OrganizationLanguage"/>
			<br/>
		</xsl:if>
		<xsl:value-of select="cat_ru:OrganizationName"/>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="cat_ru:OrganizationName">(</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<br/>
		<xsl:choose>
			<xsl:when test="cat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="cat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			</xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<u>Адрес:</u>
			<br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">;<br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<br/>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<span>
				ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<span>
				ИНН: <xsl:value-of select="cat_ru:INN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<span>
				КПП: <xsl:value-of select="cat_ru:KPP"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<span>
				УНП: <xsl:value-of select="cat_ru:UNP"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<span>
				Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
			</span>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<span>
				БИН: <xsl:value-of select="cat_ru:BIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<span>
				ИИН: <xsl:value-of select="cat_ru:IIN"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			<span>
				ИТН:
				<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
				<xsl:if test="cat_ru:ITNReserv">
					/<xsl:value-of select="cat_ru:ITNReserv"/>
				</xsl:if>
			</span>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:if test="RUScat_ru:AddressKindCode">
					<xsl:choose>
						<xsl:when test="RUScat_ru:AddressKindCode='1'">Адрес регистрации: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='2'">Фактический адрес: </xsl:when>
						<xsl:when test="RUScat_ru:AddressKindCode='3'">Почтовый адрес: </xsl:when>
						<xsl:otherwise>(код вида адреса: <xsl:value-of select="RUScat_ru:AddressKindCode"/>) </xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="last">
					<!-- надо через переменную, т.к. смещение на невыводимые KLADR, AOGUID, AOID -->
					<xsl:choose>
						<xsl:when test="local-name(*[last()])='KLADR' or local-name(*[last()])='AOGUID' or local-name(*[last()])='AOID'">
							<xsl:choose>
								<xsl:when test="RUScat_ru:KLADR and RUScat_ru:AOGUID and RUScat_ru:AOID">
									<xsl:value-of select="count(*) - 3"/>
								</xsl:when>
								<xsl:when test="(not(RUScat_ru:KLADR) and RUScat_ru:AOGUID and RUScat_ru:AOID) or (RUScat_ru:KLADR and not(RUScat_ru:AOGUID) and RUScat_ru:AOID) or (RUScat_ru:KLADR and RUScat_ru:AOGUID and not(RUScat_ru:AOID)) ">
									<xsl:value-of select="count(*) - 2"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="count(*) - 1"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="count(*)"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:for-each select="*">
					<xsl:if test="local-name()='OKTMO'">ОКТМО: </xsl:if>
					<xsl:if test="local-name()='OKATO'"> ОКАТО: </xsl:if>
					<!--xsl:if test="local-name()='KLADR'">Код КЛАДР: </xsl:if>
					<xsl:if test="local-name()='AOGUID'">Глобальный ИД по ФИАС: </xsl:if>
					<xsl:if test="local-name()='AOID'">Уникальный ИД по ФИАС: </xsl:if-->
					<xsl:if test="local-name()='TerritoryCode'">Код единицы административно - территориального деления: </xsl:if>
					<xsl:if test="local-name()='PostOfficeBoxId'">Номер а/я: </xsl:if>
					<xsl:choose>
						<xsl:when test="local-name()='AddressKindCode'">
							<xsl:choose>
								<xsl:when test=".='1'">Адрес регистрации: </xsl:when>
								<xsl:when test=".='2'">Фактический адрес: </xsl:when>
								<xsl:when test=".='3'">Почтовый адрес: </xsl:when>
								<xsl:otherwise>(код вида адреса: <xsl:value-of select="."/>) </xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:when test="local-name()='CountryCode'">
							<xsl:if test="not(../RUScat_ru:CounryName)">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=$last">, </xsl:if>
							</xsl:if>
						</xsl:when>
						<xsl:when test="local-name()='KLADR' or local-name()='AOGUID' or local-name()='AOID'">
							<!--в этом случае ничего не выводим-->
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="."/>
							<xsl:if test="position()!=$last">, </xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="grn_cl:LiableTrader/RUScat_ru:IdentityCard">
		<u>Документ удостоверяющий личность:</u>
		<br/>
		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:value-of select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardCode">
			(код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
			<span>
				Серия номер:
				<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
				<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
				<xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
			Выдан
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
			</xsl:call-template>
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
			<br/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="grn_cl:CustomsOffice|grn_cl:BorderCustoms|grn_cl:DeliveryCustoms">
		<xsl:value-of select="cat_ru:Code"/>
		<xsl:if test="cat_ru:OfficeName">
			(<xsl:value-of select="cat_ru:OfficeName"/>)
		</xsl:if>
		<xsl:if test="cat_ru:CustomsCountryCode">
			, код государства - члена ЕАЭС: <xsl:value-of select="cat_ru:CustomsCountryCode"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="grn_cl:CustomsOfficial">
		<xsl:value-of select="cat_ru:PersonName"/>
		<xsl:if test="cat_ru:LNP">
			(ЛНП: <xsl:value-of select="cat_ru:LNP"/>)
		</xsl:if>
	</xsl:template>
	<xsl:template match="grn_cl:GuaranteeUseDocument">
		<!--код/дата/номер-->
		<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
		<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
</xsl:stylesheet>
