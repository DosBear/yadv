<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rer="urn:customs.ru:Information:SQDocuments:RealEstateResponse:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
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
   <xsl:template match="rer:RealEstateResponse">
      <html>
         <head>
            <title>Выписка из Единого государственного реестра прав на объект недвижимого имущества и сделок с ним</title>
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
				font-family: Arial;
					font-weight: bold;
					margin-top:20px;
					font-size: 13pt;
					
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
               <table class="table">
                  <tbody>
                     <tr>
                        <td align="center" class="header" style="border:0px solid #ffffff;">ВЫПИСКА ИЗ ЕДИНОГО ГОСУДАРСТВЕННОГО РЕЕСТРА ПРАВ НА ОБЪЕКТ НЕДВИЖИМОГО ИМУЩЕСТВА И СДЕЛОК С НИМ</td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="border:0px solid #ffffff;">
                           <b>
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="rer:ExcerptDate"/>
                              </xsl:call-template>
                           </b>
                           <br/>
                           <br/>
                        </td>
                     </tr>
                     <tr>
                        <td align="left" class="graph" style="border:0px solid #ffffff;">
                           <xsl:choose>
                              <xsl:when test="rer:DocSign='3'">Отказ в выдаче сведений<br/>Причина: <xsl:value-of select="rer:RefusalReasons"/>
                              </xsl:when>
                              <xsl:when test="rer:DocSign='2'">Отсутствие сведений по запросу</xsl:when>
                              <xsl:otherwise>На основании запроса, поступившего на рассмотрение, сообщаем, что в Едином государственном реестре прав на недвижимое имущество и сделок с ним зарегистрировано:</xsl:otherwise>
                           </xsl:choose>
                        </td>
                     </tr>
                     <xsl:for-each select="rer:ExcerptObject">
                        <tr>
                           <td align="left" class="graph" style="border:0px solid #ffffff;">
                              <b>Объект недвижимости:</b> </td>
                        </tr>
                        <xsl:for-each select="rer:EstateObject">
                           <tr>
                              <td align="left" class="graph" style="border:0px solid #ffffff;">Наименование  объекта недвижимости: <xsl:value-of select="rer:ObjectName"/>
                              </td>
                           </tr>
                           <xsl:if test="rer:CadastrNumber">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Кадастровый номер: <xsl:value-of select="rer:CadastrNumber"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:ConditionNum">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Условный номер: <xsl:value-of select="rer:ConditionNum"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:InventoryNumber">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Инвентарный номер: <xsl:value-of select="rer:InventoryNumber"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:FloorNumber">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Этажность: <xsl:value-of select="rer:FloorNumber"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:FloorPlanNum">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Номера на поэтажном плане. Элемент экспликации: <xsl:for-each select="rer:FloorPlanNum">
                                       <xsl:value-of select="."/>
                                       <xsl:if test="position()!=last()">, </xsl:if>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:Complex">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Элемент сложной вещи: <xsl:for-each select="rer:Complex">
                                       <xsl:value-of select="."/>
                                       <xsl:if test="position()!=last()">, </xsl:if>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:ObjectType">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Тип объекта недвижимости: <xsl:value-of select="rer:ObjectType/rer:Code"/> <xsl:value-of select="rer:ObjectType/rer:TextDescription"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:Assignation">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Назначение объекта недвижимости: <xsl:value-of select="rer:Assignation/rer:Code"/> <xsl:value-of select="rer:Assignation/rer:TextDescription"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:GroundCategory">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Целевое назначение (категория) земель: <xsl:value-of select="rer:GroundCategory/rer:Code"/> <xsl:value-of select="rer:GroundCategory/rer:TextDescription"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:ObjectArea">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Площадь объекта недвижимости: <xsl:value-of select="rer:ObjectArea/rer:AreaValue"/>( <xsl:value-of select="rer:ObjectArea/rer:AreaUnit"/>) -  <xsl:value-of select="rer:ObjectArea/rer:AreaText"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:if test="rer:Address">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">   Адрес: <xsl:apply-templates select="rer:Address"/>
                                 </td>
                              </tr>
                           </xsl:if>
                           <xsl:for-each select="rer:Right">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">
                                    <b>Права:</b>
                                    <br/>
                                    <xsl:for-each select="rer:Owner">   <xsl:value-of select="position()"/>. Правообладатель:<br/>
                                       <xsl:apply-templates select="."/>
                                       <br/>
                                       <br/>
                                    </xsl:for-each>
                                    <xsl:for-each select="rer:RightRegistration">
										   <u>Зарегистрированное право: <br/>
                                          <xsl:value-of select="rer:RightDescription/rer:Code"/> <xsl:value-of select="rer:RightDescription/rer:TextDescription"/>
                                       </u>,
										Дата государственной регистрации: <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="rer:RegDate"/>
                                       </xsl:call-template>,
										Номер государствеенной регистрации:  <xsl:value-of select="rer:RegNum"/>
                                       <xsl:if test="rer:ExpirationDate">, Дата прекращения права: <xsl:call-template name="russian_date">
                                             <xsl:with-param name="dateIn" select="rer:ExpirationDate"/>
                                          </xsl:call-template>
                                       </xsl:if>
                                       <xsl:if test="rer:ShareNominator or rer:ShareDenominator or rer:ShareText">, Доля: <xsl:if test="rer:ShareNominator and rer:ShareDenominator">
                                             <xsl:value-of select="rer:ShareNominator"/>/<xsl:value-of select="rer:ShareDenominator"/>
                                          </xsl:if> <xsl:value-of select="rer:ShareText"/>
                                       </xsl:if>
                                       <xsl:if test="rer:FoundationDoc">
                                          <br/>Документы - основания регистрации права:</xsl:if>
                                       <xsl:for-each select="rer:FoundationDoc">
                                          <xsl:value-of select="position()"/>.<xsl:apply-templates select="."/>
                                       </xsl:for-each>
                                       <br/>
                                    </xsl:for-each>
                                    <xsl:if test="rer:Encumbrance">   Ограничение права:<br/>
                                       <xsl:for-each select="rer:Encumbrance">
                                          <xsl:value-of select="position()"/>).  <xsl:apply-templates select="."/>
                                          <br/>
                                       </xsl:for-each>
                                    </xsl:if>
                                 </td>
                              </tr>
                           </xsl:for-each>
                           <xsl:if test="rer:ShareHolding">
                              <tr>
                                 <td align="left" class="graph" style="border:0px solid #ffffff;">
                                    <b>Описание объектов долевого строительства:</b>
                                    <br/>
                                    <xsl:for-each select="rer:ShareHolding">
                                       <u>
                                          <xsl:value-of select="position()"/>).  <xsl:if test="rer:ShareObject">Описание объекта: <xsl:for-each select="rer:ShareObject">
                                                <xsl:value-of select="."/> </xsl:for-each>
                                             <br/>
                                          </xsl:if>
									Участник долевого строительства: </u>
                                       <br/>
                                       <xsl:for-each select="rer:Owner">
                                          <xsl:value-of select="position()"/>. <xsl:apply-templates select="."/>
                                          <br/>
                                          <br/>
                                       </xsl:for-each>
                                       <xsl:if test="rer:Encumbrance">Описание ипотеки<br/>
                                          <xsl:for-each select="rer:Encumbrance">
                                             <xsl:value-of select="position()"/>).  <xsl:apply-templates select="."/>
                                             <br/>
                                             <br/>
                                          </xsl:for-each>
                                       </xsl:if>
                                    </xsl:for-each>
                                 </td>
                              </tr>
                           </xsl:if>
                        </xsl:for-each>
                        <tr>
                           <td align="left" class="graph" style="border:0px solid #ffffff;">
                              <b>Правопритязания:</b> <xsl:value-of select="rer:RightAssert"/>
                           </td>
                        </tr>
                        <tr>
                           <td align="left" class="graph" style="border:0px solid #ffffff;">
                              <b>Права требования:</b> <xsl:value-of select="rer:RightClaim"/>
                           </td>
                        </tr>
                     </xsl:for-each>
                     <tr>
                        <td align="left" class="graph" style="border:0px solid #ffffff;">
                           <br/>
                           <b>Выписка выдана:</b> <xsl:value-of select="rer:Recipient"/>
                        </td>
                     </tr>
                     <xsl:if test="rer:ResourceOrg">
                        <tr>
                           <td align="left" class="graph" style="border:0px solid #ffffff;">
                              <b>Орган - источник информации:</b>
                              <br/>
                              <xsl:for-each select="rer:ResourceOrg">
                                 <xsl:value-of select="rer:OrgCode"/> <xsl:value-of select="rer:Region"/>
                                 <br/>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </xsl:if>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rer:Encumbrance">
      <xsl:value-of select="rer:EncumbranceDetails/rer:Code"/> <xsl:value-of select="rer:EncumbranceDetails/rer:TextDescription"/>
	Номер государствеенной регистрации <xsl:value-of select="rer:RegNum"/>
	Дата государственной регистрации <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="rer:RegDate"/>
      </xsl:call-template>
      <xsl:if test="rer:ShareText">Предмет ограничения <xsl:value-of select="rer:ShareText"/>
      </xsl:if>
      <xsl:if test="rer:StartDate">Дата начала действия <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rer:StartDate"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:if test="rer:EndDate">Дата прекращения действия <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rer:EndDate"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:if test="rer:Term">Продолжительность <xsl:value-of select="rer:Term"/>
      </xsl:if>
      <xsl:if test="rer:AllShareOwner">Участники  долевого строительства по договорам участия в долевом строительстве <xsl:value-of select="rer:AllShareOwner"/>
      </xsl:if>
      <xsl:if test="rer:Owner">
         <br/>
         <br/>Лица, в пользу которых ограничиваютя права:<br/>
         <xsl:for-each select="rer:Owner">
            <xsl:value-of select="position()"/>. <xsl:apply-templates select="."/>
            <br/>
         </xsl:for-each>
      </xsl:if>
      <xsl:if test="rer:FoundationDoc">
         <br/>Документы - основания регистрации ограничения:<br/>
         <xsl:for-each select="rer:FoundationDoc">
            <xsl:value-of select="position()"/>. <xsl:apply-templates select="."/>
            <br/>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rer:FoundationDoc">
      <span>
	Тип документа <xsl:value-of select="rer:DocType"/> 
	<xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="rer:DocSeries">
	, Серия документа <xsl:value-of select="rer:DocSeries"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate">
			от <xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:if test="rer:OrganizationName">
	, Наименование организации, выдавшей документ <xsl:value-of select="rer:OrganizationName"/>
         </xsl:if>;
	</span>
   </xsl:template>
   <xsl:template match="rer:Owner">
      <!--<xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
      <xsl:choose>
         <xsl:when test="rer:OrgSign='1'">Физическое лицо </xsl:when>
         <xsl:when test="rer:OrgSign='2'">Юридическое лицо </xsl:when>
         <xsl:otherwise>Субъект публичного права</xsl:otherwise>
      </xsl:choose>
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
		Субъект правоотношений <xsl:value-of select="rer:SubjectCode"/>
      <xsl:if test="rer:BirthDate">,
			Дата рождения <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rer:BirthDate"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:if test="rer:BirthPlace">,
			Место рождения <xsl:value-of select="rer:BirthPlace"/>
      </xsl:if>
      <xsl:if test="rer:InsuranceNumber">,
			СНИЛС <xsl:value-of select="rer:InsuranceNumber"/>
      </xsl:if>
      <xsl:if test="rer:Citizen">,
			Гражданство <xsl:value-of select="rer:Citizen"/>
      </xsl:if>
      <xsl:if test="rer:Sex">,
			Пол <xsl:value-of select="rer:Sex"/>
      </xsl:if>
      <xsl:if test="rer:CodeOPF">,
			Код ОПФ <xsl:value-of select="rer:CodeOPF"/>
      </xsl:if>
      <xsl:if test="rer:RegCountry">,
			Страна регистрации (инкорпорации) <xsl:value-of select="rer:RegCountry"/>
      </xsl:if>
      <xsl:if test="rer:AgencyRegistration">,
			Орган регистрации  <xsl:value-of select="rer:AgencyRegistration"/>
      </xsl:if>
      <xsl:if test="rer:RegDate">,
			Дата государственной регистрации (Дата регистрации в стране регистрации (инкорпорации)) <xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="rer:RegDate"/>
         </xsl:call-template>
      </xsl:if>
      <xsl:if test="rer:RegNum">,
			Номер регистрационной записи  <xsl:value-of select="rer:RegNum"/>
      </xsl:if>
      <xsl:if test="rer:Email">,
			Адрес электронной почты <xsl:value-of select="rer:Email"/>
      </xsl:if>
      <xsl:if test="rer:CodeOKATO">,
			Код ОКАТО <xsl:value-of select="rer:CodeOKATO"/>
      </xsl:if>
      <xsl:if test="rer:RegAddress">,
			Зарегистрированный адрес субъекта:<xsl:apply-templates select="rer:RegAddress"/>
      </xsl:if>
      <xsl:if test="rer:FactLocation">,
			Фактический адрес субъекта:<xsl:apply-templates select="rer:FactLocation"/>
      </xsl:if>
      <xsl:if test="rer:IdentityCard">,
			<xsl:apply-templates select="rer:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span> ИНН: <xsl:value-of select="cat_ru:INN"/>
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
   <xsl:template match="rer:IdentityCard">
      <span class="graph">Документ удостоверяющий личность:</span>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"/>
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
   <xsl:template match="rer:Address | rer:RegAddress | rer:FactLocation">
      <!--<span class="header">Адрес:</span><br/>-->
      <xsl:if test="cat_ru:PostalCode"> Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/> </xsl:if>
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
      <xsl:if test="rer:District">,
		Район <xsl:if test="rer:District/rer:Type">
            <xsl:value-of select="rer:District/rer:Type"/> </xsl:if>
         <xsl:value-of select="rer:District/rer:Name"/>
      </xsl:if>
      <xsl:if test="rer:RuralPlace">,
		Сельсовет <xsl:if test="rer:RuralPlace/rer:Type">
            <xsl:value-of select="rer:RuralPlace/rer:Type"/> </xsl:if>
         <xsl:value-of select="rer:RuralPlace/rer:Name"/>
      </xsl:if>
      <xsl:if test="rer:UrbanDistrict">,
		Городской район <xsl:if test="rer:UrbanDistrict/rer:Type">
            <xsl:value-of select="rer:UrbanDistrict/rer:Type"/> </xsl:if>
         <xsl:value-of select="rer:UrbanDistrict/rer:Name"/>
      </xsl:if>
      <xsl:if test="rer:KLADRCode">,
		Код адреса по КЛАДР <xsl:value-of select="rer:KLADRCode"/>
      </xsl:if>
      <xsl:if test="rer:OKATO">,
		ОКАТО <xsl:value-of select="rer:OKATO"/>
      </xsl:if>
      <xsl:if test="rer:UnformalizedDescription">,
		Неформализованное описание <xsl:value-of select="rer:UnformalizedDescription"/>
      </xsl:if>
      <br/>
   </xsl:template>
</xsl:stylesheet>
