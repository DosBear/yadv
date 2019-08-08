<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:schr="urn:customs.ru:Information:ExchangeDocuments:GoodSearchResponse:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="schr:GoodSearchResponse">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Ответ на запрос о розыске недоставленных товаров</title>
            <style type="text/css">
				body {background-color: #cccccc;}

				div.page {
					width: 210mm;
					margin: 6pt auto;
					padding: 10mm;
					background: white;
					border: solid 1px black;
				}

				/*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
				@media print {div.page {border: none; margin: 0; padding: 0;}}

				h1 {
					text-align: center;
					font-size: 16pt;
					margin-bottom: 10pt;
					counter-reset: numbered;
				}

				h2.numbered:after {
					content: " № " counter(numbered);
					counter-increment: numbered;
				}

				h2 {
					font-size: 14pt;
					text-align: center;
					margin-top: 20pt;
				}


				p {padding-left: 10pt;}
				
				.low 
				{
					font-size: 13;
				}
				
				.auxiliary tbody tr td { border: 0; }
			</style>
         </head>
         <body>
            <div class="page">
               <h1>Ответ на запрос о розыске недоставленных товаров</h1>
               <xsl:apply-templates select="schr:GoodsRegistrationDate"/>
               <table border="1" style="border: 0">
                  <xsl:if test="schr:ConsignmentNumber">
                     <tr>
                        <td style="border: 0; vertical-align:bottom" width="35%">Номер товарно-транспортной накладной: </td>
                        <td style="border-right:0; border-left:0; border-top:0; padding-top: 10px; padding-left: 30px; vertical-align:bottom">
                           <xsl:value-of select="schr:ConsignmentNumber"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td style="border: 0; vertical-align:bottom">Дата отправления</td>
                     <td style="border-right:0; border-left:0; border-top:0; padding-top: 10px; padding-left: 30px; vertical-align:bottom">
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="schr:DepartureDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <tr>
                     <td style="border: 0; vertical-align:bottom">Место отправления</td>
                     <td style="border-right:0; border-left:0; border-top:0; padding-top: 10px; padding-left: 30px; vertical-align:bottom">
                        <xsl:apply-templates select="schr:DeparturePlace"/>
                     </td>
                  </tr>
                  <tr>
                     <td style="border: 0; vertical-align:bottom">Место назначения</td>
                     <td style="border-right:0; border-left:0; border-top:0; padding-top: 10px; padding-left: 30px; vertical-align:bottom">
                        <xsl:apply-templates select="schr:DestinationPlace"/>
                     </td>
                  </tr>
                  <tr>
                     <td style="border: 0; vertical-align:bottom">Получатель груза</td>
                     <td style="border-right:0; border-left:0; border-top:0; padding-top: 10px; padding-left: 30px; vertical-align:bottom">
                        <xsl:apply-templates select="schr:Consignee"/>
                     </td>
                  </tr>
               </table>
               <xsl:if test="schr:Transport">
                  <br/>
                  <br/>
					Сведения о транспортном средстве:
					<table border="0">
                     <xsl:for-each select="schr:Transport">
                        <tr>
                           <td style="vertical-align:top; font-weight:bold">
                              <xsl:value-of select="position()"/>. 
								</td>
                           <td>
                              <xsl:apply-templates select="."/>
                           </td>
                        </tr>
                     </xsl:for-each>
                  </table>
               </xsl:if>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="schr:GoodsRegistrationDate">
      <div align="right">
         <table border="1" style="margin-top:10px; width:60mm; border: 0">
            <tbody>
               <tr>
                  <td align="center" style="border-right:0; border-left:0; border-top:0">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="."/>
                     </xsl:call-template>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="low" style="border:0;">(Дата оформления товарной партии в таможне)</td>
               </tr>
            </tbody>
         </table>
      </div>
   </xsl:template>
   <xsl:template match="schr:DeparturePlace | schr:DestinationPlace | schr:FactStation">
	код станции: <xsl:value-of select="schr:StationCode"/>
      <xsl:if test="schr:StationName">(<xsl:value-of select="schr:StationName"/>)</xsl:if>;
	<xsl:if test="schr:RailwayCode">
		код ж/д <xsl:value-of select="schr:RailwayCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="schr:Consignee">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName"> (</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>. 
	
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
			<span>Адрес: </span>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()">; </xsl:if>
				<xsl:if test="position()=last()">.<br/></xsl:if>
			</xsl:for-each>
		</xsl:if>

      <xsl:if test="RUScat_ru:IdentityCard">
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>. 
	</xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
      </xsl:if>. 
</xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>; 
	</xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
      </xsl:for-each>. 
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
   <xsl:template match="RUScat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <xsl:if test="RUScat_ru:IdentityCardName">
         <xsl:value-of select="RUScat_ru:IdentityCardName"/>; </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа - <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName or RUScat_ru:IdentityCardCode">; </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries or RUScat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="RUScat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="RUScat_ru:IdentityCardNumber"/>
         </span>; 
	</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="RUScat_ru:OrganizationName"/>
      </xsl:if>. 
</xsl:template>
   <xsl:template match="schr:Transport">
      <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>; </xsl:if>
      <xsl:if test="cat_ru:TransportKindCode">код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>; </xsl:if>
      <xsl:if test="cat_ru:TransportMarkCode">код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>; </xsl:if>
      <xsl:if test="cat_ru:TransportIdentifier">идент. ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>; </xsl:if>
      <xsl:if test="cat_ru:TransportMeansNationalityCode">
		код страны принадл. ТС 
		<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>; 
	</xsl:if>
      <xsl:if test="cat_ru:ActiveTransportIdentifier">
		идент. активного ТС  
		<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>; 
	</xsl:if>
      <xsl:if test="cat_ru:TransportRegNumber">
		№ свид. о рег. ТС 
		<xsl:value-of select="cat_ru:TransportRegNumber"/>; 
	</xsl:if>
      <xsl:for-each select="schr:ArrivalDate">
         <br/>
		Дата прибытия: 
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="."/>
         </xsl:call-template>
      </xsl:for-each>
      <xsl:if test="schr:GoodsInfo">
         <br/>Описание товаров<br/>
      </xsl:if>
      <table border="0">
         <xsl:for-each select="schr:GoodsInfo">
            <tr>
               <td style="vertical-align:top;">
                  <xsl:value-of select="position()"/>. 
				</td>
               <td>	
					Код ТН ВЭД ЕАЭС <xsl:value-of select="schr:GoodsTNVEDCode"/>;
					<xsl:if test="schr:Container">
						контейнеры: 
						<xsl:for-each select="schr:Container">
                        <xsl:if test="position()>1">, </xsl:if>
                        <xsl:value-of select="."/>
                     </xsl:for-each>; 
					</xsl:if>
                  <xsl:if test="schr:ETSNG">
						код ЕТСНГ: 
						<xsl:value-of select="schr:ETSNG"/>; 
					</xsl:if>
                  <xsl:for-each select="schr:IssuanceDate">
						дата выдачи груза: 
						<xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="."/>
                     </xsl:call-template>; 
					</xsl:for-each>
                  <xsl:if test="schr:FactStation">
						cтанция фактического прибытия: 
						<xsl:apply-templates select="schr:FactStation"/>
                  </xsl:if>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>
</xsl:stylesheet>
