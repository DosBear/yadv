<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:ntcrbk="urn:customs.ru:Information:SQDocuments:NoticeRuByKz:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="ntcrbk:NoticeRuByKz">
      <html>
         <head>
            <title>
				Сведения из документа 
				<xsl:choose>
                  <xsl:when test="ntcrbk:Notification/ntcrbk:BelarusControlID">Уведомление Республики Беларусь</xsl:when>
                  <xsl:when test="ntcrbk:Notification/ntcrbk:KazakhControlID">Уведомление Республики Казахстан</xsl:when>
                  <xsl:when test="ntcrbk:Notification/ntcrbk:DocumentalControlID">Уведомление Российской Федерации</xsl:when>
                  <xsl:when test="ntcrbk:Notification/ntcrbk:KirghizControlID">Уведомление Республики Кыргызстан</xsl:when>
                  <xsl:when test="ntcrbk:Notification/ntcrbk:ArmeniaControlID">Уведомление Республики Армения</xsl:when>
               </xsl:choose>
            </title>
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
				
				.common {
					font: 13;
					/*font-weight: bold;*/
					font-family: Arial, serif;
				}
				
				/*.info tbody tr td {
					border: 0;
				}*/
				
			</style>
         </head>
         <body>
            <div class="page">
               <h2>
				Сведения из документа 
				<xsl:choose>
                     <xsl:when test="ntcrbk:Notification/ntcrbk:BelarusControlID">Уведомление Республики Беларусь</xsl:when>
                     <xsl:when test="ntcrbk:Notification/ntcrbk:KazakhControlID">Уведомление Республики Казахстан</xsl:when>
                     <xsl:when test="ntcrbk:Notification/ntcrbk:DocumentalControlID">Уведомление Российской Федерации</xsl:when>
					 <xsl:when test="ntcrbk:Notification/ntcrbk:KirghizControlID">Уведомление Республики Кыргызстан</xsl:when>
					 <xsl:when test="ntcrbk:Notification/ntcrbk:ArmeniaControlID">Уведомление Республики Армения</xsl:when>
                 </xsl:choose>
               </h2>
               <xsl:apply-templates select="ntcrbk:Notification"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ntcrbk:Notification">
      <div align="right">
         <table border="0" style="margin-top:50px; width:60mm">
            <tbody>
               <tr>
                  <td align="center" style="border-right:0; border-left:0; border-top:0">
                     <xsl:call-template name="date_time">
                        <xsl:with-param name="dateTimeIn" select="ntcrbk:InspectionDate"/>
                     </xsl:call-template>
                  </td>
               </tr>
               <tr>
                  <td align="center" style="border:0;">Дата, время проведения контроля</td>
               </tr>
            </tbody>
         </table>
      </div>
      <table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%;">
         <tbody>
            <tr>
               <td width="35%">
                  <xsl:choose>
                     <xsl:when test="ntcrbk:BelarusControlID">Идентификатор листа контроля Республики Беларусь</xsl:when>
                     <xsl:when test="ntcrbk:KazakhControlID">Идентификатор листа контроля Республики Казахстан</xsl:when>
                     <xsl:when test="ntcrbk:DocumentalControlID">Идентификатор листа контроля Российской Федерации</xsl:when>
					 <xsl:when test="ntcrbk:Notification/ntcrbk:KirghizControlID">Уведомление Республики Кыргызстан</xsl:when>
					 <xsl:when test="ntcrbk:Notification/ntcrbk:ArmeniaControlID">Уведомление Республики Армения</xsl:when>
                  </xsl:choose>
               </td>
               <td>
                  <xsl:choose>
                     <xsl:when test="ntcrbk:BelarusControlID"><xsl:value-of select="ntcrbk:BelarusControlID"/></xsl:when>
                     <xsl:when test="ntcrbk:KazakhControlID"><xsl:value-of select="ntcrbk:KazakhControlID"/></xsl:when>
                     <xsl:when test="ntcrbk:DocumentalControlID"><xsl:value-of select="ntcrbk:DocumentalControlID"/></xsl:when>
					 <xsl:when test="ntcrbk:Notification/ntcrbk:KirghizControlID"><xsl:value-of select="ntcrbk:KirghizControlID"/></xsl:when>
					 <xsl:when test="ntcrbk:Notification/ntcrbk:ArmeniaControlID"><xsl:value-of select="ntcrbk:ArmeniaControlID"/></xsl:when>
                  </xsl:choose>
               </td>
            </tr>
            <tr>
               <td>Уведомление</td>
               <td>
                  <xsl:apply-templates select="ntcrbk:NotificationInfo"/>
               </td>
            </tr>
            <tr>
               <td>Водитель</td>
               <td>
                  <xsl:apply-templates select="ntcrbk:Driver"/>
               </td>
            </tr>
            <tr>
               <td>Инспектор, выдавший уведомление</td>
               <td>
                  <xsl:apply-templates select="ntcrbk:NotificationEmployee"/>
               </td>
            </tr>
            <tr>
               <td>Организация, проводившая контроль</td>
               <td>
                  <xsl:apply-templates select="ntcrbk:NotificationOrg"/>
               </td>
            </tr>
            <tr>
               <td>Контрольный пункт для представления недостающих документов</td>
               <td>
                  <xsl:apply-templates select="ntcrbk:DestOrg"/>
               </td>
            </tr>
            <tr>
               <td>Сведения о транспортном средстве</td>
               <td>
                  <xsl:apply-templates select="ntcrbk:TSInfo"/>
               </td>
            </tr>
            <tr>
               <td>Перевозчик</td>
               <td>
                  <xsl:apply-templates select="ntcrbk:Carrier"/>
               </td>
            </tr>
            <tr>
               <td>Выявленное нарушение</td>
               <td>
				   <xsl:for-each select="ntcrbk:Violation">
					  <xsl:apply-templates select="."/><br/>
					</xsl:for-each>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="ntcrbk:NotificationInfo">
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
      <br/>
      <xsl:if test="ntcrbk:CreateTime">
		Время создания уведомления  
		<xsl:value-of select="substring(ntcrbk:CreateTime, 1, 10)"/>
         <br/>
      </xsl:if>
      <xsl:if test="ntcrbk:ModificationDate">
		Дата обновления   
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="ntcrbk:ModificationDate"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <span>
		Идент. уведомления в реестре уведомлений 
		<xsl:value-of select="ntcrbk:IDreestr"/>
         <br/>
      </span>
      <xsl:if test="ntcrbk:ID">
         <span>
			Идент. уведомления в реестре уведомлений 
			<xsl:value-of select="ntcrbk:ID"/>
            <br/>
         </span>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="ntcrbk:Driver | ntcrbk:NotificationEmployee">
      <xsl:value-of select="cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonMiddleName"/>
      <xsl:if test="cat_ru:PersonPost">, <xsl:value-of select="cat_ru:PersonPost"/></xsl:if>
      <xsl:if test="ntcrbk:ID">, ID: <xsl:value-of select="ntcrbk:ID"/></xsl:if>
      <br/>
      <br/>
   </xsl:template>
   <xsl:template match="ntcrbk:TSInfo">
      <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportMeansNationalityCode">
		Код страны принадлежности ТС 
		<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:ActiveTransportIdentifier">
		Идентификатор активного ТС  
		<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
      </xsl:if>
      <br/>
      <xsl:if test="cat_ru:TransportRegNumber">
		Номер свидетельства о регистрации ТС 
		<xsl:value-of select="cat_ru:TransportRegNumber"/>
      </xsl:if>
      <br/>
      <br/>
   </xsl:template>
   <xsl:template match="ntcrbk:Carrier">
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
      <xsl:if test="cat_ru:RFOrganizationFeatures or cat_ru:RKOrganizationFeatures or cat_ru:RBOrganizationFeatures or cat_ru:RAOrganizationFeatures or cat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			<br/>
		</xsl:if>	
		<xsl:if test="RUScat_ru:CountryA2Code">
			Код страны: <xsl:value-of select="RUScat_ru:CountryA2Code"/>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			Организационно-правовая форма: 
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<xsl:text> </xsl:text>
				<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			Таможенный номер, присвоенный юр. или физ. лицу: <xsl:apply-templates select="RUScat_ru:UITN"/>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			ИД физ. лица: <xsl:value-of select="RUScat_ru:PersonId"/>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			Сведения о документе, удостоверяющем личность физ. лица: <br/>
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			Адрес: <br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/><br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			Контактные данные: <xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
			<br/>
		</xsl:if>
		<xsl:if test="ntcrbk:ID">
			ID: <xsl:value-of select="ntcrbk:ID"/>
			<br/>
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
		<xsl:if test="cat_ru:IdentityCardCode or cat_ru:IdentityCardName or RUScat_ru:FullIdentityCardName">
			<xsl:if test="cat_ru:IdentityCardCode or RUScat_ru:FullIdentityCardName">
				(<xsl:value-of select="cat_ru:IdentityCardCode"/>
				<xsl:if test="RUScat_ru:FullIdentityCardName">&#160;<xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>)
			</xsl:if>
			<xsl:text> </xsl:text>	
			<xsl:value-of select="cat_ru:IdentityCardName"/>
			<xsl:text> </xsl:text>
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
		<xsl:if test="RUScat_ru:AuthorityId">&#160;ID органа гос.власти: <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">&#160;код страны: <xsl:value-of select="RUScat_ru:CountryCode"/></xsl:if>
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
			<xsl:text>номер а/я: </xsl:text>
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
   <xsl:template match="ntcrbk:Violation">
      <span>
         <xsl:value-of select="ntcrbk:NodeNumber"/>. <xsl:value-of select="ntcrbk:ViolationName"/>
      </span>
      <br/>
      <span>
		Статус 
		<xsl:choose>
            <xsl:when test="ntcrbk:Status=1">Устранено</xsl:when>
            <xsl:when test="ntcrbk:Status=2">Не устранено</xsl:when>
            <xsl:when test="ntcrbk:Status=3">Устранение не требуется</xsl:when>
         </xsl:choose>
         <br/>
         <br/>
      </span>
   </xsl:template>
   <xsl:template match="ntcrbk:DestOrg | ntcrbk:NotificationOrg">
      <span>
		Код контрольного пункта
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="ntcrbk:OrgName"/>
         <br/>
      </span>
      <span>
		Код страны
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="ntcrbk:CountryCode"/>
         <br/>
      </span>
      <span>
		Наименование контрольного пункта
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="ntcrbk:OrgDescription"/>
      </span>
      <br/>
      <span>
		Код региона
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="ntcrbk:RegionCode"/>
      </span>
      <br/>
      <xsl:if test="ntcrbk:ID">
         <span>
			Идентификатор
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="ntcrbk:ID"/>
         </span>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
