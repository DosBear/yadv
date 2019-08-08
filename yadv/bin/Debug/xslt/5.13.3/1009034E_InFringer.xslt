<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:infrg="urn:customs.ru:Information:SQDocuments:InFringer:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="infrg:InFringer">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="infrg:DocSign = '0' ">Сведения из реестра нарушителей</xsl:when>
                  <xsl:otherwise>Сведения из реестра нарушителей - отметка об оплате штрафа</xsl:otherwise>
               </xsl:choose>
            </title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
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
					/*border: 1px solid gray;*/
					font-family: Courier, serif;
					vertical-align:top;
				}

				td.value {
					border-bottom: 1px solid gray;
				}

				.low {
					font: 12;
					font-family: Arial, serif;
				}
			</style>
         </head>
         <body>
            <div class="album_page">
               <h2>
                  <xsl:choose>
                     <xsl:when test="infrg:DocSign = '0' ">Сведения из реестра нарушителей</xsl:when>
                     <xsl:otherwise>Сведения из реестра нарушителей - отметка об оплате штрафа</xsl:otherwise>
                  </xsl:choose>
               </h2>
               <table>
				   <xsl:for-each select="infrg:ViolatorsList">
					   <xsl:apply-templates select="."/>
				   </xsl:for-each>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="infrg:ViolatorsList">
		<tr>
			<td style="border-bottom: 1px solid black" colspan="2">
				<b>ИД записи в реестре нарушителей: <xsl:value-of select="infrg:ViolatorID"/></b>
			</td>
		</tr>
		<xsl:if test="infrg:ResolutionOrgName">
			<tr>
				<td style="width:50%">ПК, на котором составлено постановление</td>
				<td class="value" style="width:50%"><xsl:value-of select="infrg:ResolutionOrgName"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="infrg:InspectionDateTime">
			<tr>
				<td style="width:50%">Дата/время контроля (проверки)</td>
				<td class="value" style="width:50%">
					<xsl:call-template name="date_time">
						<xsl:with-param name="dateTimeIn" select="infrg:InspectionDateTime"/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="infrg:PenaltySum or infrg:IsVerbalWarning">
			<tr>
				<td style="width:50%">Сумма штрафа</td>
				<td class="value" style="width:50%">
					<xsl:value-of select="infrg:PenaltySum"/>&#160;
				   <xsl:if test="infrg:IsVerbalWarning = 'true' or infrg:IsVerbalWarning = 1">
					   штраф заменен на устное предупреждение
				   </xsl:if>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="infrg:PenaltyStatus">
			<tr>
				<td style="width:50%">Статус штрафа</td>
				<td class="value" style="width:50%">
					<xsl:choose>
					   <xsl:when test="infrg:PenaltyStatus = 'REALLY'">Действительно</xsl:when>
					   <xsl:when test="infrg:PenaltyStatus = 'APPEALED'">Обжаловано</xsl:when>
					   <xsl:when test="infrg:PenaltyStatus = 'CANCELLED'">Отменено по жалобе</xsl:when>
					   <xsl:otherwise><xsl:value-of select="infrg:PenaltyStatus"/></xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="infrg:IsMAP">
			<tr>
				<td style="width:50%">Штраф наложен при перевозке</td>
				<td class="value" style="width:50%">
					<xsl:choose>
					   <xsl:when test="infrg:IsMAP = 'true' or infrg:IsMAP = '1' or infrg:IsMAP = 't' ">МАП</xsl:when>
					   <xsl:otherwise>на территории РФ</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td style="width:50%">Отметка об оплате штрафа</td>
			<td class="value" style="width:50%">
				<xsl:choose>
				   <xsl:when test="infrg:IsPaid = 'true' or infrg:IsPaid = '1' or infrg:IsPaid = 't' ">Оплачено</xsl:when>
				   <xsl:otherwise>Не оплачено</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="infrg:AutoLawName">
			<tr>
				<td style="width:50%">Статья нарушения</td>
				<td class="value" style="width:50%"><xsl:value-of select="infrg:AutoLawName"/></td>
			</tr>
		</xsl:if>
		<tr>
			<td style="width:50%">Постановление</td>
			<td class="value" style="width:50%"><xsl:apply-templates select="infrg:Resolution"/></td>
		</tr>
        <xsl:if test="infrg:ResolutionEmployee">
			<tr>
				<td style="width:50%">Инспектор, составивший постановление</td>
				<td class="value" style="width:50%"><xsl:apply-templates select="infrg:ResolutionEmployee"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="infrg:PenaltyOrganization">
			<tr><td colspan="2"><br/><u>Организация, на которую наложен штраф</u></td></tr>
			<xsl:apply-templates select="infrg:PenaltyOrganization"/>
		</xsl:if>
		<xsl:if test="infrg:Carrier">
			<tr><td colspan="2"><br/><u>Перевозчик</u></td></tr>
			<xsl:apply-templates select="infrg:Carrier"/>
		</xsl:if>
		<xsl:if test="infrg:DriverName">
			<tr><td colspan="2"><br/><u>Водитель</u></td></tr>
			<xsl:apply-templates select="infrg:DriverName"/>
		</xsl:if>
 		<xsl:if test="infrg:ViolatorForm or infrg:ViolatorName or infrg:ViolatorBirthDate or infrg:ViolatorBirthPlace or infrg:ViolatorAddress">
			<tr><td colspan="2"><br/><u>Сведения о нарушителе</u></td></tr>
			<xsl:if test="infrg:ViolatorForm">
				<tr>
					<td style="width:50%">Вид нарушителя</td>
					<td class="value" style="width:50%"><xsl:value-of select="infrg:ViolatorForm"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="infrg:ViolatorName">
				<tr>
					<td style="width:50%">Ф.И.О. или наименование</td>
					<td class="value" style="width:50%"><xsl:value-of select="infrg:ViolatorName"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="infrg:ViolatorBirthDate">
				<tr>
					<td style="width:50%">Дата рождения</td>
					<td class="value" style="width:50%">
						<xsl:call-template name="russian_date">
							<xsl:with-param name="dateIn" select="infrg:ViolatorBirthDate"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="infrg:ViolatorBirthPlace">
				<tr>
					<td style="width:50%">Место рождения</td>
					<td class="value" style="width:50%"><xsl:value-of select="infrg:ViolatorBirthPlace"/></td>
				</tr>
			</xsl:if>
			<xsl:if test="infrg:ViolatorAddress">
				<tr>
					<td style="width:50%">Адрес нарушителя</td>
					<td class="value" style="width:50%"><xsl:value-of select="infrg:ViolatorAddress"/></td>
				</tr>
			</xsl:if>
		</xsl:if>
 		<xsl:if test="infrg:TSInfo">
			<tr><td colspan="2"><br/><u>Регистрационные данные ТС</u></td></tr>
			<xsl:apply-templates select="infrg:TSInfo"/>
		</xsl:if>
		<xsl:if test="infrg:PaymentRecipient">
			<tr><td colspan="2"><br/><u>Получатель платежа и его реквизиты</u></td></tr>
			<xsl:apply-templates select="infrg:PaymentRecipient"/>
		</xsl:if>
		<tr><td colspan="2"><br/></td></tr>
   </xsl:template>
   <xsl:template match="infrg:Carrier | infrg:PenaltyOrganization | infrg:PaymentRecipient">
		<xsl:if test="cat_ru:OrganizationLanguage">
			<tr>
				<td style="width:50%">Код языка для заполнения наименования </td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:OrganizationLanguage"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName or cat_ru:ShortName">
			<tr>
				<td style="width:50%">Наименование организации / ФИО физического лица</td>
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
				<td style="width:50%">Уникальный идентификатор физического лица</td>
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
		<xsl:if test="infrg:CBC">
			<tr>
				<td style="width:50%">Код бюджетной классификации (КБК) платежа</td>
				<td class="value" style="width:50%"><xsl:value-of select="infrg:CBC"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="RUScat_ru:BankInformation">
			<tr>
				<td colspan="2">
					<br/>Информация о банковских счетах
						<table>
							<tr style="font-size: 10pt; font-weight: bold">
								<td style="border: 1px solid gray" rowspan="2">Номер банковского счета</td>
								<td style="border: 1px solid gray" rowspan="2">Описание типа счета</td>
								<td style="border: 1px solid gray" colspan="6" align="center">Сведения о банке</td>
								<td style="border: 1px solid gray" colspan="2" align="2">Валютный счет организации</td>
							</tr>
							<tr style="font-size: 10pt; font-weight: bold">
								<td style="border: 1px solid gray" >Название</td>
								<td style="border: 1px solid gray" >МФО</td>
								<td style="border: 1px solid gray" >ОКПО</td>
								<td style="border: 1px solid gray" >БИК</td>
								<td style="border: 1px solid gray" >SWIFT</td>
								<td style="border: 1px solid gray" >Кор. счет</td>
								<td style="border: 1px solid gray" >Транзитный</td>
								<td style="border: 1px solid gray" >Специальный транзитный</td>
							</tr>	
							<xsl:for-each select="RUScat_ru:BankInformation">
								<xsl:apply-templates select="."/>
							</xsl:for-each>
						</table>
					<br/>
				</td>
			</tr>
		</xsl:if>
   </xsl:template>
   <!-- Шаблон для типа BankInformationType -->
   <xsl:template match="RUScat_ru:BankInformation">
	   <tr style="font-size: 10pt">
			<td style="border: 1px solid gray">
				<xsl:for-each select="cat_ru:BankAccount">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">,<br/></xsl:if>
				</xsl:for-each>
			</td>
			<td style="border: 1px solid gray"><xsl:apply-templates select="cat_ru:BankAccountDescription"/></td>
			<td style="border: 1px solid gray"><xsl:value-of select="cat_ru:BankName"/></td>
			<td style="border: 1px solid gray"><xsl:value-of select="cat_ru:BankMFO"/></td>
			<td style="border: 1px solid gray"><xsl:value-of select="cat_ru:OKPOID"/></td>
			<td style="border: 1px solid gray"><xsl:value-of select="cat_ru:BICID"/></td>
			<td style="border: 1px solid gray"><xsl:value-of select="cat_ru:SWIFTID"/></td>
			<td style="border: 1px solid gray"><xsl:value-of select="cat_ru:CorrAccount"/></td>
			<td style="border: 1px solid gray">
				<xsl:for-each select="cat_ru:TransitCurrencyAccount">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">,<br/></xsl:if>
				</xsl:for-each>
			</td>
			<td style="border: 1px solid gray">
				<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">,<br/></xsl:if>
				</xsl:for-each>
			</td>
		</tr>
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
   <xsl:template mode="fio" match="*">
		<xsl:value-of select="cat_ru:PersonSurname"/>&#160;
		<xsl:value-of select="cat_ru:PersonName"/>&#160;
		<xsl:value-of select="cat_ru:PersonMiddleName"/>
	</xsl:template>
	<xsl:template match="infrg:ResolutionEmployee">
		<xsl:apply-templates mode="fio" select="."/>
		<xsl:if test="cat_ru:PersonPost">, должность - <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
	</xsl:template>
   <xsl:template match="infrg:DriverName">
		<tr>
			<td style="width:50%">Ф.И.О.</td>
			<td class="value" style="width:50%"><xsl:apply-templates mode="fio" select="."/></td>
		</tr>
		<xsl:if test="cat_ru:PersonPost">
			<tr>
				<td style="width:50%">Должность</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:PersonPost"/></td>
			</tr>
		</xsl:if>
		<tr>
			<td style="width:50%">Дата рождения</td>
			<td class="value" style="width:50%">
				<xsl:call-template name="russian_date">
				   <xsl:with-param name="dateIn" select="infrg:DriverBirthDate"/>
				</xsl:call-template>
			</td>
		</tr>
		<xsl:if test="infrg:DriverBirthPlace">
			<tr>
				<td style="width:50%">Место рождения</td>
				<td class="value" style="width:50%"><xsl:value-of select="infrg:DriverBirthPlace"/></td>
			</tr>
		</xsl:if>
   </xsl:template>
   <xsl:template match="infrg:TSInfo">
		<xsl:if test="cat_ru:VIN">
			<tr>
				<td style="width:50%">Номер шасси</td>
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
				<td style="width:50%">Идентификатор активного ТС </td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:ActiveTransportIdentifier"/></td>
			</tr>
		</xsl:if>
		<xsl:if test="cat_ru:TransportRegNumber">
			<tr>
				<td style="width:50%">Номер свидетельства о регистрации ТС</td>
				<td class="value" style="width:50%"><xsl:value-of select="cat_ru:TransportRegNumber"/></td>
			</tr>
		</xsl:if>
   </xsl:template>
   <xsl:template match="infrg:Resolution">
		<xsl:value-of select="cat_ru:PrDocumentName"/>&#160;
		<xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			&#160;создан(о)&#160;
			<xsl:call-template name="russian_date">
			   <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
   </xsl:template>
</xsl:stylesheet>
