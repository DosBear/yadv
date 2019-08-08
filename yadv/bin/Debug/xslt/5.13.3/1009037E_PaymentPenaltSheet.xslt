<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:pmpnlt="urn:customs.ru:Information:SQDocuments:PaymentPenaltSheet:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template match="pmpnlt:PaymentPenaltSheet">
      <html>
         <head>
            <title>Сведения из реестра уведомлений Таможенного союза</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					/*height: 297mm;*/
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					/*height: 210mm;*/
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
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
					
					margin-top:20px;
					font: bold;
					
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					/*border: 1px solid gray;*/
					font-family: Courier, serif;
					font-size: 10;
					vertical-align:top;
				}

				td.value {
					border-bottom: 1px solid gray;
				}
				
				.low {
					font: 12;
					font-family: Arial, serif;
				}
				
				.auxiliary tbody tr td {
					border: 0;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Сведения из реестра уведомлений Таможенного союза</h2>
               <table style="table-layout:fixed;word-wrap:break-word; width:100%;">
				 <xsl:for-each select="pmpnlt:Penalty">
					<xsl:apply-templates select="."/>
				 </xsl:for-each>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="pmpnlt:Penalty">
		<tr>
			<td style="border-bottom: 1px solid black" colspan="2">
				<br/><b>Идентификатор записи: <xsl:value-of select="pmpnlt:ViolatorID"/></b>
			</td>
		</tr>
		<tr>
			<td style="width:50%">Сумма штрафа в рублях</td>
			<td class="value" style="width:50%">
				<xsl:value-of select="pmpnlt:PenaltySum"/>
				<xsl:choose>
					<xsl:when test="pmpnlt:IsPaid='1' or pmpnlt:IsPaid='t' or pmpnlt:IsPaid='true'"> (оплачено)</xsl:when>
					<xsl:when test="pmpnlt:IsPaid='0' or pmpnlt:IsPaid='f' or pmpnlt:IsPaid='false'"> (не оплачено)</xsl:when>
				</xsl:choose>
			</td>
		</tr>
		<tr>
			<td style="width:50%">Дата/время внесения платежа</td>
			<td class="value" style="width:50%">
				<xsl:call-template name="date_time">
				   <xsl:with-param name="dateTimeIn" select="pmpnlt:PenaltyCreateDateTime"/>
				</xsl:call-template>
			</td>
		</tr>
		<xsl:if test="pmpnlt:PayDateTime">
			<tr>
				<td style="width:50%">Дата/время оплаты</td>
				<td class="value" style="width:50%">
					<xsl:call-template name="date_time">
					   <xsl:with-param name="dateTimeIn" select="pmpnlt:PayDateTime"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td style="width:50%">КП / УГАДН</td>
			<td class="value" style="width:50%"><xsl:value-of select="pmpnlt:Organization"/></td>
		</tr>
		<tr>
			<td style="width:50%">Постановление</td>
			<td class="value" style="width:50%"><xsl:apply-templates select="pmpnlt:Resolution"/></td>
		</tr>
		<xsl:if test="pmpnlt:PayDoc or pmpnlt:IsHalfPenalty">
			<tr>
				<td style="width:50%">Платежный документ</td>
				<td class="value" style="width:50%">
					<xsl:apply-templates select="pmpnlt:PayDoc"/>
					<xsl:choose>
						<xsl:when test="pmpnlt:IsHalfPenalty='true' or pmpnlt:IsHalfPenalty=1"> (50% оплаты)</xsl:when>
						<xsl:when test="pmpnlt:IsHalfPenalty='false' or pmpnlt:IsHalfPenalty=0"> (полная оплата)</xsl:when>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="pmpnlt:UIN">
			<tr>
				<td style="width:50%">УИН</td>
				<td class="value" style="width:50%"><xsl:value-of select="pmpnlt:UIN"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pmpnlt:CustomsPenaltyInfo">
			<tr><td colspan="2"><br/><u>Информация об постановлении в ФТС</u></td></tr>
			<xsl:apply-templates select="pmpnlt:CustomsPenaltyInfo"/>
		</xsl:if>
 		<xsl:if test="pmpnlt:Payer">
			<tr><td colspan="2"><br/><u>Плательщик</u></td></tr>
			<xsl:apply-templates select="pmpnlt:Payer"/>
		</xsl:if>
		<xsl:if test="pmpnlt:BankRequis">
			<tr><td colspan="2"><br/><u>Реквизиты банка</u></td></tr>
			<xsl:apply-templates select="pmpnlt:BankRequis"/>
		</xsl:if>
		<tr><td colspan="2"><br/><u>Регистрационные данные ТС</u></td></tr>
		<xsl:apply-templates select="pmpnlt:TSInfo"/>
   </xsl:template>
   <xsl:template match="pmpnlt:CustomsPenaltyInfo">
		<xsl:if test="pmpnlt:InputDate">
			<tr>
				<td style="width:50%">Дата внесения сведений об оплате в ПК ФТС </td>
				<td class="value" style="width:50%">
					<xsl:call-template name="date_time">
					   <xsl:with-param name="dateTimeIn" select="pmpnlt:InputDate"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
 		<xsl:for-each select="pmpnlt:CustomsPerson">
			<tr>
				<td style="width:50%">ФИО инспектора, вынесшего постановление</td>
				<td class="value" style="width:50%">
					<xsl:value-of select="cat_ru:PersonName"/>
					<xsl:if test="cat_ru:LNP"> ЛНП: <xsl:value-of select="cat_ru:LNP"/></xsl:if>
				</td>
			</tr>
		</xsl:for-each>
 		<xsl:for-each select="pmpnlt:CustomsOffice">
			<tr>
				<td style="width:50%">Код поста ФТС, где вынесено постановление</td>
				<td class="value" style="width:50%">
					<xsl:value-of select="cat_ru:Code"/>&#160;
					<xsl:value-of select="cat_ru:OfficeName"/>
				</td>
			</tr>
		</xsl:for-each>
  </xsl:template>
   <xsl:template match="pmpnlt:Resolution | pmpnlt:PayDoc">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
   </xsl:template>
   <xsl:template match="pmpnlt:Payer">
		<xsl:if test="cat_ru:OrganizationLanguage">
			<tr>
				<td style="width:50%">Код языка для заполнения наименования </td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<tr>
				<td style="width:50%">Наименование организации / ФИО физ. лица</td>
				<td class="value" style="width:50%">
					<xsl:value-of select="cat_ru:OrganizationName"/>
					<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName"> (</xsl:if>
					<xsl:value-of select="cat_ru:ShortName"/>
					<xsl:if test="cat_ru:OrganizationName and cat_ru:ShortName">)</xsl:if>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<tr>
				<td style="width:50%">Сведения об организации</td>
				<td class="value" style="width:50%">
					<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
					<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<tr>
				<td style="width:50%">Кодовое обозначение страны</td>
				<td class="value" style="width:50%"><xsl:value-of select="RUScat_ru:CountryA2Code"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			<tr>
				<td style="width:50%">Организационно-правовая форма</td>
				<td class="value" style="width:50%">
					<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
					<xsl:if test="RUScat_ru:BusinessEntityTypeName">&#160;
						<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
					</xsl:if>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<tr>
				<td style="width:50%">Таможенный номер, присвоенный юр. или физ. лицу</td>
				<td class="value" style="width:50%"><xsl:apply-templates select="RUScat_ru:UITN"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<tr>
				<td style="width:50%">Уникальный идентификатор физ. лица</td>
				<td class="value" style="width:50%"><xsl:value-of select="RUScat_ru:PersonId"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<tr>
				<td style="width:50%">Сведения о док-те, удостоверяющем личность физ. лица</td>
				<td class="value" style="width:50%"><xsl:apply-templates select="RUScat_ru:IdentityCard"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<tr>
					<td style="width:50%"><xsl:if test="position()=1">Адрес</xsl:if> </td>
					<td class="value" style="width:50%"><xsl:apply-templates select="."/></td>
				</tr>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<tr>
				<td style="width:50%">Контактные данные</td>
				<td class="value" style="width:50%"><xsl:apply-templates select="RUScat_ru:CommunicationDetails"/></td>
			</tr>
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
		<!--xsl:if test="cat_ru:ITNReserv">
			<xsl:if test="cat_ru:RNN"><xsl:text>/00000000</xsl:text></xsl:if>
			<xsl:text>/</xsl:text>
			<xsl:value-of select="cat_ru:ITNReserv"/>
		</xsl:if-->
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
			<xsl:text>Номер справки об отсутствии НЗОУ: </xsl:text>
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
			<xsl:text>ОГРН/ОГРНИП: </xsl:text>
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
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:text>код объекта: </xsl:text>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<xsl:text> код справочника: </xsl:text>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
		</xsl:if>
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
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="RUScat_ru:IdentityCard">
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardCode"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text>(</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>) </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<xsl:text>серия </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			<xsl:text> </xsl:text>
		</xsl:if>				
		<xsl:if test="cat_ru:IdentityCardNumber">
			<xsl:text>№ </xsl:text>
			<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName or RUScat_ru:IssuerCode">выдан </xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or RUScat_ru:IssuerCode">
			&#160;<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:value-of select="RUScat_ru:PostalCode"/>
		<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">
			<xsl:if test="RUScat_ru:PostalCode">, </xsl:if>
			<xsl:if test="RUScat_ru:CountryCode">
				<xsl:if test="RUScat_ru:CounryName">(<xsl:value-of select="RUScat_ru:CountryCode"/>) </xsl:if>
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:PostalCode or RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<xsl:text>, (</xsl:text>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
   <xsl:template match="pmpnlt:TSInfo">
		<xsl:if test="cat_ru:VIN">
			<tr>
				<td style="width:50%">Номер шасси (VIN)</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:VIN"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:TransportKindCode">
			<tr>
				<td style="width:50%">Код типа ТС</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:TransportKindCode"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMarkCode">
			<tr>
				<td style="width:50%">Код марки ТС</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:TransportMarkCode"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:TransportIdentifier">
			<tr>
				<td style="width:50%">Идентификатор ТС</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:TransportIdentifier"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:TransportMeansNationalityCode">
			<tr>
				<td style="width:50%">Код страны принадлежности ТС</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:TransportMeansNationalityCode"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:ActiveTransportIdentifier">
			<tr>
				<td style="width:50%">Идентификатор активного ТС</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:ActiveTransportIdentifier"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:TransportRegNumber">
			<tr>
				<td style="width:50%">Номер свидетельства о регистрации ТС </td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:TransportRegNumber"/></td>
			</tr>
		</xsl:if>
   </xsl:template>
   <xsl:template match="pmpnlt:BankRequis">
		<tr>
			<td style="width:50%">Наименование банка</td>
			<td class="value" style="width:50%"><xsl:value-of select="pmpnlt:BankName"/></td>
		</tr>
		<xsl:if test="pmpnlt:BIC">
			<tr>
				<td style="width:50%">БИК</td>
				<td class="value" style="width:50%"><xsl:value-of select="pmpnlt:BIC"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pmpnlt:CorrespAccount">
			<tr>
				<td style="width:50%">Номер кор. счета</td>
				<td class="value" style="width:50%"><xsl:value-of select="pmpnlt:CorrespAccount"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pmpnlt:BankPlace">
			<tr>
				<td style="width:50%">Местонахождение банка</td>
				<td class="value" style="width:50%"><xsl:value-of select="pmpnlt:BankPlace"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="pmpnlt:PersonalAccount">
			<tr>
				<td style="width:50%">Лицевой счет клиента</td>
				<td class="value" style="width:50%"><xsl:value-of select="pmpnlt:PersonalAccount"/></td>
			</tr>
		</xsl:if>
   </xsl:template>
</xsl:stylesheet>