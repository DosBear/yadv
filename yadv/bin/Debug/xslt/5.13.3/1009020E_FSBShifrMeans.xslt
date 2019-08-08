<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:shfrmn="urn:customs.ru:Information:SQDocuments:FSBShifrMeans:5.13.3" xmlns:sq_cat="urn:customs.ru:Information:SQDocuments:SQCommonAgregateTypesCust:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3">
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
   <xsl:template match="shfrmn:FSBShifrMeans">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="shfrmn:DocSign = '0'">
						Заключение (разрешительный документ) на
						<xsl:value-of select="shfrmn:Sign"/>
						специальных технических средств, предназначенных для негласного получения информации
					</xsl:when>
                  <xsl:otherwise>
						Заключение (разрешительный документ) на 
						<xsl:value-of select="shfrmn:Sign"/>
						шифровальных (криптографических) средств
					</xsl:otherwise>
               </xsl:choose>
            </title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
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
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
			</style>
         </head>
         <body>
            <div class="page">
				<h2>Заключение (разрешительный документ) на 
				   <xsl:choose>
						<xsl:when test="shfrmn:DocSign = '0' ">
							<xsl:value-of select="shfrmn:Sign"/> 
							специальных технических средств, предназначенных для негласного получения информации
					  </xsl:when>
					  <xsl:otherwise>
							<xsl:value-of select="shfrmn:Sign"/> 
							шифровальных (криптографических) средств
					  </xsl:otherwise>
				   </xsl:choose>
               </h2>
               <p class="remark">
                  <xsl:choose>
                     <xsl:when test="shfrmn:IsCanceled='true' or shfrmn:IsCanceled='1'">Документ не действителен</xsl:when>
                     <xsl:otherwise>Документ действителен</xsl:otherwise>
                  </xsl:choose>
               </p>
               <table border="0">
				   <xsl:if test="shfrmn:BDRDID">
                     <tr style="vertical-align:top">
                        <td width="30%">ID по БД РД</td>
                        <td><xsl:value-of select="shfrmn:BDRDID"/></td>
                     </tr>
                   </xsl:if>  
                     <tr style="vertical-align:top">
                        <td width="30%">Описание СТС НПИ</td>
                        <td><xsl:apply-templates select="shfrmn:Info"/></td>
                     </tr>
                     <tr style="vertical-align:top">
                        <td>Страна отправления</td>
                        <td>
                           <xsl:value-of select="shfrmn:CountryOrigin"/>
                        </td>
                     </tr>
                     <xsl:if test="shfrmn:CountryDestination">
						 <tr style="vertical-align:top">
							<td>Страна назначения</td>
							<td>
							   <xsl:value-of select="shfrmn:CountryDestination"/>
							</td>
						 </tr>
                     </xsl:if>
                     <tr>
                        <td style="vertical-align:top">Реквизиты заключения</td>
                        <td>
                           <xsl:apply-templates select="shfrmn:ConclusionDescription"/>
                           <br/><xsl:apply-templates select="shfrmn:AuthorizedPerson"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Получатель заключения (разрешительного документа)</td>
                        <td>
                           <xsl:apply-templates select="shfrmn:Name"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Производитель</td>
                        <td>
                           <xsl:apply-templates select="shfrmn:ManufacturerName"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Реквизиты контракта</td>
                        <td>
                           <xsl:apply-templates select="shfrmn:ContractDescription"/>
                        </td>
                     </tr>
                   <tr>
                        <td>Количество товара</td>
                        <td>
                           <xsl:apply-templates select="shfrmn:Quantity"/>
                        </td>
                     </tr>
                     <xsl:if test="shfrmn:AddQuantity">
						 <tr>
							<td>Количество товара в доп. ед. измерения</td>
							<td>
							   <xsl:apply-templates select="shfrmn:AddQuantity"/>
							</td>
						 </tr>
                     </xsl:if>
                     <xsl:if test="shfrmn:Lefttover">
						 <tr>
							<td>Остаток по квоте</td>
							<td>
								<xsl:for-each select="shfrmn:Lefttover">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</td>
						</tr>
                     </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="shfrmn:ConclusionDescription | shfrmn:ContractDescription">
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
      <xsl:if test="sq_cat:DateTo">
         <span>Действителен до </span>
         <xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="sq_cat:DateTo"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>
   <xsl:template match="shfrmn:Name | shfrmn:ManufacturerName">
      <xsl:if test="RUScat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="RUScat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
      <xsl:apply-templates select="RUScat_ru:OrganizationName"/>
      <xsl:if test="RUScat_ru:ShortName">
         <xsl:if test="RUScat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="RUScat_ru:ShortName"/>
         <xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationName or RUScat_ru:ShortName"><br/></xsl:if>
      <xsl:if test="RUScat_ru:RFOrganizationFeatures or RUScat_ru:RKOrganizationFeatures or RUScat_ru:RBOrganizationFeatures or RUScat_ru:RAOrganizationFeatures or RUScat_ru:KGOrganizationFeatures">
			<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
			<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
			<br/>
		</xsl:if>
      <xsl:if test="RUScat_ru:OrganizationFullDatas">
		  <xsl:for-each select="RUScat_ru:OrganizationFullDatas"><xsl:value-of select="."/></xsl:for-each>
		  <br/>
      </xsl:if>
      <xsl:if test="RUScat_ru:Address">
         <xsl:apply-templates select="RUScat_ru:Address"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCard">
         <xsl:apply-templates select="RUScat_ru:IdentityCard"/>
      </xsl:if>
      <xsl:if test="RUScat_ru:Contact">
         <xsl:apply-templates select="RUScat_ru:Contact"/>
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
	<!-- Шаблон для типа RUScat_ru:KGOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RAOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RBOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
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
	<!-- Шаблон для типа RUScat_ru:RKOrganizationFeaturesType -->
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
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
   <xsl:template match="RUScat_ru:Address">
      <span class="header">Адрес:</span>
      <br/>
		<xsl:if test="RUScat_ru:AddressKindCode">
			<xsl:text>Вид адреса - </xsl:text>
			<xsl:value-of select="RUScat_ru:AddressKindCode"/>
			<xsl:text>:  </xsl:text>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName"><xsl:value-of select="RUScat_ru:CounryName"/></xsl:if>
		<xsl:if test="RUScat_ru:CountryCode"> (<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:District"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Town"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse">, </xsl:if>
			<xsl:value-of select="RUScat_ru:House"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Room"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room">, </xsl:if>
			<xsl:value-of select="RUScat_ru:AddressText"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText">, </xsl:if>
			<xsl:text> номер а/я: </xsl:text>
			<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<br/>Почтовый индекс: <xsl:value-of select="RUScat_ru:PostalCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:TerritoryCode">
			<br/>
			<xsl:if test="RUScat_ru:OKTMO">ОКТМО: <xsl:value-of select="RUScat_ru:OKTMO"/></xsl:if>
			<xsl:if test="RUScat_ru:OKATO"> ОКАТО: <xsl:value-of select="RUScat_ru:OKATO"/></xsl:if>
			<xsl:if test="RUScat_ru:TerritoryCode"> Код единицы административно-территориального деления: <xsl:value-of select="RUScat_ru:TerritoryCode"/></xsl:if>
			<xsl:if test="RUScat_ru:KLADR"> Код КЛАДР: <xsl:value-of select="RUScat_ru:KLADR"/></xsl:if>
		</xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="RUScat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
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
      <br/>
   </xsl:template>
   <xsl:template match="RUScat_ru:Contact">
	   <span class="header">Контактные данные:</span>
		<br/>
		<xsl:if test="cat_ru:Phone or cat_ru:Telex">
			<span>Телефон / телекс: 
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
			<xsl:if test="cat_ru:Telex"> / <xsl:value-of select="cat_ru:Telex"/></xsl:if>
			</span>
			 <br/>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span>Факс: 
				<xsl:value-of select="cat_ru:Fax"/>
			</span>
			<br/>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span>Эл.почта: 
				<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
			</span>
		</xsl:if>  
	</xsl:template>
   <xsl:template match="shfrmn:Quantity | shfrmn:AddQuantity | shfrmn:Lefttover">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>&#160;
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode"> (код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
   </xsl:template>
   <xsl:template match="shfrmn:AuthorizedPerson">
		Уполномоченное должностное лицо, подписавшее заключение: <xsl:value-of select="."/>
   </xsl:template>
</xsl:stylesheet>
