<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:fpr="urn:customs.ru:Information:CustomsDocuments:FactPresenceRequest:5.13.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="fpr:FactPresenceRequest">
      <html>
         <head>
            <title>Запрос сведений из Единой автоматизированной информационной системы</title>
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
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Запрос сведений из Единой автоматизированной информационной системы<br/>
                              <xsl:if test="fpr:ReqDate">от
					    <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="fpr:ReqDate"/>
                                 </xsl:call-template> </xsl:if>
                              <xsl:if test="fpr:ReqTime">(<xsl:value-of select="substring(fpr:ReqTime, 1, 8)"/>)</xsl:if>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="fpr:TransportDoc">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Номер транспортного (перевозочного) документа</u>:<br/>
                              <xsl:for-each select="fpr:TransportDoc">
                                 <xsl:value-of select="position()"/>.
							<xsl:apply-templates select="."/>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
                  </xsl:if>
                  <xsl:if test="fpr:TDNumber">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Номер транзитной декларации</u>:<br/>
                              <xsl:for-each select="fpr:TDNumber">
                                 <xsl:value-of select="position()"/>.
							<xsl:apply-templates select="."/>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
				  </xsl:if>
				  <xsl:if test="fpr:TIRID">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Номер книжки МДП</u>:<br/>
                              <xsl:for-each select="fpr:TIRID">
                                 <xsl:value-of select="position()"/>.
							№ <xsl:value-of select="fpr:TIRID"/> серия <xsl:value-of select="fpr:TIRSeries"/>
                                 <xsl:if test="fpr:TIRPageNumber"> лист номер <xsl:value-of select="fpr:TIRPageNumber"/>
                                 </xsl:if>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
				  </xsl:if>
                  <xsl:if test="fpr:PPNumber">
                        <tr>
                           <td class="graph" style="border:solid 0pt">
                              <u>Уведомление о прибытии</u>:<br/>
                              <xsl:for-each select="fpr:PPNumber">
                                 <xsl:value-of select="position()"/>.
							<xsl:apply-templates select="."/>
                                 <xsl:if test="position()!=last()">
                                    <br/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </tr>
				  </xsl:if>

                  <xsl:if test="fpr:WHDocumentRegisterNumber">
					<tr>
						<td class="graph" style="border:solid 0pt">
							<u>Регистрационный номер ДО-1</u>:
							<xsl:apply-templates select="fpr:WHDocumentRegisterNumber"/>
						</td>
					</tr>
                  </xsl:if>
                  <xsl:if test="fpr:DepartureCountryCode">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Страна отправления</u>:
						<xsl:value-of select="fpr:DepartureCountryCode"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="fpr:Consignor">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Отправитель</u>:
						<xsl:apply-templates select="fpr:Consignor"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="fpr:Consignee">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Получатель</u>:
						<xsl:apply-templates select="fpr:Consignee"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <xsl:if test="fpr:GoodsLocationCustoms">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Таможенный орган местонахождения товаров: <xsl:if test="fpr:GoodsLocationCustoms/cat_ru:OfficeName">
                              <xsl:value-of select="fpr:GoodsLocationCustoms/cat_ru:OfficeName"/>, </xsl:if>
						код <xsl:value-of select="fpr:GoodsLocationCustoms/cat_ru:Code"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="fpr:Marks">
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <table>
                              <tr>
                                 <td align="center" class="graph" colspan="3" style="border:solid 0pt">Отметки о прохождении товарами таможенного и иных видов контроля</td>
                              </tr>
                              <tr>
                                 <td class="graph" style="border:solid 1pt #000000">Наличие отметки</td>
                                 <td class="graph" style="border:solid 1pt #000000">Тип отметки</td>
                                 <td class="graph" style="border:solid 1pt #000000">Результат прохождения контроля</td>
                              </tr>
                              <xsl:for-each select="fpr:Marks">
                                 <tr>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="fpr:MarkSign='1' or fpr:MarkSign='t' or fpr:MarkSign='true'">Присутствует</xsl:if>
                                       <xsl:if test="fpr:MarkSign='0' or fpr:MarkSign='f' or fpr:MarkSign='false'">Отсутствует</xsl:if>
                                    </td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:value-of select="fpr:MarkKind"/>
                                    </td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="fpr:ResultControl">
                                          <xsl:value-of select="fpr:ResultControl"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="fpr:TransportMeanArrive">
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <table>
                              <tr>
                                 <td align="center" class="graph" colspan="100%" style="border:solid 0pt">Описание транспортных средств</td>
                              </tr>
                              <tr>
                                 <td class="graph" style="border:solid 1pt #000000">Код<br/>типа<br/>ТС</td>
                                 <td class="graph" style="border:solid 1pt #000000">Номер<br/>шасси<br/>(VIN)</td>
                                 <td class="graph" style="border:solid 1pt #000000">Код марки ТС</td>
                                 <td class="graph" style="border:solid 1pt #000000">Иденти-<br/>фикатор</td>
                                 <td class="graph" style="border:solid 1pt #000000">Код<br/>страны<br/>принадлеж-<br/>ности<br/>ТС</td>
                                 <td class="graph" style="border:solid 1pt #000000">Иденти-<br/>фикатор<br/>активного<br/>ТС для<br/>прицепов,<br/>полу-<br/>прицепов<br/>и др.</td>
                                 <td class="graph" style="border:solid 1pt #000000">Номер<br/>свиде-<br/>тельства<br/>о регистра-<br/>ции ТС</td>
                                 <td class="graph" style="border:solid 1pt #000000">Иденти-<br/>фикатор<br/>нахож-<br/>дения<br/>ТС в зоне<br/>таможен-<br/>ного<br/>контроля</td>
                                 <td class="graph" style="border:solid 1pt #000000">Дата<br/>пересе-<br/>чения<br/>таможен-<br/>ной<br/>границы</td>
                                 <td class="graph" style="border:solid 1pt #000000">Примечание</td>
                              </tr>
                              <xsl:for-each select="fpr:TransportMeanArrive">
                                 <tr>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="cat_ru:TransportKindCode">
                                          <xsl:value-of select="cat_ru:TransportKindCode"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="cat_ru:VIN">
                                          <xsl:value-of select="cat_ru:VIN"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="cat_ru:TransportMarkCode">
                                          <xsl:value-of select="cat_ru:TransportMarkCode"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="cat_ru:TransportIdentifier">
                                          <xsl:value-of select="cat_ru:TransportIdentifier"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="cat_ru:TransportMeansNationalityCode">
                                          <xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="cat_ru:ActiveTransportIdentifier">
                                          <xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="cat_ru:TransportRegNumber">
                                          <xsl:value-of select="cat_ru:TransportRegNumber"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="fpr:TransportMeanArriveFlag">
                                          <xsl:value-of select="fpr:TransportMeanArriveFlag"/>
                                       </xsl:if>
                                    </td>
                                    <td align="center" class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="fpr:Date">
                                          <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="fpr:Date"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                    </td>
                                    <td class="graph" style="border:solid 1pt #000000">
                                       <xsl:if test="fpr:Note">
                                          <xsl:value-of select="fpr:Note"/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </table>
                        </td>
                     </tr>
                     <tr>
                        <td class="graph" style="border:solid 0pt"> </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="fpr:CustomsPerson">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Должностное лицо таможенного органа:
						<xsl:value-of select="fpr:CustomsPerson/cat_ru:PersonName"/>
                           <xsl:if test="fpr:CustomsPerson/cat_ru:LNP"> (<xsl:value-of select="fpr:CustomsPerson/cat_ru:LNP"/>)</xsl:if>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="fpr:Customs">
                     <tr>
                        <td class="graph" style="border:solid 0pt">Сведения о таможенном органе, осуществляющем запрос: 
						<xsl:if test="fpr:Customs/cat_ru:OfficeName">
                              <xsl:value-of select="fpr:Customs/cat_ru:OfficeName"/>, </xsl:if>
						код <xsl:value-of select="fpr:Customs/cat_ru:Code"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="fpr:Declarant">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <br/>
                           <u>Сведения о декларанте</u>: <xsl:apply-templates select="fpr:Declarant"/>
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
   <xsl:template match="fpr:Consignor | fpr:Consignee | fpr:Declarant">
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
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact">
		Контактные сведения:
		<xsl:for-each select="cat_ru:Contact">
            <xsl:if test="cat_ru:Phone">тел.: <xsl:value-of select="cat_ru:Phone"/> </xsl:if>
            <xsl:if test="cat_ru:Fax">факс: <xsl:value-of select="cat_ru:Fax"/> </xsl:if>
            <xsl:if test="cat_ru:Telex">телекс: <xsl:value-of select="cat_ru:Telex"/> </xsl:if>
            <xsl:if test="cat_ru:E_mail">эл. почта: <xsl:value-of select="cat_ru:E_mail"/>
            </xsl:if>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span> 
	</xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span> 
	</xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span> 
	</xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span> 
	</xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span> 
	</xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span> 
	<xsl:if test="cat_ru:PostalCode">Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/> </xsl:if>
      <xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>
	
	 
</xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span> 
	<xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"> </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
		 
	</xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
		 
	</xsl:if>
	 
</xsl:template>
   <xsl:template match="fpr:TransportDoc">
      <span>
         <xsl:if test="cat_ru:PrDocumentName">
            <xsl:value-of select="cat_ru:PrDocumentName"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if> 
		<xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
   </xsl:template>
   <xsl:template match="fpr:TDNumber|fpr:WHDocumentRegisterNumber|fpr:PPNumber">
      <xsl:value-of select="cat_ru:CustomsCode"/>/<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/>/<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
</xsl:stylesheet>
