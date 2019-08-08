<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3" xmlns:dresrq="urn:customs.ru:Information:SQDocuments:DocReestrReq:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="dresrq:DocReestrReq">
      <html>
         <head>
            <title>Сведения из реестра разрешительных документов </title>
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
            <xsl:for-each select="dresrq:PermissionInfo">
               <div class="page">
                  <xsl:if test="position()=1">
                     <h2>Сведения из реестра разрешительных документов </h2>
                  </xsl:if>
                  <div style="margin-bottom: 20px;">
                     <span class="header">Данные по разрешению № <xsl:value-of select="position()"/>
                     </span>
                     <table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%;">
                        <tbody>
                           <tr>
                              <td>Начало диапазона номеров</td>
                              <td>
                                 <xsl:value-of select="dresrq:MinNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td>Конец диапазона номеров</td>
                              <td>
                                 <xsl:value-of select="dresrq:MaxNumber"/>
                              </td>
                           </tr>
                           <tr>
                              <td>Количество номеров в диапазоне</td>
                              <td>
                                 <xsl:value-of select="dresrq:Count"/>
                              </td>
                           </tr>
                           <tr>
                              <td>Страна</td>
                              <td>
                                 <xsl:value-of select="dresrq:Country"/>
                              </td>
                           </tr>
                           <xsl:if test="dresrq:RestrictCondition">
                              <tr>
                                 <td>Ограничения, особые условия по экологическим нормам </td>
                                 <td>
                                    <xsl:value-of select="dresrq:RestrictCondition"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="dresrq:ShipmentKind">
                              <tr>
                                 <td>Вид перевозки</td>
                                 <td>
                                    <xsl:choose>
                                       <xsl:when test="dresrq:ShipmentKind='1'">двусторонние перевозки  (если вид разрешения "многосторонние перевозки грузов")</xsl:when>
                                       <xsl:when test="dresrq:ShipmentKind='2'">транзитный проезд (если вид разрешения "многосторонние перевозки грузов")</xsl:when>
                                       <xsl:when test="dresrq:ShipmentKind='3'">перевозки в/из третьих стран (если вид разрешения "многосторонние перевозки грузов")</xsl:when>
                                    </xsl:choose>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="dresrq:CountryRestriction">
                              <tr>
                                 <td>Ограничения, особые условия по странам, перевозка в/из которых не разрешена </td>
                                 <td>
                                    <xsl:value-of select="dresrq:CountryRestriction"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="dresrq:TransitTransportation='true' or dresrq:TransitTransportation='t' or dresrq:TransitTransportation='1'">
                              <tr>
                                 <td colspan="2">Только транзитный проезд</td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="dresrq:IsTransit='true' or dresrq:IsTransit='t' or dresrq:IsTransit='1'">
                              <tr>
                                 <td colspan="2">Транзит</td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="dresrq:TSRoute">
                              <tr>
                                 <td>Маршрут Транспортного средства </td>
                                 <td>
                                    <xsl:value-of select="dresrq:TSRoute"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:for-each select="dresrq:PermitDocument">
                              <tr>
                                 <td>Вид разрешительного документа</td>
                                 <td>
                                    <xsl:value-of select="dresrq:TransitPermitKind"/>
                                 </td>
                              </tr>
                              <xsl:if test="dresrq:PermitNumber ">
                                 <tr>
                                    <td>Номер разрешения</td>
                                    <td>
                                       <xsl:value-of select="dresrq:PermitNumber"/>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td>Дата/время выдачи</td>
                                 <td>
                                    <xsl:call-template name="date_time">
                                       <xsl:with-param name="dateTimeIn" select="dresrq:IssueDateTime"/>
                                    </xsl:call-template>
                                 </td>
                              </tr>
                              <tr>
                                 <td>Дата окончания действия</td>
                                 <td>
                                    <xsl:call-template name="date_time">
                                       <xsl:with-param name="dateTimeIn" select="dresrq:Duration"/>
                                    </xsl:call-template>
                                 </td>
                              </tr>
                              <xsl:if test="dresrq:StopCancelDate">
                                 <tr>
                                    <td>Дата приостановления, аннулирования</td>
                                    <td>
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="dresrq:StopCancelDate"/>
                                       </xsl:call-template>
                                    </td>
                                 </tr>
                              </xsl:if>
                              <tr>
                                 <td>Статус</td>
                                 <td>
                                    <xsl:choose>
                                       <xsl:when test="dresrq:Status='1'">ACTIVE (Действует)</xsl:when>
                                       <xsl:when test="dresrq:Status='2'">EXPIRED (Истек срок действия)</xsl:when>
                                       <xsl:when test="dresrq:Status='3'">SUSPENDED (Приостановлено)</xsl:when>
                                       <xsl:when test="dresrq:Status='4'">CANCELED (Аннулировано)</xsl:when>
                                    </xsl:choose>
                                 </td>
                              </tr>
                              <xsl:if test="dresrq:PermUseAnalysis">
                                  <tr>
                                    <td>Результаты анализа использования разрешения</td>
                                    <td><xsl:value-of select="dresrq:PermUseAnalysis"/></td>
                                 </tr>
                             </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="dresrq:APP">
                              <tr>
                                 <td>АПП, через которые проходит маршрут ТС</td>
                                 <td>
                                    <xsl:value-of select="dresrq:APP/cat_ru:Code"/> <xsl:value-of select="dresrq:APP/cat_ru:OfficeName"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:for-each select="dresrq:Carrier">
                              <tr>
                                 <td>Перевозчик</td>
                                 <td>
                                    <xsl:if test="dresrq:IsForeign">
                                       <xsl:choose>
                                          <xsl:when test="dresrq:IsForeign='1'">
                                             <u>Иностранный перевозчик</u>
                                             <br/>
                                          </xsl:when>
                                          <xsl:when test="dresrq:IsForeign='0'">
                                             <u>Российский перевозчик</u>
                                             <br/>
                                          </xsl:when>
                                       </xsl:choose>
                                    </xsl:if>
                                    <xsl:apply-templates select="."/>
                                 </td>
                              </tr>
                           </xsl:for-each>
                           <tr>
                              <td>Примечание</td>
                              <td>
                                 <xsl:value-of select="dresrq:Information"/>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </div>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="dresrq:Carrier">
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
			Кодовое обозначение страны: <xsl:value-of select="RUScat_ru:CountryA2Code"/><br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode or RUScat_ru:BusinessEntityTypeName">
			Организационно-правовая форма, в которой зарегистрирован хозяйствующий субъект: 
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
			<xsl:if test="RUScat_ru:BusinessEntityTypeName">
				<xsl:text> </xsl:text>
				<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
			</xsl:if>
			<br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			Таможенный номер, присвоенный юридическому или физическому лицу: <xsl:apply-templates select="RUScat_ru:UITN"/><br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			Уникальный идентификатор физического лица: <xsl:value-of select="RUScat_ru:PersonId"/><br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			Сведения о документе, удостоверяющем личность физического лица: <xsl:apply-templates select="RUScat_ru:IdentityCard"/><br/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			Адрес: <br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/><br/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			Контакты: <xsl:apply-templates select="RUScat_ru:CommunicationDetails"/>
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
	<xsl:template match="cat_ru:KGOrganizationFeatures| RUScat_ru:KGOrganizationFeatures">
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
	<xsl:template match="cat_ru:RAOrganizationFeatures| RUScat_ru:RAOrganizationFeatures">
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
	<xsl:template match="cat_ru:RBOrganizationFeatures| RUScat_ru:RBOrganizationFeatures">
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
	<xsl:template match="cat_ru:RFOrganizationFeatures| RUScat_ru:RFOrganizationFeatures">
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
	<xsl:template match="cat_ru:RKOrganizationFeatures | RUScat_ru:RKOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>: </xsl:text>
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
			<xsl:value-of select="cat_ru:OrganizationName"/>
			<xsl:if test="RUScat_ru:IssuerCode"> код подразделения: <xsl:value-of select="RUScat_ru:IssuerCode"/></xsl:if>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName"><xsl:value-of select="RUScat_ru:FullIdentityCardName"/></xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId"> выдан <xsl:value-of select="RUScat_ru:AuthorityId"/></xsl:if>
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
</xsl:stylesheet>
