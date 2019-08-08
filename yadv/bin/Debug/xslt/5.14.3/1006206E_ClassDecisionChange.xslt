<?xml version="1.0" encoding="UTF-8"?>

<!-- Бланк на основании формы в приказе ФТС №1940 от 15.10.2013 Приложение №3 -->

<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:cdc="urn:customs.ru:Information:CustomsDocuments:ClassDecisionChange:5.14.3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="cdc:ClassDecisionChange">
      <html>
         <head>
            <title>Решение об изменении решения по классификации товара</title>
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

				.value
				{
				border-bottom: solid 1px black;
				}

				.annot
				{
				border: 0;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 11pt;
							}
				.graph2 {
							font-family: Arial;
							font-size: 9pt;
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
                           <b>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА<br/>
						РЕШЕНИЕ ОБ ИЗМЕНЕНИЙ РЕШЕНИЯ ПО КЛАССИФИКАЦИИ ТОВАРА
						</b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
               </table>
               <table>
                  <tr>
                     <td class="graph" style="border:solid 1pt #000000" width="50%">1. Наименование таможенного органа<br/>
                        <span class="graph2">
                           <xsl:value-of select="cdc:Customs/cat_ru:Code"/>
                           <xsl:if test="cdc:Customs/cat_ru:OfficeName"> <xsl:value-of select="cdc:Customs/cat_ru:OfficeName"/>
                           </xsl:if>
                        </span>
                     </td>
                     <td class="graph" style="border:solid 1pt #000000" width="50%">2. Декларант<br/>
                        <span class="graph2">
                           <xsl:apply-templates select="cdc:Declarant"/>
                           <br/>
                           <xsl:if test="cdc:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN">
								ИНН <xsl:value-of select="cdc:Declarant/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
                           </xsl:if>
                           <xsl:if test="cdc:Declarant/RUScat_ru:IdentityCard">
                              <br/>
                              <xsl:apply-templates select="cdc:Declarant/RUScat_ru:IdentityCard"/>
                           </xsl:if>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 1pt #000000" width="50%">3. Регистрационный номер<br/>
                        <span class="graph2">
						РКТ-<xsl:value-of select="cdc:RegistrationNumber/cdc:CustomsCode"/>-<xsl:call-template name="date">
                              <xsl:with-param name="dateIn" select="cdc:RegistrationNumber/cdc:Date"/>
                           </xsl:call-template>/<xsl:value-of select="cdc:RegistrationNumber/cdc:SerialNumber"/>И
						</span>
                     </td>
                     <td class="graph" style="border:solid 1pt #000000" width="50%">4. Дата принятия<br/>
                        <span class="graph2">
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cdc:Date"/>
                           </xsl:call-template>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 1pt #000000">5. Наименование товара<br/>
                        <span class="graph2">
                           <xsl:for-each select="cdc:Goods/cdc:GoodDescription">
                              <xsl:value-of select="."/>
                              <xsl:if test="position()!=last()"> </xsl:if>
                           </xsl:for-each>
                        </span>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 1pt #000000">6. <br/>
						В решение по классификации товара №
						<span class="graph2">
                           <u>
						РКТ-<xsl:value-of select="cdc:RegistrationNumber/cdc:CustomsCode"/>-<xsl:call-template name="date">
                                 <xsl:with-param name="dateIn" select="cdc:RegistrationNumber/cdc:Date"/>
                              </xsl:call-template>/<xsl:value-of select="cdc:RegistrationNumber/cdc:SerialNumber"/>
                           </u>
                        </span> от 
						<u>
                           <xsl:call-template name="russian_date">
                              <xsl:with-param name="dateIn" select="cdc:RegistrationNumber/cdc:Date"/>
                           </xsl:call-template>
                        </u> вносятся следующие изменения:<br/>
                        <xsl:for-each select="cdc:Goods/cdc:ChangesDescription">
							В графе 
							<u>
                              <xsl:value-of select="cdc:GRNumber"/>
                           </u> решения вместо <u>
                              <xsl:value-of select="cdc:PreviousValue"/>
                           </u> следует читать <u>
                              <xsl:value-of select="cdc:NewValue"/>
                           </u>
                           <xsl:if test="position()!=last()"><br/></xsl:if>
                        </xsl:for-each>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" colspan="2" style="border:solid 1pt #000000">7. Подпись должностного лица таможенного органа<br/> <br/>
                        <table>
                           <tr>
                              <td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="30%">
                                 <xsl:if test="cdc:CustomsPerson/cat_ru:PersonPost">
                                    <xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonPost"/>
                                 </xsl:if>
                              </td>
                              <td class="graph2" style="border:solid 0pt" width="10%"> </td>
                              <td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="20%"> </td>
                              <td class="graph2" style="border:solid 0pt" width="10%"> </td>
                              <td align="center" class="graph2" style="border-bottom:1px solid #000000; border-left:0px; border-top:0px; border-right:0px;" width="30%">
                                 <xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonSurname"/> 
									<xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonName"/>
                                 <xsl:if test="cdc:CustomsPerson/cat_ru:PersonMiddleName"> <xsl:value-of select="cdc:CustomsPerson/cat_ru:PersonMiddleName"/>
                                 </xsl:if>
                              </td>
                           </tr>
                           <tr>
                              <td align="center" class="graph2" style="border:solid 0pt" width="30%">(должность)</td>
                              <td class="graph2" style="border:solid 0pt" width="10%"> </td>
                              <td align="center" class="graph2" style="border:solid 0pt" width="20%">(подпись)</td>
                              <td class="graph2" style="border:solid 0pt" width="10%"> </td>
                              <td align="center" class="graph2" style="border:solid 0pt" width="30%">(Ф. И. О.)
									</td>
                           </tr>
                        </table>
                     </td>
                  </tr>
               </table>
            </div>
            <xsl:if test="cdc:Declarant or cdc:RegNumberDT or cdc:ProcedureID">
				<div class="page">
				   <table>
					  <tr>
						 <td align="center" class="graph" style="border:solid 0pt">
							<font face="Times new roman" size="4">
							   <b>ДОПОЛНИТЕЛЬНЫЕ СВЕДЕНИЯ</b>
							</font>
						 </td>
					   </tr>  
				   </table>
				   <br/>
				   <table>
					   <xsl:if test="cdc:RegNumberDT">
							<tr>
								<td class="graph" style="width: 30%; vertical-align: middle">Регистрационный номер ДТ</td>
								<td class="graph2" style="width: 70%"><xsl:apply-templates select="cdc:RegNumberDT"/></td>
							</tr>	
					   </xsl:if>
						<xsl:if test="cdc:ProcedureID">
							<tr>
								<td class="graph" style="width: 30%; vertical-align: middle">Идентификатор  процедуры декларирования</td>
								<td class="graph2" style="width: 70%"><xsl:value-of select="cdc:ProcedureID"/></td>
							</tr>	
						</xsl:if>
						<xsl:if test="cdc:Declarant">
							<tr>
								<td class="graph" style="width: 30%; vertical-align: middle">Сведения о декларанте</td>
								<td class="graph2" style="width: 70%">
									<xsl:for-each select="cdc:Declarant">
										<xsl:if test="cat_ru:OrganizationLanguage">
											Язык заполнения: <xsl:value-of select="cat_ru:OrganizationLanguage"/><br/>
										</xsl:if>
										<xsl:apply-templates select="."/><br/>
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
										<xsl:if test="RUScat_ru:IdentityCard">
											<br/><xsl:apply-templates select="RUScat_ru:IdentityCard"/>
										</xsl:if>
										<xsl:if test="cat_ru:Contact">
											<br/>Контакты: <xsl:apply-templates select="cat_ru:Contact"/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:if>
					</table>
				</div> 
			</xsl:if>	 
         </body>
      </html>
   </xsl:template>
   
   <xsl:template match="cdc:Declarant">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if> 
      <xsl:if test="RUScat_ru:SubjectAddressDetails">
		<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
			<br/>
			<xsl:apply-templates select="."/>
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
	Документ удостоверяющий личность: 
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
	</xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate or RUScat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="RUScat_ru:OrganizationName"/>
	</xsl:if>
</xsl:template>

	<xsl:template match="cat_ru:Contact">
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

	<xsl:template match="cdc:RegNumberDT">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>

   <xsl:template name="gtd_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise><xsl:value-of select="$dateIn"/></xsl:otherwise>
      </xsl:choose>
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
   <xsl:template name="date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>
