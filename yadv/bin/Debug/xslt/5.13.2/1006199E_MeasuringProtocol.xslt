<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mp="urn:customs.ru:Information:CustomsDocuments:MeasuringProtocol:5.12.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="mp:MeasuringProtocol">
      <html>
         <head>
            <title>Протокол выполнения измерений круглых лесоматериалов</title>
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
            <div class="album_page">
               <table>
                  <xsl:choose>
                     <xsl:when test="mp:DocSign=1">
                        <tr>
                           <td align="center" colspan="4" style="border:solid 0pt">
                              <font face="Times new roman">
                                 <b>
				ПРОТОКОЛ<br/> выполнения измерений объема партии круглых  лесоматериалов<br/> поштучным методом концевых сечений по методике ФР.1.27.2011.10629</b>
                              </font>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1.2"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1.3"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="Person"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1.4"/>
                           </td>
                        </tr>
                     </xsl:when>
                     <xsl:when test="mp:DocSign=2">
                        <tr>
                           <td align="center" colspan="4" style="border:solid 0pt">
                              <font face="Times new roman">
                                 <b>
				ПРОТОКОЛ<br/> выполнения измерений объема партии круглых  лесоматериалов<br/> поштучным методом срединного сечения по методике ФР.1.27.2011.10630</b>
                              </font>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table2.2"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1.3"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="Person"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1.4"/>
                           </td>
                        </tr>
                     </xsl:when>
                     <xsl:when test="mp:DocSign=3">
                        <tr>
                           <td align="center" colspan="4" style="border:solid 0pt">
                              <font face="Times new roman">
                                 <b>
				ПРОТОКОЛ<br/> выполнения измерений объема партии круглых  лесоматериалов<br/> поштучным методом с использованием таблиц объемов ГОСТ 2708 по методике ФР.1.27.2011.10631</b>
                              </font>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt"> </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table3.2"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1.3"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="Person"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4" style="border:solid 0pt">
                              <xsl:call-template name="table1.4"/>
                           </td>
                        </tr>
                     </xsl:when>
                     <xsl:when test="mp:DocSign=4 and //mp:MeasuringTransportLogs[mp:TransportType='1']">
                        <xsl:if test="mp:MeasuringTransportLogs[mp:TransportType='1']">
                           <tr>
                              <td align="center" colspan="4" style="border:solid 0pt">
                                 <font face="Times new roman">
                                    <b>
				ПРОТОКОЛ<br/> выполнения измерений объема штабеля (партии) круглых лесоматериалов, погруженных в вагоны, по методике ФР.1.27.2011.10632</b>
                                 </font>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt"> </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="table1"/>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="table4.2"/>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="table1.3"/>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="Person"/>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:when>
                     <xsl:when test="mp:DocSign=4 and (//mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3'])">
                        <xsl:if test="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
                           <tr>
                              <td align="center" colspan="4" style="border:solid 0pt">
                                 <font face="Times new roman">
                                    <b>
				ПРОТОКОЛ<br/> выполнения измерений объемов штабеля (партии) круглых  лесоматериалов,<br/> погруженных на автомобили, по методике ФР.1.27.2011.10632</b>
                                 </font>
                              </td>
                           </tr>
                           <tr>
                              <td style="border:solid 0pt"> </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="table1"/>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="table5.2"/>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="table1.3"/>
                              </td>
                           </tr>
                           <tr>
                              <td colspan="4" style="border:solid 0pt">
                                 <xsl:call-template name="Person"/>
                              </td>
                           </tr>
                        </xsl:if>
                     </xsl:when>
                     <xsl:otherwise>
						 <table>
							<tbody>
								<tr>
									<td colspan="2" align="center" style="border:solid 0pt"><font size="4" color="red"><b>Невозможно отобразить протокол</b></font></td>
								</tr>
								<tr>
									<td align="right" width="50%" style="border:solid 0pt">метод измерения (1 - 4):</td>
									<td align="left" style="border:solid 0pt"><xsl:value-of select="mp:DocSign"/></td>
								</tr>
								<xsl:if test="mp:DocSign=4">
									<tr>
										<td align="right" style="border:solid 0pt">Сведения об измерениях объема штабеля круглых лесоматериалов - тип транспорта (1 - 3):</td>
										<td align="left" style="border:solid 0pt"><xsl:value-of select="mp:MeasuringTransportLogs/mp:TransportType"/></td>
									</tr>
								</xsl:if>
							</tbody>
						 </table>
                     </xsl:otherwise>
                  </xsl:choose>
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
   <xsl:template match="mp:Seller | mp:Consignee | mp:Buyer | mp:Consignor">
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
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
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
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
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
   <xsl:template match="cat_ru:Address | mp:MeasuringPlace | mp:DeparturePlace | mp:DestinationPlace">
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
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
Документ удостоверяющий личность:<br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="mp:Contract">
      <span>
         <xsl:if test="cat_ru:PrDocumentName">
            <xsl:value-of select="cat_ru:PrDocumentName"/> </xsl:if>
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
   <xsl:template match="mp:RegNumberDT">
      <xsl:value-of select="cat_ru:CustomsCode"/> / 
	<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/> / 
	<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="mp:Transport">
      <!-- вставить в <style/>	.auxiliary tbody tr td { border: 0; } -->
      <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>; </xsl:if>
      <xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>; </xsl:if>
      <xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>; </xsl:if>
      <xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:TransportMeansNationalityCode">
						Код страны принадлежности ТС 
						<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:ActiveTransportIdentifier">
						Идентификатор активного ТС  
						<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:TransportRegNumber">
						Номер свидетельства о регистрации ТС 
						<xsl:value-of select="cat_ru:TransportRegNumber"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="table1">
      <table>
         <tr>
            <td class="graph" colspan="2" style="border:solid 1pt #000000">Дата/место измерений</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:call-template name="russian_date">
                  <xsl:with-param name="dateIn" select="mp:MeasuringDate"/>
               </xsl:call-template>
            </td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:MeasuringPlace"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="2" style="border:solid 1pt #000000">Продавец/Грузоотправитель</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:Seller"/>
            </td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:Consignor"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="2" style="border:solid 1pt #000000">Покупатель/Грузополучатель</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:Buyer"/>
            </td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:Consignee"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="2" style="border:solid 1pt #000000">Пункт отправления/пункт назначения</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:DeparturePlace"/>
            </td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:DestinationPlace"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="2" style="border:solid 1pt #000000">Договор (контракт)/ДТ</td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:Contract"/>
            </td>
            <td class="graph" style="border:solid 1pt #000000">
               <xsl:apply-templates select="mp:RegNumberDT"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="2" style="border:solid 1pt #000000">Транспортное средство/№ ТТН</td>
            <td class="graph" colspan="2" style="border:solid 1pt #000000">
               <table>
                  <xsl:for-each select="mp:TransportWayBillInfo">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <table>
                              <xsl:for-each select="mp:Transport">
                                 <tr>
                                    <td class="graph" style="border:solid 0pt">
                                       <xsl:value-of select="position()"/>. 
									<xsl:apply-templates select="."/>
                                       <xsl:if test="position()!=last()">
                                          <br/>
                                       </xsl:if>
                                    </td>
                                 </tr>
                              </xsl:for-each>
                           </table>
                        </td>
                        <td class="graph" style="border:solid 0pt #000000">
                           <xsl:value-of select="mp:WayBillNumber"/>
                        </td>
                     </tr>
                  </xsl:for-each>
               </table>
            </td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">Сортимент</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">Порода</td>
            <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">Количество бревен в партии</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">
               <xsl:value-of select="mp:WoodSortiment"/>
            </td>
            <td align="center" class="graph" style="border:solid 1pt #000000">
               <xsl:value-of select="mp:WoodKind"/>
            </td>
            <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
               <xsl:value-of select="mp:LogPileQuantity"/>
            </td>
         </tr>
         <tr>
            <td colspan="4" style="border:solid 0pt"> </td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="table1.2">
      <table>
         <tr>
            <td align="center" class="graph" rowspan="3" style="border:solid 1pt #000000">№ п/п брев-<br/>на</td>
            <td align="center" class="graph" colspan="16" style="border:solid 1pt #000000">Измеряемые параметры бревен</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">длина, м</td>
            <td align="center" class="graph" colspan="6" style="border:solid 1pt #000000">верхний диаметр, см</td>
            <td align="center" class="graph" colspan="6" style="border:solid 1pt #000000">нижний диаметр, см</td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Объем<br/>
               <sub>VKL</sub>
               <br/>ФАКТ.,<br/>м3</td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">L<sub>ном.</sub>
               <br/>ПАРТ.,<br/>м</td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Объем<br/>VL<br/>
               <sub>НОМ</sub>.,<br/>м3</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">L<sub>ФАКТ.,</sub>
               <br/>м</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>1</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>2</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>К1</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>К2</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>К</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<sub>1</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<sub>2</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<sub>К1</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<sub>К2</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<sub>К</sub>
               <br/>см</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">1</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">2</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">3</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">4</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">5</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">6</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">7</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">8</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">9</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">10</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">11</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">12</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">13</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">14</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">15</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">16</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">17</td>
         </tr>
         <xsl:for-each select="mp:LogMeasuringInfo">
            <tr>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:LogSerialNumber"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:FactLength"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--	<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--	<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:FactVolume"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="/.//mp:NominalLength">
                     <xsl:value-of select="/.//mp:NominalLength"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:NominalVolume">
                     <xsl:value-of select="mp:NominalVolume"/>
                  </xsl:if>
               </td>
            </tr>
         </xsl:for-each>
         <tr>
            <td align="right" class="graph" colspan="8" style="border-left:1px solid #000000; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">Итого:</td>
            <td align="right" class="graph" colspan="6" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">∑ </td>
            <td align="right" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
               <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
            </td>
            <td align="right" class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">∑ </td>
            <td class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:1px solid #000000;">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
               <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="17" style="border:solid 1pt #000000">
						t=<u>
                  <xsl:value-of select="mp:Temperature"/>
               </u>
               <sup>0</sup>C (температура воздуха при измерениях)</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="table1.3">
      <table>
         <tr>
            <td class="graph" colspan="3" style="border:solid 0pt">   При измерениях применялись следующие средства измерений:</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">Наименование и тип средства измерений (СИ)</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">Заводской номер</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">Дата поверки СИ (номер Свидетельства о поверке при его наличии), наименование поверочного органа</td>
         </tr>
         <xsl:for-each select="mp:MeasuringEquipment">
            <tr>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:EquipmentName"/>
               </td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:SerialNumber"/>
               </td>
               <td class="graph" style="border:solid 1pt #000000">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="mp:Verification/mp:VerificationDate"/>
                  </xsl:call-template>, 
						<xsl:if test="mp:Verification/mp:VerificationCertificate">
                     <xsl:value-of select="mp:Verification/mp:VerificationCertificate"/>, 
						</xsl:if>
                  <xsl:value-of select="mp:Verification/mp:VerificationOrg"/>
               </td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>
   <xsl:template name="Person">
      <table>
         <xsl:for-each select="mp:MeasuringPerson[mp:PersonSign='0']">
            <tr>
               <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">
                  <xsl:if test="mp:PersonSign='0'">
                     <xsl:if test="cat_ru:PersonPost">
                        <xsl:value-of select="cat_ru:PersonPost"/>, </xsl:if>
                     <xsl:value-of select="cat_ru:PersonSurname"/> 
						<xsl:value-of select="cat_ru:PersonName"/> 
						<xsl:if test="cat_ru:PersonMiddleName">
                        <xsl:value-of select="cat_ru:PersonMiddleName"/>
                     </xsl:if>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">
						(должность, подпись, инициалы и фамилия лица, проводившего измерения)
						</td>
            </tr>
         </xsl:for-each>
         <xsl:for-each select="mp:MeasuringPerson[mp:PersonSign='1']">
            <tr>
               <td class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">
                  <xsl:if test="mp:PersonSign='1'">
                     <xsl:if test="cat_ru:PersonPost">
                        <xsl:value-of select="cat_ru:PersonPost"/>, </xsl:if>
                     <xsl:value-of select="cat_ru:PersonSurname"/> 
						<xsl:value-of select="cat_ru:PersonName"/> 
						<xsl:if test="cat_ru:PersonMiddleName">
                        <xsl:value-of select="cat_ru:PersonMiddleName"/>
                     </xsl:if>
                  </xsl:if>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" style="border-left:0px solid #ffffff; border-top:0px solid #ffffff; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">
						(должность, подпись, инициалы и фамилия лица, присутствующего при проведении измерения)
						</td>
            </tr>
         </xsl:for-each>
      </table>
   </xsl:template>
   <xsl:template name="table1.4">
      <div class="page">
         <table>
            <xsl:choose>
               <xsl:when test="mp:DocSign='1'">
                  <tr>
                     <td align="center" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman">
                           <b>
				ПРОТОКОЛ<br/> выполнения измерений объема партии круглых  лесоматериалов<br/> поштучным методом концевых сечений по методике ФР.1.27.2011.10629</b>
                        </font>
                     </td>
                  </tr>
               </xsl:when>
               <xsl:when test="mp:DocSign=2">
                  <tr>
                     <td align="center" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman">
                           <b>
				ПРОТОКОЛ<br/> выполнения измерений объема партии круглых  лесоматериалов<br/> поштучным методом срединного сечения по методике ФР.1.27.2011.10630</b>
                        </font>
                     </td>
                  </tr>
               </xsl:when>
               <xsl:when test="mp:DocSign=3">
                  <tr>
                     <td align="center" colspan="2" style="border:solid 0pt">
                        <font face="Times new roman">
                           <b>
				ПРОТОКОЛ<br/> выполнения измерений объема партии круглых  лесоматериалов<br/> поштучным методом с использованием таблиц объемов ГОСТ 2708 по методике ФР.1.27.2011.10631</b>
                        </font>
                     </td>
                  </tr>
               </xsl:when>
            </xsl:choose>
            <!--<tr>
				<td colspan="2" style="border:solid 0pt" align="center"><font face="Times new roman"><b>
				ПРОТОКОЛ<br/> выполнения измерений объема партии круглых  лесоматериалов<br/> поштучным методом концевых сечений по методике ФР.1.27.2011.10629</b></font></td>
			</tr>-->
            <tr>
               <td align="center" class="graph" style="border:solid 1pt #000000" valign="middle">Измеренный (документированный) параметр</td>
               <td align="center" class="graph" style="border:solid 1pt #000000">Результат измерений<br/>(численное значение параметра)</td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 1pt #000000" width="70%">Сумма плотных (номинальных) объемов каждого бревна (VL <sub>HOM.</sub>) входящего в партию бревен, без учета объемов коры - плотный
						 (номинальный)объем партии бревен (VL <sub>НОМ. ПАРТ. </sub>), м<sup>3</sup>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000" width="30%">
                  <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
                  <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
               </td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Сумма фактических объемов каждого бревна (VKL <sub>ФАКТ.</sub>) входящего в партию бревен - фактический объем партии бревен с корой 
					    (VKL <sub>ФАКТ. ПАРТ. </sub>), м<sup>3</sup>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <!-- <xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:MeasureValue)">	</xsl:if> -->
                  <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">
						Оформление числового значения результата измерения плотного (номинального) объема и фактического объема ПАРТИИ круглых лесоматериалов
						</td>
            </tr>
            <tr>
               <xsl:choose>
                  <xsl:when test="mp:DocSign='1'">
                     <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений плотного (номинального) объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ± 5 %, м <sup>3</sup>
                        <br/>
						 (10,677× 5,0) : 100 = 0,5333 ≈ 0,53
						 </td>
                  </xsl:when>
                  <xsl:when test="mp:DocSign=2">
                     <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений плотного (номинального) объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ± 6 %, м <sup>3</sup>
                        <br/>
						 (21,940× 6,0) : 100 = 1,3164 ≈ 1,3
						 </td>
                  </xsl:when>
                  <xsl:when test="mp:DocSign=3">
                     <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений плотного (номинального) объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ± 8 %, м <sup>3</sup>
                        <br/>
						 (10,227× 8,0) : 100 = 0,8176 ≈ 0,82
						 </td>
                  </xsl:when>
               </xsl:choose>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:AbsoluteError)"></xsl:if>-->
						±<xsl:value-of select="mp:MeasuringResults/mp:AbsoluteError[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
               </td>
            </tr>
            <tr>
               <xsl:choose>
                  <xsl:when test="mp:DocSign='1'">
                     <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений фактического объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ± 5 %, м <sup>3</sup>
                        <br/>
						 (12,898× 5,0) : 100 = 0,6449 ≈ 0,64
						 </td>
                  </xsl:when>
                  <xsl:when test="mp:DocSign='2'">
                     <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений фактического объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ± 6 %, м <sup>3</sup>
                        <br/>
						 (25,270× 6,0) : 100 = 1,5162 ≈ 1,5
						 </td>
                  </xsl:when>
                  <xsl:when test="mp:DocSign='3'">
                     <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений фактического объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ± 8 %, м <sup>3</sup>
                        <br/>
						 (11,772× 8,0) : 100 = 0,9417 ≈ 0,94
						 </td>
                  </xsl:when>
               </xsl:choose>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:AbsoluteError)"></xsl:if>-->
						±<xsl:value-of select="mp:MeasuringResults/mp:AbsoluteError[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
               </td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений плотного (номинального) объема партии круглых лесоматериалов - VL <sub>НОМ. ПАРТ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности
						 </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:ResultMeasureValue)"></xsl:if>-->
                  <xsl:value-of select="mp:MeasuringResults/mp:ResultMeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
               </td>
            </tr>
            <tr>
               <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений фактического объема партии круглых лесоматериалов - VKL <sub>ФАКТ. ПАРТ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности
						 </td>
               <td align="center" class="graph" style="border:solid 1pt #000000" valign="bottom">
                  <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:ResultMeasureValue)"></xsl:if>-->
                  <xsl:value-of select="mp:MeasuringResults/mp:ResultMeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
               </td>
            </tr>
         </table>
         <br/>
         <xsl:call-template name="Person"/>
      </div>
   </xsl:template>
   <xsl:template name="table2.2">
      <table>
         <tr>
            <td align="center" class="graph" rowspan="3" style="border:solid 1pt #000000">№ п/п брев-<br/>на</td>
            <td align="center" class="graph" colspan="11" style="border:solid 1pt #000000">Измеряемые параметры бревен</td>
         </tr>
         <tr>
            <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">длина, м</td>
            <td align="center" class="graph" colspan="6" style="border:solid 1pt #000000">средний диаметр, см</td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Объем<br/>VL<sub>НОМ</sub>.,<br/>м3</td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Объем<br/>VKL<sub>ФАКТ</sub>.,<br/>м3</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">L<sub>ФАКТ.,</sub>
               <br/>м</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">L<sub>НОРМ. ПАРТ.,</sub>
               <br/>м</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>СК1</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>СК2</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>СК</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>С1</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>С2</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>С</sub>
               <br/>см</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">1</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">2</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">3</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">4</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">5</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">6</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">7</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">8</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">9</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">10</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">11</td>
         </tr>
         <xsl:for-each select="mp:LogMeasuringInfo">
            <tr>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:LogSerialNumber"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:FactLength"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="/.//mp:NominalLength">
                     <xsl:value-of select="/.//mp:NominalLength"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='2')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='2')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--	<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:MeasureSign='2')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='2')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='2')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='2')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:NominalVolume">
                     <xsl:value-of select="mp:NominalVolume"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:FactVolume"/>
               </td>
            </tr>
         </xsl:for-each>
         <tr>
            <td align="right" class="graph" colspan="5" style="border-left:1px solid #000000; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">Итого:</td>
            <td align="right" class="graph" colspan="4" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;"> </td>
            <td class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">
						∑ 
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
               <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
            </td>
            <td class="graph" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:1px solid #000000;">
						∑<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:MeasureValue)"/>
               <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="11" style="border:solid 1pt #000000">
						t=<u>
                  <xsl:value-of select="mp:Temperature"/>
               </u>
               <sup>0</sup>C (температура воздуха при измерениях)</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="table3.2">
      <table>
         <tr>
            <td align="center" class="graph" rowspan="3" style="border:solid 1pt #000000">№ п/п брев-<br/>на</td>
            <td align="center" class="graph" colspan="18" style="border:solid 1pt #000000">Измеряемые параметры бревен</td>
         </tr>
         <tr>
            <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">длина, м</td>
            <td align="center" class="graph" colspan="4" style="border:solid 1pt #000000">верхний диаметр, см</td>
            <td align="center" class="graph" colspan="3" style="border:solid 1pt #000000">нижний диаметр, см</td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">сбег<br/>S,<br/>см/м</td>
            <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">Объем<br/>VL<sub>ТАБ.ПРИН</sub>.,м<sup>3</sup>
            </td>
            <td align="center" class="graph" style="border:solid 1pt #000000">L<sub>ФАКТ</sub>
            </td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">К<sub>к</sub>
            </td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">Объем<br/>VKL<br/>
               <sub>ФАКТ</sub>.,м<sup>3</sup>
            </td>
            <td align="center" class="graph" rowspan="2" style="border:solid 1pt #000000">L<sub>ном.</sub>
               <br/>ПАРТ.,<br/>м</td>
            <td align="center" class="graph" colspan="2" style="border:solid 1pt #000000">Объем<br/>VL<sub>НОМ</sub>.,м<sup>3</sup>
            </td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">L<sub>ФАКТ.,</sub>
               <br/>м</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">L<sub>ТАБ.<br/>ПРИН.,</sub>
               <br/>м</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>1</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">d<sub>2</sub>
               <br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">T<br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">по<br/>ГОСТ<br/>2708<br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<sub>1</sub>,<br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D<sub>2</sub>,<br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">D,<br/>см</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">по таб.<br/>1<br/>ГОСТ<br/>2708</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">по таб.<br/>4<br/>ГОСТ<br/>2708</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">L<sub>ТАБ.<br/>ПРИН.</sub>
            </td>
            <td align="center" class="graph" style="border:solid 1pt #000000">по таб.<br/>1<br/>ГОСТ<br/>2708</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">по таб.<br/>4<br/>ГОСТ<br/>2708</td>
         </tr>
         <tr>
            <td align="center" class="graph" style="border:solid 1pt #000000">1</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">2</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">3</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">4</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">5</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">6</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">7</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">8</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">9</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">10</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">11</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">12</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">13</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">14</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">15</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">16</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">17</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">18</td>
            <td align="center" class="graph" style="border:solid 1pt #000000">19</td>
         </tr>
         <xsl:for-each select="mp:LogMeasuringInfo">
            <tr>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:LogSerialNumber"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:FactLength"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:TabularValues">
                     <xsl:value-of select="mp:TabularValues/mp:TabularLength"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--	<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='1')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:TabularValues">
                     <xsl:value-of select="mp:TabularValues/mp:TabularDiameter"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:FirstMeasureValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:SecondMeasureValue"/>
                     </xsl:if>
                     <!--	<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:for-each select="mp:MeasuringDetails">
                     <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:MeasureSign='3')">
                        <xsl:value-of select="mp:AverageValue"/>
                     </xsl:if>
                     <!--<xsl:if test="position()!=last()"><br/></xsl:if>-->
                  </xsl:for-each>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:LogRise">
                     <xsl:value-of select="mp:LogRise"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:TabularValues/mp:TabularVolume1">
                     <xsl:value-of select="mp:TabularValues/mp:TabularVolume1"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:TabularValues/mp:TabularVolume4">
                     <xsl:value-of select="mp:TabularValues/mp:TabularVolume4"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:TabularValues">
                     <xsl:value-of select="mp:TabularValues/mp:LengthRatio"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:TabularValues">
                     <xsl:value-of select="mp:TabularValues/mp:VolumeCoefficient"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:value-of select="mp:FactVolume"/>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="/.//mp:NominalLength">
                     <xsl:value-of select="/.//mp:NominalLength"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:NominalVolume">
                     <xsl:value-of select="mp:NominalVolume"/>
                  </xsl:if>
               </td>
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <xsl:if test="mp:NominalVolume2">
                     <xsl:value-of select="mp:NominalVolume2"/>
                  </xsl:if>
               </td>
            </tr>
         </xsl:for-each>
         <tr>
            <td align="right" class="graph" colspan="9" style="border-left:1px solid #000000; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">Итого:</td>
            <td align="right" class="graph" colspan="6" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;"> </td>
            <td align="left" class="graph" colspan="2" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:0px solid #ffffff;">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
						∑<xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
            </td>
            <td align="center" class="graph" colspan="2" style="border-left:0px solid #ffffff; border-top:1px solid #000000; border-bottom:1px solid #000000; border-right:1px solid #000000;">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
						∑<xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
            </td>
         </tr>
         <tr>
            <td class="graph" colspan="19" style="border:solid 1pt #000000">
						t=<u>
                  <xsl:value-of select="mp:Temperature"/>
               </u>
               <sup>0</sup>C (температура воздуха при измерениях)</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="table4.2">
      <xsl:variable name="a" select="count(mp:MeasuringTransportLogs)"/>
      <table>
         <tr>
            <td align="center" class="graph" rowspan="3" style="border:solid 1pt #000000" width="45%">Измеренный (документированный) параметр</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">Номер вагона и штабеля</td>
         </tr>
         <tr>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td align="center" class="graph" style="border:solid 1pt #000000; width='b'">№ 
						<xsl:value-of select="mp:TransportIdentifier"/>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:PileSerialNumber"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Номинальная длина бревен штабеля, указанная в представленных документах, L<sub>НОМ.декл</sub>., м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;">
                              <xsl:text disable-output-escaping="yes"> </xsl:text>
                              <xsl:value-of select="mp:NominalLength"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Количество бревен штабеля, у которых измерялась их фактическая длина L<sub>ФАКТ</sub>., шт.</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <!--<xsl:choose>
							<xsl:when test="position()=last()"><td  class="graph" style="border:solid 1pt #000000"></xsl:when>
							<xsl:otherwise><td  class="graph" style="border:solid 1pt #000000"></xsl:otherwise>
						</xsl:choose>-->
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;"> <xsl:value-of select="mp:MeasuredLogsQuantity"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" colspan="100%">Фактические длины измеренных бревен:</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000;">Бревно № — Значение, <br/>L<sub>ФАКТ.1</sub>, м
							
               <!--<table width="100%">
								<xsl:for-each select="mp:MeasuringTransportLogs/mp:PileMeasuringInfo">
									<tr>
										<td class="graph" style="border:solid 0pt #ffffff;" align="center"><xsl:for-each select="mp:LogFactLength">бревно&#160;№<xsl:value-of select="mp:LogNumber"/><br/></xsl:for-each></td>
									</tr>
								</xsl:for-each>
							</table>-->
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;">
                              <xsl:for-each select="mp:LogFactLength">№<xsl:value-of select="mp:LogNumber"/> — <xsl:value-of select="mp:FactLength"/>
                                 <br/>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Разность между максимальным и минимальным значением у измеренных длин бревен, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:LengthDifference"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренная фактическая длина штабеля L<sub>ФАКТ</sub>., м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:FactLength"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" colspan="100%" style="border:solid 1pt #000000">Высота штабеля, измеренная с его боковых сторон:</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - первой, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:SideHeight1"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - второй, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:SideHeight2"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренная высота штабеля H, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:PileHeight"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - толщина нижних подкладок h<sub>H</sub>, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff">
                              <xsl:if test="mp:LowerLayerHeight"> <xsl:value-of select="mp:LowerLayerHeight"/> </xsl:if>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - толщина слоя мусора h<sub>H</sub>, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff">
                              <xsl:if test="mp:RubbishLayerHeight"> <xsl:value-of select="mp:RubbishLayerHeight"/> </xsl:if>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - сумма средних толщин прокладок, уложенных внутри штабеля и под "шапкой" ∑ h<sub>вн</sub>, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff">
                              <xsl:if test="mp:InnerLayer"> <xsl:value-of select="mp:InnerLayer"/> </xsl:if>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Расчетная высота штабеля H<sub>РАСЧ</sub>, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff">
                              <xsl:if test="mp:PileHeightCalculated"> <xsl:value-of select="mp:PileHeightCalculated"/> </xsl:if>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренная ширина штабеля B, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:PileWidth"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный складочный номинальный объем штабеля с учетом номинальной длины бревен штабеля, указанной в документах L<sub>НОМ</sub>, объема их
						 коры и пустот между ними VL<sub>НОМ.С</sub>, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:BarkNominalVolume"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный складочный фактический объем штабеля с учетом фактической длины штабеля L<sub>ФАКТ</sub>., объема
						 коры бревен и пустот мужду ними VL<sub>ФАКТ.С</sub>, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:FactlVolumeVL"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Диапазон толщин бревен, находящихся в штабеле, см</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:WidthSpan"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Форма погрузки штабеля</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff">
                              <xsl:if test="mp:LoadingForm"> <xsl:value-of select="mp:LoadingForm"/> </xsl:if>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Принятое табличное значение переводного коэффициента (коэффициента полнодревесности) K<sub>ПНеокор</sub>.</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:WoodCoefficient"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Принятое табличное значение коэффициента на кору K<sub>K</sub>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:BarkCoefficient"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный плотный (номинальный) объем штабеля с учетом номинальной длины бревен штабеля, указанной в документах L<sub>НОМ.</sub>, 
						без учета объема их коры и пустот между ними VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:NominalVolume"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный фактический объем бревен штабеля с учетом фактической длины штабеля L<sub>ФАКТ.</sub> и объема бревен VKL<sub>ФАКТ.</sub>, м
						<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:FactlVolumeVKL"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">Оформление числового значения результата измерения плотного (номинального) объема и фактического объема
						 ШТАБЕЛЯ круглых лесоматериалов</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений плотного (номинального) объема штабеля круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±11%, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <!--<xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:AbsoluteError)"></xsl:if>-->
                                 <xsl:value-of select="mp:AbsoluteError[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений фактического объема штабеля круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±11%, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <!--<xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:AbsoluteError)"></xsl:if>-->
                                 <xsl:value-of select="mp:AbsoluteError[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений плотного (номинального) объема штабеля круглых лесоматериалов - VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <!--<xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:ResultMeasureValue)"></xsl:if>-->
                                 <xsl:value-of select="mp:ResultMeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений фактического объема штабеля круглых лесоматериалов - VKL<sub>ФАКТ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">
               <td align="center" class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <!--<xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:ResultMeasureValue)"></xsl:if>-->
                                 <xsl:value-of select="mp:ResultMeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">Оформление числового значения результата измерения плотного (номинального) объема и фактического
						 объема ПАРТИИ круглых лесоматериалов (
						 <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='1']">№
						 <xsl:value-of select="mp:TransportIdentifier"/>
                  <xsl:if test="position()!=last()">, </xsl:if>
               </xsl:for-each>
						 )</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Плотный (номинальный) и фактический объемы партии круглых лесоматериалов вычисляются как суммы соответствующих объемов всех штабелей,
						 входящих в партию:</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000"> </td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - плотный (номинальный) объем партии круглых лесоматериалов - VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - фактический объем партии круглых лесоматериалов - VKL<sub>ФАКТ.</sub>, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений плотного (номинального) объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±8%, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:AbsoluteError)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:AbsoluteError[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений фактического объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±8%, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:AbsoluteError)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:AbsoluteError[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений плотного (номинального) объема партии круглых лесоматериалов - VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:ResultMeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:ResultMeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений фактического объема партии круглых лесоматериалов - VKL<sub>ФАКТ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:ResultMeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:ResultMeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" colspan="100%" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #000000;">t=<u>
                  <xsl:value-of select="mp:Temperature"/>
               </u>ºC (температура воздуха при измерениях)</td>
         </tr>
      </table>
   </xsl:template>
   <xsl:template name="table5.2">
      <table>
         <tr>
            <td align="center" class="graph" rowspan="3" style="border:solid 1pt #000000" width="45%">Измеренный (документированный) параметр</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">Номер транспортного средства и штабеля*</td>
         </tr>
         <tr>
            <xsl:for-each select="mp:MeasuringTransportLogs">
               <td align="center" class="graph" style="border:solid 1pt #000000; width='b'">рег. № 
						<xsl:choose>
                     <xsl:when test="mp:TransportType=1">вагонa</xsl:when>
                     <xsl:when test="mp:TransportType=2">автомобиля</xsl:when>
                     <xsl:when test="mp:TransportType=3">прицепа</xsl:when>
                  </xsl:choose>
                  <br/>
                  <xsl:value-of select="mp:TransportIdentifier"/>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff">
                              <xsl:value-of select="position()"/>.
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Номинальная длина бревен штабеля, указанная в представленных документах, L<sub>НОМ.декл</sub>., м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff">
                              <xsl:if test="mp:NominalLength"> <xsl:value-of select="mp:NominalLength"/> 
									</xsl:if>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Количество бревен штабеля, у которых измерялась их фактическая длина L<sub>ФАКТ</sub>., шт.</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:MeasuredLogsQuantity"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <!--<tr>
						<td class="graph" style="border:solid 1pt #000000" colspan="100%">Фактические длины измерений:</td>
					</tr>
					<tr>
						<td class="graph" style="border:solid 1pt #000000"> - первого L<sub>ФАКТ.1</sub>,м</td>
					</tr>-->
         <tr>
            <td class="graph" colspan="100%">Фактические длины измеренных бревен:</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000;">Бревно № — Значение, <br/>L<sub>ФАКТ.1</sub>, м
							
               <!--<table width="100%">
								<xsl:for-each select="mp:MeasuringTransportLogs/mp:PileMeasuringInfo">
									<tr>
										<td class="graph" style="border:solid 0pt #ffffff;" align="center"><xsl:for-each select="mp:LogFactLength">бревно&#160;№<xsl:value-of select="mp:LogNumber"/><br/></xsl:for-each></td>
									</tr>
								</xsl:for-each>
							</table>-->
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff;">
                              <xsl:for-each select="mp:LogFactLength">№<xsl:value-of select="mp:LogNumber"/> — <xsl:value-of select="mp:FactLength"/>
                                 <br/>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Разность между максимальным и минимальным значением у измеренных длин бревен, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:LengthDifference"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренная фактическая длина штабеля L<sub>ФАКТ</sub>., м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:FactLength"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" colspan="100%" style="border:solid 1pt #000000">Высота штабеля, измеренная с его боковых сторон:</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - первой, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:SideHeight1"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - второй, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:SideHeight2"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренная высота штабеля H, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:PileHeight"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренная ширина штабеля B, м</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:PileWidth"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный складочный номинальный объем штабеля с учетом номинальной длины бревен штабеля, указанной в документах L<sub>НОМ</sub>, объема их
						 коры и пустот между ними VL<sub>НОМ.С</sub>, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:BarkNominalVolume"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный складочный фактический объем штабеля с учетом фактической длины штабеля L<sub>ФАКТ</sub>., объема
						 коры бревен и пустот мужду ними VL<sub>ФАКТ.С</sub>, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:FactlVolumeVL"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Диапазон толщин бревен, находящихся в штабеле, см</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:WidthSpan"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Принятое табличное значение переводного коэффициента (коэффициента полнодревесности) K<sub>ПНеокор</sub>.</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:WoodCoefficient"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Принятое табличное значение коэффициента на кору K<sub>K</sub>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:BarkCoefficient"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный плотный (номинальный) объем штабеля с учетом номинальной длины бревен штабеля, указанной в документах L<sub>НОМ.</sub>, 
						без учета объема их коры и пустот между ними VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:NominalVolume"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Измеренный фактический объем бревен штабеля с учетом фактической длины штабеля L<sub>ФАКТ.</sub> и объема бревен VKL<sub>ФАКТ.</sub>, м
						<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff"> <xsl:value-of select="mp:FactlVolumeVKL"/> 
									</td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">Оформление числового значения результата измерения плотного (номинального) объема и фактического объема 
						ШТАБЕЛЯ круглых лесоматериалов</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений плотного (номинального) объема штабеля круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±12%, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff; width:40mm;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:AbsoluteError)">
                                    <xsl:value-of select="mp:AbsoluteError"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений фактического объема штабеля круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±12%, м<sup>3</sup>
            </td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff; width:40mm;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:AbsoluteError)">
                                    <xsl:value-of select="mp:AbsoluteError"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений плотного (номинального) объема штабеля круглых лесоматериалов - VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff; width:40mm;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <xsl:if test="(mp:BarkSign='0' or mp:BarkSign='f' or mp:BarkSign='false') and (mp:ResultMeasureValue)">
                                    <xsl:value-of select="mp:ResultMeasureValue"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений фактического объема штабеля круглых лесоматериалов - VKL<sub>ФАКТ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
               <td class="graph" style="border:solid 1pt #000000">
                  <table width="100%">
                     <tr>
                        <xsl:for-each select="mp:PileMeasuringInfo">
                           <td align="center" class="graph" style="border:solid 0pt #ffffff; width:40mm;">
                              <xsl:for-each select="mp:PileMeasuringResults">
                                 <xsl:if test="(mp:BarkSign='1' or mp:BarkSign='t' or mp:BarkSign='true') and (mp:ResultMeasureValue)">
                                    <xsl:value-of select="mp:ResultMeasureValue"/>
                                 </xsl:if>
                              </xsl:for-each>
                           </td>
                        </xsl:for-each>
                     </tr>
                  </table>
               </td>
            </xsl:for-each>
         </tr>
         <tr>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">Оформление числового значения результата измерения плотного (номинального) объема и фактического объема
						 ПАРТИИ круглых лесоматериалов (
						 <xsl:for-each select="mp:MeasuringTransportLogs[mp:TransportType='2' or mp:TransportType='3']">
                  <xsl:choose>
                     <xsl:when test="mp:TransportType=1">вагон</xsl:when>
                     <xsl:when test="mp:TransportType=2">автомобиль</xsl:when>
                     <xsl:when test="mp:TransportType=3">прицеп</xsl:when>
                  </xsl:choose> №
						 <xsl:value-of select="mp:TransportIdentifier"/>
                  <xsl:if test="position()!=last()">, </xsl:if>
               </xsl:for-each>
						 )</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Плотный (номинальный) и фактический объемы партии круглых лесоматериалов вычисляются как суммы соответствующих объемов всех штабелей,
						 входящих в партию:</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000"> </td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - плотный (номинальный) объем партии круглых лесоматериалов - VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000"> - фактический объем партии круглых лесоматериалов - VKL<sub>ФАКТ.</sub>, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:MeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:MeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений плотного (номинального) объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±11%, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:AbsoluteError)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:AbsoluteError[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение абсолютной погрешности (Δ) результата измерений фактического объема партии круглых лесоматериалов, с учетом
						 приписанной настоящей методике относительной погрешности ±11%, м<sup>3</sup>
            </td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:AbsoluteError)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:AbsoluteError[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений плотного (номинального) объема партии круглых лесоматериалов - VL<sub>НОМ.ИЗМ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='0' or mp:MeasuringResults/mp:BarkSign='f' or mp:MeasuringResults/mp:BarkSign='false') and (mp:MeasuringResults/mp:ResultMeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:ResultMeasureValue[../mp:BarkSign='0' or ../mp:BarkSign='f' or ../mp:BarkSign='false']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" style="border:solid 1pt #000000">Числовое значение результата измерений фактического объема партии круглых лесоматериалов - VKL<sub>ФАКТ.</sub>, м<sup>3</sup>
						с учетом абсолютной погрешности</td>
            <td align="center" class="graph" colspan="100%" style="border:solid 1pt #000000">
               <!--<xsl:if test="(mp:MeasuringResults/mp:BarkSign='1' or mp:MeasuringResults/mp:BarkSign='t' or mp:MeasuringResults/mp:BarkSign='true') and (mp:MeasuringResults/mp:ResultMeasureValue)"></xsl:if>-->
									 <xsl:value-of select="mp:MeasuringResults/mp:ResultMeasureValue[../mp:BarkSign='1' or ../mp:BarkSign='t' or ../mp:BarkSign='true']"/> 
						</td>
         </tr>
         <tr>
            <td class="graph" colspan="100%" style="border-left:1px solid #000000; border-top:1px solid #000000; border-right:1px solid #000000; border-bottom:1px solid #000000;">t=<u>
                  <xsl:value-of select="mp:Temperature"/>
               </u>ºC (температура воздуха при измерениях)</td>
         </tr>
      </table>
      <table>
         <tr>
            <td class="graph" style="border:solid 0pt">Примечание:<br/>*начало номеров штабелей - от кабины водителя.</td>
         </tr>
      </table>
   </xsl:template>
</xsl:stylesheet>
