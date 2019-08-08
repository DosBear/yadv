<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:nr="urn:customs.ru:Information:ExchangeDocuments:NotifReservation:5.14.3">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="nr:NotifReservation">
		<html>
			<head>
			<title>Уведомление о резервировании/о невозможности резервирования суммы обеспечения</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
			<style type="text/css">
			body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					max-width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
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
				

					table
					{
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					font-size:11pt;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 11pt;
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
			<table>
			    <tr>
					<td align="center" style="border:solid 0pt" class="graph"><font face="Times new roman" size="4"><b> 
					<xsl:choose>
						<xsl:when test="nr:DocSign='0'">Уведомление об успешном резервировании суммы обеспечения</xsl:when>
						<xsl:when test="nr:DocSign='1'">Уведомление о частичном резервировании суммы обеспечения</xsl:when>
						<xsl:when test="nr:DocSign='2'">Уведомление о невозможности резервирования суммы обеспечения</xsl:when>
					</xsl:choose>
					</b></font></td>
				</tr>
				<tr>
					<td style="border:solid 0pt" class="graph">&#160;</td>
				</tr>
				<tr>
					<td align="right" style="border:solid 0pt" class="graph"><font face="Times new roman" size="3"><b>
					    <xsl:call-template name="date_time">
					        <xsl:with-param name="dateTimeIn" select="nr:DocumentDateTime"/>
					    </xsl:call-template>
					</b></font></td>
				</tr>
				<!--<tr>
					<td style="border:solid 0pt" class="graph">&#160;</td>
				</tr>-->
			</table>
			<table>
			        <tr>
						<td class="annot graphMain" width="50%"><b>Регистрационный номер таможенного документа&#160;</b></td>
						<td class="value graphMain"><b><xsl:apply-templates select="nr:DeclRegNumber"/></b></td>
					</tr>
					<tr>
						<td class="annot graphMain" width="50%">Зарезервированная сумма обеспечения уплаты таможенных пошлин, налогов</td>
						<td class="value graphMain"><xsl:value-of select="nr:ReservedAmount"/>
						<xsl:if test="nr:CurrencyCode">
						    <xsl:text> </xsl:text><xsl:value-of select="nr:CurrencyCode"/>
						</xsl:if>
						</td>
					</tr>
					<xsl:if test="nr:RequiredAmount">
					<tr>
						<td class="annot graphMain" width="50%">Сумма обеспечения, которая не может быть зарезервирована из-за отсутствия неиспользованного (свободного) остатка</td>
						<td class="value graphMain"><xsl:value-of select="nr:RequiredAmount"/>
							<xsl:if test="nr:CurrencyCode">
								<xsl:text> </xsl:text><xsl:value-of select="nr:CurrencyCode"/>
							</xsl:if>
						</td>
					</tr></xsl:if>
					<xsl:if test="nr:Reasons">
					<tr>
						<td class="annot graphMain" width="50%">Описание обстоятельств, послуживших причиной невозможности резервирования суммы обеспечения</td>
						<td class="value graphMain">
							<xsl:for-each select="nr:Reasons">
								<xsl:value-of select="nr:ReasonCode"/><xsl:text> </xsl:text> 
								<xsl:for-each select="nr:ReasonDescription">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
								</xsl:for-each>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
					</tr></xsl:if>
					
					<xsl:if test="nr:Participant">
						<tr>
							<td class="annot graphMain" colspan="2">&#160;</td>
						</tr>
						<tr>
							<td class="annot graphMain" colspan="2"><b>Участник ВЭД, несущий обязательства по обеспечению</b></td>
						</tr>
						<xsl:apply-templates select="nr:Participant"/>
					</xsl:if>
			</table>
			<xsl:if test="nr:Comment">
					<br/>
					<table>
						<tr>
							<td class="annot graphMain">Примечание: </td>
						</tr>
						<tr>
							<td class="value graphMain">
								<xsl:for-each select="nr:Comment">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
								</xsl:for-each>
							</td>
							<br/>
						</tr>
					</table>
				</xsl:if>
			<br/>
			<table>
				    <xsl:if test="nr:Customs">
			        <tr>
						<td class="annot graphMain" width="50%"><b>Код и наименование таможенного органа</b></td>
						<td class="value graphMain"><xsl:value-of select="nr:Customs/cat_ru:Code"/>
							<xsl:if test="nr:Customs/cat_ru:OfficeName"><xsl:text> </xsl:text><xsl:value-of select="nr:Customs/cat_ru:OfficeName"/></xsl:if>
						</td>
					</tr></xsl:if>
					<xsl:if test="nr:CustomsPerson">
					<tr>
						<td class="annot graphMain" width="50%"><b>Должностное лицо таможенного органа</b></td>
						<td class="value graphMain"><xsl:value-of select="nr:CustomsPerson/cat_ru:PersonName"/>
							<xsl:if test="nr:CustomsPerson/cat_ru:LNP"><xsl:text> </xsl:text><xsl:value-of select="nr:CustomsPerson/cat_ru:LNP"/></xsl:if>
						</td>
					</tr>
				</xsl:if>
			</table>
			</div>
			</body>
	    </html>
	</xsl:template>
	<xsl:template name="date_time">
	<xsl:param name="dateTimeIn"/>
	<xsl:call-template name="russian_date">
		<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
	</xsl:call-template>
	<xsl:text> </xsl:text>
	<xsl:value-of select="substring($dateTimeIn,12,5)"/>
</xsl:template>
<xsl:template name="russian_date">
	<xsl:param name="dateIn"/>
	<xsl:choose>
		<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
			<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of
				select="substring($dateIn,1,4)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$dateIn"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<xsl:template match="nr:DeclRegNumber"><!--код/дата/номер-->
	<xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/><xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
	<xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:if test="nr:AddNumber"><xsl:value-of select="nr:AddNumber"/></xsl:if><xsl:value-of select="cat_ru:GTDNumber"/>
</xsl:template>

	<!-- Шаблон для типа cat_ru:AddressType -->
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
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<xsl:text>тел.: </xsl:text>
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<xsl:if test="cat_ru:Phone">, </xsl:if>
			<xsl:text>факс: </xsl:text>
			<xsl:value-of select="cat_ru:Fax"/>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax">, </xsl:if>
			<xsl:text>телекс: </xsl:text>
			<xsl:value-of select="cat_ru:Telex"/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<xsl:if test="cat_ru:Phone or cat_ru:Fax or cat_ru:Telex">, </xsl:if>
			<xsl:text>e-mail: </xsl:text>
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:ITNKZType -->
	<xsl:template match="cat_ru:ITN">
		<xsl:value-of select="cat_ru:CategoryCode"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:KATOCode"/>
		<xsl:if test="cat_ru:RNN">
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:RNN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="RUScat_ru:IdentityCardCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCardCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardName"><xsl:value-of select="RUScat_ru:IdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries"> серия: <xsl:value-of select="RUScat_ru:IdentityCardSeries"/></xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber"> № <xsl:value-of select="RUScat_ru:IdentityCardNumber"/></xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName"> выдан: 
			<xsl:if test="RUScat_ru:IdentityCardDate">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:value-of select="RUScat_ru:OrganizationName"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<xsl:text>ИНН / ПИН: </xsl:text>
			<xsl:value-of select="cat_ru:KGINN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<xsl:text>ОКПО: </xsl:text>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<xsl:text>УНН: </xsl:text>
			<xsl:value-of select="cat_ru:UNN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<xsl:text>НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<xsl:text>Номер справки об НЗОУ: </xsl:text>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<xsl:text>УНП: </xsl:text>
			<xsl:value-of select="cat_ru:UNP"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<xsl:text>Идентификационный номер физ.лица: </xsl:text>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">
			<xsl:text>ОГРН: </xsl:text>
			<xsl:value-of select="cat_ru:OGRN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:text>ИНН: </xsl:text>
			<xsl:value-of select="cat_ru:INN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:text>КПП: </xsl:text>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<xsl:text>БИН: </xsl:text>
			<xsl:value-of select="cat_ru:BIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:text>ИИН: </xsl:text>
			<xsl:value-of select="cat_ru:IIN"/>
			<xsl:text>  </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<xsl:text>ИТН: </xsl:text>
			<xsl:apply-templates select="cat_ru:ITN"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CUOrganizationType -->
	<xsl:template match="nr:Participant">
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<table class="w190">
				<tr>
					<td style="width:50%" class="annot graphMain">&#160;&#160;&#160;Наименование организации /<br/>&#160;&#160;&#160;ФИО физического лица</td>
					<td class="value graphMain">
						<xsl:value-of select="cat_ru:OrganizationName"/>
						<xsl:if test="cat_ru:ShortName">
							<xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
							<xsl:value-of select="cat_ru:ShortName"/>
							<xsl:if test="cat_ru:OrganizationName">)</xsl:if>
						</xsl:if>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationLanguage">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">&#160;&#160;&#160;Код языка для заполнения наименования </td>
					<td class="value graphMain"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">&#160;&#160;&#160;Сведения об организации</td>
					<td class="value graphMain">
						<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
						<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">&#160;&#160;&#160;Адрес организации</td>
					<td class="value graphMain">
						<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
							<xsl:apply-templates select="."/>
							<xsl:if test="position()!=last()">; </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">&#160;&#160;&#160;Документ, удостоверяющий личность</td>
					<td class="value graphMain"><xsl:apply-templates select="RUScat_ru:IdentityCard"/></td>
				</tr>
			</table>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<table class="w190">
				<tr>
					<td class="annot graphMain" style="width:50%">&#160;&#160;&#160;Контактная информация</td>
					<td class="value graphMain"><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
