<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:tpo="urn:customs.ru:Information:CustomsDocuments:TPO:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="tpo:TPO">
      <html>
         <head>
            <title>Таможенный приходный ордер (ТПО)</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
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
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 0pt #000000;
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
            <xsl:for-each select="tpo:Goods[1]">
               <div class="page">
                  <table>
                     <tr>
                        <td class="graph" colspan="5" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #000000;">Таможенный приходный ордер</td>
                        <td class="graph" colspan="3" rowspan="2" style="border:solid 1pt #000000">1. Тип ордера<br/>
                           <xsl:value-of select="../tpo:TPOTypeCode/tpo:MovementPurpose"/>/<xsl:value-of select="../tpo:TPOTypeCode/tpo:MovementWay"/>/<xsl:value-of select="../tpo:TPOTypeCode/tpo:TransportKindCode"/>
                        </td>
                        <td class="graph" colspan="2" rowspan="2" style="border:solid 1pt #000000">2. Доб.лист<br/>
                           <!--<xsl:if test="//tpo:AdditionalSheetNumber"><xsl:value-of select="//tpo:AdditionalSheetNumber"/></xsl:if>-->
                           <xsl:choose>
                              <xsl:when test="../tpo:AdditionalSheetNumber">
                                 <xsl:value-of select="../tpo:AdditionalSheetNumber"/>
                              </xsl:when>
                              <xsl:otherwise>-</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="5" style="border:solid 1pt #000000">3. Справочный номер<br/>
                           <xsl:value-of select="../tpo:TPORegNumber/tpo:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="../tpo:TPORegNumber/tpo:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="../tpo:TPORegNumber/tpo:DocNumber"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">4. Плательщик<br/>
                           <xsl:apply-templates select="../tpo:Payer"/>
                        </td>
                        <td class="graph" colspan="5" style="border:solid 1pt #000000">5. Валюта платежа<br/>
                           <xsl:value-of select="../tpo:PaymentCurrency/tpo:CurrencyCode"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #000000;"> </td>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000">ИНН<br/>
                           <xsl:if test="../tpo:Payer/cat_ru:RFOrganizationFeatures/cat_ru:INN">
                              <xsl:value-of select="../tpo:Payer/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </xsl:if>
                           <!--xsl:if test="//tpo:Payer/cat_ru:RKOrganizationFeatures/cat_ru:IIN">
                              <xsl:value-of select="//tpo:Payer/cat_ru:RFOrganizationFeatures/cat_ru:IIN"/>
                           </xsl:if-->
                        </td>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000">5.1. Курс доллара США<br/>
                           <xsl:value-of select="../tpo:PaymentCurrency/tpo:CurrencyDollarRate"/>
                        </td>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000">5.2. Курс евро<br/>
                           <xsl:value-of select="../tpo:PaymentCurrency/tpo:CurrencyEuroRate"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6. Представляемые сведения/Дополнительная информация<br/>
                           <xsl:for-each select="../tpo:PresentedDocument">
                           <xsl:if test="tpo:PresentedDocumentModeCode"><xsl:value-of select="tpo:PresentedDocumentModeCode"/>:</xsl:if>
                              <xsl:if test="cat_ru:PrDocumentName">
                                 <xsl:value-of select="cat_ru:PrDocumentName"/> </xsl:if>
                              <xsl:if test="cat_ru:PrDocumentNumber">№<xsl:value-of select="cat_ru:PrDocumentNumber"/> </xsl:if>
                              <xsl:if test="cat_ru:PrDocumentDate">
						(<xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
                                 </xsl:call-template>)
						</xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </xsl:for-each>
                        </td>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000">6.1. Общий вес (кг)<br/>
                           <xsl:value-of select="../tpo:TotalWeight"/>
                        </td>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000">6.2. Общая стоимость в валюте платежа<br/>
                           <xsl:value-of select="../tpo:TotalCost"/>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="2" style="border:solid 1pt #000000">6.3. Общая стоимость в долларах США<br/>
                           <xsl:value-of select="../tpo:DollarTotalCost"/>
                        </td>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000">6.4. Общая стоимость в евро<br/>
                           <xsl:value-of select="../tpo:EuroTotalCost"/>
                        </td>
                     </tr>
                     <xsl:apply-templates select="."/>
                     <tr>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000">9. Подпись сотрудника таможни<br/>
                           <xsl:value-of select="../tpo:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:if test="../tpo:CustomsPerson/cat_ru:LNP"> (<xsl:value-of select="//tpo:CustomsPerson/cat_ru:LNP"/>)</xsl:if>
                        </td>
                        <td class="graph" colspan="4" style="border:solid 1pt #000000">10. Подпись лица, принявшего платеж<br/>
                           <xsl:if test="../tpo:ReceiverPerson">
                              <xsl:value-of select="../tpo:ReceiverPerson/cat_ru:PersonSurname"/> 
						<xsl:value-of select="../tpo:ReceiverPerson/cat_ru:PersonName"/> 
						</xsl:if>
                           <xsl:if test="../tpo:ReceiverPerson/cat_ru:PersonMiddleName">
                              <xsl:value-of select="../tpo:ReceiverPerson/cat_ru:PersonMiddleName"/>
                           </xsl:if>
                           <xsl:if test="../tpo:ReceiverPerson/cat_ru:PersonPost">, <xsl:value-of select="../tpo:ReceiverPerson/cat_ru:PersonPost"/>
                           </xsl:if>
                        </td>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000">11. Подпись плательщика<br/>
                           <xsl:if test="../tpo:Payer/cat_ru:OrganizationName">
                              <xsl:value-of select="../tpo:Payer/cat_ru:OrganizationName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="border:solid 1pt #000000">1</td>
                        <td align="center" class="graph" colspan="4" style="border:solid 1pt #000000">Экземпляр для таможни</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000">1</td>
                        <td colspan="4" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;"> </td>
                     </tr>
                  </table>
               </div>
            </xsl:for-each>
            <xsl:for-each select="tpo:Goods[position()!=1and (position()) mod 3 = 2]">
               <!--[(position()) mod 3 = 2 and (position()) mod 3 = 0 and (position()) mod 3 = 1 and ]-->
               <div class="page">
                  <table>
                     <tr>
                        <td class="graph" colspan="5" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #000000;">Добавочный лист таможенного приходного ордера</td>
                        <td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">2. Доб.лист<br/>
                           <!--<xsl:if test="//tpo:AdditionalSheetNumber"><xsl:value-of select="//tpo:AdditionalSheetNumber"/></xsl:if>-->
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" colspan="5" style="border:solid 1pt #000000">3. Справочный номер<br/>
                           <xsl:value-of select="../tpo:TPORegNumber/tpo:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                              <xsl:with-param name="dateIn" select="../tpo:TPORegNumber/tpo:RegistrationDate"/>
                           </xsl:call-template>/<xsl:value-of select="../tpo:TPORegNumber/tpo:DocNumber"/>
                        </td>
                     </tr>
                     <xsl:apply-templates select="."/>
                     <xsl:apply-templates select="following-sibling::tpo:Goods[1]"/>
                     <xsl:apply-templates select="following-sibling::tpo:Goods[2]"/>
                     <tr>
                        <td class="graph" colspan="3" style="border:solid 1pt #000000">9. Подпись сотрудника таможни<br/>
                           <xsl:value-of select="../tpo:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:if test="../tpo:CustomsPerson/cat_ru:LNP"> (<xsl:value-of select="../tpo:CustomsPerson/cat_ru:LNP"/>)</xsl:if>
                        </td>
                        <td class="graph" colspan="7" style="border:solid 1pt #000000">11. Подпись плательщика<br/>
                           <xsl:if test="../tpo:Payer/cat_ru:OrganizationName">
                              <xsl:value-of select="../tpo:Payer/cat_ru:OrganizationName"/>
                           </xsl:if>
                        </td>
                     </tr>
                     <tr>
                        <td align="center" class="graph" style="border:solid 1pt #000000">1</td>
                        <td align="center" class="graph" colspan="4" style="border:solid 1pt #000000">Экземпляр для таможни</td>
                        <td align="center" class="graph" style="border:solid 1pt #000000">1</td>
                        <td colspan="4" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:0px solid #ffffff; border-bottom:0px solid #ffffff;"> </td>
                     </tr>
                  </table>
               </div>
            </xsl:for-each>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="tpo:Payer">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
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
			  <span class="header">Адрес:</span>
			  <br/>
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:apply-templates select="."/>
				<xsl:if test="position()!=last()"><br/></xsl:if>
			</xsl:for-each>
		</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
         <br/><xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
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
   <xsl:template match="RUScat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="RUScat_ru:IdentityCardName">
         <xsl:value-of select="RUScat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="RUScat_ru:IdentityCardCode"/>)</xsl:if>
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
   <xsl:template match="tpo:Goods[1]">
      <tr>
         <td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">6.5. Описание товара<br/>
            <xsl:for-each select="tpo:GoodsDescription">
               <xsl:value-of select="."/>
               <xsl:if test="position()!=last()"> </xsl:if>
            </xsl:for-each>
            <xsl:if test="tpo:OriginCountryCode">(код страны происхождения:<xsl:value-of select="tpo:OriginCountryCode"/>)</xsl:if>
            <!--(<xsl:value-of select="tpo:GoodsTNVEDCode"/>)-->
            <br/>
            <xsl:if test="tpo:AutomobileInfo">Данные об автомобиле:<br/></xsl:if>
            <xsl:for-each select="tpo:AutomobileInfo">
            <xsl:value-of select="position()"/>.
            <xsl:if test="tpo:Model">Модель:<xsl:value-of select="tpo:Model"/>
               ;
            </xsl:if>
            <xsl:if test="tpo:Mark">Марка:<xsl:value-of select="tpo:Mark"/>;
            </xsl:if>
            <xsl:if test="tpo:MarkCode">Код марки:<xsl:value-of select="tpo:MarkCode"/>
               ;
            </xsl:if>
            <xsl:if test="tpo:OfftakeYear">Год выпуска:<xsl:value-of select="tpo:OfftakeYear"/>
               ;
            </xsl:if>
            <xsl:if test="tpo:EngineVolumeQuanity">Объем двигателя, куб. см:<xsl:value-of select="tpo:EngineVolumeQuanity"/>
               ;
            </xsl:if>
            <xsl:if test="tpo:VINID">Идентификационный номер:<xsl:value-of select="tpo:VINID"/>
               ;
            </xsl:if>
            <xsl:if test="tpo:EnginePower">Мощность двигателя в лошадиных силах:<xsl:value-of select="tpo:EnginePower"/>
               ;
            </xsl:if>
            <xsl:if test="tpo:EnginePowerKVt">Мощность двигателя в КВт:<xsl:value-of select="tpo:EnginePowerKVt"/>
               ;
            </xsl:if>
            </xsl:for-each>
         </td>
         <td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>
            <xsl:value-of select="tpo:GoodsTNVEDCode"/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </td>
         <td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>
            <xsl:value-of select="tpo:GoodsWeight"/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph" colspan="2" style="border:solid 1pt #000000">6.8. Количество<br/>
            <xsl:if test="tpo:SupplementaryQuantity">
               <xsl:value-of select="cat_ru:GoodsQuantity"/> </xsl:if>
            <xsl:if test="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
               <xsl:value-of select="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
            <xsl:if test="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
               <xsl:value-of select="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/> </xsl:if>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
         <td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
            <xsl:if test="tpo:AdditionalInformation">
               <xsl:value-of select="tpo:AdditionalInformation"/>
            </xsl:if>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph" colspan="5" rowspan="2" style="border:solid 1pt #000000">7. Наименование взимаемых платежей<br/>
            <xsl:for-each select="tpo:PaymentInfo/tpo:PaymentModeCode[not(.=preceding::tpo:PaymentModeCode)]">
               <xsl:value-of select="."/> 
						<xsl:value-of select="../tpo:PaymentName"/>
               <br/>
            </xsl:for-each>
         </td>
         <td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
						7.1. Стоимость товаров
						</td>
      </tr>
      <tr>
         <td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в валюте платежа<br/>
            <xsl:value-of select="tpo:Cost"/>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
         <td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
            <xsl:value-of select="tpo:DollarCost"/>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
         <td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
            <xsl:value-of select="tpo:EuroCost"/>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph" rowspan="3" style="border:solid 1pt #000000">8. Платежи</td>
         <td class="graph" colspan="9" style="border:solid 1pt #000000">
            <table border="0pt #ffffff">
               <tr>
                  <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Вид</td>
                  <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Основа начисления</td>
                  <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Ставка</td>
                  <td align="center" class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Исчисленная сумма</td>
                  <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">СП</td>
                  <td align="center" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">Подробности уплаты</td>
               </tr>
               <xsl:for-each select="tpo:PaymentInfo">
               <xsl:choose>
                  <!--<xsl:when test="position()!=last()">-->
                     <!--<xsl:for-each select="tpo:PaymentInfo">-->
                     <xsl:when test="position()!=last()">
                        <tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
                           <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
                              <xsl:value-of select="tpo:PaymentModeCode"/>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="tpo:TaxBase"/><xsl:if test="tpo:TaxBaseQualifierCode">(<xsl:value-of select="tpo:TaxBaseQualifierCode"/>)</xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                              <xsl:value-of select="tpo:Rate"/><xsl:if test="tpo:RateQualifierCode">(<xsl:value-of select="tpo:RateQualifierCode"/>)</xsl:if>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
                              <xsl:value-of select="tpo:Amount"/>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000">
                                                          
                              <xsl:for-each select="tpo:PaymentDetails">
                         <!-- <xsl:if test="tpo:PaymentMethodCode">-->
                              <xsl:value-of select="tpo:PaymentMethodCode"/>
                              
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                             <!-- </xsl:if>-->
                              </xsl:for-each>
                              
                              
                           </td>
                           <td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:1px solid #0000000;">
                              <xsl:for-each select="tpo:PaymentDetails">
                                 <xsl:value-of select="tpo:FactPaidAmount"/><!--<xsl:if test="tpo:PaymentMethodCode">(<xsl:value-of select="tpo:PaymentMethodCode"/>)</xsl:if>-->
                                <xsl:text> </xsl:text>
                                 <xsl:if test="tpo:PaymentDocument/tpo:PresentedDocumentModeCode"><xsl:value-of select="tpo:PaymentDocument/tpo:PresentedDocumentModeCode"/><xsl:text> </xsl:text></xsl:if>
                                 <xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentName">
                                    <xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentName"/> </xsl:if>
                                 <xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentNumber">№<xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentNumber"/> </xsl:if>
                                 <xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentDate">
						(<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="tpo:PaymentDocument/cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>)</xsl:if>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>   </xsl:when>
                    <!-- </xsl:for-each>-->
               <!--   </xsl:when>-->
                 <!-- <xsl:when test="position()=last()">-->
                   <!--  <xsl:for-each select="tpo:PaymentInfo">-->
                      <xsl:when test="position()=last()">
                        <tr style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:0px solid #ffffff; border-bottom:0pt solid #ffffff;">
                           <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0pt solid #ffffff;">
                              <xsl:value-of select="tpo:PaymentModeCode"/>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;border-bottom:0pt solid #ffffff;">
                              <xsl:value-of select="tpo:TaxBase"/>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" style="border:solid 1pt #000000;border-bottom:0pt solid #ffffff;">
                              <xsl:value-of select="tpo:Rate"/>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000;border-bottom:0pt solid #ffffff;">
                              <xsl:value-of select="tpo:Amount"/>
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                           </td>
                           
                          <td align="center" class="graph" style="border:solid 0pt #000000;border-bottom:0pt solid #ffffff;">
                          <xsl:for-each select="tpo:PaymentDetails">
                         <!-- <xsl:if test="tpo:PaymentMethodCode">-->
                              <xsl:value-of select="tpo:PaymentMethodCode"/>
                              
                              <xsl:if test="position()!=last()">
                                 <br/>
                              </xsl:if>
                             <!-- </xsl:if>-->
                              </xsl:for-each>
                           </td>
                           <td align="left" class="graph" colspan="3" style="border-left:1px solid #000000; border-top:0px solid #000000; border-right:0px solid #ffffff; border-bottom:0pt solid #ffffff;">
                              <xsl:for-each select="tpo:PaymentDetails">
                                 <xsl:value-of select="tpo:FactPaidAmount"/><!--<xsl:if test="tpo:PaymentMethodCode"><xsl:value-of select="tpo:PaymentMethodCode"/></xsl:if>-->
                                 <xsl:text> </xsl:text>
                                 <xsl:if test="tpo:PaymentDocument/tpo:PresentedDocumentModeCode"><xsl:value-of select="tpo:PaymentDocument/tpo:PresentedDocumentModeCode"/></xsl:if>
                                 <xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentName">
                                    <xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentName"/> </xsl:if>
                                 <xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentNumber">№<xsl:value-of select="tpo:PaymentDocument/cat_ru:PrDocumentNumber"/> </xsl:if>
                                 <xsl:if test="tpo:PaymentDocument/cat_ru:PrDocumentDate">
						(<xsl:call-template name="russian_date">
                                       <xsl:with-param name="dateIn" select="tpo:PaymentDocument/cat_ru:PrDocumentDate"/>
                                    </xsl:call-template>)</xsl:if>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr></xsl:when>
                     
                <!--  </xsl:when>-->
               </xsl:choose></xsl:for-each>
            </table>
         </td>
      </tr>
      <tr>
         <td class="graph" rowspan="2" style="border:solid 1pt #000000">8.1. Всего подлежит уплате</td>
         <td class="graph" style="border:solid 1pt #000000">цифрами</td>
         <td align="center" class="graph" colspan="7" style="border:solid 1pt #000000">
            <xsl:value-of select="//tpo:Amount"/>
         </td>
      </tr>
      <tr>
         <td class="graph" style="border:solid 1pt #000000">прописью</td>
         <td align="center" class="graph" colspan="7" style="border:solid 1pt #000000">
            <xsl:value-of select="//tpo:AmountLetter"/>
         </td>
      </tr>
   </xsl:template>
   <xsl:template match="tpo:Goods[position()!=1]">
      <tr>
         <td class="graph" colspan="5" rowspan="4" style="border:solid 1pt #000000">6.5. Описание товара<br/>
            <xsl:for-each select="tpo:GoodsDescription">
               <xsl:value-of select="."/>
               <xsl:if test="position()!=last()"> </xsl:if>
            </xsl:for-each>
            <xsl:if test="tpo:OriginCountryCode">(код страны происхождения:<xsl:value-of select="tpo:OriginCountryCode"/>)</xsl:if>
            <!--(<xsl:value-of select="//tpo:GoodsTNVEDCode"/>)-->
            <br/>
            <xsl:if test="tpo:AutomobileInfo">Данные об автомобиле:<br/></xsl:if>
            <xsl:variable name="avto_num" select="count(tpo:AutomobileInfo)"/>
            <xsl:for-each select="tpo:AutomobileInfo">
            <xsl:if test="$avto_num>1"><xsl:value-of select="position()"/>.</xsl:if>
            <xsl:if test="tpo:Model">Модель:<xsl:value-of select="tpo:Model"/>
               <br/>
            </xsl:if>
            <xsl:if test="tpo:Mark">Марка:<xsl:value-of select="tpo:Mark"/>;
            </xsl:if>
            <xsl:if test="tpo:MarkCode"> Код марки:<xsl:value-of select="tpo:MarkCode"/>;</xsl:if>
            <xsl:if test="tpo:OfftakeYear"> Год выпуска:<xsl:value-of select="tpo:OfftakeYear"/>;</xsl:if>
            <xsl:if test="tpo:EngineVolumeQuanity"> Объем двигателя, куб. см:<xsl:value-of select="tpo:EngineVolumeQuanity"/>;</xsl:if>
            <xsl:if test="tpo:VINID"> Идентификационный номер:<xsl:value-of select="tpo:VINID"/>;</xsl:if>
            <xsl:if test="tpo:EnginePower or tpo:EnginePowerKVt"> Мощность двигателя: <xsl:if test="tpo:EnginePower"><xsl:value-of select="tpo:EnginePower"/> лошадиных сил;</xsl:if>
            <xsl:if test="tpo:EnginePowerKVt"><xsl:text> </xsl:text><xsl:value-of select="tpo:EnginePowerKVt"/>КВт;</xsl:if></xsl:if>
             
            <xsl:if test="position()!=last()"><br/></xsl:if>
            </xsl:for-each>
         </td>
         <td class="graph" colspan="2" style="border:solid 1pt #000000">6.6. Код товара<br/>
            <xsl:value-of select="tpo:GoodsTNVEDCode"/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </td>
         <td class="graph" colspan="3" style="border:solid 1pt #000000">6.7. Вес товара (кг)<br/>
            <xsl:value-of select="tpo:GoodsWeight"/>
            <xsl:if test="position()!=last()">, </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph" colspan="2" style="border:solid 1pt #000000">6.8. Количество<br/>
            <xsl:if test="tpo:SupplementaryQuantity">
               <xsl:value-of select="cat_ru:GoodsQuantity"/> </xsl:if>
            <xsl:if test="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName">
               <xsl:value-of select="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierName"/> </xsl:if>
            <xsl:if test="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode">
               <xsl:value-of select="tpo:SupplementaryQuantity/cat_ru:MeasureUnitQualifierCode"/> </xsl:if>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
         <td class="graph" colspan="3" style="border:solid 1pt #000000">6.9.<br/>
            <xsl:if test="tpo:AdditionalInformation">
               <xsl:value-of select="tpo:AdditionalInformation"/>
            </xsl:if>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
						7.1. Стоимость товаров
						</td>
      </tr>
      <tr>
         <td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в валюте платежа<br/>
            <xsl:value-of select="tpo:Cost"/>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
         <td class="graph" colspan="2" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в долларах США<br/>
            <xsl:value-of select="tpo:DollarCost"/>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
         <td class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
						в евро<br/>
            <xsl:value-of select="tpo:EuroCost"/>
            <xsl:if test="position()!=last()">
               <br/>
            </xsl:if>
         </td>
      </tr>
      <tr>
         <td class="graph" style="border:solid 1pt #000000">8. Платежи</td>
         <td align="center" class="graph" colspan="9" style="border:solid 1pt #000000">
            <table>
               <tbody>
                  <tr>
                     <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Вид</td>
                     <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Основа начисления</td>
                     <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">Ставка</td>
                     <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:1px solid #0000000;">Исчисленная сумма</td>
                  </tr>
                  <xsl:for-each select="tpo:PaymentInfo">
                  <xsl:if test="position()!=last()">
                     <tr>
                        <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
                           <xsl:value-of select="tpo:PaymentModeCode"/>
                        </td>
                        <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
                           <xsl:value-of select="tpo:TaxBase"/>
                        </td>
                        <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:1px solid #0000000;">
                           <xsl:value-of select="tpo:Rate"/>
                        </td>
                        <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:1px solid #0000000;">
                           <xsl:value-of select="tpo:Amount"/>
                        </td>
                     </tr>
                    </xsl:if>
                    <xsl:if test="position()=last()">
                     <tr>
                        <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
                           <xsl:value-of select="tpo:PaymentModeCode"/>
                        </td>
                        <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
                           <xsl:value-of select="tpo:TaxBase"/>
                        </td>
                        <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:1px solid #000000; border-bottom:0px solid #ffffff;">
                           <xsl:value-of select="tpo:Rate"/>
                        </td>
                        <td align="center" class="graph" style="border-left:1px solid #000000; border-top:0px solid #ffffff; border-right:0px solid #000000; border-bottom:0px solid #ffffff;">
                           <xsl:value-of select="tpo:Amount"/>
                        </td>
                     </tr>
                    </xsl:if>
                  </xsl:for-each>
               </tbody>
            </table>
         </td>
      </tr>
   </xsl:template>
</xsl:stylesheet>
