<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:metstn="urn:customs.ru:Information:SQDocuments:MinFinMetalStoneInOut:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="metstn:MinFinMetalStoneInOut">
      <html>
         <head>
            <title>
               <xsl:choose>
                  <xsl:when test="metstn:DocSign = '1' ">Ответ на запрос сведений о документах государственного контроля и об оценке стоимости драгоценные металлов, оформляемых при экспорте драгоценных металлов, вывозимых с территории государства - члена Таможенного союза</xsl:when>
                  <xsl:when test="metstn:DocSign = '2' ">Ответ на запрос сведений о документах государственного контроля, оформляемого при ввозе и вывозе драгоценных камней с территории государства - члена Таможенного союза</xsl:when>
                  <xsl:when test="metstn:DocSign = '3' ">Ответ на запрос сведений о документах государственного контроля и об оценке стоимости товаров, содержащих драгоценные металлы и драгоценные камни, вывозимые с территории государства - члена Таможенного союза</xsl:when>
                  <xsl:otherwise>Ответ на запрос сведений о документах государственного контроля товаров, товаров, содержащих драгоценные металлы и драгоценные камни, ввозимых на территорию государства - члена Таможенного союза</xsl:otherwise>
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
			</style>
         </head>
         <body>
            <div class="page">
               <xsl:choose>
                  <xsl:when test="metstn:DocSign = '1' ">
                     <h2>Ответ на запрос сведений о документах государственного контроля и об оценке стоимости драгоценные металлов, оформляемых при экспорте драгоценных металлов, вывозимых с территории государства - члена Таможенного союза</h2>
                  </xsl:when>
                  <xsl:when test="metstn:DocSign = '2' ">
                     <h2>Ответ на запрос сведений о документах государственного контроля, оформляемого при ввозе и вывозе драгоценных камней с территории государства - члена Таможенного союза</h2>
                  </xsl:when>
                  <xsl:when test="metstn:DocSign = '3' ">
                     <h2>Ответ на запрос сведений о документах государственного контроля и об оценке стоимости товаров, содержащих драгоценные металлы и драгоценные камни, вывозимые с территории государства - члена Таможенного союза</h2>
                  </xsl:when>
                  <xsl:otherwise>
                     <h2>Ответ на запрос сведений о документах государственного контроля товаров, товаров, содержащих драгоценные металлы и драгоценные камни, ввозимых на территорию государства - члена Таможенного союза</h2>
                  </xsl:otherwise>
               </xsl:choose>
               <p class="remark">
                  <xsl:choose>
                     <xsl:when test="metstn:IsCanceled='1' or metstn:IsCanceled='true' or metstn:IsCanceled='t' ">Документ не действует</xsl:when>
                     <xsl:otherwise>Документ действует</xsl:otherwise>
                  </xsl:choose>
               </p>
               <table border="1">
                  <tbody>
                     <tr>
                        <th>Общие сведения</th>
                        <th>Описание товара</th>
                     </tr>
                     <tr>
                        <td>
                           <xsl:if test="metstn:ControlDate">
                              <span>Дата проведения госконтроля: </span>
                              <span>
                                 <xsl:call-template name="russian_date">
                                    <xsl:with-param name="dateIn" select="metstn:ControlDate"/>
                                 </xsl:call-template>
                              </span>
                              <br/>
                           </xsl:if>
                           <span>
									Результаты проведения госконтроля: <br/>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:value-of select="metstn:ControlResult"/>
                              <br/>
                           </span>
                           <xsl:if test="metstn:TotalPrice">
                              <span>
										Стоимость партии: 
										<xsl:value-of select="metstn:TotalPrice"/>
                                 <br/>
                              </span>
                           </xsl:if>
                           <xsl:if test="metstn:TotalWeight">
                              <span>
										Общий вес партии: 
										<xsl:value-of select="metstn:TotalWeight"/>
                                 <br/>
                              </span>
                           </xsl:if>
                           <xsl:if test="metstn:MeasureUnitQualifier">
                              <span>
										Единицы измерения массы: 
										<xsl:value-of select="metstn:MeasureUnitQualifier"/>
                                 <br/>
                              </span>
                           </xsl:if>
                           <xsl:if test="metstn:PlaceCount">
                              <span>
										Количество мест: 
										<xsl:value-of select="metstn:PlaceCount"/>
                                 <br/>
                              </span>
                           </xsl:if>
                           <span>
										Место проведения госконтроля: 
										<xsl:value-of select="metstn:ControlPlace"/>
                                 <br/>
                           </span>
                           <span>
										Наименование страны, где проведен госконтроль: 
										<xsl:value-of select="metstn:ControlCountryName"/>
                                 <br/>
                           </span>
                           <xsl:if test="metstn:ControlPerson">
								   <span>
									   Сведения о госконтролере:
									   <xsl:for-each select="metstn:ControlPerson/*">
										   <xsl:value-of select="."/>
										   <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									   </xsl:for-each>
								   </span>
                           </xsl:if>
                           <xsl:if test="metstn:Onlooker">
								   <span>
									   Сведения о присутствующем лице:
									   <xsl:for-each select="metstn:Onlooker/*">
										   <xsl:value-of select="."/>
										   <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									   </xsl:for-each>
								   </span>
                           </xsl:if>
                           <xsl:if test="metstn:CustomsPerson">
								   <span>
									   Сведения о присутствующем представителе таможенного органа:
									   <xsl:for-each select="metstn:CustomsPerson/*">
										   <xsl:value-of select="."/>
										   <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
									   </xsl:for-each>
								   </span>
                           </xsl:if>
                        </td>
                        <td>
                           <xsl:apply-templates select="metstn:ProductDescription"/>
                        </td>
                     </tr>
                     <tr>
                        <th style="width:50%">Акт государственного контроля</th>
                        <th>Сведения о документах</th>
                     </tr>
                     <tr>
                        <td>
                           <xsl:if test="metstn:Act = false()">Данные отсутствуют</xsl:if>
                           <xsl:apply-templates select="metstn:Act"/>
                        </td>
                        <td>
							<xsl:if test="not(metstn:AddDocument)">нет данных</xsl:if>
							<xsl:for-each select="metstn:AddDocument">
								<xsl:value-of select="cat_ru:PrDocumentName"/>
								<xsl:text> № </xsl:text>
								<xsl:value-of select="cat_ru:PrDocumentNumber"/>
								<xsl:text> от </xsl:text>
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
								</xsl:call-template>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
                        </td>
                     </tr>
                     <tr>
						<th>Сведения о драгметаллах в чистоте, грамм</th>
						<th>Сведения о самородках драгметаллов, грамм</th>
					</tr>
					<tr>
						<td>
							<xsl:if test="not(metstn:PreciousMetal)">нет данных</xsl:if>
							<xsl:for-each select="metstn:PreciousMetal">
								<xsl:for-each select="*">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
						<td>
							<xsl:if test="not(metstn:Nugget)">нет данных</xsl:if>
							<xsl:for-each select="metstn:Nugget">
								<xsl:for-each select="*">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>							
						</td>
					</tr>
					 <tr>
						<th>Сведения о драгоценных камнях, карат</th>
						<th></th>
					</tr>
					<tr>
						<td>
							<xsl:if test="not(metstn:Gems)">нет данных</xsl:if>
							<xsl:for-each select="metstn:Gems">
								<xsl:for-each select="*">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
								<xsl:if test="position()!=last()"><br/></xsl:if>
							</xsl:for-each>
						</td>
						<td>
						</td>
					</tr>
                     <tr>
                        <th colspan="2">Собственник</th>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:apply-templates select="metstn:OwnerOrg"/>
                        </td>
                     </tr>
                     <tr>
                        <th>Импортер</th>
                        <th>Экспортер</th>
                     </tr>
                     <tr>
                        <td>
                           <xsl:if test="metstn:Exporter = false()">Данные отсутствуют</xsl:if>
                           <xsl:apply-templates select="metstn:Exporter"/>
                        </td>
                        <td>
                           <xsl:if test="metstn:Importer = false()">Данные отсутствуют</xsl:if>
                           <xsl:apply-templates select="metstn:Importer"/>
                        </td>
                     </tr>
                     <tr>
                        <th>Грузополучатель (грузоотправитель)</th>
                        <th>Организация госконтроля</th>
                     </tr>
                     <tr>
                        <td>
                           <xsl:if test="metstn:CargoHandler = false()">Данные отсутствуют</xsl:if>
                           <xsl:apply-templates select="metstn:CargoHandler"/>
                        </td>
                        <td>
                           <xsl:if test="metstn:ControlOrganization = false()">Данные отсутствуют</xsl:if>
                           <xsl:apply-templates select="metstn:ControlOrganization"/>
                        </td>
                     </tr>
                     <xsl:if test="metstn:ProductDescription/metstn:Lefttover">
						 <tr>
							<th colspan="2">Остаток по квоте</th >
						</tr>
						<tr>
							<td colspan="2">
								<table class="bordered w190">
									<tbody>
										<tr>
											<td class="graphMain bordered">Количество товара</td>
											<td class="graphMain bordered">Условное обозначение ед.изм.</td>
											<td class="graphMain bordered">Код ед.изм.</td>
										</tr>
										<xsl:for-each select="metstn:ProductDescription/metstn:Lefttover">
											<tr>
												<td class="graphMain bordered">
													<xsl:value-of select="cat_ru:GoodsQuantity"/>
												</td>
												<td class="graphMain bordered">
													<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
												</td>
												<td class="graphMain bordered">
													<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</td>
						</tr>
					</xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="metstn:ProductDescription">
      <span>Наименование: <xsl:value-of select="metstn:Product"/>
      </span>
      <br/>
      <xsl:if test="metstn:Weight">
         <span>Вес: <xsl:value-of select="metstn:Weight"/>
         </span>
      </xsl:if>
      <br/>
      <xsl:if test="metstn:ETNVEDCode">
         <span>Код ЕТН ВЭД: <xsl:value-of select="metstn:ETNVEDCode"/>
         </span>
      </xsl:if>
      <br/>
      <xsl:if test="metstn:Price">
         <span>
			Контрактная стоимость: <xsl:value-of select="metstn:Price"/>
            <xsl:if test="metstn:Currency">(код валюты <xsl:value-of select="metstn:Currency"/>)</xsl:if>
         </span>
      </xsl:if>
      <br/>
      <xsl:apply-templates select="metstn:Count"/>
   </xsl:template>
   <xsl:template match="metstn:Count">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="metstn:Specification | metstn:Invoice | metstn:License | metstn:Certificate | metstn:Act | metstn:Contract">
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
   </xsl:template>
   <xsl:template match="metstn:Exporter | metstn:Importer | metstn:CargoHandler | metstn:ControlOrganization | metstn:OwnerOrg">
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
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span>
      <br/>
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
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
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
</xsl:stylesheet>
